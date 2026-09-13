#!/usr/bin/env node
// AAA 氏の比較表（refs/wiki/ja_AAA_cmp1.txt: 拡張 Buchholz ψ と C の木）を読み、
// ラベルの ψ 式を Buchholz 項に、木を C 項に変換して、bms2tc.js の規則 ι と突き合わせる。
//
//   node tools/aaa_cmp.js [FILE] [--json OUT]
//
// 木の記法: C(a,b) は a を上（| または ↑ で結ぶ）、b を右（- で結ぶ）に置く。根は左下。下線は無視。
// 添字が有限でない ψ（例 ψ_{ψ_0(1)} = Ω_ω の ψ）は Buchholz 項にせず、extended として出力だけする。
'use strict';
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const args = process.argv.slice(2);
let file = path.join(ROOT, 'refs/wiki/ja_AAA_cmp1.txt'), jsonOut = null;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--json') jsonOut = args[++i];
  else file = args[i];
}
const src = fs.readFileSync(file, 'utf8');

// ---- 木 → C 項
function parseArray(body) {
  const rows = body.split('\\\\').map(r => r.split('&').map(c => c.replace(/\\underline\{([^}]*)\}/g, '$1').trim()));
  function leaf(s) {
    if (s === '0') return '0';
    let m = s.match(/^\\Omega_\{?(\d+)\}?$/);
    if (m) return m[1] === '1' ? 'W' : `W_${m[1]}`;
    return null;
  }
  function term(r, c) {
    const s = (rows[r] || [])[c];
    if (s === undefined) throw new Error(`no cell ${r},${c}`);
    const l = leaf(s);
    if (l) return l;
    if (s !== 'C') throw new Error(`bad cell "${s}" at ${r},${c}`);
    const link = (rows[r - 1] || [])[c];
    if (link !== '|' && link !== '\\uparrow') throw new Error(`no up link at ${r},${c}`);
    const a = term(r - 2, c);
    let cc = c + 1;
    while ((rows[r][cc] || '') === '-') cc++;
    if (cc === c + 1) throw new Error(`no right link at ${r},${c}`);
    const b = term(r, cc);
    return `C(${a},${b})`;
  }
  let last = rows.length - 1;
  while (last >= 0 && rows[last].every(x => x === '')) last--;
  return term(last, 0);
}

// 結合系の書き方: C(W_{i+1},0) → W_i (i ≥ 1)
function toCombined(t) {
  let prev;
  do {
    prev = t;
    t = t.replace(/C\(W_(\d+),0\)/g, (m, k) => (+k >= 2 ? (+k === 2 ? 'W' : `W_${+k - 1}`) : m));
  } while (t !== prev);
  return t;
}

// ---- ψ 式 → Buchholz 項（有限の添字のみ）
function parsePsi(s) {
  s = s.replace(/\s+/g, '');
  let pos = 0;
  let extended = false;
  function sum() {
    const ts = [summand()];
    while (s[pos] === '+') { pos++; ts.push(summand()); }
    const flat = [];
    for (const t of ts) { if (Array.isArray(t)) flat.push(...t); else if (t !== 0) flat.push(t); }
    return flat.length === 0 ? 0 : (flat.length === 1 ? flat[0] : flat);
  }
  function summand() {
    if (s[pos] === '0') { pos++; return 0; }
    if (/[1-9]/.test(s[pos])) {
      // 数字 n = ψ_0(0) を n 個足したもの
      let j = pos;
      while (/\d/.test(s[j])) j++;
      const n = +s.slice(pos, j);
      pos = j;
      return Array.from({ length: n }, () => ({ nu: 0, a: 0 }));
    }
    if (s.startsWith('\\psi_', pos)) {
      pos += 5;
      let nu;
      if (s[pos] === '{') {
        pos++;
        const sub = sum();
        if (s[pos] !== '}') throw new Error('expected } at ' + s.slice(pos));
        pos++;
        nu = finiteValue(sub);
      } else if (/\d/.test(s[pos])) {
        nu = +s[pos]; pos++;
      } else throw new Error('bad subscript at ' + s.slice(pos));
      if (s[pos] !== '(') throw new Error('expected ( at ' + s.slice(pos));
      pos++;
      const a = sum();
      if (s[pos] !== ')') throw new Error('expected ) at ' + s.slice(pos));
      pos++;
      if (nu === null) { extended = true; return { nu: -1, a }; }
      return { nu, a };
    }
    throw new Error('bad term at ' + s.slice(pos));
  }
  // 添字が ψ_0(0)+…+ψ_0(0)（= 有限の n）なら n、そうでなければ null
  function finiteValue(t) {
    if (t === 0) return 0;
    const ts = Array.isArray(t) ? t : [t];
    if (ts.every(q => q.nu === 0 && q.a === 0)) return ts.length;
    return null;
  }
  const t = sum();
  if (pos !== s.length) throw new Error('trailing ' + s.slice(pos));
  return { t, extended };
}

// ---- 表の読み取り
const entries = [];
const blockRe = /\\\[([\s\S]*?)\\\]/g;
let m;
while ((m = blockRe.exec(src)) !== null) {
  const blk = m[1];
  const i = blk.indexOf('\\begin{array}');
  if (i < 0) continue;
  const labelPart = blk.slice(0, i).replace(/\s+/g, ' ').trim().replace(/=\s*$/, '');
  const j = blk.indexOf('}', i + '\\begin{array}'.length) + 1;
  const k = blk.indexOf('\\end{array}', j);
  const body = blk.slice(j, k);
  const segs = labelPart.split('=').map(x => x.trim()).filter(Boolean);
  const psiSeg = [...segs].reverse().find(x => x.includes('\\psi'));
  const e = { label: labelPart, psi: psiSeg || null };
  try { e.tc = toCombined(parseArray(body)); } catch (err) { e.treeError = err.message; }
  if (psiSeg) {
    try {
      const { t, extended } = parsePsi(psiSeg);
      e.extended = extended;
      if (!extended) {
        e.bt = B.btToString(t);
        e.ours = B.tcToString(B.iota(t), false);
      }
    } catch (err) { e.psiError = err.message; }
  }
  entries.push(e);
}

// ---- Lean で標準形・比較・表の中の順序
const q = [], at = [];
const ask = (line, cb) => { q.push(line); at.push(cb); };
for (const e of entries) {
  if (e.tc) ask(`std ${e.tc}`, x => { e.aaaStd = x === '1'; });
  if (e.tc && e.ours) {
    ask(`cmp ${e.ours} ${e.tc}`, x => { e.cmp = x; });
    ask(`std ${e.ours}`, x => { e.oursStd = x === '1'; });
  }
}
// 表は小さい順に並んでいるはず。隣り合う項の C 側の順序を AAA 氏の木・私の規則の両方で調べる。
const withPsi = entries.filter(e => e.psi && e.tc);
const orderBad = [];
for (let i = 0; i + 1 < withPsi.length; i++) {
  const a = withPsi[i], b = withPsi[i + 1];
  ask(`cmp ${a.tc} ${b.tc}`, x => { if (x !== '-1') orderBad.push(`aaa  : ${a.psi}  vs  ${b.psi}  -> ${x}`); });
  if (a.ours && b.ours) ask(`cmp ${a.ours} ${b.ours}`, x => { if (x !== '-1') orderBad.push(`ours : ${a.psi}  vs  ${b.psi}  -> ${x}`); });
  // 片方ずつ混ぜた比較: 私の規則の a と AAA 氏の b など
  if (a.ours && b.ours && (a.ours !== a.tc || b.ours !== b.tc)) {
    ask(`cmp ${a.ours} ${b.tc}`, x => { if (x !== '-1') orderBad.push(`ours(a) vs aaa(b): ${a.psi}  vs  ${b.psi}  -> ${x}`); });
    ask(`cmp ${a.tc} ${b.ours}`, x => { if (x !== '-1') orderBad.push(`aaa(a) vs ours(b): ${a.psi}  vs  ${b.psi}  -> ${x}`); });
  }
}
const r = spawnSync(CLI, ['batch'], { input: q.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 28 }).stdout.split('\n');
r.slice(0, q.length).forEach((x, i) => at[i](x.trim()));

let same = 0, diff = 0, ext = 0, err = 0;
for (const e of entries) {
  if (e.treeError || e.psiError) { err++; console.log('ERR ', e.label, e.treeError || e.psiError); continue; }
  if (!e.psi) continue;
  if (e.extended) { ext++; console.log('EXT ', e.psi, '\n     aaa :', e.tc, e.aaaStd ? '' : '(AAA non-standard)'); continue; }
  if (e.ours === e.tc) { same++; continue; }
  diff++;
  console.log('DIFF', e.bt, `(ours ${e.cmp === '1' ? '>' : e.cmp === '-1' ? '<' : e.cmp} aaa)`, '\n     ours:', e.ours, '\n     aaa :', e.tc, e.aaaStd ? '' : '(AAA non-standard)');
}
console.log(`entries ${entries.length}: same ${same}, diff ${diff}, extended ${ext}, parse errors ${err}`);
for (const e of entries) if (e.ours && e.oursStd === false) console.log('OURS NON-STANDARD', e.psi);
console.log(`order violations between neighbouring rows: ${orderBad.length}`);
for (const o of orderBad) console.log('  ', o);
if (jsonOut) fs.writeFileSync(jsonOut, JSON.stringify(entries, null, 1));
