#!/usr/bin/env python3
"""PSS → Buchholz（参照実装: naruyoko 氏 common.js の Trans。環境変数 BUCHHOLZ_REF_JS）
→ Taranovsky's C の試作翻訳と機械検証。

Buchholz 項:  0 | D_ν a | (p_1, …, p_m)  (非増加の和)
TC 側:  Ω̂_1 = W_1,  Ω̂_{ν+1} = C(W_2, Ω̂_ν)

  ι(0) = 0
  ι((p_1,…,p_m)) = C(exp(p_m), … C(exp(p_2), ι(p_1)))
  exp(D_0 a)   = ι(a)            (a < Ω_1)
  exp(D_ν a)   = Ω̂_ν            (ν ≥ 1, a = 0)
               = chain(a, Ω̂_ν)  (ν ≥ 1, 0 < a < Ω_{ν+1})   [= Ω_ν + a]
  exp(D_ν a)   = chain(β, P)     (a = a_high ++ β, a_high ≠ 0 ≠ β, P = ι(D_ν a_high))
               = ι(D_ν a)        (a = a_high ≠ 0: ε 数)
  chain((q_1,…,q_j), t) = C(exp(q_j), … C(exp(q_1), t))
  ι(D_ν a):  a = a_high ++ β  (a_high: 添字 > ν の項, β: 添字 ≤ ν の項)
     ν = 0, a_high = 0:  C(ι(a), 0)
     ν ≥ 1, a_high = 0:  a = 0 → Ω̂_ν;  else C(chain(a, Ω̂_ν), Ω̂_ν)
     a_high ≠ 0, β ≠ 0:  P = ι(D_ν a_high);  C(chain(β, P), P)   [= P + ω^{P+β}]
     a_high ≠ 0, β = 0:  a_high = a' ++ [D_μ b]:  C(exp(D_μ b), ι(D_ν a') or base_ν if a' = 0)
  base_0 = 0, base_ν = Ω̂_ν.
"""
import subprocess, sys, os, random, json
RULE2 = os.environ.get('RULE2', '1') == '1'

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PSS2BP = os.environ.get('BUCHHOLZ_REF_JS', 'buchholz_ref.js')
CLI = os.path.join(ROOT, 'lean', '.lake', 'build', 'bin', 'bms2tc')

# ---------- Buchholz raw parse ----------
def parse_raw(s):
    pos = 0
    def term():
        nonlocal pos
        while s[pos] == ' ': pos += 1
        if s[pos] == '0':
            pos += 1
            return 0
        if s[pos] == 'D':
            assert s[pos+1] == '_'
            pos += 2
            j = pos
            while pos < len(s) and s[pos].isdigit(): pos += 1
            nu = int(s[j:pos])
            inner = term()
            return ('D', nu, inner)
        if s[pos] == '(':
            pos += 1
            items = [term()]
            while s[pos] == ',':
                pos += 1
                items.append(term())
            assert s[pos] == ')'
            pos += 1
            return ('S', items)
        raise ValueError(s[pos:])
    t = term()
    assert pos == len(s), (s, pos)
    return t

def buchholz_ref(mats):
    p = subprocess.run(['node', PSS2BP, '--raw'], input='\n'.join(mats) + '\n',
                       capture_output=True, text=True)
    out = {}
    for line in p.stdout.splitlines():
        if '=>' in line:
            a, b = line.split('=>')
            out[a.strip()] = parse_raw(b.strip())
    return out

# ---------- TC terms ----------
Z = ('0',)
def W(n): return ('W', n)
def C(a, b): return ('C', a, b)
def tstr(t):
    if t == Z: return '0'
    if t[0] == 'W': return 'W' if t[1] == 1 else f'W_{t[1]}'
    return f'C({tstr(t[1])},{tstr(t[2])})'

def omega_hat(nu):
    assert nu >= 1
    t = W(1)
    for _ in range(nu - 1):
        t = C(W(2), t)
    return t

def base(nu):
    return Z if nu == 0 else omega_hat(nu)

def terms_of(a):
    """和の項リスト (0 → [])."""
    if a == 0: return []
    if a[0] == 'S': return a[1]
    return [a]

def mk_sum(ts):
    if not ts: return 0
    if len(ts) == 1: return ts[0]
    return ('S', ts)

def chain(a, t):
    # CnAll: C の代わりに第 2 引数の最小化つきの Cn（値は変わらず標準形に近づく）
    for q in terms_of(a):
        t = Cn(exp(q), t)
    return t

def split_high(a, nu):
    ts = terms_of(a)
    high = [q for q in ts if q[1] > nu]
    low = [q for q in ts if q[1] <= nu]
    # 正規形では high が前にまとまっている
    assert ts == high + low, (a, nu)
    return mk_sum(high), mk_sum(low)

def deg_of(t):
    """C(a,b) の a."""
    return t[1] if t[0] == 'C' else None

def cmp_tc(a, b):
    return _cli.q(f'cmp {tstr(a)} {tstr(b)}')

def Cn(x, b):
    """C(x, b) を第 2 引数最小化して作る: b = C(c,d) で x > c なら b := d."""
    while b[0] == 'C' and cmp_tc(x, b[1]) == '1':
        b = b[2]
    return C(x, b)

def exp(p):
    """log_ω ι(p) の TC 項（和の中で次の項を積むときの次数）."""
    assert p[0] == 'D'
    nu, a = p[1], p[2]
    high, low = split_high(a, nu)
    if high == 0:
        if nu == 0: return iota(a)
        if a == 0: return omega_hat(nu)
        return chain(a, omega_hat(nu))
    if low != 0:
        return chain(low, iota(('D', nu, high)))   # ψ_ν(a_high+β) = ω^{P+β}
    return iota(p)                                 # ε 数

def chain_rp(a, nu, e):
    """N2: chain(a, Ω̂_ν) の最後の項を高さ ν のままたどった先の ψ_ν(0) の指数 Ω̂_ν を e に置き換える."""
    ts = terms_of(a)
    if not ts:
        return None
    last = ts[-1]
    if last[0] != 'D' or last[1] != nu:
        return None
    init = chain(mk_sum(ts[:-1]), omega_hat(nu))
    if last[2] == 0:
        return C(e, init)
    h, _ = split_high(last[2], nu)
    if h != 0:
        return None
    e2 = chain_rp(last[2], nu, e)
    return None if e2 is None else C(e2, init)

def exp_rp(p, mu, E):
    """R2g: 段 μ の素の Ω_μ への右端の道をたどり、その指数を E にした log p（Translate.lean の expRP と同じ）.
    道は段 ≥ μ の項だけを通る。置き換えがなければ None."""
    if p[0] != 'D' or p[1] < mu:
        return None
    nu, a = p[1], p[2]
    if a == 0:
        return E if nu == mu else None
    h, l = split_high(a, nu)
    if h == 0:
        if nu == 0:
            return None
        return chain_rp2(a, mu, E, omega_hat(nu))
    if l != 0:
        return chain_rp2(l, mu, E, iota(('D', nu, h)))
    return iota_rp(p, mu, E)

def chain_rp2(a, mu, E, base_):
    ts = terms_of(a)
    if not ts:
        return None
    r = exp_rp(ts[-1], mu, E)
    return None if r is None else C(r, chain(mk_sum(ts[:-1]), base_))

def iota_rp_sum(x, mu, E):
    ts = terms_of(x)
    if not ts:
        return None
    if len(ts) == 1:
        return iota_rp(ts[0], mu, E)
    r = exp_rp(ts[-1], mu, E)
    return None if r is None else C(r, iota(mk_sum(ts[:-1])))

def iota_rp(p, mu, E):
    """R2g: ι(p) の計算の形をなぞって置き換える（Translate.lean の iotaRP と同じ）."""
    if p[0] != 'D' or p[1] < mu or p[2] == 0:
        return None
    nu, a = p[1], p[2]
    high, low = split_high(a, nu)
    if high == 0:
        if nu == 0:
            return None
        if nu >= 2 and terms_of(a)[-1][1] == nu:
            return None
        r = chain_rp2(a, mu, E, omega_hat(nu))
        return None if r is None else C(r, omega_hat(nu))
    if low != 0:
        Pt = iota(('D', nu, high))
        r = chain_rp2(low, mu, E, Pt)
        return None if r is None else C(r, Pt)
    hs = terms_of(high)
    aprime = mk_sum(hs[:-1])
    last = hs[-1]
    if last[1] == nu + 1:
        bh, _ = split_high(last[2], last[1])
        r = chain_rp2(last[2], mu, E, omega_hat(last[1])) if bh == 0 else iota_rp_sum(last[2], mu, E)
        if r is None:
            return None
        return Cn(r, iota(('D', nu, aprime)) if aprime != 0 else base(nu))
    if nu == 0:
        return None
    r = iota_rp_sum(a, mu, E)
    return None if r is None else C(r, base(nu))

def chain_rp_base(a, nu, e, base):
    """chain_rp の基点を指定できる版（Translate.lean の chainRPBase と同じ）."""
    ts = terms_of(a)
    if not ts:
        return None
    last = ts[-1]
    if last[0] != 'D' or last[1] != nu:
        return None
    init = chain(mk_sum(ts[:-1]), base)
    if last[2] == 0:
        return C(e, init)
    h, _ = split_high(last[2], nu)
    if h != 0:
        return None
    e2 = chain_rp(last[2], nu, e)
    return None if e2 is None else C(e2, init)

def val(t):
    """順序数 t (Buchholz 項) の TC 項. 和は C(exp(p_m), … C(exp(p_2), ι(p_1)))."""
    return iota(t)

def iota(t):
    if t == 0: return Z
    if t[0] == 'S':
        ts = t[1]
        r = iota(ts[0])
        for q in ts[1:]:
            r = Cn(exp(q), r)   # CnAll
        return r
    nu, a = t[1], t[2]
    high, low = split_high(a, nu)
    if high == 0:
        if nu == 0: return C(iota(a), Z)
        if a == 0: return omega_hat(nu)
        if nu >= 2:
            # N2: 最後の項を高さ ν のままたどった先の ψ_ν(0) の指数を ψ̂_{ν-1}(Ω_ν + a) に
            lc = chain_rp(a, nu, Cn(chain(a, omega_hat(nu)), omega_hat(nu - 1)))
            if lc is not None:
                return C(lc, omega_hat(nu))
        return C(chain(a, omega_hat(nu)), omega_hat(nu))
    if low != 0:
        P = iota(('D', nu, high))
        return C(chain(low, P), P)
    hs = terms_of(high)
    aprime = mk_sum(hs[:-1])
    last = hs[-1]
    mu, b = last[1], last[2]
    if mu == nu + 1:
        # 1 段上の崩壊 ψ_{ν+1}(b) が最後の項: 次数は「Ω_{ν+1} + b」の値項
        bh, _ = split_high(b, nu + 1)
        degree = chain(b, omega_hat(nu + 1)) if bh == 0 else val(b)
        if nu == 0 and bh != 0:
            # R1d: b が段 m ≥ 2 の項で終わるとき、ι(b) の中で R2g と同じ置き換え（E = ψ̂_{m-1}(b)）
            bts = terms_of(b)
            q2 = bts[-1]
            if len(bts) >= 2 and q2[1] >= 2:
                binit = mk_sum(bts[:-1])
                e2 = iota(('D', q2[1] - 1, b))
                if q2[2] == 0:
                    degree = Cn(e2, val(binit))
                else:
                    r = exp_rp(q2, q2[1], e2)
                    if r is not None:
                        degree = C(r, val(binit))
        base_ = iota(('D', nu, aprime)) if aprime != 0 else base(nu)
        return Cn(degree, base_)
    # 2 段以上上の項が最後: 添字全体の値項を次数にする
    if nu == 0 and aprime != 0 and RULE2:
        # R2n: ψ_0(α' + ψ_μ(b)), μ ≥ 2。E = ψ̂_{μ-1}(a)（Translate.lean と同じ）
        en = iota(('D', mu - 1, a))
        if b == 0:
            return C(Cn(en, val(aprime)), Z)
        ex = exp_rp(('D', mu, b), mu, en)   # R2g
        if ex is not None:
            return C(Cn(ex, val(aprime)), Z)   # R2k
        # R2x: b の項がすべて添字 > μ・2 項以上・最後の項の段 m ≥ μ+2 のとき、ι(b) の中で E = ψ̂_{m-1}(b) の置き換え
        bts = terms_of(b)
        if len(bts) >= 2 and all(q[1] > mu for q in bts) and bts[-1][1] >= mu + 2:
            q2 = bts[-1]
            binit = mk_sum(bts[:-1])
            e2 = iota(('D', q2[1] - 1, b))
            deg = None
            if q2[2] == 0:
                deg = Cn(e2, val(binit))
            else:
                r = exp_rp(q2, q2[1], e2)
                if r is not None:
                    deg = C(r, val(binit))
            if deg is not None:
                return C(C(C(deg, omega_hat(mu)), val(aprime)), Z)
        return C(iota(a), Z)
    return C(val(a), base(nu))

# ---------- CLI batch ----------
_cli = None
class Cli:
    def __init__(self):
        global _cli
        self.p = subprocess.Popen([CLI, 'batch'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True, bufsize=1)
        _cli = self
    def q(self, line):
        self.p.stdin.write(line + '\n'); self.p.stdin.flush()
        return self.p.stdout.readline().strip()
    def close(self):
        self.p.stdin.close(); self.p.wait()

def translate(mats):
    raw = buchholz_ref(mats)
    return {m: tstr(iota(raw[m])) for m in mats if m in raw}

def is_succ_matrix(m):
    return m.endswith('(0,0)')

def verify(mats, cli, nmax=12, K=6, verbose=True):
    """標準形・順序・上限の検査。
    極限 M について f(M[n]) < f(M) (n ≤ nmax) かつ
    f(M)[k] ≤ f(M[nmax]) (k ≤ K; Hyp cos 基本列が BMS 展開列に追い越される)。"""
    mats = [m for m in mats if cli.q(f'bstd {m}') == '1']
    tr = translate(mats)
    bad = []
    for m in mats:
        t = tr[m]
        if cli.q(f'std {t}') != '1':
            bad.append(('nonstd', m, t))
    pairs = list(zip(mats, mats[1:])) + [(random.choice(mats), random.choice(mats)) for _ in range(len(mats))]
    for a, b in pairs:
        if cli.q(f'bcmp {a} {b}') != cli.q(f'cmp {tr[a]} {tr[b]}'):
            bad.append(('order', a, b, tr[a], tr[b]))
    for m in mats:
        t = tr[m]
        if m == '' or m == 'Empty Matrix': continue
        if is_succ_matrix(m):
            pm = m[:-len('(0,0)')]
            tp = translate([pm]).get(pm, '0') if pm else '0'
            if t != f'C(0,{tp})':
                bad.append(('succ', m, t, tp))
            continue
        tns = []
        for n in range(1, nmax + 1):
            mn = cli.q(f'bexp {m}[{n}]')
            tn = translate([mn]).get(mn)
            if tn is None:
                bad.append(('notrans-exp', m, mn)); break
            if cli.q(f'std {tn}') != '1':
                bad.append(('nonstd-exp', m, n, mn, tn)); break
            if cli.q(f'cmp {tn} {t}') != '-1':
                bad.append(('not-below', m, n, t, mn, tn)); break
            tns.append(tn)
        if len(tns) < nmax: continue
        top = tns[-1]
        for k in range(K + 1):
            ak = cli.q(f'expand {t} {k}')
            if ak == '(none)': break
            if cli.q(f'cmp {ak} {top}') == '1':
                bad.append(('not-cofinal', m, k, t, ak, top)); break
    if verbose:
        for b in bad[:40]: print('BAD', b)
        print(f'checked {len(mats)} matrices, {len(bad)} problems')
    return bad, tr

def sample_pss(cli, seeds, depth=3, brackets=(1, 2, 3)):
    """diagonal から展開して標準な PSS を集める。"""
    out = set(seeds)
    frontier = list(seeds)
    for _ in range(depth):
        nxt = []
        for m in frontier:
            for n in brackets:
                e = cli.q(f'bexp {m}[{n}]')
                if e and e != 'ERR' and len(e) < 200 and e not in out:
                    out.add(e); nxt.append(e)
        frontier = nxt
    return sorted(out, key=len)

if __name__ == '__main__':
    random.seed(1)
    cli = Cli()
    if len(sys.argv) > 1:
        for m in sys.argv[1:]:
            print(m, '=>', translate([m]).get(m))
        cli.close(); sys.exit()
    rows = json.load(open(os.path.join(ROOT, 'sheet', 'bms_rows.json')))
    pss_rows = [b for _, b, _ in rows if b.startswith('(') and b.count(',') > 0 and b.split(')')[0].count(',') == 1]
    print('xlsx PSS rows:', len(pss_rows))
    bad, tr = verify(pss_rows, cli)
    badmap = {}
    for b in bad:
        badmap.setdefault(b[1], []).append(b[0])
    json.dump(badmap, open(os.path.join(ROOT, 'sheet', 'verify_bad.json'), 'w'), indent=1)
    seeds = ['(0,0)(1,1)(2,2)', '(0,0)(1,1)(2,2)(3,3)', '(0,0)(1,1)(2,1)(3,2)', '(0,0)(1,1)(2,2)(3,2)', '(0,0)(1,1)(2,2)(3,3)(4,4)']
    mats = sample_pss(cli, seeds, depth=4)
    print('sampled PSS:', len(mats))
    verify(mats, cli)
    cli.close()
