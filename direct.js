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

// 根が 1 つの木（最初の列が根、残りの列の 1 行目は 1 以上）
function tree(T) {
  const S = strip(T);
  if (S[0].length === 1) {
    // 1 行: 子の森の 1 行目から 1 を引いたものを指数にする
    return C(forest(S.slice(1).map(c => [c[0] - 1])), Z);
  }
  return null;   // 2 行以上の木の規則は作業中
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
