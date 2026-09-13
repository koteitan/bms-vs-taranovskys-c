#!/usr/bin/env node
// ψ(I) の像の検証: t_1 = Ω_1, t_{k+1} = Ω_{t_k} として ι(ψ_0(t_k)) (k = 4, 5, 6) の上限を
// Lean の supseq で求め、C(C(C(W_2,W_2),0),0) と比べる。
//
//   node tools/psi_i_sup.js
'use strict';
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');

const CAND = 'C(C(C(W_2,W_2),0),0)';
let t = E.P(E.ONE, 0);
const tcs = [];
for (let k = 1; k <= 6; k++) {
  const s = B.tcToString(X.iota(E.P(0, t)), false);
  console.log(`ψ_0(t_${k}) ->`, s);
  tcs.push(s);
  t = E.P(t, 0);
}
const q = [`supseq ${tcs[3]} ${tcs[4]} ${tcs[5]}`, ...tcs.map(s => `cmp ${s} ${CAND}`), `std ${CAND}`];
const out = spawnSync(CLI, ['batch'], { input: q.join('\n') + '\n', encoding: 'utf8' }).stdout.split('\n');
console.log('sup                =', out[0]);
console.log('candidate          =', CAND, out[0] === CAND ? '(equal)' : '(DIFFERENT)');
console.log('ψ_0(t_k) < cand    :', out.slice(1, 7).join(' '));
console.log('candidate standard :', out[7]);
process.exit(out[0] === CAND ? 0 : 1);
