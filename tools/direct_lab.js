#!/usr/bin/env node
// 行列から直接の翻訳（direct.js）の検査台。原表を使わず、BMS の展開で集めた行列で調べる。
//
//   node tools/direct_lab.js [--rows 1|2|3] [--depth D] [--maxcols N] [--seeds "M;M"] [--sheet] [--out FILE]
//
// 行列: 種の行列から bexp M[1], M[2], M[3] を D 段たどり、その接頭辞も含めて標準な行列を集める
//   （--sheet で原表の同じ行数の行も加える）。列が N 個を超える行列は捨てる。
// 検査（行列ごと）:
//   notrans  direct.js が訳せない
//   nonstd   f(M) が C の標準形でない
//   tr       1・2 行で、今の翻訳 tr（Buchholz ψ 経由）と一致しない
//   order    辞書式に隣り合う M < M' で f(M) < f(M') でない（辞書式の順序が bcmp と違えば lexcmp）
//   below    極限 M で f(M[n]) < f(M) でない（n = 4, 5, 6）
//   sup      極限 M で supseq f(M[4..6]) ≠ f(M)（近似列がすべて標準形のときだけ。そうでなければ supweak）
'use strict';
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));
const D = require(path.join(ROOT, 'direct.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const args = process.argv.slice(2);
let rows = 2, depth = 3, maxCols = 24, seedsArg = null, useSheet = false, outFile = null;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--rows') rows = +args[++i];
  else if (args[i] === '--depth') depth = +args[++i];
  else if (args[i] === '--maxcols') maxCols = +args[++i];
  else if (args[i] === '--seeds') seedsArg = args[++i].split(/[;\s]+/).filter(Boolean);
  else if (args[i] === '--sheet') useSheet = true;
  else if (args[i] === '--out') outFile = args[++i];
  else { console.error('unknown argument', args[i]); process.exit(3); }
}

function batch(lines) {
  if (lines.length === 0) return [];
  const r = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 });
  const out = r.stdout.split('\n');
  if (out.length < lines.length) throw new Error(`batch: ${out.length} < ${lines.length}`);
  return lines.map((_, i) => out[i].trim());
}

const SEEDS = {
  1: ['(0)(1)(2)(3)(4)', '(0)(1)(2)(3)(3)(3)'],
  2: ['(0,0)(1,1)(2,2)(3,3)', '(0,0)(1,1)(2,1)(3,2)', '(0,0)(1,1)(2,2)(3,2)', '(0,0)(1,1)(2,2)(3,3)(4,4)',
      '(0,0)(1,1)(2,2)(3,3)(3,3)', '(0,0)(1,1)(2,2)(3,2)(3,2)'],
  3: ['(0,0,0)(1,1,1)(2,1,1)(3,1,0)(2,0,0)', '(0,0,0)(1,1,1)(2,1,1)(3,1,0)', '(0,0,0)(1,1,1)(2,1,1)(2,1,1)',
      '(0,0,0)(1,1,1)(2,1,0)(3,1,1)', '(0,0,0)(1,1,1)(1,1,1)(2,1,0)'],
};
const cols = m => m.match(/\(([^)]*)\)/g).map(c => c.slice(1, -1).split(',').map(Number));
const str = cs => cs.map(c => '(' + c.join(',') + ')').join('');
const height = m => m.split(')')[0].split(',').length;

// ---- 行列を集める
const seen = new Set();
const add = m => {
  if (!m || m === 'ERR' || height(m) !== rows) return false;
  const cs = cols(m);
  if (cs.length > maxCols) return false;
  let added = false;
  for (let k = 1; k <= cs.length; k++) {
    const p = str(cs.slice(0, k));
    if (!seen.has(p)) { seen.add(p); added = true; }
  }
  return added;
};
let frontier = seedsArg || SEEDS[rows];
frontier.forEach(add);
for (let d = 0; d < depth; d++) {
  const qs = [];
  for (const m of frontier) for (const n of [1, 2, 3]) qs.push(`bexp ${m}[${n}]`);
  const next = [];
  for (const e of batch(qs)) if (add(e)) next.push(e);
  frontier = next;
}
if (useSheet) {
  const sheet = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
  for (const r of sheet) if (r[1].startsWith('(')) add(r[1].replace(/\s/g, ''));
}
let mats = [...seen];
const stdRes = batch(mats.map(m => `bstd ${m}`));
mats = mats.filter((_, i) => stdRes[i] === '1');
// BMS の順序（同じ行数なら列ごとの辞書式、接頭辞が小さい）
const lex = (a, b) => {
  const x = cols(a), y = cols(b);
  for (let i = 0; i < Math.min(x.length, y.length); i++)
    for (let r = 0; r < rows; r++) if (x[i][r] !== y[i][r]) return x[i][r] - y[i][r];
  return x.length - y.length;
};
mats.sort(lex);

// ---- 翻訳
const items = mats.map(m => ({ m, f: D.translate(m).tc, bad: [] }));
const isLimit = m => cols(m).slice(-1)[0].some(v => v !== 0);
const q = [], at = [];
const ask = (l, cb) => { q.push(l); at.push(cb); };
for (const it of items) {
  if (it.f === null) { it.bad.push('notrans'); continue; }
  if (rows <= 2) { const t = B.translate(it.m, { omega: false }).tc; if (t !== it.f) { it.bad.push('tr'); it.tr = t; } }
  if (isLimit(it.m)) for (const n of [4, 5, 6]) ask(`bexp ${it.m}[${n}]`, r => { (it.ex = it.ex || []).push(r); });
}
batch(q).forEach((r, i) => at[i](r));
q.length = 0; at.length = 0;
items.forEach((it, k) => {
  if (it.f === null) return;
  ask(`std ${it.f}`, r => { if (r !== '1') it.bad.push('nonstd'); });
  const nx = items[k + 1];
  if (nx) {
    ask(`bcmp ${it.m} ${nx.m}`, r => { if (r !== '-1') it.bad.push('lexcmp'); });
    if (nx.f !== null) ask(`cmp ${it.f} ${nx.f}`, r => { if (r !== '-1') it.bad.push('order'); });
  }
  if (it.ex) {
    it.fe = it.ex.map(m => D.translate(m).tc);
    if (it.fe.some(t => t === null)) { it.bad.push('notrans-exp'); return; }
    it.apStd = true;
    for (const t of it.fe) {
      ask(`std ${t}`, r => { if (r !== '1') it.apStd = false; });
      ask(`cmp ${t} ${it.f}`, r => { if (r !== '-1' && !it.bad.includes('below')) it.bad.push('below'); });
    }
    ask(`supseq ${it.fe.join(' ')}`, r => { it.sup = r; });
  }
});
batch(q).forEach((r, i) => at[i](r));
for (const it of items) {
  if (it.sup === undefined) continue;
  if (!it.apStd) it.bad.push('supweak');
  else if (it.sup !== it.f) it.bad.push('sup');
}

// ---- 集計
const count = {};
for (const it of items) for (const b of it.bad) count[b] = (count[b] || 0) + 1;
const clean = items.filter(it => it.bad.length === 0).length;
console.log(`rows ${rows}: matrices ${items.length}, limits ${items.filter(it => it.sup !== undefined).length}, clean ${clean}`);
console.log(JSON.stringify(count));
for (const kind of Object.keys(count)) {
  const ex = items.filter(it => it.bad.includes(kind)).slice(0, 4);
  console.log(`-- ${kind}`);
  for (const it of ex) console.log(`  ${it.m}  f=${it.f}${it.tr !== undefined ? '  tr=' + it.tr : ''}${kind === 'sup' ? '  sup=' + it.sup : ''}`);
}
if (outFile) fs.writeFileSync(outFile, JSON.stringify(items.map(({ m, f, tr, bad, sup }) => ({ m, f, tr, bad, sup })), null, 1));
