// 拡張 Buchholz ψ の項の像のずれを直す写像 σ。3 行の行の翻訳は f(t) = ι(σ(t))。
//
// ι（ebp2tc.js）は、添字の中に崩壊 ψ_κ(X)（X が大きい）を含む項を C の標準形に写せない（tools/ebp_std_rule.js の R4）。
// その先の項は ι のままだと値がずれるので、σ で「C に写せる項」の側へ順序を保って送ってから ι をかける。
//
// 段 κ（引数の先頭の項の添字 ψ_{κ+1}(..) から読む。κ は有限でも超限でもよい）ごとに、
// ψ_0 の引数 a の先頭が Ω_{Ω_{κ+1}} の段の項のとき:
//   - 添字の主項 ψ_κ(大きい項 + Y) ↦ ψ_{κ+1}(λ)
//   - 2 つ目以降の段 κ の項 q ↦ Ω_{ψ_{κ+1}(λ)}
//   λ(b): b の先頭の Ω_{Ω_{κ+1}} を落とし、残りの大きい項 y_m を Ω_{ψ_κ(b_{≤m})} に置き換えた和
//         （y の浅い位置の Ω_m（m ≥ 2 の後続、段より下）を ψ_{m-1}(y) に置き換えてから）
//   - 中の可算の崩壊 ψ_0(..) にも同じ σ を当てる
// 最後の低い項 ψ_μ(b) が R2n の形なら、その E = ψ̂_{μ-1}(a) は σ の前の引数 a から作る。
// ψ_ν（ν ≥ 1）の中の R2n 型の置き換え（ebp2tc.js の R2nu）は、σ の像の翻訳のときだけ有効にする。
//
// 原表の 3 行（2000〜4506 行）で、段 1・2 だけの σ と比べて悪くなる行はなく、48 行が良くなる（tools/sigma_lab.js）。
'use strict';
const path = require('path');
const E = require(path.join(__dirname, 'ebpsi.js'));
const X = require(path.join(__dirname, 'ebp2tc.js'));
const B = require(path.join(__dirname, 'bms2tc.js'));
const { P, nat, terms, mk, cmp, eq, add, natValue, succ, pred } = E;
const sum = ts => ts.reduce((acc, p) => add(acc, p), 0);

// 段 κ（項）の定数: W = Ω_{κ+1}, OO = Ω_{Ω_{κ+1}}, ETA = ψ_κ(Ω_{Ω_{κ+1}}),
//   BOUND = ψ_{κ+1}(Ω_{Ω_{κ+1}})（これ以上の添字では式の像が元の項より小さくなる）
function level(cur) {
  if (typeof cur === 'number') cur = nat(cur);
  const NEXT = succ(cur), W = P(NEXT, 0), OO = P(W, 0);
  const pc = pred(cur);
  return { CUR: cur, NEXT, W, OO, ETA: P(cur, OO), BOUND: P(NEXT, OO),
           useE: pc !== null && cmp(cur, nat(2)) >= 0, PREV: pc };
}
// 先頭の項 q の添字の最初の主項 ψ_m(..) から段 κ = m - 1 を読む（m が後続でなければなし）
function autoLevels(q) {
  if (q === 0 || Array.isArray(q)) return [];
  const s0 = terms(q.i)[0];
  if (!s0) return [];
  const kap = pred(s0.i);
  if (kap === null || natValue(kap) === 0) return [];
  return [level(kap)];
}

// opts: levels（[1, 2] のような段の並び、または 'auto'＝先頭の項から段を読む。既定 'auto'）,
//       normAll（段より下の Ω_m も E で置き換える、既定 true）, low（低い崩壊の引数にも当てる、既定 false）,
//       eorig（最後の低い項の E を σ の前の引数から作る、既定 true）, r2nu（既定 true）
function makeSigma(opts = {}) {
  const LEVELS = (opts.levels || 'auto') === 'auto' ? null : opts.levels.map(level);
  const LOW = !!opts.low;
  const EORIG = opts.eorig !== false;
  const R2NU = opts.r2nu !== false;
  // 段 κ の項: 添字が Ω_{κ+1} 以上 BOUND 未満（最上位の置き換え用）。isBig: 添字が Ω_{κ+1} 以上（λ と添字の規則用）
  const isO = (L, q) => q !== 0 && !Array.isArray(q) && cmp(q.i, L.W) >= 0 && cmp(q.i, L.BOUND) < 0;
  const isBig = (L, q) => q !== 0 && !Array.isArray(q) && cmp(q.i, L.W) >= 0;
  function fixAll(t) {
    let out = 0;
    for (const p of terms(t)) out = add(out, natValue(p.i) === 0 ? top(p) : P(fixAll(p.i), fixAll(p.a)));
    return out;
  }
  // 大きい項 y = ψ_i(a) の浅い位置の Ω_κ を ψ_{κ-1}(y) に置き換える（値は同じ）
  //   y の添字の主項としての Ω_κ、その主項の引数の最上位の項としての Ω_κ、a の最上位の項 ψ_{Ω_κ}(..) の添字 Ω_κ
  // normAll（実験）: 段 κ の Ω_κ だけでなく、段より下の後続添字の Ω_m（m ≥ 2）を ψ_{m-1}(y) に置き換え、
  //   a の最上位の項としての Ω_m も対象にする
  const NORMALL = opts.normAll !== false;
  function normE(L, y) {
    const Wk = P(L.CUR, 0);
    // p が置き換える Ω_m なら ψ_{m-1}(y)、そうでなければ null
    const rep = p => {
      if (p === 0 || Array.isArray(p) || p.a !== 0) return null;
      if (!NORMALL) return eq(p, Wk) ? P(L.PREV, y) : null;
      const pm = pred(p.i);
      return (pm !== null && cmp(p.i, nat(2)) >= 0 && cmp(p, L.W) < 0) ? P(pm, y) : null;
    };
    const idx = sum(terms(y.i).map(s => rep(s)
      || ((s.a !== 0 && terms(s.a).some(p => rep(p))) ? P(s.i, sum(terms(s.a).map(p => rep(p) || p))) : s)));
    const arg = y.a === 0 ? 0 : sum(terms(y.a).map(p => {
      const r = rep(p.i);
      if (r) return P(r, p.a);                  // ψ_{Ω_m}(..) の添字 Ω_m
      return (NORMALL && rep(p)) || p;          // 最上位の項としての Ω_m（normAll のみ）
    }));
    return P(idx, arg);
  }
  function lam(L, b) {
    if (L.useE || NORMALL) b = sum(terms(b).map(y => (isBig(L, y) && !eq(y, L.OO)) ? normE(L, y) : y));
    const bs = terms(b), out = [];
    bs.forEach((y, m) => {
      if (m === 0 && eq(y, L.OO)) return;
      if (isBig(L, y)) out.push(P(P(L.CUR, sum(bs.slice(0, m + 1))), 0));
      else out.push(y);
    });
    return sum(out);
  }
  function slot(L, s) {
    if (cmp(s, L.ETA) < 0) return s;
    if (eq(s.i, L.CUR) && terms(s.a).length && isBig(L, terms(s.a)[0])) return P(L.NEXT, lam(L, s.a));
    return s;
  }
  function argT(L, xs) {
    const out = [];
    let first = -1;   // 最初の段 κ の項の位置
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
      if (n === 0) { out.push(q); continue; }
      const a = (LOW && q.a !== 0) ? argT(L, terms(q.a)) : q.a;
      if (n !== null) { out.push(P(q.i, a)); continue; }
      out.push(P(sum(terms(q.i).map(s => slot(L, s))), a));
    }
    return sum(out);
  }
  function top(t) {
    if (t.a === 0) return t;
    let xs = terms(fixAll(t.a));
    if (!xs.length) return t;
    for (const L of (LEVELS || autoLevels(xs[0]))) {
      if (!LOW && (!isO(L, xs[0]) || (xs.length === 1 && eq(xs[0], L.OO)))) continue;
      xs = terms(argT(L, xs));
    }
    return P(0, mk(xs));
  }
  // σ（ψ_0 の主項だけに当てる）
  const sigma = t => (Array.isArray(t) || t === 0 || natValue(t.i) !== 0) ? t : top(t);
  // f(t) = ι(σ(t)) の C の項（文字列）
  function tcOf(t) {
    const saved = X.RULES.R2nu;
    if (R2NU) X.RULES.R2nu = true;
    try {
      const t2 = sigma(t);
      if (EORIG && !Array.isArray(t) && t !== 0 && natValue(t.i) === 0 && cmp(t, t2) !== 0) {
        const xs = terms(t.a), ys = terms(t2.a);
        const last = xs[xs.length - 1];
        if (xs.length >= 2 && ys.length >= 2 && eq(last, ys[ys.length - 1])) {
          const mu = last.i, nv = natValue(mu), mp = pred(mu);
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
    } finally {
      X.RULES.R2nu = saved;
    }
  }
  return { sigma, top, tcOf };
}

module.exports = { makeSigma, level, ...makeSigma() };
