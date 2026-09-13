#!/usr/bin/env node
// 翻訳規則の実験台。bms2tc.js の RULES を切り替えて、2 行 BMS の翻訳を機械検査と上限探索で調べる。
//
//   node tools/rule_lab.js [FLAG,FLAG,...] [--depth D] [--out FILE]
//
// 対象: シートの 2 行の行 + 展開サンプル（標準形の極限だけ）。各極限 M について
//   nonstd      f(M) が非標準
//   nonstd-exp  f(M[n]) が非標準            (n = 1..6, 12)
//   not-below   f(M[n]) ≥ f(M)
//   not-cofinal f(M)[k] > f(M[12])           (k = 0..6)
//   oracle      supseq(f(M[4]), f(M[5]), f(M[6])) ≠ f(M)
// と、シートの隣り合う行の順序 (order) を数える。Lean CLI には一括で問い合わせる。
'use strict';
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const args = process.argv.slice(2);
let depth = 3, outFile = null;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--depth') depth = +args[++i];
  else if (args[i] === '--out') outFile = args[++i];
  else for (const f of args[i].split(',').filter(Boolean)) {
    if (!(f in B.RULES)) { console.error('unknown rule', f); process.exit(3); }
    B.RULES[f] = true;
  }
}

function batch(lines) {
  if (lines.length === 0) return [];
  const r = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 });
  const out = r.stdout.split('\n');
  if (out.length < lines.length) throw new Error(`batch: ${out.length} < ${lines.length}`);
  return lines.map((_, i) => out[i].trim());
}

const tr = m => {
  const r = B.translate(m, { omega: false });
  return r.tc;
};
const isTwoRow = m => m.startsWith('(') && m.split(')')[0].split(',').length === 2;

// ---- 対象の行列
const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const sheetMats = rows.map(r => r[1]).filter(isTwoRow);
const seen = new Set(sheetMats);
let frontier = ['(0,0)(1,1)(2,2)', '(0,0)(1,1)(2,2)(3,3)', '(0,0)(1,1)(2,1)(3,2)', '(0,0)(1,1)(2,2)(3,2)',
  '(0,0)(1,1)(2,2)(3,3)(4,4)', '(0,0)(1,1)(2,2)(3,3)(3,3)', '(0,0)(1,1)(2,2)(3,2)(3,2)'];
const sampled = [];
for (const m of frontier) if (!seen.has(m)) { seen.add(m); sampled.push(m); }
for (let d = 0; d < depth; d++) {
  const qs = [];
  for (const m of frontier) for (const n of [1, 2, 3]) qs.push(`bexp ${m}[${n}]`);
  const res = batch(qs);
  const next = [];
  for (const e of res) if (e && e !== 'ERR' && e.length < 160 && !seen.has(e)) { seen.add(e); sampled.push(e); next.push(e); }
  frontier = next;
}
let mats = sheetMats.concat(sampled);
const stdRes = batch(mats.map(m => `bstd ${m}`));
mats = mats.filter((m, i) => stdRes[i] === '1');
const limits = [...new Set(mats.filter(m => !m.endsWith('(0,0)')))];

// ---- 展開
const NS = [1, 2, 3, 4, 5, 6, 12];
const expQ = [];
for (const m of limits) for (const n of NS) expQ.push(`bexp ${m}[${n}]`);
const expR = batch(expQ);
const info = limits.map((m, i) => {
  const ex = {};
  NS.forEach((n, j) => { ex[n] = expR[i * NS.length + j]; });
  const t = tr(m);
  const te = {};
  for (const n of NS) te[n] = tr(ex[n]);
  return { m, t, ex, te, bad: [] };
});

// ---- 検査の問い合わせ
const q = [], at = [];
function ask(line, cb) { q.push(line); at.push(cb); }
for (const x of info) {
  if (!x.t) { x.bad.push('notrans'); continue; }
  ask(`std ${x.t}`, r => { if (r !== '1') x.bad.push('nonstd'); });
  for (const n of NS) {
    const tn = x.te[n];
    if (!tn) { x.bad.push(`notrans-exp${n}`); continue; }
    ask(`std ${tn}`, r => { if (r !== '1') x.bad.push(`nonstd-exp${n}`); });
    ask(`cmp ${tn} ${x.t}`, r => { if (r !== '-1') x.bad.push(`not-below${n}`); });
  }
  if (x.te[4] && x.te[5] && x.te[6]) ask(`supseq ${x.te[4]} ${x.te[5]} ${x.te[6]}`, r => { x.oracle = r; });
  x.fs = [];
  for (let k = 0; k <= 6; k++) ask(`expand ${x.t} ${k}`, r => { x.fs[k] = r; });
}
const ordQ = [];
for (let i = 0; i + 1 < sheetMats.length; i++) {
  const a = sheetMats[i], b = sheetMats[i + 1];
  if (!stdRes[i] || stdRes[i] !== '1' || stdRes[i + 1] !== '1') continue;
  ordQ.push([a, b]);
}
const ordRes = {};
for (const [a, b] of ordQ) {
  ask(`bcmp ${a} ${b}`, r => { ordRes[a + ' ' + b] = { b: r }; });
  const ta = tr(a), tb = tr(b);
  if (ta && tb) ask(`cmp ${ta} ${tb}`, r => { ordRes[a + ' ' + b].t = r; });
}
batch(q).forEach((r, i) => at[i](r));

// ---- 2 段目: 共終性と上限の一致
const q2 = [], at2 = [];
for (const x of info) {
  if (!x.t || !x.te[12]) continue;
  for (let k = 0; k <= 6; k++) {
    const a = x.fs && x.fs[k];
    if (!a || a === '(none)') break;
    q2.push(`cmp ${a} ${x.te[12]}`);
    at2.push(r => { if (r === '1' && !x.bad.some(b => b.startsWith('not-cofinal'))) x.bad.push(`not-cofinal${k}`); });
  }
  if (x.oracle && x.oracle !== '(none)' && x.oracle !== 'ERR') {
    q2.push(`cmp ${x.oracle} ${x.t}`);
    at2.push(r => { if (r !== '0') x.bad.push('oracle'); });
  }
}
batch(q2).forEach((r, i) => at2[i](r));

let orderBad = 0;
for (const k of Object.keys(ordRes)) if (ordRes[k].t !== undefined && ordRes[k].b !== ordRes[k].t) orderBad++;

const counts = {};
let clean = 0;
for (const x of info) {
  if (x.bad.length === 0) clean++;
  for (const b of new Set(x.bad.map(s => s.replace(/\d+$/, '')))) counts[b] = (counts[b] || 0) + 1;
}
console.log(`rules: ${JSON.stringify(B.RULES)}`);
console.log(`limits: ${info.length}  clean: ${clean}  order-bad (sheet neighbours): ${orderBad}`);
console.log('failures by kind:', JSON.stringify(counts));
// 近似列 f(M[n]) がすべて標準で f(M) 未満のとき、上限探索の答え (oracle) は信用できる。
const trusted = x => !x.bad.some(b => b.startsWith('nonstd-exp') || b.startsWith('notrans'));
const bads = info.filter(x => x.bad.length).sort((a, b) => a.m.length - b.m.length);
const tb = bads.filter(trusted);
console.log(`failures with clean approximants (oracle trusted): ${tb.length}`);
for (const x of tb.slice(0, 25)) console.log('BAD', x.m, x.bad.join(','), '\n    f      =', x.t, '\n    oracle =', x.oracle);
if (outFile) fs.writeFileSync(outFile, JSON.stringify(info.map(x => ({ m: x.m, t: x.t, oracle: x.oracle, bad: x.bad })), null, 1));
