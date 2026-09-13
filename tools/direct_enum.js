#!/usr/bin/env node
// 行列から直接の翻訳（direct.js）を、列 N 個までの標準な 2 行の行列の総当たりで今の翻訳 tr と照らし合わせる。
//
//   node tools/direct_enum.js [N] [SHOW]
//
// 行列: (0,0) から始め、各列 (a,b) を 0 ≤ a ≤ 前の a + 1、0 ≤ b ≤ 前の b + 1 の範囲で伸ばし、bstd で標準なものだけ残す。
// 出力: 一致の数と、外れた行列（短い順に SHOW 個）。
'use strict';
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));
const D = require(path.join(ROOT, 'direct.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');
const MAX = +(process.argv[2] || 6), SHOW = +(process.argv[3] || 25);

const str = cs => cs.map(c => '(' + c.join(',') + ')').join('');
const cands = [];
const rec = cs => {
  cands.push(str(cs));
  if (cs.length >= MAX) return;
  const l = cs[cs.length - 1];
  for (let a = 0; a <= l[0] + 1; a++) for (let b = 0; b <= l[1] + 1; b++) rec([...cs, [a, b]]);
};
rec([[0, 0]]);
const out = spawnSync(CLI, ['batch'], { input: cands.map(m => `bstd ${m}`).join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 }).stdout.split('\n');
const mats = cands.filter((_, i) => (out[i] || '').trim() === '1');
let ok = 0;
const bad = [];
for (const m of mats) {
  const d = D.translate(m).tc, t = B.translate(m, { omega: false }).tc;
  if (d === t) ok++; else bad.push(`${m}\n   direct ${d}\n   tr     ${t}`);
}
console.log(`columns ≤ ${MAX}: matrices ${mats.length}, match ${ok}, mismatch ${bad.length}`);
bad.sort((a, b) => a.length - b.length).slice(0, SHOW).forEach(l => console.log(l));
