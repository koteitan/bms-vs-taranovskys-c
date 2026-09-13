#!/usr/bin/env node
// 解析: 行列に列を 1 つ足したとき、翻訳の C の項がどう変わるかを調べる（直接の翻訳の規則探し）。
//
//   node tools/append_lab.js [--rows 2] [--depth D] [--maxcols N] [--seeds "M;M"] [--show K]
//
// 行列 M と、列 c を足した M' = M c の両方が標準のとき、f(M) と f(M') を n 番目の系に直して
// （Ω_i (i < n) = C(Ω_n, 0) を展開して）比べ、次に分ける。
//   wrap     f(M') は f(M) のある位置の部分項 S を C(x, S) に置き換えたもの
//   complex  それ以外
// wrap は、足した列と親の関係（1 行目の親 p1、2 行目の親 p2、…）と、置き換えた位置の道ごとに数える。
// f は 1・2 行では今の翻訳 tr（参考の値として使う。規則を見つけたら direct.js に入れて direct_lab.js で検査する）。
'use strict';
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const args = process.argv.slice(2);
let rows = 2, depth = 3, maxCols = 16, seedsArg = null, show = 6;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--rows') rows = +args[++i];
  else if (args[i] === '--depth') depth = +args[++i];
  else if (args[i] === '--maxcols') maxCols = +args[++i];
  else if (args[i] === '--seeds') seedsArg = args[++i].split(/[;\s]+/).filter(Boolean);
  else if (args[i] === '--show') show = +args[++i];
  else { console.error('unknown argument', args[i]); process.exit(3); }
}
function batch(lines) {
  if (lines.length === 0) return [];
  const r = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 });
  return lines.map((_, i) => (r.stdout.split('\n')[i] || '').trim());
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
for (let d = 0; d < depth; d++) {
  const qs = [];
  for (const m of frontier) for (const n of [1, 2, 3]) qs.push(`bexp ${m}[${n}]`);
  const next = [];
  for (const e of batch(qs)) if (add(e)) next.push(e);
  frontier = next;
}
let mats = [...seen];
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
const maxW = t => t[0] === 'W' ? t[1] : t[0] === 'C' ? Math.max(maxW(t[1]), maxW(t[2])) : 0;
const toN = (n, t) => {
  if (t[0] === 'W') { let r = ['W', n]; for (let k = t[1]; k < n; k++) r = ['C', r, ['0']]; return r; }
  return t[0] === 'C' ? ['C', toN(n, t[1]), toN(n, t[2])] : t;
};
const eq = (x, y) => JSON.stringify(x) === JSON.stringify(y);
const show1 = t => t[0] === '0' ? '0' : t[0] === 'W' ? (t[1] === 1 ? 'W' : 'W_' + t[1]) : `C(${show1(t[1])},${show1(t[2])})`;
// f(M') が f(M) の道 P の部分項 S を C(x, S) にしたものなら {path, x, S}
function findWrap(o, n, p = '') {
  if (eq(o, n)) return null;
  if (n[0] === 'C' && eq(n[2], o)) return { path: p || '.', x: n[1], S: o };
  if (o[0] === 'C' && n[0] === 'C') {
    if (eq(o[2], n[2])) return findWrap(o[1], n[1], p + 'a');
    if (eq(o[1], n[1])) return findWrap(o[2], n[2], p + 'b');
  }
  return undefined;   // complex
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

// ---- 解析
const tr = m => B.translate(m, { omega: false }).tc;
const stat = { pairs: 0, wrap: 0, complex: 0, same: 0 };
const table = new Map();
const cx = [];
for (const m2 of std) {
  const cs = cols(m2);
  if (cs.length < 2) continue;
  const m1 = str(cs.slice(0, -1));
  if (!std.has(m1)) continue;
  const t1 = tr(m1), t2 = tr(m2);
  if (!t1 || !t2) continue;
  stat.pairs++;
  const a = parse(t1), b = parse(t2);
  const n = Math.max(1, maxW(a), maxW(b));
  const w = findWrap(toN(n, a), toN(n, b));
  const j = cs.length - 1, ps = parents(cs, j);
  const rel = ps.map((p, r) => p < 0 ? '-' : `${r ? 'p' + (r + 1) : 'p1'}=${j - p}`).join(' ');
  const key = `c-p1=(${ps[0] < 0 ? '-' : cs[j].map((v, r) => v - cs[ps[0]][r]).join(',')}) ${rel}`;
  if (w === null) { stat.same++; continue; }
  if (w === undefined) { stat.complex++; if (cx.length < show) cx.push(`${m1} -> ${m2}: ${t1} -> ${t2}`); continue; }
  stat.wrap++;
  const k = `${key} | path ${w.path} | x=${show1(w.x)}`;
  if (!table.has(k)) table.set(k, []);
  table.get(k).push(`${m2}`);
}
console.log(JSON.stringify(stat));
const keys = [...table.keys()].sort((x, y) => table.get(y).length - table.get(x).length);
for (const k of keys.slice(0, 40)) console.log(`${String(table.get(k).length).padStart(4)}  ${k}   e.g. ${table.get(k)[0]}`);
console.log('-- complex examples');
for (const l of cx) console.log('  ' + l);
