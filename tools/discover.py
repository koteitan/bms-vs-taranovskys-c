#!/usr/bin/env python3
"""機械による対応の発見: ι が検証に通らない行列 M に対し、
f(M) = sup{ f(M[n]) } を `tc-sup`（min{γ > β | L(γ) ≤ L(β)}）で求める。
再帰はメモ化し、ι が検証に通る行列を底とする。

使い方: python3 tools/discover.py "(0,0)(1,1)(2,2)(3,3)(2,2)" ...
"""
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pss_tc

cli = pss_tc.Cli()
memo = {}
NMAX = int(os.environ.get('NMAX', '1'))
MAXDEPTH = int(os.environ.get('MAXDEPTH', '400'))

def q(s): return cli.q(s)

def expand(m, n): return q(f'bexp {m}[{n}]')

def iota_ok(m, t):
    """ι(M) = t が標準で、M[n] の ι が t の基本列要素か (n=1..2)。"""
    if q(f'std {t}') != '1': return False
    if m.endswith('(0,0)'):
        return True
    for n in (1, 2):
        mn = expand(m, n)
        tn = pss_tc.translate([mn]).get(mn)
        if tn is None or q(f'std {tn}') != '1' or q(f'isfs {t} {tn}') != '1':
            return False
    return True

def f(m, depth=0, log=None):
    if m in memo: return memo[m]
    if m == '':
        memo[m] = '0'; return '0'
    t = pss_tc.translate([m]).get(m)
    if t is not None and iota_ok(m, t):
        memo[m] = t; return t
    if m.endswith('(0,0)'):
        r = f'C(0,{f(m[:-5], depth + 1, log)})'
        memo[m] = r; return r
    if depth > MAXDEPTH:
        raise RuntimeError(f'too deep at {m}')
    cands = []
    for n in range(1, NMAX + 1):
        mn = expand(m, n)
        tn = f(mn, depth + 1, log)
        s = q(f'sup {tn}')
        cands.append((n, mn, tn, s))
    sups = {c[3] for c in cands}
    if len(sups) == 1:
        r = cands[0][3]
        # 検証: 各 f(M[n]) が r の基本列要素
        ok = all(q(f'isfs {r} {c[2]}') == '1' for c in cands)
        if log is not None:
            log.append((m, r, ok, [(c[0], c[2]) for c in cands]))
        memo[m] = r
        return r
    raise RuntimeError(f'sup candidates disagree at {m}: {cands}')

if __name__ == '__main__':
    log = []
    for m in sys.argv[1:]:
        try:
            r = f(m, 0, log)
            # 追加検証: M[2] の翻訳が r の基本列要素か
            m2 = expand(m, 2)
            t2 = f(m2, 0, None)
            print(m, '=>', r, ' check[2]=', q(f'isfs {r} {t2}'), ' memo=', len(memo))
        except RuntimeError as e:
            print(m, 'FAIL', e)
    print('--- derived (non-ι) entries:')
    for m, r, ok, cs in log:
        print(('OK ' if ok else 'NG ') + m + ' => ' + r)
        for n, tn in cs:
            print(f'      [{n}] {tn}')
    cli.close()
