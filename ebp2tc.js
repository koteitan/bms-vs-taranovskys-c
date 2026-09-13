// 拡張 Buchholz ψ の項 → Taranovsky's C。
// bms2tc.js の ι（Buchholz 項 → C）を、添字が項（超限でもよい）の場合に広げたもの。
//
//   Ω̂_1 = Ω_1,  Ω̂_{ν+1} = C(Ω_2, Ω̂_ν),  Ω̂_{γ+ω^{1+x}} = C(C(ι(x), Ω_2), Ω̂_γ)  （Ω̂_0 の位置は 0）
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
const RULES = { R2p: false };
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
      const ts = terms(i);
      const last = ts[ts.length - 1];
      const gamma = mk(ts.slice(0, -1));
      const e = logP(last), en = natValue(e);
      const x = en !== null ? nat(en - 1) : e;
      r = Cn(C(iota(x), W(2)), gamma === 0 ? Z : omegaHat(gamma));
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
    const degree = bh === 0 ? chain(b, omegaHat(mu)) : iota(b);
    const base = aprime !== 0 ? iota(P(nu, aprime)) : baseOf(nu);
    return Cn(degree, base);
  }
  if (nu === 0 && aprime !== 0) {
    // R2: 最後の項（段 μ ≥ 2）の指数を ψ̂_1(a) にする。R2p（実験）: ψ̂_{μ-1}(a)（μ が後続のとき）
    const mm1 = RULES.R2p ? pred(mu) : null;
    const k = mm1 !== null ? mm1 : ONE;
    return C(C(iota(P(k, a)), iota(aprime)), Z);
  }
  return C(iota(a), baseOf(nu));
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
