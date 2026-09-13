#!/usr/bin/env node
// 拡張 Buchholz ψ の項 t について「ι(t) が C の標準形になるか」を規則 R4 で判定し、実際の標準形判定と照合する。
//
// R4: 項をたどり、添字の中では s = その位置を含む一番外側の添字の主項とする。
//     そこにある崩壊 δ = ψ_κ(X) は、κ ≥ 1、根からの経路上の崩壊の添字の最小値 < κ、X ≥ Ω_{s+1}
//     のすべてを満たすとき除外する。ψ_0 の崩壊の引数に入ったら文脈を作り直す（最小値 0、添字の外）。
// R4 で除外されない正規形の項の集合を EBψ' とすると、ι は EBψ' の上で標準形を与える。
// 正しい翻訳は f = ι∘σ（σ は EBψ から EBψ' への順序同型）になる見込み（未実装）。
//
// 使い方: node tools/ebp_std_rule.js FROM TO [label...]
//   原表の 3 行の行 FROM..TO とその近似列 [1..3]、および追加の表記について、
//   「ι 標準 / R4 許可」の 2×2 表と不一致の例を出す。
const path = require('path');
const fs = require('fs');
const { spawnSync } = require('child_process');
const ROOT = path.join(__dirname, '..');
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');
const { P, terms, cmp, natValue, succ } = E;

// t の中に R4 で除外される崩壊があれば true
function excl(t, minIdx, s) {
  for (const p of terms(t)) {
    if (s !== null && minIdx !== null && p.a !== 0 && natValue(p.i) !== 0 && cmp(minIdx, p.i) < 0
        && cmp(p.a, P(succ(s), 0)) >= 0) return true;
    for (const q of terms(p.i)) if (excl(q, minIdx, s === null ? q : s)) return true;
    if (p.a !== 0) {
      if (natValue(p.i) === 0) { if (excl(p.a, 0, null)) return true; }
      else {
        const m = (minIdx === null || cmp(p.i, minIdx) < 0) ? p.i : minIdx;
        if (excl(p.a, m, s)) return true;
      }
    }
  }
  return false;
}
const allowed = t => E.isStd(t) && !excl(t, null, null);
module.exports = { excl, allowed };
if (require.main !== module) return;

const batch = lines => {
  if (!lines.length) return [];
  const out = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 }).stdout.split('\n');
  return lines.map((_, i) => (out[i] || '').trim());
};
const tcs = t => B.tcToString(X.iota(t), false);
const args = process.argv.slice(2);
const from = +args[0], to = +args[1];
const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const cases = [];
const addCase = (label, t) => { try { cases.push({ label, tc: tcs(t), r: allowed(t), n: E.isStd(t) }); } catch (e) { /* ι が作れない項は飛ばす */ } };
const addWithFs = (label, t) => {
  addCase(label, t);
  if (E.dom(t) === 'w') for (const n of [1, 2, 3]) { try { addCase(`${label} [${n}]`, E.fs(t, E.nat(n))); } catch (e) { /* skip */ } }
};
for (let i = from; i <= to && i < rows.length; i++) {
  const [sheet, b, u] = rows[i];
  if (sheet !== 'To psi(I)' || !b.startsWith('(') || b.split(')')[0].split(',').length !== 3) continue;
  try { addWithFs(`${i} ${u}`, E.parseLabel(X.fixLabel(u))); } catch (e) { /* 読めない表記は飛ばす */ }
}
for (const u of args.slice(2)) { try { addWithFs(u, E.parseLabel(X.fixLabel(u))); } catch (e) { console.log('parse', u, e.message); } }
const res = batch(cases.map(c => `std ${c.tc}`));
const table = { 'std&allowed': 0, 'std&excluded': 0, 'nonstd&allowed': 0, 'nonstd&excluded': 0 };
const dis = [];
cases.forEach((c, k) => {
  const s = res[k] === '1';
  table[`${s ? 'std' : 'nonstd'}&${c.r ? 'allowed' : 'excluded'}`]++;
  if (s !== c.r) dis.push(`std=${s ? 1 : 0} R4=${c.r ? 1 : 0} normal=${c.n ? 1 : 0}  ${c.label}`.slice(0, 170));
});
console.log('cases', cases.length, JSON.stringify(table));
for (const l of dis.slice(0, 50)) console.log('  ' + l);
