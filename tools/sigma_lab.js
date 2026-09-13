// sigma2.js FROM TO [--off] : σ for arguments starting with Ω_{Ω_2}
//   a = Ω_{Ω_2} + t_2 + ... ; subscript summand s of a later term:
//   s < η: keep;  s = ψ_1(Ω_{Ω_2}+Y) ↦ ψ_2(Y');  term t_j = Ω_{Ω_2} ↦ Ω_{ψ_2((t_2+..+t_j)')}
//   Y' = Y with its m-th term Ω_{Ω_2} replaced by Ω_{ψ_1(Ω_{Ω_2}+y_1+..+y_m)}
const path = require('path');
const fs = require('fs');
const { spawnSync } = require('child_process');
const ROOT = path.join(__dirname, "..");
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');
const batch = lines => {
  if (!lines.length) return [];
  const out = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 }).stdout.split('\n');
  return lines.map((_, i) => (out[i] || '').trim());
};
const { P, nat, terms, mk, cmp, eq, add, natValue } = E;
const sum = ts => ts.reduce((acc, p) => add(acc, p), 0);

// 段 k（k = 1, 2, …）の定数: W = Ω_{k+1}, OO = Ω_{Ω_{k+1}}, ETA = ψ_k(Ω_{Ω_{k+1}}),
//   BOUND = ψ_{k+1}(Ω_{Ω_{k+1}})（これ以上の添字では式の像が元の項より小さくなる）
function level(k) {
  const W = P(nat(k + 1), 0), OO = P(W, 0);
  return { k, W, OO, ETA: P(nat(k), OO), BOUND: P(nat(k + 1), OO), CUR: nat(k), NEXT: nat(k + 1) };
}
// --k2: 段 1 のあとに段 2（Ω_{Ω_3} の段）も当てる
const LEVELS = (process.argv.includes('--k2') ? [1, 2] : [1]).map(level);
// 段 k の項: 添字が Ω_{k+1} 以上 BOUND 未満（最上位の置き換え用）。isBig: 添字が Ω_{k+1} 以上（λ と添字の規則用）
const isO = (L, q) => q !== 0 && !Array.isArray(q) && cmp(q.i, L.W) >= 0 && cmp(q.i, L.BOUND) < 0;
const isBig = (L, q) => q !== 0 && !Array.isArray(q) && cmp(q.i, L.W) >= 0;
// 中の可算の崩壊 ψ_0(..) にも σ を当てる
function fixAll(t) {
  let out = 0;
  for (const p of terms(t)) out = add(out, natValue(p.i) === 0 ? top(p) : P(fixAll(p.i), fixAll(p.a)));
  return out;
}
// 段 k ≥ 2: 大きい項 y = ψ_i(a) の浅い位置の Ω_k を ψ_{k-1}(y) に置き換える（値は同じ）
//   (1) y の添字 i の主項としての Ω_k、(2) a の最上位の項 ψ_{Ω_k}(..) の添字 Ω_k。崩壊の中の奥は置き換えない
function normE(L, y, yTop) {
  const Wk = P(nat(L.k), 0), Ek = P(nat(L.k - 1), yTop);
  const idx = sum(terms(y.i).map(s => eq(s, Wk) ? Ek : s));
  const arg = y.a === 0 ? 0 : sum(terms(y.a).map(p => eq(p.i, Wk) ? P(Ek, p.a) : p));
  return P(idx, arg);
}
// λ(b): b の先頭の Ω_{Ω_{k+1}} を落とし、残りの大きい項 y_m を Ω_{ψ_k(b_{≤m})} に置き換えた和
function lam(L, b) {
  if (L.k >= 2) b = sum(terms(b).map(y => (isBig(L, y) && !eq(y, L.OO)) ? normE(L, y, y) : y));
  const bs = terms(b), out = [];
  bs.forEach((y, m) => {
    if (m === 0 && eq(y, L.OO)) return;
    if (isBig(L, y)) out.push(P(P(L.CUR, sum(bs.slice(0, m + 1))), 0));
    else out.push(y);
  });
  return sum(out);
}
function slot(L, s) {         // 添字の主項 s: ψ_k(大きい項 + Y) ↦ ψ_{k+1}(λ)
  if (cmp(s, L.ETA) < 0) return s;
  if (natValue(s.i) === L.k && terms(s.a).length && isBig(L, terms(s.a)[0])) return P(L.NEXT, lam(L, s.a));
  return s;
}
// --low: 低い崩壊 ψ_ν(b)（ν ≥ 1）の引数 b にも同じ変換を当てる
const LOW = process.argv.includes('--low');
function argT(L, xs) {
  const out = [];
  let first = -1;   // 最初の段 k の項の位置
  for (let j = 0; j < xs.length; j++) {
    const q = xs[j];
    if (isO(L, q)) {
      if (first < 0) first = j;
      if (j === first && eq(q, L.OO)) out.push(q);
      else {
        const seg = xs.slice(first, j + 1);
        const pre = eq(seg[0], L.OO) ? seg : [L.OO, ...seg];
        out.push(P(P(L.NEXT, lam(L, sum(pre))), 0));
      }
      continue;
    }
    const n = natValue(q.i);
    if (n === 0) { out.push(q); continue; }                                  // 可算の崩壊は fixAll 済み
    const a = (LOW && q.a !== 0) ? argT(L, terms(q.a)) : q.a;
    if (n !== null) { out.push(P(q.i, a)); continue; }                       // 有限添字の低い項
    out.push(P(sum(terms(q.i).map(s => slot(L, s))), a));
  }
  return sum(out);
}
function top(t) {
  if (t.a === 0) return t;
  let xs = terms(fixAll(t.a));
  if (!xs.length) return t;
  for (const L of LEVELS) {
    if (!LOW && (!isO(L, xs[0]) || (xs.length === 1 && eq(xs[0], L.OO)))) continue;
    xs = terms(argT(L, xs));
  }
  return P(0, mk(xs));
}

module.exports = { top, slot, lam, level };
if (require.main !== module) return;
const args = process.argv.slice(2);
const off = args.includes('--off');
// +FLAG で ebp2tc.js の RULES[FLAG] を有効にする
for (const f of args.filter(a => a.startsWith('+'))) X.RULES[f.slice(1)] = true;
const [from, to] = args.filter(a => !a.startsWith('--')).map(Number);
const tr = t => (off || Array.isArray(t) || t === 0 || natValue(t.i) !== 0) ? t : top(t);
// --eorig: 最後の低い項 ψ_μ(b)（μ ≥ 2 の後続）が σ で変わらず R2n の形なら、
//   E = ψ̂_{μ-1}(a) を σ をかける前の引数 a から作る（残りは σ の像）
const EORIG = args.includes('--eorig');
function tcs(t) {
  const t2 = tr(t);
  if (EORIG && !off && !Array.isArray(t) && t !== 0 && natValue(t.i) === 0 && cmp(t, t2) !== 0) {
    const xs = terms(t.a), ys = terms(t2.a);
    const last = xs[xs.length - 1];
    if (xs.length >= 2 && ys.length >= 2 && eq(last, ys[ys.length - 1])) {
      const mu = last.i, nv = natValue(mu), mp = E.pred(mu);
      if (mp !== null && (nv === null || nv >= 2)) {
        const En = X.iota(P(mp, t.a));
        const ap2 = X.iota(mk(ys.slice(0, -1)));
        if (last.a === 0) return B.tcToString(X.C(X.Cn(En, ap2), X.Z), false);
        const exg = X.expRP(last, mu, En);
        if (exg !== null) return B.tcToString(X.C(X.Cn(exg, ap2), X.Z), false);
      }
    }
  }
  return B.tcToString(X.iota(t2), false);
}
const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const items = [];
for (let i = from; i <= to; i++) {
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
  if (it.ap) {
    const ok = it.sup === it.tc;
    if (it.apStd && !ok) { cnt.supbad++; codes.push('SUP≠'); }
    if (!it.apStd) { cnt.weak++; codes.push('weak'); }
    if (it.apStd && ok && it.std) cnt.trusted++;
  }
  if (it.order && it.order !== '-1') { cnt.orderbad++; codes.push('order' + it.order); }
  if (codes.length) bad.push(`${it.idx} ${codes.join(',')} ${it.label}`);
}
console.log(off ? 'baseline' : 'sigma2', JSON.stringify(cnt));
for (const l of bad.slice(0, 70)) console.log('  ' + l.slice(0, 150));
