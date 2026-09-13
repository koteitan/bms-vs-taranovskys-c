// BMS → Taranovsky's C 翻訳（lean/BmsTc/Translate.lean と同一規則の JS 版）。
// ブラウザ (index.html) と node (tools/check_js.js) の両方から使う。
//
//   Bms2tc.translate("(0,0)(1,1)(2,2)")  →  { tc: "C(C(Ω_2,Ω_1),0)", rows: 2 }
//   Bms2tc.translate("(0,0,0)(1,1,1)")   →  { tc: null, rows: 3, error: "..." }
(function (root) {
'use strict';

// ---------------------------------------------------------------- TC 項
// 項:  Z = ['0'] | ['W', n] | ['C', a, b]
const Z = ['0'];
const W = n => ['W', n];
const C = (a, b) => ['C', a, b];

function maxOmega(t) {
  if (t[0] === '0') return 0;
  if (t[0] === 'W') return t[1];
  return Math.max(maxOmega(t[1]), maxOmega(t[2]));
}

// W_i (i < n) を C^(n-i)(W_n, 0) に書き換えて n 番目の系の項にする。
function toN(n, t) {
  if (t[0] === '0') return t;
  if (t[0] === 'W') {
    if (n <= t[1]) return t;
    let r = W(n);
    for (let k = n - t[1]; k > 0; k--) r = C(r, Z);
    return r;
  }
  return C(toN(n, t[1]), toN(n, t[2]));
}

// post 記号: c = 0 < 0 = 1 < W_n = n + 1
function post(t) {
  const out = [];
  const stack = [t];
  while (stack.length) {
    const x = stack.pop();
    if (typeof x === 'number') { out.push(x); continue; }
    if (x[0] === '0') out.push(1);
    else if (x[0] === 'W') out.push(x[1] + 1);
    else { stack.push(0); stack.push(x[1]); stack.push(x[2]); }
  }
  return out;
}

function lexCmp(p, q) {
  const n = Math.min(p.length, q.length);
  for (let i = 0; i < n; i++) {
    if (p[i] !== q[i]) return p[i] < q[i] ? -1 : 1;
  }
  return p.length === q.length ? 0 : (p.length < q.length ? -1 : 1);
}

// 結合系の項の比較: -1 / 0 / 1
function cmp(a, b) {
  const n = Math.max(1, maxOmega(a), maxOmega(b));
  return lexCmp(post(toN(n, a)), post(toN(n, b)));
}

function tcToString(t, omega) {
  // omega = true: Ω_1, Ω_2 … / false: W, W_2 …
  const parts = [];
  const stack = [t];
  while (stack.length) {
    const x = stack.pop();
    if (typeof x === 'string') { parts.push(x); continue; }
    if (x[0] === '0') parts.push('0');
    else if (x[0] === 'W') parts.push(omega ? `Ω_${x[1]}` : (x[1] === 1 ? 'W' : `W_${x[1]}`));
    else { stack.push(')'); stack.push(x[2]); stack.push(','); stack.push(x[1]); stack.push('C('); }
  }
  return parts.join('');
}

// ---------------------------------------------------------------- PrSS
// f([t_1,…,t_k]) = C(g(t_k), … C(g(t_1), 0)),  g(t) = f(children(t) − 1)
function prss(xs) {
  if (xs.length === 0) return Z;
  let acc = Z;
  let i = 0;
  while (i < xs.length) {
    let j = i + 1;
    while (j < xs.length && xs[j] > xs[i]) j++;
    const children = xs.slice(i + 1, j).map(v => v - 1);
    acc = C(prss(children), acc);
    i = j;
  }
  return acc;
}

// ---------------------------------------------------------------- PSS → Buchholz
// Buchholz 項:  0 (数値 0) | {nu, a} (D_nu a) | 配列 (和)
// ペア列 PS: [[x0,y0],[x1,y1],…]

const isArr = t => Array.isArray(t);
const isObj = t => t !== 0 && !Array.isArray(t);

function beq(a, b) {
  if (a === b) return true;
  if (a === 0 || b === 0) return false;
  if (isArr(a) !== isArr(b)) return false;
  if (isArr(a)) {
    if (a.length !== b.length) return false;
    for (let i = 0; i < a.length; i++) if (!beq(a[i], b[i])) return false;
    return true;
  }
  return a.nu === b.nu && beq(a.a, b.a);
}

const D = (nu, a) => ({ nu, a });
const ONE = D(0, 0);

function pget(M, i, j) {
  if (j < 0 || j >= M.length) return 0;
  return M[j][i];
}

function findParent(M, i, j, k) {
  if (k === undefined) k = 0;
  if (j < 0 || j >= M.length) return -1;
  if (i === 0) {
    for (let j0 = j - 1; j0 >= k; j0--) if (pget(M, 0, j0) < pget(M, 0, j)) return j0;
    return -1;
  }
  if (i === 1) {
    let j0 = findParent(M, 0, j, k);
    while (j0 >= k) {
      if (pget(M, 1, j0) < pget(M, 1, j)) return j0;
      j0 = findParent(M, 0, j0, k);
    }
    return -1;
  }
  return -1;
}

function isParent(M, i, j, k) {
  return k >= 0 && k < M.length && k === findParent(M, i, j, k);
}

function findAncestors(M, i, j, k) {
  if (k === undefined) k = 0;
  if (j < k || j >= M.length) return [];
  const acc = [j];
  let j0 = j;
  for (;;) {
    const j1 = findParent(M, i, j0);
    if (j1 >= k) { acc.push(j1); j0 = j1; } else return acc;
  }
}

function isAncestor(M, i, j, k) {
  if (k < 0 || k >= M.length) return false;
  let j0 = j;
  for (;;) {
    if (k === j0) return true;
    const j1 = findParent(M, i, j0, k);
    if (j1 === -1) return false;
    j0 = j1;
  }
}

const pred = M => M.length === 1 ? M : M.slice(0, -1);
const derp = M => M.slice(1);
const incrFirst = (M, i) => M.map(c => [c[0] + (i === undefined ? 1 : i), c[1]]);
const isZeroPair = M => M.length === 1 && pget(M, 1, 0) === 0;
const isPrincipalPair = M => !isZeroPair(M) && isAncestor(M, 0, M.length - 1, 0);
const slice = (M, j0, j1) => M.slice(Math.max(j0, 0), Math.max(j1, 0));

function ppair(M) {
  const r = [];
  let j1 = M.length - 1;
  while (j1 >= 0) {
    const ans = findAncestors(M, 0, j1);
    const j0 = ans[ans.length - 1];
    r.unshift(slice(M, j0, j1 + 1));
    j1 = j0 - 1;
  }
  return r;
}

const isUnadmitted = (M, j) => j > M.length || (isParent(M, 1, j, j - 1) && isParent(M, 1, j + 1, j));
const isAdmitted = (M, j) => !isUnadmitted(M, j);

function adm(M, j) {
  while (j >= 0) { if (isAdmitted(M, j)) return j; j--; }
  return -1;
}

function idxSum(Q) {
  const r = [0];
  let j = 0;
  for (const q of Q) { j += q.length; r.push(j); }
  return r;
}

function trMax(M) {
  for (let j = 0; j < M.length; j++) if (!isParent(M, 1, j + 1, j)) return j;
  return M.length - 1;
}

const br = M => ppair(slice(M, trMax(M) + 1, M.length));
function firstNodes(M) {
  const d = trMax(M) + 1;
  return idxSum(br(M)).map(x => x + d);
}
const joints = M => firstNodes(M).slice(0, -1).map(e => findParent(M, 0, e));

function jjSeq(j0, j1) {
  const r = [];
  for (let t = j0; t <= j1; t++) r.push([t, t]);
  return r;
}

function equalPair(M, N) {
  if (M.length !== N.length) return false;
  for (let i = 0; i < M.length; i++) if (M[i][0] !== N[i][0] || M[i][1] !== N[i][1]) return false;
  return true;
}

function red(M) {
  if (isZeroPair(M)) return [[0, 0]];
  if (isPrincipalPair(M)) {
    const j1 = M.length - 1;
    if (pget(M, 0, 0) === 0 && pget(M, 1, 0) === 0) {
      const j1p = trMax(M);
      if (j1p === j1) return jjSeq(0, j1);
      const brs = br(M), fn = firstNodes(M), jn = joints(M);
      let r = jjSeq(0, j1p);
      for (let J = 0; J < brs.length; J++) {
        const bJ = brs[J];
        const nJ = pget(bJ, 1, 0) === 0 ? -1 : findParent(M, 1, fn[J]);
        const NJ = [[jn[J] + 1, nJ + 1]].concat(derp(bJ));
        r = r.concat(incrFirst(red(NJ), jn[J] - nJ));
      }
      return r;
    }
    const M10 = pget(M, 1, 0);
    if (M10 === 0) return red(incrFirst(M, -pget(M, 0, 0)));
    const N = red(jjSeq(0, M10 - 1).concat(incrFirst(M, M10)));
    const j1n = N.length - 1;
    if (M10 <= j1n && isPrincipalPair(slice(N, M10, N.length)))
      return incrFirst(slice(N, M10, N.length), -pget(N, 0, M10) + pget(N, 1, M10));
    return M;
  }
  let acc = [];
  for (const e of ppair(M)) acc = acc.concat(red(e));
  return acc;
}

const isReduced = M => equalPair(red(M), M);

function lessThan(a, b) {
  if (beq(a, b)) return false;
  if (isArr(a)) {
    if (isArr(b)) {
      const n = Math.min(a.length, b.length);
      for (let i = 0; i < n; i++) {
        if (lessThan(a[i], b[i])) return true;
        if (lessThan(b[i], a[i])) return false;
      }
      return a.length < b.length;
    }
    if (isObj(b)) return lessThan(a[0], b);
    return false;
  }
  if (isObj(a)) {
    if (isArr(b)) return !lessThan(b[0], a);
    if (isObj(b)) return a.nu < b.nu || (a.nu === b.nu && lessThan(a.a, b.a));
    return false;
  }
  return true; // a = 0
}

function plus(a, b) {
  if (isArr(a)) {
    if (isArr(b)) return a.concat(b);
    if (isObj(b)) return a.concat([b]);
    return a;
  }
  if (isObj(a)) {
    if (isArr(b)) return [a].concat(b);
    if (isObj(b)) return [a, b];
    return a;
  }
  return b;
}

function pbuchholz(t) {
  if (isArr(t)) return t;
  if (isObj(t)) return [t];
  return [];
}

function replaceMark(t, c, cc) {
  if (isArr(t)) {
    if (t.length === 0) return null;
    const tt = replaceMark(t[t.length - 1], c, cc);
    return tt === null ? null : t.slice(0, -1).concat([tt]);
  }
  if (isObj(t)) {
    if (beq(t, c)) return cc;
    const tt = replaceMark(t.a, c, cc);
    return tt === null ? null : D(t.nu, tt);
  }
  return null;
}

function nextMarked(t) {
  if (isArr(t)) return t.length ? t[t.length - 1] : null;
  if (isObj(t)) return t.a;
  return null;
}

function isMarked(t, c) {
  while (t !== null) {
    if (beq(t, c)) return true;
    t = nextMarked(t);
  }
  return false;
}

// ---- Trans / TransType / Mark（メモ化つき）
function makeTrans() {
  const tyM = new Map(), trM = new Map(), mkM = new Map();
  let calls = 0;
  const LIMIT = 2000000;
  const keyOf = M => M.map(c => c[0] + ',' + c[1]).join(';');
  const dOf = (M, j) => D(pget(M, 1, j), 0);
  const tick = () => { if (++calls > LIMIT) throw new Error('too many steps'); };

  function transType(M) {
    const k = keyOf(M);
    if (tyM.has(k)) return tyM.get(k);
    tick();
    const j1 = M.length - 1;
    let r;
    if (isReduced(M)) {
      if (j1 === 0) r = -1;
      else if (isPrincipalPair(M)) {
        const t1 = trans(pred(M));
        if (t1 === 0) r = 0;
        else {
          const j0 = findParent(M, 0, j1);
          if (pget(M, 1, j1) === 0) r = isAdmitted(M, j0) ? 1 : 2;
          else if (pget(M, 1, j0) >= pget(M, 1, j1)) r = isAdmitted(M, j0) ? 3 : 4;
          else r = j0 + 1 < j1 ? 5 : 6;
        }
      } else r = -2;
    } else r = -3;
    tyM.set(k, r);
    return r;
  }

  function c1c2(M, ty) {
    const j1 = M.length - 1;
    const j0 = findParent(M, 0, j1);
    const jn1 = adm(M, j0);
    const c1 = mark(pred(M), jn1);
    const v = isObj(c1) ? c1.nu : 0;
    const t2 = isObj(c1) ? c1.a : 0;
    const Pt2 = pbuchholz(t2);
    const J1 = Pt2.length - 1;
    let c2;
    if (ty === 1 || ty === 3 || ty === 5) c2 = D(v, plus(t2, dOf(M, j1)));
    else if (ty === 2 || ty === 4) {
      if (t2 === 0) c2 = D(v, D(pget(M, 1, j0), dOf(M, j1)));
      else {
        const last = Pt2[Pt2.length - 1];
        let t3, t4;
        if (isObj(last) && last.nu === pget(M, 1, j0)) {
          t3 = J1 === 1 ? Pt2[0] : Pt2.slice(0, -1);
          t4 = last.a;
        } else { t3 = t2; t4 = t2; }
        c2 = D(v, plus(t3, D(pget(M, 1, j0), plus(t4, dOf(M, j1)))));
      }
    } else c2 = D(v, dOf(M, j1));
    return [c1, c2];
  }

  function trans(M) {
    const k = keyOf(M);
    if (trM.has(k)) return trM.get(k);
    tick();
    const j1 = M.length - 1;
    const ty = transType(M);
    let r;
    if (ty === -3) r = trans(red(M));
    else if (ty === -2) {
      const parts = ppair(M);
      let acc = 0;
      parts.forEach((e, i) => {
        if (i === 0) acc = trans(e);
        else acc = plus(acc, equalPair(e, [[0, 0]]) ? ONE : trans(e));
      });
      r = acc;
    } else if (ty === -1) r = (pget(M, 0, 0) === 0 && pget(M, 1, 0) === 0) ? 0 : D(pget(M, 1, 0), 0);
    else if (ty === 0) r = D(0, dOf(M, j1));
    else {
      const t1 = trans(pred(M));
      const [c1, c2] = c1c2(M, ty);
      const rr = replaceMark(t1, c1, c2);
      r = rr === null ? 0 : rr;
    }
    trM.set(k, r);
    return r;
  }

  function mark(M, m) {
    const k = keyOf(M) + '#' + m;
    if (mkM.has(k)) return mkM.get(k);
    tick();
    const j1 = M.length - 1;
    const ty = transType(M);
    let r;
    if (ty === -3) r = mark(red(M), m);
    else if (ty === -2) {
      const PM = ppair(M);
      const last = PM[PM.length - 1];
      const j0 = j1 - last.length + 1;
      r = equalPair(last, [[0, 0]]) ? ONE : mark(last, m - j0);
    } else if (ty === -1) r = (pget(M, 0, 0) === 0 && pget(M, 1, 0) === 0) ? 0 : D(pget(M, 1, 0), 0);
    else if (ty === 0) r = m === 0 ? D(0, dOf(M, j1)) : dOf(M, j1);
    else {
      const [c1, c2] = c1c2(M, ty);
      if (m < j1) {
        const c0 = mark(pred(M), m);
        if (isMarked(c0, c1)) { const rr = replaceMark(c0, c1, c2); r = rr === null ? 0 : rr; }
        else r = dOf(M, j1);
      } else r = dOf(M, j1);
    }
    mkM.set(k, r);
    return r;
  }

  return trans;
}

function transPS(cols) {
  return makeTrans()(cols.map(c => [c[0], c[1]]));
}

function btToString(t) {
  if (t === 0) return '0';
  if (isArr(t)) return '(' + t.map(btToString).join(',') + ')';
  return `D_${t.nu} ${btToString(t.a)}`;
}

// ---------------------------------------------------------------- Buchholz 項 → TC 項
const termsOf = a => a === 0 ? [] : (isArr(a) ? a : [a]);
const mkSum = ts => ts.length === 0 ? 0 : (ts.length === 1 ? ts[0] : ts);
const nuOf = t => isObj(t) ? t.nu : 0;

function omegaHat(nu) {
  let t = W(1);
  for (let k = 1; k < nu; k++) t = C(W(2), t);
  return t;
}
const baseOf = nu => nu === 0 ? Z : omegaHat(nu);

// 第 2 引数の最小化: b = C(c,d) で x > c なら b := d
function Cn(x, b) {
  while (b[0] === 'C' && cmp(x, b[1]) === 1) b = b[2];
  return C(x, b);
}

function splitHigh(a, nu) {
  const ts = termsOf(a);
  return [mkSum(ts.filter(q => nuOf(q) > nu)), mkSum(ts.filter(q => nuOf(q) <= nu))];
}

// 規則スイッチ（tools/rule_lab.js が書き換える）。N2 は採用済み（Lean / Python と同じ）、他は実験中。
const RULES = { N1: false, N1exp: false, N2: true, N2exp: false, R2p: false, R2s: false, R2e: false, R2u: false, R2z: false, R2n: true, R2h: false, R1d: false };

// N2: ν ≥ 2、a の項がすべて高さ ≤ ν のとき、Ω̂_ν + a = chain(a, Ω̂_ν) の「最後の項を高さ ν のまま
// たどった先の ψ_ν(0) の指数 Ω̂_ν」を E に置き換える。たどれなければ null。
function chainRP(a, nu, E) {
  const ts = termsOf(a);
  if (ts.length === 0) return null;
  const last = ts[ts.length - 1];
  if (!isObj(last) || last.nu !== nu) return null;
  const init = chain(mkSum(ts.slice(0, -1)), omegaHat(nu));
  let e;
  if (last.a === 0) e = E;
  else {
    const [h] = splitHigh(last.a, nu);
    if (h !== 0) return null;
    e = chainRP(last.a, nu, E);
    if (e === null) return null;
  }
  return C(e, init);
}

function levelChain2(nu, a) {
  if (nu < 2) return null;
  const E = Cn(chain(a, omegaHat(nu)), omegaHat(nu - 1));
  return chainRP(a, nu, E);
}

// N1: ν ≥ 2 で a の最後の項が高さ ν のとき、その項の指数を ψ̂_{ν-1}(ψ_ν(a)) にした Ω̂_ν + a。
function levelChain(nu, a) {
  const ts = termsOf(a);
  const last = ts[ts.length - 1];
  if (nu >= 2 && isObj(last) && last.nu === nu) {
    const init = chain(mkSum(ts.slice(0, -1)), omegaHat(nu));
    return C(iota(D(nu - 1, D(nu, a))), init);
  }
  return null;
}

function expT(p) {
  if (!isObj(p)) return iota(p);
  const nu = p.nu, a = p.a;
  const [high, low] = splitHigh(a, nu);
  if (high === 0) {
    if (nu === 0) return iota(a);
    if (a === 0) return omegaHat(nu);
    if (RULES.N1exp) { const lc = levelChain(nu, a); if (lc) return lc; }
    if (RULES.N2exp) { const lc = levelChain2(nu, a); if (lc) return lc; }
    return chain(a, omegaHat(nu));
  }
  if (low !== 0) return chain(low, iota(D(nu, high)));
  return iota(p);
}

function chain(a, t) {
  for (const q of termsOf(a)) t = C(expT(q), t);
  return t;
}

function iota(t) {
  if (t === 0) return Z;
  if (isArr(t)) {
    if (t.length === 0) return Z;
    let r = iota(t[0]);
    for (const q of t.slice(1)) r = C(expT(q), r);
    return r;
  }
  const nu = t.nu, a = t.a;
  const [high, low] = splitHigh(a, nu);
  if (high === 0) {
    if (nu === 0) return C(iota(a), Z);
    if (a === 0) return omegaHat(nu);
    if (RULES.N1) { const lc = levelChain(nu, a); if (lc) return C(lc, omegaHat(nu)); }
    if (RULES.N2) { const lc = levelChain2(nu, a); if (lc) return C(lc, omegaHat(nu)); }
    return C(chain(a, omegaHat(nu)), omegaHat(nu));
  }
  if (low !== 0) {
    const P = iota(D(nu, high));
    return C(chain(low, P), P);
  }
  const hs = termsOf(high);
  const aprime = mkSum(hs.slice(0, -1));
  const last = hs[hs.length - 1];
  if (!isObj(last)) return Z;
  const mu = last.nu, b = last.a;
  if (mu === nu + 1) {
    const [bh] = splitHigh(b, nu + 1);
    let degree = bh === 0 ? chain(b, omegaHat(nu + 1)) : iota(b);
    // R1d（実験）: ebp2tc.js の R1d と同じ
    if (RULES.R1d && nu === 0 && bh !== 0) {
      const bts = termsOf(b);
      const q2 = bts[bts.length - 1];
      if (bts.length >= 2 && isObj(q2) && q2.nu >= 2) {
        const m2 = q2.nu;
        const binit = mkSum(bts.slice(0, -1));
        const E2 = iota(D(m2 - 1, b));
        if (q2.a === 0) degree = Cn(E2, iota(binit));
        else {
          const [h2, l2] = splitHigh(q2.a, m2);
          let ex2 = null;
          if (h2 === 0) ex2 = chainRPBase(q2.a, m2, E2, omegaHat(m2));
          else if (l2 !== 0) ex2 = chainRPBase(l2, m2, E2, iota(D(m2, h2)));
          if (ex2) degree = C(ex2, iota(binit));
        }
      }
    }
    const base = aprime !== 0 ? iota(D(nu, aprime)) : baseOf(nu);
    return Cn(degree, base);
  }
  if (nu === 0 && aprime !== 0) {
    // R2n（実験）: ebp2tc.js の R2n と同じ（段は有限）
    if (RULES.R2n) {
      const En = iota(D(mu - 1, a));
      if (b === 0) return C(Cn(En, iota(aprime)), Z);
      const [hq, lq] = splitHigh(b, mu);
      let ex = null;
      if (hq === 0) ex = chainRPBase(b, mu, En, omegaHat(mu));
      else if (lq !== 0) ex = chainRPBase(lq, mu, En, iota(D(mu, hq)));
      else if (RULES.R2h) {
        // R2h（実験）: ebp2tc.js の R2h と同じ（b が添字 λ > μ の主項 1 個）
        const hts = termsOf(hq);
        if (hts.length === 1 && isObj(hts[0]) && hts[0].a !== 0) {
          const lam = hts[0].nu, c = hts[0].a;
          const [hc, lc] = splitHigh(c, lam);
          if (lam === mu + 1) {
            if (hc === 0) {
              const r = chainRPBase(c, mu, En, omegaHat(lam));
              if (r) ex = Cn(r, omegaHat(mu));
            }
          } else {
            let inner = null;
            if (hc === 0) {
              const r = chainRPBase(c, mu, En, omegaHat(lam));
              if (r) inner = C(r, omegaHat(lam));
            } else if (lc !== 0) {
              const Pl = iota(D(lam, hc));
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
    // R2z（実験）: 最後の項が素の Ω_μ（b = 0）のときだけ ψ̂_{μ-1}(a) に潰し、他は和の規則
    if (RULES.R2z) {
      if (b !== 0) return C(iota(a), Z);
      return C(Cn(iota(D(mu - 1, a)), iota(aprime)), Z);
    }
    // R2u（実験）: ebp2tc.js の R2u と同じ（段は有限）
    if (RULES.R2u) {
      const bts0 = termsOf(b);
      const lastB = bts0[bts0.length - 1];
      if (bts0.length && isObj(lastB) && lastB.nu === 0 && lastB.a === 0) return C(iota(a), Z);
      const [hb, lb] = splitHigh(b, mu);
      const lts = termsOf(lb);
      const lhi = mkSum(lts.filter(q => nuOf(q) === mu));
      const llo = mkSum(lts.filter(q => nuOf(q) < mu));
      const collapse = () => iota(D(mu - 1, a));
      const base = iota(aprime);
      let ex;
      if (lb !== 0 && beq(hb, aprime) && llo === 0) ex = iotaCtx(lhi, aprime, mu);
      else if (lb !== 0 && beq(hb, aprime) && lhi !== 0) ex = C(collapse(), iotaCtx(lhi, aprime, mu));
      else ex = collapse();
      return C(Cn(ex, base), Z);
    }
    // R2s（実験）: 最後の項 ψ_μ(b) の b が後続（最後の項が 1）なら潰さない（和の規則）
    const bts = termsOf(b);
    if (RULES.R2s && bts.length && isObj(bts[bts.length - 1]) && bts[bts.length - 1].nu === 0 && bts[bts.length - 1].a === 0) {
      return C(iota(a), Z);
    }
    // R2e（実験）: b = α' + l（l は段 μ の項で終わる）なら指数を ι(l) にする
    if (RULES.R2e) {
      const [hb, lb] = splitHigh(b, mu);
      const lts = termsOf(lb);
      if (lts.length && isObj(lts[lts.length - 1]) && lts[lts.length - 1].nu === mu && beq(hb, aprime)) {
        return C(C(iota(lb), iota(aprime)), Z);
      }
    }
    // R2: 最後の項（段 μ ≥ 2）の指数を ψ̂_1(a) にする。R2p（実験）: ψ̂_{μ-1}(a)
    return C(C(iota(D(RULES.R2p ? mu - 1 : 1, a)), iota(aprime)), Z);
  }
  return C(iota(a), baseOf(nu));
}

// R2n 用: chainRP の基点を指定できる版（ebp2tc.js と同じ）
function chainRPBase(a, nu, e, base) {
  const ts = termsOf(a);
  if (ts.length === 0) return null;
  const last = ts[ts.length - 1];
  if (!isObj(last) || last.nu !== nu) return null;
  const init = chain(mkSum(ts.slice(0, -1)), base);
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

// R2u 用: 文脈 α' のもとでの ι(l)（ebp2tc.js の iotaCtx と同じ）
function addBT(x, y) {
  const xs = termsOf(x).slice(), ys = termsOf(y);
  if (ys.length === 0) return x;
  const cmpBT = (p, q) => (lessThan(p, q) ? -1 : (beq(p, q) ? 0 : 1));
  while (xs.length && cmpBT(xs[xs.length - 1], ys[0]) < 0) xs.pop();
  return mkSum(xs.concat(ys));
}
function iotaCtx(l, aprime, mu) {
  const ts = termsOf(l);
  if (mu < 2) return iota(l);
  const Ectx = Cn(iota(addBT(aprime, l)), omegaHat(mu - 1));
  if (ts.length === 1 && ts[0].a !== 0) {
    const c = ts[0].a;
    const [h] = splitHigh(c, mu);
    if (h === 0) {
      const lc = chainRP(c, mu, Ectx);
      if (lc) return C(lc, omegaHat(mu));
    }
  } else if (ts.length >= 2 && ts[0].a === 0 && ts[0].nu === mu) {
    const lc = chainRP(mkSum(ts.slice(1)), mu, Ectx);
    if (lc) return lc;
  }
  return iota(l);
}

// ---------------------------------------------------------------- BMS 入口
// 文字列 → 列のリスト。無効文字は捨て、列の高さは最大の列に合わせて 0 を詰める。
function parseBms(s) {
  const clean = s.replace(/[^(),0-9]/g, '');
  const cols = [];
  const re = /\(([^()]*)\)/g;
  let m;
  while ((m = re.exec(clean)) !== null) {
    const xs = m[1].split(',').map(x => x === '' ? 0 : parseInt(x, 10));
    cols.push(xs);
  }
  const h = cols.reduce((acc, c) => Math.max(acc, c.length), 0);
  return cols.map(c => c.concat(new Array(h - c.length).fill(0)));
}

// 末尾の全零行を落とす（1 行は残す）。
function stripZeroRows(m) {
  const rows = m.length ? m[0].length : 0;
  let last = 0;
  for (let r = 0; r < rows; r++) if (m.some(c => c[r] !== 0)) last = r + 1;
  const keep = Math.max(1, last);
  return m.map(c => c.slice(0, keep));
}

function bms2tc(m) {
  if (m.length === 0) return { tc: Z, rows: 0 };
  m = stripZeroRows(m);
  const rows = m[0].length;
  if (rows === 1) return { tc: prss(m.map(c => c[0])), rows };
  if (rows === 2) return { tc: iota(transPS(m.map(c => [c[0], c[1]]))), rows };
  return { tc: null, rows, error: `${rows} 行の行列は未対応 (3 rows and more: not supported)` };
}

function translate(s, opts) {
  opts = opts || {};
  const m = parseBms(s);
  try {
    const r = bms2tc(m);
    return { tc: r.tc ? tcToString(r.tc, opts.omega !== false) : null, rows: r.rows, error: r.error || null,
             bms: m.map(c => '(' + c.join(',') + ')').join('') };
  } catch (e) {
    return { tc: null, rows: m.length ? m[0].length : 0, error: '変換失敗 (' + e.message + ')',
             bms: m.map(c => '(' + c.join(',') + ')').join('') };
  }
}

const api = { RULES, Z, W, C, cmp, tcToString, prss, transPS, btToString, iota, parseBms, stripZeroRows, bms2tc, translate };
if (typeof module !== 'undefined' && module.exports) module.exports = api;
else root.Bms2tc = api;
})(typeof globalThis !== 'undefined' ? globalThis : this);
