#!/usr/bin/env node
// 拡張 Buchholz ψ → C（ebp2tc.js）の検査台。BMS を経由しない。
//
//   node tools/ebp_lab.js [--rows 3|2|all] [--from I] [--to J] [--desc] [--out FILE]
//
// 対象: シート 1（To psi(I)）の UNOCF 表記を拡張 Buchholz 項にしたもの（--desc で基本列の 1 段下の項も）。
// 検査:
//   nonstd       ι(α) が非標準
//   not-below    ι(α[n]) ≥ ι(α)          (n = 1..6)
//   oracle       ι(α) ≠ supseq(ι(α[4]), ι(α[5]), ι(α[6]))   （可算共終数の極限だけ）
//   order        シートで隣り合う行 α < β について ι(α) < ι(β) でない
'use strict';
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const args = process.argv.slice(2);
let rowsSel = '3', from = 0, to = Infinity, desc = false, outFile = null, labelsArg = null;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--rows') rowsSel = args[++i];
  else if (args[i] === '--from') from = +args[++i];
  else if (args[i] === '--to') to = +args[++i];
  else if (args[i] === '--desc') desc = true;
  else if (args[i] === '--out') outFile = args[++i];
  else if (args[i] === '--bad') i++;
  else if (args[i] === '--labels') labelsArg = args[++i].split(';').map(x => x.trim()).filter(Boolean);
  else for (const f of args[i].split(',').filter(Boolean)) {
    // FLAG で有効、-FLAG で無効（ebp2tc.js の RULES）
    const name = f.replace(/^-/, '');
    if (!(name in X.RULES)) { console.error('unknown rule', name); process.exit(3); }
    X.RULES[name] = !f.startsWith('-');
  }
}

function batch(lines) {
  if (lines.length === 0) return [];
  const r = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 });
  const out = r.stdout.split('\n');
  if (out.length < lines.length) throw new Error(`batch: ${out.length} < ${lines.length}`);
  return lines.map((_, i) => out[i].trim());
}
const tcs = t => B.tcToString(X.iota(t), false);
const nrows = b => (b.startsWith('(') ? b.split(')')[0].split(',').length : 0);

// ---- 対象
const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const items = [];
// --labels "l1;l2;…": シートを使わず、渡した表記（シートと同じ書式）だけを並べた順に調べる
if (labelsArg) labelsArg.forEach((u, idx) => {
  let t;
  try { t = E.parseLabel(X.fixLabel(u)); } catch (e) { items.push({ idx, label: u, error: 'parse: ' + e.message.slice(0, 60) }); return; }
  items.push({ idx, bms: u, label: u, t, sheet: true });
});
rows.forEach(([sheet, b, u], idx) => {
  if (labelsArg) return;
  if (sheet !== 'To psi(I)' || idx < from || idx > to) return;
  if (rowsSel !== 'all' && String(nrows(b)) !== rowsSel) return;
  let t;
  try { t = E.parseLabel(X.fixLabel(u)); } catch (e) { items.push({ idx, bms: b, label: u, error: 'parse: ' + e.message.slice(0, 60) }); return; }
  items.push({ idx, bms: b, label: u, t, sheet: true });
});
if (desc) {
  const extra = [];
  for (const it of items) {
    if (!it.t || E.dom(it.t) !== 'w') continue;
    for (const n of [1, 2, 3]) {
      try { extra.push({ idx: it.idx, label: `${it.label} [${n}]`, t: E.fs(it.t, E.nat(n)) }); } catch (e) { /* skip */ }
    }
  }
  items.push(...extra);
}

// ---- 翻訳
for (const it of items) {
  if (!it.t) continue;
  it.std = E.isStd(it.t);
  try { it.tc = tcs(it.t); } catch (e) { it.error = 'iota: ' + e.message.slice(0, 60); continue; }
  it.bad = [];
  if (E.dom(it.t) === 'w') {
    it.approx = {};
    for (const n of [1, 2, 3, 4, 5, 6]) {
      try { it.approx[n] = tcs(E.fs(it.t, E.nat(n))); } catch (e) { it.bad.push('approx-error'); break; }
    }
  }
}

// ---- 問い合わせ
const q = [], at = [];
const ask = (line, cb) => { q.push(line); at.push(cb); };
for (const it of items) {
  if (!it.tc) continue;
  ask(`std ${it.tc}`, r => { if (r !== '1') it.bad.push('nonstd'); });
  if (it.approx && Object.keys(it.approx).length === 6) {
    it.approxStd = true;
    for (const n of [1, 2, 3, 4, 5, 6]) {
      ask(`cmp ${it.approx[n]} ${it.tc}`, r => { if (r !== '-1' && !it.bad.includes('not-below')) it.bad.push('not-below'); });
      ask(`std ${it.approx[n]}`, r => { if (r !== '1') it.approxStd = false; });
    }
    ask(`supseq ${it.approx[4]} ${it.approx[5]} ${it.approx[6]}`, r => { it.oracle = r; });
  }
}
const sheetItems = items.filter(it => it.sheet && it.tc);
const orderBad = [];
for (let k = 0; k + 1 < sheetItems.length; k++) {
  const a = sheetItems[k], b = sheetItems[k + 1];
  if (b.idx !== a.idx + 1) continue;
  ask(`cmp ${a.tc} ${b.tc}`, r => { if (r !== '-1') orderBad.push([a, b, r]); });
}
batch(q).forEach((r, i) => at[i](r));
const q2 = [], at2 = [];
for (const it of items) {
  if (it.oracle && it.oracle !== '(none)' && it.oracle !== 'ERR') {
    q2.push(`cmp ${it.oracle} ${it.tc}`);
    at2.push(r => { if (r !== '0') it.bad.push('oracle'); });
  }
}
batch(q2).forEach((r, i) => at2[i](r));

// ---- 報告
const counts = {};
let clean = 0, errors = 0;
for (const it of items) {
  if (it.error) { errors++; continue; }
  if (!it.tc) continue;
  if (it.bad.length === 0) clean++;
  for (const b of it.bad) counts[b] = (counts[b] || 0) + 1;
}
console.log(`items ${items.length}  clean ${clean}  errors ${errors}  order-bad ${orderBad.length}`);
console.log('failures by kind:', JSON.stringify(counts));
for (const it of items.filter(i => i.error).slice(0, 10)) console.log('ERR', it.idx, it.label, it.error);
// 近似列 ι(α[n]) がすべて標準なら上限探索の答えは信用できる（信用できる失敗を先に出す）
const bads = items.filter(it => it.bad && it.bad.length)
  .sort((a, b) => (b.approxStd === true) - (a.approxStd === true));
console.log(`failures with standard approximants (oracle trusted): ${bads.filter(it => it.approxStd).length}`);
// 通過しても近似列に非標準があれば上限の照合は弱い（上限探索の答えが汚れている）
const weak = items.filter(it => it.tc && it.bad && it.bad.length === 0 && it.approx && it.approxStd === false);
console.log(`clean but some approximants non-standard (weak sup check): ${weak.length}`, weak.slice(0, 40).map(it => it.idx).join(' '));
for (const it of bads.slice(0, labelsArg ? 200 : 25)) {
  if (it.approxStd) process.stdout.write('[trusted] ');
  console.log('BAD', it.idx, it.label, it.bad.join(','), it.std ? '' : '(EBψ non-normal)', '\n    ι      =', it.tc, it.oracle ? '\n    oracle = ' + it.oracle : '');
}
for (const [a, b, r] of orderBad.slice(0, 15)) console.log('ORDER', a.idx, a.label, ' vs ', b.label, '->', r);
// --bad FILE: シートの行（BMS 文字列）→ 失敗の種類。既存のファイルがあれば検査した範囲だけ上書きする。
const badIdx = args.indexOf('--bad');
if (badIdx >= 0) {
  const badFile = args[badIdx + 1];
  let bad = {};
  try { bad = JSON.parse(fs.readFileSync(badFile, 'utf8')); } catch (e) { bad = {}; }
  for (const it of items) {
    if (!it.sheet || !it.bms) continue;
    const kinds = [...(it.bad || [])];
    if (it.error) kinds.push(it.error.split(':')[0]);
    if (it.std === false) kinds.push('label-non-normal');
    for (const [a, b] of orderBad) if (b === it) kinds.push('order');
    if (kinds.length) bad[it.bms] = kinds; else delete bad[it.bms];
  }
  fs.writeFileSync(badFile, JSON.stringify(bad, null, 1));
}
if (outFile) fs.writeFileSync(outFile, JSON.stringify(items.map(it => ({ idx: it.idx, bms: it.bms, label: it.label, tc: it.tc, oracle: it.oracle, bad: it.bad, error: it.error, std: it.std, approxStd: it.approxStd })), null, 1));
