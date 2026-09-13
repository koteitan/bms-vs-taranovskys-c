#!/usr/bin/env node
// bms2tc.js と Lean CLI (lean/.lake/build/bin/bms2tc) の翻訳結果を照合する。
//   node tools/check_js.js
// 対象: lean/tests/TranslateTest.lean の #guard 行 + sheet/bms_rows.json の 1 行・2 行の行。
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const ROOT = path.dirname(__dirname);
const B = require(path.join(ROOT, 'bms2tc.js'));

let bad = 0, n = 0;
function check(m, expect) {
  const r = B.translate(m, { omega: false });
  const got = r.tc === null ? 'not translated' : r.tc;
  n++;
  if (got !== expect) {
    bad++;
    if (bad <= 20) console.log('MISMATCH', m, '\n  js  :', got, '\n  lean:', expect);
  }
}

// 1. TranslateTest.lean
const src = fs.readFileSync(path.join(ROOT, 'lean/tests/TranslateTest.lean'), 'utf8');
for (const line of src.split('\n')) {
  const mm = line.match(/Bms\.parse! "([^"]*)"\)\)\.map toString == some "([^"]*)"/);
  if (mm) check(mm[1], mm[2]);
}
console.log('TranslateTest cases:', n, 'mismatches:', bad);

// 2. xlsx の 1 行・2 行 (Lean CLI batch で期待値を作る)
const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const mats = rows.map(r => r[1]).filter(b => b.startsWith('(') && b.split(')')[0].split(',').length <= 2);
const cli = spawnSync(path.join(ROOT, 'lean/.lake/build/bin/bms2tc'), ['batch'],
  { input: mats.map(m => 'tr ' + m).join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 28 });
const outs = cli.stdout.trim().split('\n');
if (outs.length !== mats.length) { console.log('CLI output count mismatch', outs.length, mats.length); process.exit(1); }
const n0 = n, bad0 = bad;
mats.forEach((m, i) => check(m, outs[i].trim()));
console.log('xlsx 1/2-row cases:', n - n0, 'mismatches:', bad - bad0);
process.exit(bad ? 1 : 0);
