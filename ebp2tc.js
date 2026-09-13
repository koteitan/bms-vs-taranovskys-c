// 拡張 Buchholz ψ の項 → Taranovsky's C。
// bms2tc.js の ι（Buchholz 項 → C）を、添字が項（超限でもよい）の場合に広げたもの。
//
//   Ω̂_1 = Ω_1,  Ω̂_{ν+1} = C(Ω_2, Ω̂_ν),  Ω̂_{γ+ω^e} = C(Ω_2 + e, Ω̂_γ)  （Ω_2 + e = chain(e, Ω_2)。Ω̂_0 の位置は 0）
//   それ以外の規則（和、R2、第 2 引数の最小化、N2）は bms2tc.js と同じ。N2 は ν が 2 以上の後続のときだけ。
(function (root) {
'use strict';
const isNode = typeof module !== 'undefined' && module.exports;
const E = isNode ? require('./ebpsi.js') : root.Ebpsi;
const B = isNode ? require('./bms2tc.js') : root.Bms2tc;
const { C, W, Z } = B;
const { ONE, P, terms, mk, nat, natValue, cmp, succ, pred, splitHigh, logP } = E;

const tcmp = B.cmp;
// 実験用の規則スイッチ（tools/ebp_lab.js が書き換える）
const RULES = { R2p: false, R2s: false, R2c: false, R2e: false, R2u: false, R2z: false, R2n: true, R2h: false, R1d: false, R2g: false };

// R2g（実験）: 段 μ の素の Ω_μ への「右端の道」をたどり、その指数を E に置き換える一般形。
// 道は段 ≥ μ の項だけを通り、expT / ι / chain の計算の形をなぞる。null = 置き換えなし。
function expRP(p, mu, E) {
  const c0 = cmp(p.i, mu);
  if (c0 < 0) return null;
  if (p.a === 0) return c0 === 0 ? E : null;
  const [h, l] = splitHigh(p.a, p.i);
  if (h === 0) {
    if (p.i === 0) return null;
    return chainRP2(p.a, mu, E, omegaHat(p.i));
  }
  if (l !== 0) return chainRP2(l, mu, E, iota(P(p.i, h)));
  return iotaRP(p, mu, E);
}
function chainRP2(a, mu, E, base) {
  const ts = terms(a);
  if (ts.length === 0) return null;
  const r = expRP(ts[ts.length - 1], mu, E);
  return r === null ? null : C(r, chain(mk(ts.slice(0, -1)), base));
}
function iotaRPsum(x, mu, E) {
  const ts = terms(x);
  if (ts.length === 0) return null;
  if (ts.length === 1) return iotaRP(ts[0], mu, E);
  const r = expRP(ts[ts.length - 1], mu, E);
  return r === null ? null : C(r, iota(mk(ts.slice(0, -1))));
}
function iotaRP(p, mu, E) {
  if (cmp(p.i, mu) < 0 || p.a === 0) return null;
  const nu = p.i, a = p.a;
  const [high, low] = splitHigh(a, nu);
  if (high === 0) {
    if (nu === 0) return null;
    const nv = natValue(nu), nm1 = pred(nu);
    const ats = terms(a);
    if (nm1 !== null && (nv === null || nv >= 2) && cmp(ats[ats.length - 1].i, nu) === 0) return null; // N2 の形はなぞらない
    const r = chainRP2(a, mu, E, omegaHat(nu));
    return r === null ? null : C(r, omegaHat(nu));
  }
  if (low !== 0) {
    const Pt = iota(P(nu, high));
    const r = chainRP2(low, mu, E, Pt);
    return r === null ? null : C(r, Pt);
  }
  const hs = terms(high);
  const aprime = mk(hs.slice(0, -1));
  const last = hs[hs.length - 1];
  if (cmp(last.i, succ(nu)) === 0) {
    const [bh] = splitHigh(last.a, last.i);
    const r = bh === 0 ? chainRP2(last.a, mu, E, omegaHat(last.i)) : iotaRPsum(last.a, mu, E);
    if (r === null) return null;
    return Cn(r, aprime !== 0 ? iota(P(nu, aprime)) : baseOf(nu));
  }
  if (nu === 0) return null;
  const r = iotaRPsum(a, mu, E);
  return r === null ? null : C(r, baseOf(nu));
}
function Cn(x, b) {
  while (b[0] === 'C' && tcmp(x, b[1]) === 1) b = b[2];
  return C(x, b);
}

const hatMemo = new Map();
function omegaHat(i) {
  const key = E.toString(i);
  if (hatMemo.has(key)) return hatMemo.get(key);
  let r;
  const n = natValue(i);
  if (n !== null) {
    if (n === 0) throw new Error('omegaHat(0)');
    r = W(1);
    for (let k = 1; k < n; k++) r = C(W(2), r);
  } else {
    const j = pred(i);
    if (j !== null) r = C(W(2), omegaHat(j));
    else {
      // Ω̂_{γ+ω^e} = C(Ω_2 + e, Ω̂_γ)、Ω_2 + e = chain(e, Ω_2)
      // （Ω_ω → Ω_2+1, Ω_{ω^2} → Ω_2+2, Ω_Ω → Ω_2+Ω, Ω_{Ω_ω} → Ω_2+Ω̂_ω）
      const ts = terms(i);
      const last = ts[ts.length - 1];
      const gamma = mk(ts.slice(0, -1));
      const e = logP(last);
      r = Cn(chain(e, W(2)), gamma === 0 ? Z : omegaHat(gamma));
    }
  }
  hatMemo.set(key, r);
  return r;
}
const baseOf = nu => (nu === 0 ? Z : omegaHat(nu));

function chain(a, t) {
  for (const q of terms(a)) t = C(expT(q), t);
  return t;
}

function expT(p) {
  const nu = p.i, a = p.a;
  const [high, low] = splitHigh(a, nu);
  if (high === 0) {
    if (nu === 0) return iota(a);
    if (a === 0) return omegaHat(nu);
    return chain(a, omegaHat(nu));
  }
  if (low !== 0) return chain(low, iota(P(nu, high)));
  return iota(p);
}

// N2: chain(a, Ω̂_ν) の最後の項を高さ ν のままたどった先の ψ_ν(0) の指数を e に置き換える
function chainRP(a, nu, e) {
  const ts = terms(a);
  if (ts.length === 0) return null;
  const last = ts[ts.length - 1];
  if (cmp(last.i, nu) !== 0) return null;
  const init = chain(mk(ts.slice(0, -1)), omegaHat(nu));
  let e2;
  if (last.a === 0) e2 = e;
  else {
    const [h] = splitHigh(last.a, nu);
    if (h !== 0) return null;
    e2 = chainRP(last.a, nu, e);
    if (e2 === null) return null;
  }
  return C(e2, init);
}

// chainRP の基点を指定できる版: chain(a, base) の最後の段 ν の項をたどった先の ψ_ν(0) の指数を e に。
// 途中の ψ_ν(c) では基点 Ω̂_ν に戻る（chainRP と同じ）。
function chainRPBase(a, nu, e, base) {
  const ts = terms(a);
  if (ts.length === 0) return null;
  const last = ts[ts.length - 1];
  if (cmp(last.i, nu) !== 0) return null;
  const init = chain(mk(ts.slice(0, -1)), base);
  let e2;
  if (last.a === 0) e2 = e;
  else {
    const [h] = splitHigh(last.a, nu);
    if (h !== 0) return null;
    e2 = chainRP(last.a, nu, e);
    if (e2 === null) return null;
  }
  return C(e2, init);
}

function iota(t) {
  const ts = terms(t);
  if (ts.length === 0) return Z;
  if (ts.length > 1) {
    let r = iota(ts[0]);
    for (const q of ts.slice(1)) r = C(expT(q), r);
    return r;
  }
  const nu = t.i, a = t.a;
  const [high, low] = splitHigh(a, nu);
  if (high === 0) {
    if (nu === 0) return C(iota(a), Z);
    if (a === 0) return omegaHat(nu);
    const nv = natValue(nu), nm1 = pred(nu);
    if (nm1 !== null && (nv === null || nv >= 2)) {
      const lc = chainRP(a, nu, Cn(chain(a, omegaHat(nu)), omegaHat(nm1)));
      if (lc) return C(lc, omegaHat(nu));
    }
    return C(chain(a, omegaHat(nu)), omegaHat(nu));
  }
  if (low !== 0) {
    const Pt = iota(P(nu, high));
    return C(chain(low, Pt), Pt);
  }
  const hs = terms(high);
  const aprime = mk(hs.slice(0, -1));
  const last = hs[hs.length - 1];
  const mu = last.i, b = last.a;
  if (cmp(mu, succ(nu)) === 0) {
    const [bh] = splitHigh(b, mu);
    let degree = bh === 0 ? chain(b, omegaHat(mu)) : iota(b);
    // R1d（実験）: ψ_0(α' + ψ_1(b)) で b が高い添字を含み、b の最後の項 q2 = ψ_{m}(c) が段 m ≥ 2 のとき、
    //   次数 ι(b) の中で R2n と同じ置き換えを E2 = ψ̂_{m-1}(b) で行う
    if (RULES.R1d && nu === 0 && bh !== 0) {
      const bts = terms(b);
      const q2 = bts[bts.length - 1];
      const m2 = q2.i, mp2 = pred(m2), mv2 = natValue(m2);
      if (bts.length >= 2 && mp2 !== null && (mv2 === null || mv2 >= 2)) {
        const binit = mk(bts.slice(0, -1));
        const E2 = iota(P(mp2, b));
        if (q2.a === 0) degree = Cn(E2, iota(binit));
        else {
          const [h2, l2] = splitHigh(q2.a, m2);
          let ex2 = null;
          if (h2 === 0) ex2 = chainRPBase(q2.a, m2, E2, omegaHat(m2));
          else if (l2 !== 0) ex2 = chainRPBase(l2, m2, E2, iota(P(m2, h2)));
          if (ex2) degree = C(ex2, iota(binit));
        }
      }
    }
    const base = aprime !== 0 ? iota(P(nu, aprime)) : baseOf(nu);
    return Cn(degree, base);
  }
  if (nu === 0 && aprime !== 0) {
    // R2u（実験）: ψ_0(α' + ψ_μ(b)) で b = (添字 > μ の部分) + l、l = (段 μ の項) + (段 < μ の項)
    //   b が後続                → 和の規則
    //   l が段 μ の項で終わる    → 指数 ι_ctx(l)
    //   l に段 μ の項がない      → 指数 ψ̂_{μ-1}(a)
    //   それ以外                → 指数 C(ψ̂_{μ-1}(a), ι_ctx(段 μ の部分))
    // R2n（実験）: 最後の項 q = ψ_μ(b)（μ 後続）の指数を、和の規則の指数 log q の
    //   「最後の段 μ の項をたどった先の指数」を E = ψ̂_{μ-1}(a) に置き換えたものにする（b = 0 なら E そのもの）
    if (RULES.R2n) {
      const mpn = pred(mu);
      if (mpn === null) return C(iota(a), Z);
      const En = iota(P(mpn, a));
      if (b === 0) return C(Cn(En, iota(aprime)), Z);
      const [hq, lq] = splitHigh(b, mu);
      let ex = null;
      if (hq === 0) ex = chainRPBase(b, mu, En, omegaHat(mu));
      else if (lq !== 0) ex = chainRPBase(lq, mu, En, iota(P(mu, hq)));
      else if (RULES.R2h) {
        // R2h（実験）: b が高い添字の項 ψ_λ(c)（λ > μ）1 個だけのとき、ι(ψ_μ(b)) = C(ι(ψ_λ(c)), Ω̂_μ) の
        //   ι(ψ_λ(c)) の中で段 μ の最後の項をたどって E に置き換える
        const hts = terms(hq);
        if (hts.length === 1 && hts[0].a !== 0) {
          const lam = hts[0].i, c = hts[0].a;
          const [hc, lc] = splitHigh(c, lam);
          if (cmp(lam, succ(mu)) === 0) {
            // λ = μ+1: ι(ψ_μ(ψ_λ(c))) = Cn(chain(c, Ω̂_λ), Ω̂_μ)
            if (hc === 0) {
              const r = chainRPBase(c, mu, En, omegaHat(lam));
              if (r) ex = Cn(r, omegaHat(mu));
            }
          } else {
            // λ > μ+1: ι(ψ_μ(ψ_λ(c))) = C(ι(ψ_λ(c)), Ω̂_μ)
            let inner = null;
            if (hc === 0) {
              const r = chainRPBase(c, mu, En, omegaHat(lam));
              if (r) inner = C(r, omegaHat(lam));
            } else if (lc !== 0) {
              const Pl = iota(P(lam, hc));
              const r = chainRPBase(lc, mu, En, Pl);
              if (r) inner = C(r, Pl);
            }
            if (inner) ex = C(inner, omegaHat(mu));
          }
        }
      }
      if (ex === null) return C(iota(a), Z);
      return C(C(ex, iota(aprime)), Z);
    }
    // R2z（実験）: 最後の項が素の Ω_μ（b = 0、μ 後続）のときだけ ψ̂_{μ-1}(a) に潰し、他は和の規則
    if (RULES.R2z) {
      const mpz = pred(mu);
      if (b !== 0 || mpz === null) return C(iota(a), Z);
      return C(Cn(iota(P(mpz, a)), iota(aprime)), Z);
    }
    if (RULES.R2u) {
      const mp = pred(mu);
      if (E.dom(b) === 1 || (b === 0 && mp === null)) return C(iota(a), Z);   // 後続、または極限添字の Ω_μ
      const [hb, lb] = splitHigh(b, mu);
      const lts = terms(lb);
      const lhi = mk(lts.filter(q => cmp(q.i, mu) === 0));
      const llo = mk(lts.filter(q => cmp(q.i, mu) < 0));
      const collapse = () => iota(P(mp !== null ? mp : ONE, a));
      const base = iota(aprime);
      let ex;
      if (lb !== 0 && cmp(hb, aprime) === 0 && llo === 0) ex = iotaCtx(lhi, aprime, mu);
      else if (lb !== 0 && cmp(hb, aprime) === 0 && lhi !== 0) ex = C(collapse(), iotaCtx(lhi, aprime, mu));
      else ex = collapse();
      return C(Cn(ex, base), Z);
    }
    // R2s（実験）: 最後の項 ψ_μ(b) の b が後続なら潰さない（和の規則）。R2c（実験）: b の共終数が ω でも潰さない
    const db = E.dom(b);
    if ((RULES.R2s && db === 1) || (RULES.R2c && (db === 1 || db === 'w'))) return C(iota(a), Z);
    // R2e（実験）: b = α' + l（l は段 μ の項で終わる）なら指数を ι(l) にする
    if (RULES.R2e) {
      const [hb, lb] = splitHigh(b, mu);
      const lts = terms(lb);
      if (lts.length && cmp(lts[lts.length - 1].i, mu) === 0 && cmp(hb, aprime) === 0) {
        return C(C(iota(lb), iota(aprime)), Z);
      }
    }
    // R2: 最後の項（段 μ ≥ 2）の指数を ψ̂_1(a) にする。R2p（実験）: ψ̂_{μ-1}(a)（μ が後続のとき）
    const mm1 = RULES.R2p ? pred(mu) : null;
    const k = mm1 !== null ? mm1 : ONE;
    return C(C(iota(P(k, a)), iota(aprime)), Z);
  }
  return C(iota(a), baseOf(nu));
}

// R2u 用: 文脈 α' のもとでの ι(l)。l が 1 個の主項 ψ_μ(c) で N2 が効くときは、
// N2 の E を ψ̂_{μ-1}(α' + l) = Cn(C(chain(c, Ω̂_μ), ι(α')), Ω̂_{μ-1}) にする
//   E = Cn(ι(α' + l), Ω̂_{μ-1})
//   l = ψ_μ(c)（c ≠ 0）      → N2 の E をこれにする
//   l = Ω_μ + r（r ≠ 0）     → chain(r, Ω̂_μ) の最後の段 μ の項の指数を E にする
//   l = Ω_μ など             → ι(l) のまま
function iotaCtx(l, aprime, mu) {
  const ts = terms(l);
  const mp = pred(mu), mv = natValue(mu);
  if (mp === null || (mv !== null && mv < 2)) return iota(l);
  const Ectx = Cn(iota(E.add(aprime, l)), omegaHat(mp));
  if (ts.length === 1 && ts[0].a !== 0) {
    const c = ts[0].a;
    const [h] = splitHigh(c, mu);
    if (h === 0) {
      const lc = chainRP(c, mu, Ectx);
      if (lc) return C(lc, omegaHat(mu));
    }
  } else if (ts.length >= 2 && ts[0].a === 0 && cmp(ts[0].i, mu) === 0) {
    const lc = chainRP(mk(ts.slice(1)), mu, Ectx);
    if (lc) return lc;
  }
  return iota(l);
}

// シートの UNOCF 表記の誤記の補正（4 行ぶん）
function fixLabel(u) {
  let s = u.replace(/=.*$/, '').replace(/psi_w_/g, 'psi_W_').replace(/(^|[^p])si_W_/g, '$1psi_W_').replace(/^si\(/, 'psi(').trim();
  // 閉じ括弧の過不足を末尾で直す
  const open = (s.match(/\(/g) || []).length, close = (s.match(/\)/g) || []).length;
  if (open > close) s += ')'.repeat(open - close);
  for (let k = close - open; k > 0 && s.endsWith(')'); k--) s = s.slice(0, -1);
  return s;
}

function translateLabel(label, opts) {
  opts = opts || {};
  const t = E.parseLabel(fixLabel(label));
  return { term: t, tc: B.tcToString(iota(t), opts.omega !== false) };
}

const api = { RULES, omegaHat, iota, expT, chain, fixLabel, translateLabel };
if (isNode) module.exports = api;
else root.Ebp2tc = api;
})(typeof globalThis !== 'undefined' ? globalThis : this);
