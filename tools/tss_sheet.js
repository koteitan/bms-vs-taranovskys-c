#!/usr/bin/env node
// 3 行の行の翻訳: シートの UNOCF 表記 → 拡張 Buchholz 項 → C（ebp2tc.js）。
//
//   node tools/tss_sheet.js > sheet/tss_map.json
//
// 出力: BMS 文字列 → {tc, status, note}
//   status: ocf          表記経由で翻訳し、tools/ebp_lab.js の検査（sheet/tss_bad.json）に失敗が記録されていない
//           ocf-flagged  表記経由で翻訳したが、検査で失敗が記録されている（note に種類）
//           untranslated 表記を読めない、または Buchholz の正規形でない
'use strict';
const fs = require('fs');
const path = require('path');
const ROOT = path.dirname(__dirname);
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));

const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
let bad = {};
try { bad = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/tss_bad.json'), 'utf8')); } catch (e) { bad = {}; }

const nrows = b => (b.startsWith('(') ? b.split(')')[0].split(',').length : 0);
const out = {};
for (const [sheet, b, u] of rows) {
  if (nrows(b) !== 3 || out[b]) continue;
  if (X.fixLabel(u) === 'psi(I)') {
    // ψ(I) = sup ψ_0(Ω_{Ω_{…}})。Ω̂_{ω^e} = C(Ω_2 + e, 0) の不動点（e = Ω_2）で、
    // ψ_0(Ω_{Ω_{…Ω}}) の入れ子の像の上限探索（tools/psi_i_sup.js）と有志の解析に一致する
    out[b] = { tc: 'C(C(C(W_2,W_2),0),0)', status: 'ocf', note: 'sup of ψ_0(Ω_{Ω_…}) (tools/psi_i_sup.js)' };
    continue;
  }
  let t;
  try { t = E.parseLabel(X.fixLabel(u)); } catch (e) { out[b] = { tc: '', status: 'untranslated', note: 'label not parsed' }; continue; }
  if (!E.isStd(t)) { out[b] = { tc: '', status: 'untranslated', note: 'label not in Buchholz normal form' }; continue; }
  let tc;
  try { tc = B.tcToString(X.iota(t), false); } catch (e) { out[b] = { tc: '', status: 'untranslated', note: 'iota: ' + e.message }; continue; }
  if (bad[b]) out[b] = { tc, status: 'ocf-flagged', note: bad[b].join(', ') };
  else out[b] = { tc, status: 'ocf', note: '' };
}
if (process.argv.includes('--web')) {
  // ページ用: BMS → [C 項, 指摘あり(1)/なし(0)]（翻訳できた行だけ）
  const web = {};
  for (const [b, e] of Object.entries(out)) if (e.tc) web[b] = [e.tc, e.status === 'ocf-flagged' ? 1 : 0];
  process.stdout.write(JSON.stringify(web) + '\n');
} else {
  process.stdout.write(JSON.stringify(out, null, 1) + '\n');
}
