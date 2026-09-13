#!/usr/bin/env node
// 解析: 行列に列を 1 つ足したとき、翻訳の C の項がどう変わるかを調べる（直接の翻訳の規則探し）。
//
//   node tools/append_lab.js [--rows 2] [--depth D] [--maxcols N] [--seeds "M;M"] [--show K] [--track]
//
// 行列 M と、列 c を足した M' = M c の両方が標準のとき、f(M) と f(M') を n 番目の系に直して
// （Ω_i (i < n) = C(Ω_n, 0) を展開して）比べ、次に分ける。
//   wrap     f(M') は f(M) のある位置 P の部分項 S を C(x, S) に置き換えたもの
//   complex  それ以外（同じ部分項の写しが何か所も変わるなど）
// 既定では wrap を、足した列と親の関係と、根からの道 P ごとに数える。
// --track では、各列の「項の中の位置」を接頭辞に沿って追い（位置 P で包むと、P の下の位置は P+b にずれる。
// 新しい列の位置は P）、P を 1 行目の親 p1・2 行目の親 p2 の位置からの相対で、x を既にある列の部分項の写しかどうかで分類する。
// f は 1・2 行では今の翻訳 tr（参考の値として使う。規則を見つけたら direct.js に入れて direct_lab.js で検査する）。
'use strict';
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const args = process.argv.slice(2);
let rows = 2, depth = 3, maxCols = 16, seedsArg = null, show = 6, track = false, explain = null;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--rows') rows = +args[++i];
  else if (args[i] === '--depth') depth = +args[++i];
  else if (args[i] === '--maxcols') maxCols = +args[++i];
  else if (args[i] === '--seeds') seedsArg = args[++i].split(/[;\s]+/).filter(Boolean);
  else if (args[i] === '--show') show = +args[++i];
  else if (args[i] === '--track') track = true;
  else if (args[i] === '--explain') { explain = args[++i]; track = true; }
  else { console.error('unknown argument', args[i]); process.exit(3); }
}
function batch(lines) {
  if (lines.length === 0) return [];
  const r = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 });
  const out = r.stdout.split('\n');
  return lines.map((_, i) => (out[i] || '').trim());
}
const SEEDS = {
  1: ['(0)(1)(2)(3)(4)', '(0)(1)(2)(3)(3)(3)'],
  2: ['(0,0)(1,1)(2,2)(3,3)', '(0,0)(1,1)(2,1)(3,2)', '(0,0)(1,1)(2,2)(3,2)', '(0,0)(1,1)(2,2)(3,3)(4,4)',
      '(0,0)(1,1)(2,2)(3,3)(3,3)', '(0,0)(1,1)(2,2)(3,2)(3,2)'],
};
const cols = m => m.match(/\(([^)]*)\)/g).map(c => c.slice(1, -1).split(',').map(Number));
const str = cs => cs.map(c => '(' + c.join(',') + ')').join('');

// ---- 行列（接頭辞で閉じた集合）
const seen = new Set();
const add = m => {
  if (!m || m === 'ERR' || m.split(')')[0].split(',').length !== rows) return false;
  const cs = cols(m);
  if (cs.length > maxCols) return false;
  let added = false;
  for (let k = 1; k <= cs.length; k++) { const p = str(cs.slice(0, k)); if (!seen.has(p)) { seen.add(p); added = true; } }
  return added;
};
let frontier = seedsArg || SEEDS[rows];
frontier.forEach(add);
if (explain) { add(explain); frontier = [explain]; depth = 0; }
for (let d = 0; d < depth; d++) {
  const qs = [];
  for (const m of frontier) for (const n of [1, 2, 3]) qs.push(`bexp ${m}[${n}]`);
  const next = [];
  for (const e of batch(qs)) if (add(e)) next.push(e);
  frontier = next;
}
const mats = [...seen];
const st = batch(mats.map(m => `bstd ${m}`));
const std = new Set(mats.filter((_, i) => st[i] === '1'));

// ---- C の項: 解析と n 番目の系への展開
function parse(s) {
  let i = 0;
  const p = () => {
    if (s.startsWith('C(', i)) { i += 2; const a = p(); i++; const b = p(); i++; return ['C', a, b]; }
    if (s[i] === '0') { i++; return ['0']; }
    const m = /^W(?:_(\d+))?/.exec(s.slice(i)); i += m[0].length; return ['W', m[1] ? +m[1] : 1];
  };
  return p();
}
const toN = (n, t) => {
  if (t[0] === 'W') { let r = ['W', n]; for (let k = t[1]; k < n; k++) r = ['C', r, ['0']]; return r; }
  return t[0] === 'C' ? ['C', toN(n, t[1]), toN(n, t[2])] : t;
};
const eq = (x, y) => JSON.stringify(x) === JSON.stringify(y);
const show1 = t => t[0] === '0' ? '0' : t[0] === 'W' ? (t[1] === 1 ? 'W' : 'W_' + t[1]) : `C(${show1(t[1])},${show1(t[2])})`;
const sub = (t, p) => { for (const ch of p) { if (t[0] !== 'C') return null; t = ch === 'a' ? t[1] : t[2]; } return t; };
// f(M') が f(M) の道 P の部分項 S を C(x, S) にしたものなら {path, x}
function findWrap(o, n, p = '') {
  if (eq(o, n)) return null;
  if (n[0] === 'C' && eq(n[2], o)) return { path: p, x: n[1] };
  if (o[0] === 'C' && n[0] === 'C') {
    if (eq(o[2], n[2])) return findWrap(o[1], n[1], p + 'a');
    if (eq(o[1], n[1])) return findWrap(o[2], n[2], p + 'b');
  }
  return undefined;   // complex
}
// 何か所かを C(x, S) に置き換えただけなら [{path, x}, …]、そうでなければ null
function findWraps(o, n, p = '', out = []) {
  if (eq(o, n)) return out;
  if (n[0] === 'C' && eq(n[2], o)) { out.push({ path: p, x: n[1] }); return out; }
  if (o[0] === 'C' && n[0] === 'C') {
    if (findWraps(o[1], n[1], p + 'a', out) === null) return null;
    return findWraps(o[2], n[2], p + 'b', out);
  }
  return null;
}

// ---- 親
// 1 行目の親: 前の列で 1 行目の値が小さい最後の列。
// r 行目の親: (r-1) 行目の親を順にたどり、r 行目の値が小さい最初の列（無ければ -1）。
function parentAt(cs, j, r) {
  if (r === 0) {
    for (let k = j - 1; k >= 0; k--) if (cs[k][0] < cs[j][0]) return k;
    return -1;
  }
  let q = parentAt(cs, j, r - 1);
  while (q >= 0 && !(cs[q][r] < cs[j][r])) q = parentAt(cs, q, r - 1);
  return q;
}
const parents = (cs, j) => Array.from({ length: rows }, (_, r) => parentAt(cs, j, r));

const N = Math.max(rows, 2);
const trN = m => { const t = B.translate(m, { omega: false }).tc; return t ? toN(N, parse(t)) : null; };
const stat = { pairs: 0, wrap: 0, complex: 0, same: 0 };
const table = new Map();
const cx = [];
const put = (k, m) => { if (!table.has(k)) table.set(k, []); table.get(k).push(m); };

if (!track) {
  for (const m2 of std) {
    const cs = cols(m2);
    if (cs.length < 2) continue;
    const m1 = str(cs.slice(0, -1));
    if (!std.has(m1)) continue;
    const a = trN(m1), b = trN(m2);
    if (!a || !b) continue;
    stat.pairs++;
    const w = findWrap(a, b);
    const j = cs.length - 1, ps = parents(cs, j);
    const rel = ps.map((p, r) => p < 0 ? '-' : `p${r + 1}=${j - p}`).join(' ');
    const key = `c-p1=(${ps[0] < 0 ? '-' : cs[j].map((v, r) => v - cs[ps[0]][r]).join(',')}) ${rel}`;
    if (w === null) { stat.same++; continue; }
    if (w === undefined) { stat.complex++; if (cx.length < show) cx.push(`${m1} -> ${m2}`); continue; }
    stat.wrap++;
    put(`${key} | path ${w.path || '.'} | x=${show1(w.x)}`, m2);
  }
} else {
  // 接頭辞に沿って位置を追う
  const state = new Map();   // 行列 → { t, pos } （complex で追えなくなったら null）
  const sorted = [...std].sort((x, y) => x.length - y.length);
  const rel = (P, base) => {
    if (base === undefined) return '-';
    if (P === base) return '=';
    if (P.startsWith(base)) return '+' + P.slice(base.length);
    if (base.startsWith(P)) return '^' + base.slice(P.length);
    return 'x';
  };
  for (const m of sorted) {
    const cs = cols(m);
    const t = trN(m);
    if (!t) continue;
    if (cs.length === 1) { state.set(m, { t, pos: [''] }); continue; }
    const m1 = str(cs.slice(0, -1));
    const s1 = state.get(m1);
    if (!s1) { state.set(m, null); continue; }
    stat.pairs++;
    const w = findWrap(s1.t, t);
    if (w === null) { stat.same++; state.set(m, null); continue; }
    if (w === undefined) {
      stat.complex++;
      // 同じ x で何か所も包んだだけか
      const ws = findWraps(s1.t, t);
      if (ws) {
        const k = `multi ${ws.length} places, same x: ${ws.every(v => eq(v.x, ws[0].x))}`;
        stat[k] = (stat[k] || 0) + 1;
      }
      if (cx.length < show) cx.push(`${m1} -> ${m}${ws ? '  wraps at ' + ws.map(v => v.path || '.').join(',') : ''}`);
      state.set(m, null);
      continue;
    }
    stat.wrap++;
    const j = cs.length - 1, [p1, p2] = parents(cs, j);
    const P = w.path;
    // x の分類: 既にある列の位置の部分項（またはその指数）の写しか
    // 列 q の名前: p1, p2、j の 1 行目の祖先なら anc<k>（k = 1 が p1）、p2 のすぐ下の祖先なら (below p2) をつける
    const anc = [];
    for (let q = p1; q >= 0; q = parentAt(cs, q, 0)) anc.push(q);
    const names = q => {
      if (q === p1) return 'p1';
      if (q === p2) return 'p2';
      const k = anc.indexOf(q), kp2 = anc.indexOf(p2);
      if (k >= 0) return `anc${k + 1}${kp2 > 0 && k === kp2 - 1 ? '(below p2)' : ''}`;
      return `j-${j - q}`;
    };
    let xs = show1(w.x);
    if (w.x[0] !== '0' && w.x[0] !== 'W') {
      for (let q = j - 1; q >= 0; q--) {
        const s = sub(s1.t, s1.pos[q]);
        if (s && eq(s, w.x)) { xs = `node(${names(q)})`; break; }
        if (w.x[0] === 'C' && s && eq(w.x[2], s)) { xs = `C(${show1(w.x[1])},node(${names(q)}))`; break; }
      }
    }
    // p2 は p1 から 1 行目の親を何段たどった先か
    let up = '-';
    if (p2 >= 0) { let q = p1, k = 0; while (q >= 0 && q !== p2) { q = parentAt(cs, q, 0); k++; } up = q === p2 ? String(k) : '?'; }
    const d = p1 < 0 ? '-' : cs[j].map((v, r) => v - cs[p1][r]).join(',');
    const key = `c-p1=(${d}) p2up=${up} | P~p1 ${rel(P, s1.pos[p1])} | P~p2 ${rel(P, s1.pos[p2])} | x=${xs}`;
    put(key, m);
    const pos = s1.pos.map(q => q.startsWith(P) ? P + 'b' + q.slice(P.length) : q);
    pos.push(P);
    state.set(m, { t, pos });
    if (explain && explain.startsWith(m)) {
      console.log(`col ${j} ${str([cs[j]])}  p1=${p1} p2=${p2}  P=${P || '.'}  x=${show1(w.x)}`);
      console.log(`  ${key}`);
      console.log(`  f = ${show1(t)}`);
      console.log(`  nodes: ${pos.map((q, k) => `${k}${str([cs[k]])}@${q || '.'}=${show1(sub(t, q))}`).join('  ')}`);
    }
  }
}
console.log(JSON.stringify(stat));
const keys = [...table.keys()].sort((x, y) => table.get(y).length - table.get(x).length);
for (const k of keys.slice(0, 50)) console.log(`${String(table.get(k).length).padStart(4)}  ${k}   e.g. ${table.get(k)[0]}`);
console.log(`(${keys.length} kinds)`);
console.log('-- complex examples');
for (const l of cx) console.log('  ' + l);
