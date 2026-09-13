#!/usr/bin/env node
// 実験台: 写像 σ（ebp_sigma.js、f = ι∘σ）を原表の 3 行の行で試す。
//
//   node tools/sigma_lab.js FROM TO [--off] [--k2] [--low] [--eorig] [+FLAG] [--json FILE]
//
//   --off    σ をかけない（今の ι）
//   --k2     段 1 のあとに段 2（Ω_{Ω_3} の段）も当てる（既定は段 1 だけ）
//   --low    低い崩壊 ψ_ν(b)（ν ≥ 1）の引数にも当てる
//   --eorig  最後の低い項の R2n の E を σ の前の引数から作る
//   +FLAG    ebp2tc.js の RULES[FLAG] を有効にする（例 +R2nu）
//   --json   行ごとの判定と C の項を書き出す
//
// 行ごとに、像の標準形、近似列 α[4..6] の像の標準形、その上限探索との一致、隣の行との順序を調べて集計する。
// 本番の翻訳（tools/tss_sheet.js, tools/ebp_lab.js）の設定は `--k2 --eorig +R2nu` と同じ。
const path = require('path');
const fs = require('fs');
const { spawnSync } = require('child_process');
const ROOT = path.join(__dirname, '..');
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));
const { makeSigma } = require(path.join(ROOT, 'ebp_sigma.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');
const batch = lines => {
  if (!lines.length) return [];
  const out = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 }).stdout.split('\n');
  return lines.map((_, i) => (out[i] || '').trim());
};

const args = process.argv.slice(2);
const off = args.includes('--off');
for (const f of args.filter(a => a.startsWith('+'))) X.RULES[f.slice(1)] = true;
const [from, to] = args.filter(a => !a.startsWith('--') && !a.startsWith('+')).map(Number);
const S = makeSigma({
  levels: args.includes('--auto') ? 'auto' : args.includes('--k2') ? [1, 2] : [1],
  low: args.includes('--low'),
  normAll: args.includes('--normall'),
  virtual: args.includes('--virtual'),
  eorig: args.includes('--eorig'),
  r2nu: false,   // R2nu は +R2nu で RULES に直接入れる
});
const tcs = t => off ? B.tcToString(X.iota(t), false) : S.tcOf(t);

const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const items = [];
for (let i = from; i <= to && i < rows.length; i++) {
  const [sheet, b, u] = rows[i];
  if (sheet !== 'To psi(I)' || !b.startsWith('(') || b.split(')')[0].split(',').length !== 3) continue;
  const it = { idx: i, label: u };
  try {
    it.t = E.parseLabel(X.fixLabel(u));
    it.tc = tcs(it.t);
    if (E.dom(it.t) === 'w') it.ap = [4, 5, 6].map(n => tcs(E.fs(it.t, E.nat(n))));
  } catch (e) { it.err = e.message.slice(0, 50); }
  items.push(it);
}
const q = [], at = [];
const ask = (l, cb) => { q.push(l); at.push(cb); };
items.forEach((it, k) => {
  if (!it.tc) return;
  ask(`std ${it.tc}`, r => { it.std = r === '1'; });
  if (it.ap) {
    it.apStd = true;
    it.ap.forEach(a => ask(`std ${a}`, r => { if (r !== '1') it.apStd = false; }));
    it.ap.forEach(a => ask(`cmp ${a} ${it.tc}`, r => { if (r !== '-1') it.notBelow = true; }));
    ask(`supseq ${it.ap.join(' ')}`, r => { it.sup = r; });
  }
  const nx = items[k + 1];
  if (nx && nx.idx === it.idx + 1 && nx.tc) ask(`cmp ${it.tc} ${nx.tc}`, r => { it.order = r; });
});
batch(q).forEach((r, i) => at[i](r));
const cnt = { items: items.length, err: 0, nonstd: 0, weak: 0, supbad: 0, orderbad: 0, trusted: 0 };
const bad = [];
for (const it of items) {
  if (it.err) { cnt.err++; continue; }
  const codes = [];
  if (!it.std) { cnt.nonstd++; codes.push('nonstd'); }
  if (it.notBelow) { cnt.notbelow = (cnt.notbelow || 0) + 1; codes.push('not-below'); }
  if (it.ap) {
    const ok = it.sup === it.tc;
    if (it.apStd && !ok) { cnt.supbad++; codes.push('SUP≠'); }
    if (!it.apStd) { cnt.weak++; codes.push('weak'); }
    if (it.apStd && ok && it.std) cnt.trusted++;
  }
  if (it.order && it.order !== '-1') { cnt.orderbad++; codes.push('order' + it.order); }
  if (codes.length) bad.push(`${it.idx} ${codes.join(',')} ${it.label}`);
}
console.log(off ? 'baseline' : 'sigma', JSON.stringify(cnt));
const ji = args.indexOf('--json');
if (ji >= 0) fs.writeFileSync(args[ji + 1], JSON.stringify(items.map(it => ({
  idx: it.idx, label: it.label, tc: it.tc, err: it.err, std: it.std, apStd: it.apStd,
  supOk: it.ap ? it.sup === it.tc : null, order: it.order, notBelow: !!it.notBelow,
})), null, 1));
for (const l of bad.slice(0, 70)) console.log('  ' + l.slice(0, 150));
