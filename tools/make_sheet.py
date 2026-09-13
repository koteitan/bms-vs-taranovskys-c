#!/usr/bin/env python3
"""対応表の生成。

入力: sheet/bms_rows.json   (xlsx の [シート名, BMS, UNOCF] の列)
      sheet/verify_bad.json (tools/pss_tc.py の機械検査に落ちた BMS → 失敗種別の列)
      lean/.lake/build/bin/bms2tc (翻訳)
出力: sheet/tc_map.json   BMS → {"tc", "status", "note"}
      sheet/table.tsv     全行 (index, sheet, BMS, UNOCF, TC, status)
      sheet/README.md, sheet/README-en.md   翻訳できた行の表と集計
"""
import json, os, re, collections, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SHEET = os.path.join(ROOT, 'sheet')
CLI = os.path.join(ROOT, 'lean', '.lake', 'build', 'bin', 'bms2tc')

rows = json.load(open(os.path.join(SHEET, 'bms_rows.json')))
bad = json.load(open(os.path.join(SHEET, 'verify_bad.json')))

def nrows(b):
    m = re.findall(r'\(([^)]*)\)', b)
    return len(m[0].split(',')) if m else 0

def pretty(t):
    """W_n → Ω_n, W → Ω_1."""
    return re.sub(r'W(?!_)', 'Ω_1', t.replace('W_', 'Ω_')) if t else ''

# ---- 翻訳 (Lean CLI, 一括)
mats = [b for _, b, _ in rows if b.startswith('(') and nrows(b) <= 2]
p = subprocess.run([CLI, 'batch'], input=''.join(f'tr {m}\n' for m in mats), capture_output=True, text=True)
outs = p.stdout.strip().split('\n')
assert len(outs) == len(mats), (len(outs), len(mats))
tr = dict(zip(mats, (o.strip() for o in outs)))

tcmap = {}
for _, b, _ in rows:
    if b in tcmap: continue
    if b in tr and tr[b] != 'not translated':
        if b in bad:
            tcmap[b] = {'tc': tr[b], 'status': 'rule', 'note': 'failed: ' + ', '.join(bad[b])}
        else:
            tcmap[b] = {'tc': tr[b], 'status': 'verified', 'note': ''}
    elif b == '' or b == 'Empty Matrix':
        tcmap[b] = {'tc': '0', 'status': 'verified', 'note': ''}
    else:
        tcmap[b] = {'tc': '', 'status': 'untranslated', 'note': f'{nrows(b)} rows'}
json.dump(tcmap, open(os.path.join(SHEET, 'tc_map.json'), 'w'), indent=1, ensure_ascii=False)

STATUS_JA = {'verified': '検証済', 'rule': '規則(未検証)', 'untranslated': '未翻訳'}
STATUS_EN = {'verified': 'verified', 'rule': 'rule (unverified)', 'untranslated': 'untranslated'}

# ---- 全行 TSV
with open(os.path.join(SHEET, 'table.tsv'), 'w') as f:
    f.write('index\tsheet\tBMS\tUNOCF\tTC\tstatus\n')
    for i, (sheet, b, name) in enumerate(rows):
        e = tcmap[b]
        f.write(f'{i}\t{sheet}\t{b}\t{name}\t{pretty(e["tc"])}\t{e["status"]}\n')

cnt = collections.Counter(tcmap[b]['status'] for _, b, _ in rows)
by_sheet = collections.OrderedDict()
for sheet, b, _ in rows:
    by_sheet.setdefault(sheet, collections.Counter())[tcmap[b]['status']] += 1

def build(lang):
    ja = lang == 'ja'
    S = STATUS_JA if ja else STATUS_EN
    L = []
    if ja:
        L += ['# BMS vs Taranovsky\'s C 対応表', '',
              '[← Back](../README.md) | [English](README-en.md) | [Japanese](README.md)', '',
              'BM4-Analysis シートの BMS 列に対応する Taranovsky\'s C（main system, 結合系）の項。',
              '記法: `C(a,b)`, `0`, `Ω_1`, `Ω_2`（論文の Ω_n）。`#` は原表の通し番号。', '',
              '状態:', '',
              '- **検証済**: `tools/pss_tc.py` の機械検査（標準形、順序保存、展開列 M[n] (n ≤ 12) との共終性）を通過。',
              '- **規則(未検証)**: 翻訳規則は適用できるが機械検査に落ちた行（`note` に失敗の種別）。',
              '- **未翻訳**: 3 行以上。翻訳規則が未整備。', '',
              f'全 {len(rows)} 行の一覧（未翻訳を含む）は [table.tsv](table.tsv)。', '']
    else:
        L += ['# BMS vs Taranovsky\'s C correspondence table', '',
              '[← Back](../README-en.md) | [English](README-en.md) | [Japanese](README.md)', '',
              'Taranovsky\'s C (main system, combined) terms for the BMS column of the BM4-Analysis sheet.',
              'Notation: `C(a,b)`, `0`, `Ω_1`, `Ω_2` (the paper\'s Ω_n). `#` is the row number in the original sheet.', '',
              'Status:', '',
              '- **verified**: passed the machine checks in `tools/pss_tc.py` (standard form, order preservation, cofinality with the expansions M[n], n ≤ 12).',
              '- **rule (unverified)**: the rule applies but the machine check failed (`note` gives the kind of failure).',
              '- **untranslated**: 3 rows and more; no translation rule yet.', '',
              f'All {len(rows)} rows including the untranslated ones: [table.tsv](table.tsv).', '']
    L.append(('## 集計' if ja else '## Summary'))
    L.append('')
    L.append('| ' + ('シート' if ja else 'sheet') + ' | ' + ' | '.join(S[k] for k in STATUS_JA) + ' |')
    L.append('|---|' + '---|' * len(STATUS_JA))
    for sheet, c in by_sheet.items():
        L.append(f'| {sheet} | ' + ' | '.join(str(c[k]) for k in STATUS_JA) + ' |')
    L.append('| **' + ('計' if ja else 'total') + '** | ' + ' | '.join(f'**{cnt[k]}**' for k in STATUS_JA) + ' |')
    L.append('')
    L.append('## ' + ('翻訳できた行' if ja else 'Translated rows'))
    L.append('')
    L.append('| # | ' + ('シート' if ja else 'sheet') + ' | BMS | UNOCF | Taranovsky\'s C | ' + ('状態' if ja else 'status') + ' | note |')
    L.append('|---|---|---|---|---|---|---|')
    for i, (sheet, b, name) in enumerate(rows):
        e = tcmap[b]
        if e['status'] == 'untranslated': continue
        L.append(f'| {i} | {sheet} | `{b}` | {name} | `{pretty(e["tc"])}` | {S[e["status"]]} | {e["note"]} |')
    return '\n'.join(L) + '\n'

open(os.path.join(SHEET, 'README.md'), 'w').write(build('ja'))
open(os.path.join(SHEET, 'README-en.md'), 'w').write(build('en'))
print('rows', len(rows), dict(cnt))
