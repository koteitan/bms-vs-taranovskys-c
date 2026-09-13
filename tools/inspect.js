#!/usr/bin/env node
// 原表（BM4-Analysis の "To psi(I)"）の行について、翻訳 f の数値検証を大きさの区間ごとに数え、sampling.md に書く。
//
//   node tools/inspect.js
//
// 翻訳 f: 1・2 行は規則（Lean CLI の tr）、3 行は原表の表記 → 拡張 Buchholz ψ → ι∘σ（ebp_sigma.js）。
// 検査:
//   標準性      f(M) が C の標準形か
//   順序保存性  原表で隣り合う行 M, M' について f(M) < f(M') か
//   共終性      極限 M について、近似列（1・2 行は BMS の展開 M[4], M[5], M[6]、3 行は表記の基本列 α[4..6]）の像が
//               f(M) より小さく、その上限（supseq）が f(M) に一致するか。近似列の像に非標準形があれば「未確認」
'use strict';
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.join(__dirname, '..');
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const SIG = require(path.join(ROOT, 'ebp_sigma.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');
const batch = lines => {
  if (!lines.length) return [];
  const out = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 }).stdout.split('\n');
  return lines.map((_, i) => (out[i] || '').trim());
};

const all = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const rows = [];
all.forEach(([sheet, b, u], idx) => {
  if (sheet !== 'To psi(I)' || !b.startsWith('(')) return;
  rows.push({ idx, b, label: u, h: b.split(')')[0].split(',').length });
});

// 区間の上端（原表でその順序数に当たる行）
const bound = lab => { const r = rows.find(x => X.fixLabel(x.label).replace(/ /g, '') === lab); return r.idx; };
const RANGES = [
  ['ψ_0(Ω_ω) 未満', bound('psi(W_w)')],
  ['ψ_0(Ω_{ω+1}) 未満', bound('psi(W_(w+1))')],
  ['ψ_0(Ω_{ω^2}) 未満', bound('psi(W_(w^2))')],
  ['ψ_0(Λ) = ψ(I) 未満', bound('psi(I)')],
];

// ---- 1・2 行: tr と bexp
const isLimitBms = b => { const cols = b.match(/\(([^)]*)\)/g); return cols && !cols[cols.length - 1].slice(1, -1).split(',').every(v => v.trim() === '0'); };
const low = rows.filter(r => r.h <= 2);
{
  const q = [], at = [];
  for (const r of low) {
    q.push(`tr ${r.b}`); at.push(v => { r.tc = v; });
    if (isLimitBms(r.b)) {
      r.apB = [];
      for (const n of [4, 5, 6]) { q.push(`bexp ${r.b}[${n}]`); at.push(v => { r.apB.push(v); }); }
    }
  }
  batch(q).forEach((v, i) => at[i](v));
  const q2 = [], at2 = [];
  for (const r of low) if (r.apB) {
    r.ap = [];
    for (const m of r.apB) { q2.push(`tr ${m}`); at2.push(v => { r.ap.push(v); }); }
  }
  batch(q2).forEach((v, i) => at2[i](v));
}
// ---- 3 行: 表記 → ι∘σ
for (const r of rows.filter(r => r.h === 3)) {
  if (X.fixLabel(r.label) === 'psi(I)') { r.tc = 'C(C(C(W_2,W_2),0),0)'; continue; }
  let t;
  try { t = E.parseLabel(X.fixLabel(r.label)); } catch (e) { continue; }
  if (!E.isStd(t)) continue;
  r.t = t;
  try {
    r.tc = SIG.tcOf(t);
    if (E.dom(t) === 'w') r.ap = [4, 5, 6].map(n => SIG.tcOf(E.fs(t, E.nat(n))));
  } catch (e) { r.tc = undefined; r.ap = undefined; }
}
const ok = v => v && v !== '(none)' && v !== 'ERR';
for (const r of rows) { if (!ok(r.tc)) r.tc = undefined; if (r.ap && !r.ap.every(ok)) r.ap = undefined; }

// ---- 標準性・順序・上限
{
  const q = [], at = [];
  rows.forEach((r, k) => {
    if (!r.tc) return;
    q.push(`std ${r.tc}`); at.push(v => { r.std = v === '1'; });
    if (r.ap) {
      r.apStd = true; r.below = true;
      for (const a of r.ap) {
        q.push(`std ${a}`); at.push(v => { if (v !== '1') r.apStd = false; });
        q.push(`cmp ${a} ${r.tc}`); at.push(v => { if (v !== '-1') r.below = false; });
      }
      q.push(`supseq ${r.ap.join(' ')}`); at.push(v => { r.sup = v; });
    }
    const nx = rows[k + 1];
    if (nx && nx.idx === r.idx + 1 && nx.tc) { q.push(`cmp ${r.tc} ${nx.tc}`); at.push(v => { r.order = v; }); }
  });
  batch(q).forEach((v, i) => at[i](v));
}

// ---- 集計
const lines = [];
lines.push('# 数値検証の結果', '');
lines.push('原表（BM4-Analysis の "To psi(I)"、`sheet/bms_rows.json`）の行 M ごとに、翻訳 f(M) を機械で検査した結果です。');
lines.push('証明ではなく、原表にある有限個の行での検査です。`node tools/inspect.js` で作り直せます。', '');
lines.push('## エラー数', '');
lines.push('「エラー数 / 検査した数」。区間は原表の並び（BMS の順序）で、その順序数の行より前の行すべてです（累積）。', '');
lines.push('|大きさ|標準形|順序（隣の行）|近似列 < f(M)|上限 = f(M)|上限を確かめられない|翻訳なし|');
lines.push('|---|---|---|---|---|---|---|');
for (const [name, ub] of RANGES) {
  const rs = rows.filter(r => r.idx < ub);
  const tr = rs.filter(r => r.tc);
  const stdErr = tr.filter(r => !r.std).length;
  const pairs = tr.filter(r => r.order !== undefined && r.idx + 1 < ub);
  const ordErr = pairs.filter(r => r.order !== '-1').length;
  const lim = tr.filter(r => r.ap);
  const belowErr = lim.filter(r => !r.below).length;
  const supChecked = lim.filter(r => r.apStd);
  const supErr = supChecked.filter(r => r.sup !== r.tc).length;
  const supUnk = lim.length - supChecked.length;
  const cell = (e, n) => `${e === 0 ? '✅' : ''}${e}/${n}`;   // 分子が 0 なら ✅
  lines.push(`|${name}|${cell(stdErr, tr.length)}|${cell(ordErr, pairs.length)}|${cell(belowErr, lim.length)}|${cell(supErr, supChecked.length)}|${cell(supUnk, lim.length)}|${cell(rs.length - tr.length, rs.length)}|`);
}
lines.push('');
lines.push('## 各列の意味', '');
lines.push('- 翻訳 f: 1 行・2 行は行列から規則で翻訳（`lean/BmsTc/Translate.lean`）。3 行は原表の順序数表記を拡張 Buchholz ψ の項として読み、ι∘σ で C に写す（`ebp2tc.js`, `ebp_sigma.js`）。');
lines.push('- 標準形: f(M) が Taranovsky の C の標準形であるか。数は翻訳した行の数。');
lines.push('- 順序（隣の行）: 原表で隣り合う 2 行 M < M\' について f(M) < f(M\') であるか。数は隣り合う組の数。');
lines.push('- 近似列 < f(M): 極限の行 M について、近似列の像 f(M[4]), f(M[5]), f(M[6]) がすべて f(M) より小さいか。');
lines.push('  近似列は 1・2 行では BMS の展開 M[n]、3 行では表記 α の基本列 α[n]。数は極限の行の数。');
lines.push('- 上限 = f(M): 近似列の像 f(M[4..6]) の上限（C の中での増加列の上限探索 supseq）が f(M) に一致するか。');
lines.push('  近似列の像がすべて標準形の行だけを数える（非標準形があると上限を正しく求められないため）。');
lines.push('- 上限を確かめられない: 近似列の像に非標準形の項があり、上限の一致を検査できなかった行（エラーには数えていない）。');
lines.push('- 翻訳なし: 原表の表記が読めない、または拡張 Buchholz ψ の正規形でないため、f を作らなかった行。');
lines.push('- 近似列 < f(M) と 上限 = f(M) がそろうと、f(M) = sup f(M[n])（共終性）が数値で確かめられたことになる。');
lines.push('');
const bad = rows.filter(r => r.idx < RANGES[3][1] && r.tc && (!r.std || (r.ap && (!r.below || (r.apStd && r.sup !== r.tc)))));
lines.push('## 標準形・近似列・上限のエラーの行（ψ(I) 未満）', '');
lines.push('|行|BMS|表記|内容|');
lines.push('|---|---|---|---|');
for (const r of bad) {
  const what = [!r.std ? '非標準' : '', r.ap && !r.below ? '近似列が下にない' : '', r.ap && r.apStd && r.sup !== r.tc ? '上限が不一致' : ''].filter(Boolean).join('、');
  lines.push(`|${r.idx}|\`${r.b.length > 60 ? r.b.slice(0, 57) + '...' : r.b}\`|${r.label}|${what}|`);
}
lines.push('');
// 順序のエラー: 原表の表記どうし（拡張 Buchholz ψ）でも順序が逆か
const ordBad = [];
rows.forEach((r, k) => {
  if (r.idx >= RANGES[3][1] || !r.tc || r.order === undefined || r.order === '-1') return;
  const nx = rows[k + 1];
  const labelRev = r.t && nx.t ? E.cmp(r.t, nx.t) >= 0 : null;
  ordBad.push({ r, nx, labelRev });
});
const rev = ordBad.filter(o => o.labelRev === true).length;
lines.push('## 順序のエラーの組（ψ(I) 未満）', '');
lines.push(`${ordBad.length} 組のうち ${rev} 組は、原表の表記どうしを拡張 Buchholz ψ で比べても順序が逆（または等しい）です。`);
lines.push('これらは翻訳ではなく、原表の表記と BMS の並びが食い違っている組です。', '');
lines.push('|行|表記|次の行の表記|表記の順序も逆|');
lines.push('|---|---|---|---|');
for (const o of ordBad) lines.push(`|${o.r.idx}|${o.r.label}|${o.nx.label}|${o.labelRev === null ? '-' : o.labelRev ? 'はい' : 'いいえ'}|`);
fs.writeFileSync(path.join(ROOT, 'sampling.md'), lines.join('\n') + '\n');
process.stdout.write(lines.slice(0, 14).join('\n') + '\n');
