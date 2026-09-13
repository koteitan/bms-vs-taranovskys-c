// 拡張 Buchholz ψ（添字も項）: 項、正規形、順序、基本列、順序数演算、シートの UNOCF 表記のパーサ。
// ブラウザ（globalThis.Ebpsi）と node（module.exports）の両方で使う。
//
// 項:  0（数値 0）| 主項 {i, a}（ψ_i(a)、i も項）| 和（主項 2 個以上の配列、非増加）
//      Ω_i = ψ_i(0),  1 = ψ_0(0),  ω = ψ_0(1)
(function (root) {
'use strict';

const ONE = { i: 0, a: 0 };
const P = (i, a) => ({ i, a });

function terms(t) { return t === 0 ? [] : (Array.isArray(t) ? t : [t]); }
function mk(ts) { return ts.length === 0 ? 0 : (ts.length === 1 ? ts[0] : ts); }
function nat(n) { return mk(Array.from({ length: n }, () => ONE)); }
const isPrin = t => t !== 0 && !Array.isArray(t);
const isOne = p => isPrin(p) && p.i === 0 && p.a === 0;

// 自然数なら値、そうでなければ null
function natValue(t) {
  const ts = terms(t);
  return ts.every(isOne) ? ts.length : null;
}

// ---- 順序
function cmp(x, y) {
  const xs = terms(x), ys = terms(y);
  const n = Math.min(xs.length, ys.length);
  for (let k = 0; k < n; k++) {
    const c = cmpP(xs[k], ys[k]);
    if (c !== 0) return c;
  }
  return xs.length === ys.length ? 0 : (xs.length < ys.length ? -1 : 1);
}
function cmpP(p, q) {
  const c = cmp(p.i, q.i);
  return c !== 0 ? c : cmp(p.a, q.a);
}
const eq = (x, y) => cmp(x, y) === 0;

// ---- 和（CNF の吸収つき）
function add(x, y) {
  const xs = terms(x).slice(), ys = terms(y);
  if (ys.length === 0) return x;
  while (xs.length && cmpP(xs[xs.length - 1], ys[0]) < 0) xs.pop();
  return mk(xs.concat(ys));
}
function succ(x) { return add(x, ONE); }

// x = y + 1 なら y、そうでなければ null
function pred(x) {
  const xs = terms(x);
  if (xs.length && isOne(xs[xs.length - 1])) return mk(xs.slice(0, -1));
  return null;
}

// ---- 正規形（G 集合の条件）
// G_u(t): ψ_v(b) (v ≥ u) の b と、その添字・引数の中の同様の項
function G(u, t, out) {
  for (const p of terms(t)) {
    if (cmp(p.i, u) >= 0) {
      out.push(p.a);
      G(u, p.i, out);
      G(u, p.a, out);
    }
  }
  return out;
}
function isStd(t) {
  const ts = terms(t);
  for (let k = 0; k < ts.length; k++) {
    if (k > 0 && cmpP(ts[k - 1], ts[k]) < 0) return false;
    const p = ts[k];
    if (!isStd(p.i) || !isStd(p.a)) return false;
    for (const g of G(p.i, p.a, [])) if (cmp(g, p.a) >= 0) return false;
  }
  return true;
}

// ---- 基本列
// dom: 0 | 1 | 'w' | 主項 Ω_v（v は後続）
function dom(t) {
  const ts = terms(t);
  if (ts.length === 0) return 0;
  const p = ts[ts.length - 1];
  if (p.a === 0) {
    if (p.i === 0) return 1;
    if (pred(p.i) !== null) return p;
    return dom(p.i);
  }
  const d = dom(p.a);
  if (d === 1) return 'w';
  if (d === 'w') return 'w';
  return cmp(d.i, p.i) <= 0 ? d : 'w';
}

// t[η]（η は項。dom = 'w' または 1 のときは自然数の項）
function fs(t, eta) {
  const ts = terms(t);
  if (ts.length === 0) return 0;
  const head = ts.slice(0, -1);
  const r = fsP(ts[ts.length - 1], eta);
  return add(mk(head), r);
}
function fsP(p, eta) {
  if (p.a === 0) {
    if (p.i === 0) return 0;
    if (pred(p.i) !== null) return eta;
    return P(fs(p.i, eta), 0);
  }
  const d = dom(p.a);
  if (d === 1) {
    const n = natValue(eta);
    const a1 = pred(p.a);
    return mk(Array.from({ length: n }, () => P(p.i, a1)));
  }
  if (d === 'w' || cmp(d.i, p.i) <= 0) return P(p.i, fs(p.a, eta));
  // dom(a) = Ω_{w+1}, w+1 > i: γ_0 = Ω_w, γ_{k+1} = ψ_w(a[γ_k])
  const w = pred(d.i);
  const n = natValue(eta);
  let g = P(w, 0);
  for (let k = 0; k < n; k++) g = P(w, fs(p.a, g));
  return P(p.i, fs(p.a, g));
}

// ---- log_ω と ω^x
// 添字 > u の項（high）と ≤ u の項（low）
function splitHigh(a, u) {
  const ts = terms(a);
  return [mk(ts.filter(q => cmp(q.i, u) > 0)), mk(ts.filter(q => cmp(q.i, u) <= 0))];
}
function logP(p) {
  const [high, low] = splitHigh(p.a, p.i);
  if (high === 0) return p.i === 0 ? p.a : add(P(p.i, 0), p.a);
  if (low !== 0) return add(P(p.i, high), low);
  return p;
}
// 主項 p = ψ_u(β) が ε 数型（β の項がすべて添字 > u）か
function isEpsP(p) {
  const [high, low] = splitHigh(p.a, p.i);
  return high !== 0 && low === 0;
}
function expW(x) {
  const xs = terms(x);
  if (xs.length === 0) return ONE;
  const p1 = xs[0], rest = mk(xs.slice(1));
  const [h1] = splitHigh(p1.a, p1.i);
  let q;
  if (h1 !== 0) {
    // 先頭の主項が ε = ψ_u(h) 以上: x = ε + x'（x' は p1 = ε なら残り、p1 > ε なら x 自身）で
    // ω^x = ψ_u(h + x')（引数への戻し）
    if (isEpsP(p1) && rest === 0) return p1;
    const xp = isEpsP(p1) ? rest : x;
    q = P(p1.i, add(h1, xp));
  } else if (p1.i === 0) {
    q = P(0, x);
  } else {
    // ω^{Ω_u+r} = ψ_u(r)、先頭が Ω_u より大きければ Ω_u + x = x
    q = P(p1.i, p1.a === 0 ? rest : x);
  }
  if (isStd(q)) return q;
  throw new Error('expW: no normal form for ω^' + toString(x));
}

// ---- 積・冪
function mul(x, y) {
  if (x === 0 || y === 0) return 0;
  const lx = logP(terms(x)[0]);
  let res = 0;
  for (const b of terms(y)) {
    res = isOne(b) ? add(res, x) : add(res, expW(add(lx, logP(b))));
  }
  return res;
}
function pow(x, y) {
  if (y === 0) return ONE;
  if (x === 0) return 0;
  const xn = natValue(x);
  if (xn === 1) return ONE;
  const ys = terms(y);
  let k = ys.length;
  while (k > 0 && isOne(ys[k - 1])) k--;
  const ylim = mk(ys.slice(0, k)), n = ys.length - k;
  let res = ONE;
  if (ylim !== 0) {
    if (xn !== null) {
      // k^(ω·z) = ω^z
      let z = 0;
      for (const b of terms(ylim)) {
        const e = logP(b), en = natValue(e);
        z = add(z, expW(en !== null ? nat(en - 1) : e));
      }
      res = expW(z);
    } else {
      res = expW(mul(logP(terms(x)[0]), ylim));
    }
  }
  for (let j = 0; j < n; j++) res = mul(res, x);
  return res;
}

// ---- 文字列化（内部表記: 0, 1, w, Ω_i, ψ_i(a), 和は +）
function toString(t) {
  const ts = terms(t);
  if (ts.length === 0) return '0';
  return ts.map(p => {
    if (isOne(p)) return '1';
    if (p.a === 0) return `Ω_${idxStr(p.i)}`;
    return `ψ_${idxStr(p.i)}(${toString(p.a)})`;
  }).join('+');
}
function idxStr(i) {
  const n = natValue(i);
  if (n !== null) return String(n);
  const s = toString(i);
  return `{${s}}`;
}

// ---- シートの UNOCF 表記のパーサ
// psi(X) = ψ_0(X), psi_n(X) = ψ_n(X), psi_W_(x+1)(X) = ψ_x(X)（Ω_{x+1} の直下への崩壊）,
// W = Ω_1, W_x = Ω_x, w = ω, "w2" = ω·2, 数字, + * ^（^ は右結合）
function parseLabel(src) {
  const s = src.replace(/\s+/g, '');
  let pos = 0;
  const peek = str => s.startsWith(str, pos);
  const fail = msg => { throw new Error(`${msg} at "${s.slice(pos)}" in "${s}"`); };
  function num() {
    let j = pos;
    while (j < s.length && /\d/.test(s[j])) j++;
    if (j === pos) return null;
    const n = +s.slice(pos, j);
    pos = j;
    return n;
  }
  function expr() {
    let x = term();
    while (s[pos] === '+') { pos++; x = add(x, term()); }
    return x;
  }
  function term() {
    let x = factor();
    while (s[pos] === '*') { pos++; x = mul(x, factor()); }
    return x;
  }
  function factor() {
    const b = base();
    if (s[pos] === '^') { pos++; return pow(b, factor()); }
    return b;
  }
  function wAtom() {
    pos++; // w
    const n = num();
    const w = P(0, ONE);
    return n === null ? w : mul(w, nat(n));
  }
  function atom() {
    if (s[pos] === '(') { pos++; const x = expr(); if (s[pos] !== ')') fail('expected )'); pos++; return x; }
    if (peek('psi')) return base();
    if (s[pos] === 'w') return wAtom();
    if (/\d/.test(s[pos])) return nat(num());
    if (s[pos] === 'W') return omega();
    fail('bad atom');
  }
  function omega() {
    pos++; // W
    if (s[pos] === '_') { pos++; return P(atom(), 0); }
    const n = num();  // "W2" = Ω·2
    return n === null ? P(ONE, 0) : mul(P(ONE, 0), nat(n));
  }
  function base() {
    if (peek('psi')) {
      pos += 3;
      let idx = 0;
      if (s[pos] === '_') {
        pos++;
        if (peek('W_')) {
          pos += 2;
          const x = atom();
          const y = pred(x);
          if (y === null) fail('psi_W_ with a non-successor subscript');
          idx = y;
        } else if (/\d/.test(s[pos])) {
          idx = nat(num());
        } else fail('bad psi subscript');
      }
      if (s[pos] !== '(') fail('expected (');
      pos++;
      const a = expr();
      if (s[pos] !== ')') fail('expected )');
      pos++;
      return P(idx, a);
    }
    return atom();
  }
  const x = expr();
  if (pos !== s.length) fail('trailing');
  return x;
}

const api = { ONE, P, terms, mk, nat, natValue, cmp, eq, add, succ, pred, isStd, dom, fs, splitHigh, logP, expW, mul, pow, toString, parseLabel };
if (typeof module !== 'undefined' && module.exports) module.exports = api;
else root.Ebpsi = api;
})(typeof globalThis !== 'undefined' ? globalThis : this);
