#!/usr/bin/env python3
"""上限探索による翻訳の補正候補。

極限 BMS M について、規則で翻訳した f(M[n]) (n = n0..n1) の TC 上の上限候補
sup(f(M[n])) = minAbove(f(M[n]), L(f(M[n])))（bms2tc tc-sup）を求め、n によらず
一定になったらそれを f(M) の候補とし、機械検査（標準、f(M[n]) < T、T[k] ≤ f(M[N])）を行う。

    python3 tools/supfix.py M [M ...]
    python3 tools/supfix.py --bad          # sheet/verify_bad.json の行列
出力: M, 候補 T, 検査結果 (JSON 行)
"""
import sys, os, json, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CLI = os.path.join(ROOT, 'lean', '.lake', 'build', 'bin', 'bms2tc')


class Cli:
    def __init__(self):
        self.p = subprocess.Popen([CLI, 'batch'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True, bufsize=1)

    def q(self, line):
        self.p.stdin.write(line + '\n')
        self.p.stdin.flush()
        return self.p.stdout.readline().strip()


def run1(cli, m, n0=2, n1=5, N=12, K=8, tr=None):
    tr = tr or (lambda x: cli.q(f'tr {x}'))
    sups = []
    for n in range(n0, n1 + 1):
        mn = cli.q(f'bexp {m}[{n}]')
        tn = tr(mn)
        if tn in ('not translated', '(none)', ''):
            return {'m': m, 'error': f'no translation for M[{n}]'}
        sups.append(cli.q(f'sup {tn}'))
    if len(set(sups)) != 1:
        return {'m': m, 'error': 'sup not stable', 'sups': sups}
    T = sups[0]
    res = {'m': m, 'tc': T, 'old': tr(m), 'std': cli.q(f'std {T}') == '1', 'bad': []}
    tN = None
    for n in list(range(1, 7)) + [N]:
        mn = cli.q(f'bexp {m}[{n}]')
        tn = tr(mn)
        if cli.q(f'cmp {tn} {T}') != '-1':
            res['bad'].append(f'not-below n={n}')
        tN = tn
    for k in range(K + 1):
        a = cli.q(f'expand {T} {k}')
        if a == '(none)':
            break
        if cli.q(f'cmp {a} {tN}') == '1':
            res['bad'].append(f'not-cofinal k={k}')
            break
    return res


def main():
    args = sys.argv[1:]
    if args == ['--bad']:
        args = list(json.load(open(os.path.join(ROOT, 'sheet', 'verify_bad.json'))))
    cli = Cli()
    for m in args:
        print(json.dumps(run1(cli, m), ensure_ascii=False), flush=True)


if __name__ == '__main__':
    main()
