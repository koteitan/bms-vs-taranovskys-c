// BMS → Taranovsky's C を行列から直接組む翻訳（作業中）。
// 中間の順序数表記（Buchholz ψ、拡張 Buchholz ψ、原表の UNOCF 表記）を通さない。
// ブラウザ（globalThis.Direct）と node（module.exports）の両方で使う。
//
// 和の分解: 行列を根（1 行目が 0 の列）ごとの木 T_1, …, T_k に分けると
//   f(T_1 … T_k) = Cn(log f(T_k), f(T_1 … T_{k-1}))
//   log p = a（p = C(a,b) で a < p のとき）、そうでなければ p（崩壊した値）。Cn は第 2 引数の最小化。
// 根が 1 つの木 T の規則 tree(T) を行数ごとに作る。規則のない形では null を返す。
(function (root) {
'use strict';
const B = typeof module !== 'undefined' && module.exports ? require('./bms2tc.js') : root.Bms2tc;
const { C, Z, cmp, tcToString, parseBms } = B;

const Cn = (x, b) => { while (b[0] === 'C' && cmp(x, b[1]) === 1) b = b[2]; return C(x, b); };
const logC = p => (p[0] === 'C' && cmp(p[1], p) < 0) ? p[1] : p;

// 末尾の全零行を落とす（全部 0 なら 1 行にする）
function strip(M) {
  if (!M.length) return M;
  let h = M[0].length;
  while (h > 1 && M.every(c => c[h - 1] === 0)) h--;
  return M.map(c => c.slice(0, h));
}

// 根ごとの木に分けて和を組む。M の最初の列は根（1 行目が 0）
function forest(M) {
  let acc = null;
  for (let i = 0; i < M.length;) {
    let j = i + 1;
    while (j < M.length && M[j][0] > 0) j++;
    const t = tree(M.slice(i, j));
    if (t === null) return null;
    acc = acc === null ? t : Cn(logC(t), acc);
    i = j;
  }
  return acc === null ? Z : acc;
}

// 1 行目の親: 前の列で 1 行目の値が小さい最後の列。
// r 行目の親: (r-1) 行目の親を順にたどり、r 行目の値が小さい最初の列（無ければ -1）。
function parentAt(M, j, r) {
  if (r === 0) {
    for (let k = j - 1; k >= 0; k--) if (M[k][0] < M[j][0]) return k;
    return -1;
  }
  let q = parentAt(M, j, r - 1);
  while (q >= 0 && !(M[q][r] < M[j][r])) q = parentAt(M, q, r - 1);
  return q;
}

const W1 = B.W(1), W2 = B.W(2);
const fresh = base => base[0] === '0' ? W1 : C(W2, base);        // 段を 1 つ上げる: Ω̂_{k+1} = C(Ω_2, Ω̂_k)
const omegaHat = k => { let t = Z; for (let i = 0; i < k; i++) t = fresh(t); return t; };

// 根が 1 つの木（最初の列が根、残りの列の 1 行目は 1 以上）
function tree(T) {
  const S = strip(T);
  if (S[0].length === 1) {
    // 1 行: 子の森の 1 行目から 1 を引いたものを指数にする
    return C(forest(S.slice(1).map(c => [c[0] - 1])), Z);
  }
  if (S[0].length === 2) return tree2(S);
  return null;   // 3 行以上の木の規則は作業中
}

// 2 行の木（作業中 v0）。列 v の段 ν(v) = 0（2 行目が 0）、ν(2 行目の親) + 1（それ以外）。
function tree2(T) {
  const n = T.length, p1 = [], p2 = [], nu = [], kids = Array.from({ length: n }, () => []);
  for (let j = 0; j < n; j++) {
    p1[j] = parentAt(T, j, 0);
    p2[j] = parentAt(T, j, 1);
    nu[j] = T[j][1] === 0 || p2[j] < 0 ? 0 : nu[p2[j]] + 1;
    if (p1[j] >= 0) kids[p1[j]].push(j);
  }
  // ν = 0 の節の値: 2 行目が正の子は値の鎖 P = C(e, …C(e, 0))、2 行目が 0 の子は P の上の鎖 L で C(L, P)。
  // 2 行目が正の子がなければ ω^L = C(L, 0)。
  function value0(u) {
    let P = null, base = null;
    for (const v of kids[u]) {
      if (T[v][1] > 0) P = C(chain(v, W1, 1), P === null ? Z : P);
      else base = C(contrib0(v), base === null ? (P === null ? Z : P) : base);
    }
    if (P === null) return C(base === null ? Z : base, Z);
    return base === null ? P : C(base, P);
  }
  // 鎖の中の ν = 0 の列の指数: 節の値の log
  const contrib0 = v => logC(value0(v));
  // 段 level の列 u の子を土台 base に積む。段 1 は C(x, base) を直接重ね、段 2 以上は子の鎖 I を base の上に作って C(I, base)。
  // 対角で合流する子（u のすぐ次の列 v で 2 行目の親が u、かつ u の 2 行目の親が u の 1 行目の親）は、
  // 土台を C(Ω_2, base) にし、v の子へ同じ鎖を続ける。
  function chain(u, base, level) {
    let inner = null;
    for (const v of kids[u]) {
      if (v === u + 1 && T[v][1] > 0 && p2[v] === u && p2[u] === p1[u]) {
        base = chain(v, fresh(base), level + 1);
        continue;
      }
      const x = T[v][1] > 0 ? chain(v, omegaHat(nu[v]), nu[v]) : contrib0(v);
      if (level >= 2) inner = C(x, inner === null ? base : inner);
      else base = C(x, base);
    }
    return inner === null ? base : C(inner, base);
  }
  return value0(0);
}

function translate(s) {
  const M = strip(parseBms(s));
  if (!M.length) return { tc: '0', rows: 0 };
  const t = forest(M);
  return { tc: t === null ? null : tcToString(t, false), rows: M[0].length };
}

const api = { Cn, logC, strip, forest, tree, translate };
if (typeof module !== 'undefined' && module.exports) module.exports = api;
else root.Direct = api;
})(typeof globalThis !== 'undefined' ? globalThis : this);
