#!/usr/bin/env python3
"""翻訳の照合テスト生成: Lean `Translate.bms2tc` と Python 規則 (tools/pss_tc.py) の一致を
#guard で固定する。対象: xlsx の 1 行・2 行の行 + 展開サンプル。
出力: lean/tests/TranslateTest.lean
"""
import json, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pss_tc

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def prss_py(xs):
    """1 行: f([t_1..t_k]) = C(g(t_k), … C(g(t_1), 0))."""
    def split(xs):
        out = []
        i = 0
        while i < len(xs):
            j = i + 1
            while j < len(xs) and xs[j] > xs[i]: j += 1
            out.append(xs[i:j]); i = j
        return out
    if not xs: return '0'
    acc = '0'
    for t in split(xs):
        acc = f'C({prss_py([v - 1 for v in t[1:]])},{acc})'
    return acc

def main():
    cli = pss_tc.Cli()
    rows = json.load(open(os.path.join(ROOT, 'sheet', 'bms_rows.json')))
    mats = [b for _, b, _ in rows if b.startswith('(') and b.split(')')[0].count(',') <= 1]
    seeds = ['(0,0)(1,1)(2,2)', '(0,0)(1,1)(2,2)(3,3)', '(0,0)(1,1)(2,1)(3,2)', '(0,0)(1,1)(2,2)(3,2)',
             '(0)(1)(2)(3)', '(0)(1)(2)(2)(1)']
    mats += pss_tc.sample_pss(cli, seeds, depth=3)
    mats = [m for m in dict.fromkeys(mats) if cli.q(f'bstd {m}') == '1']
    lines = ['import BmsTc', '', 'open Translate', '']
    n = 0
    pss = [m for m in mats if m.split(')')[0].count(',') == 1]
    tr = pss_tc.translate(pss)
    for m in mats:
        if m.split(')')[0].count(',') == 0:
            t = prss_py([int(c.strip('()')) for c in m.split(')') if c])
        else:
            t = tr.get(m)
            if t is None: continue
        lines.append(f'#guard (bms2tc (Bms.parse! "{m}")).map toString == some "{t}"')
        n += 1
    out = os.path.join(ROOT, 'lean', 'tests', 'TranslateTest.lean')
    open(out, 'w').write('\n'.join(lines) + '\n')
    print(f'{n} cases -> {out}')
    cli.close()

if __name__ == '__main__':
    main()
