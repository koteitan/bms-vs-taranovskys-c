#!/usr/bin/env python3
"""TC.lean の照合テスト生成。

1. 標準形判定・比較: Taranovsky の OrdinalArithmetic.py (Cn 圧縮表現) と照合。
2. 基本列: n 番目の系の標準な項を C の個数 ≤ m まで全列挙して
   α[k] = max{β < α | L(β) ≤ L(α)+k} を定義どおりに計算し照合。
3. 接頭辞定理の経験的検査: 標準な項の postfix の各接頭辞を閉じた項が標準か。

出力: lean/tests/TCTest.lean (#guard 行)。
"""
import importlib.util, sys, random, itertools, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OA_PATH = os.path.join(ROOT, 'refs', 'taranovsky', 'OrdinalArithmetic.py')
spec = importlib.util.spec_from_file_location('OA', OA_PATH)
OA = importlib.util.module_from_spec(spec)
sys.argv = ['x']
spec.loader.exec_module(OA)

# ---- 項: ('0',) | ('W', n) | ('C', a, b) ----
Z = ('0',)
def W(n): return ('W', n)
def C(a, b): return ('C', a, b)

def to_str(t):
    if t == Z: return '0'
    if t[0] == 'W': return 'W' if t[1] == 1 else f'W_{t[1]}'
    return f'C({to_str(t[1])},{to_str(t[2])})'

def to_py(t):
    """Cn 圧縮表現へ: C(a, C(a, d)) → (2, a, d)."""
    if t == Z: return 0
    if t[0] == 'W': return 'W' * t[1]
    a = to_py(t[1]); b = to_py(t[2])
    if isinstance(b, tuple) and b[1] == a:
        return (b[0] + 1, a, b[2])
    return (1, a, b)

def L(t):
    return 0 if t[0] != 'C' else 1 + L(t[1]) + L(t[2])

def post(t):
    if t == Z: return '0'
    if t[0] == 'W': return 'W'
    return post(t[2]) + post(t[1]) + 'C'

ORD = {'C': 0, '0': 1, 'W': 2}
def lex_key(s): return [ORD[c] for c in s]

def is_std(t):
    return OA.IsStandard(to_py(t))

def is_std_n(t, n):
    """n 番目の系での標準形 (Python は W_1 を C(W_n,0) と書いた形を受け付けないので
    結合系の表記に直してから n=0 モードで判定する)."""
    return OA.IsStandard(to_py(combined(t)))

def combined(t):
    if t[0] != 'C': return t
    a = combined(t[1]); b = combined(t[2])
    if a[0] == 'W' and a[1] >= 2 and b == Z:
        return W(a[1] - 1)
    return C(a, b)

def toN(t, n):
    if t == Z: return t
    if t[0] == 'W':
        if t[1] >= n: return t
        r = W(n)
        for _ in range(n - t[1]): r = C(r, Z)
        return r
    return C(toN(t[1], n), toN(t[2], n))

def max_omega(t):
    if t == Z: return 0
    if t[0] == 'W': return t[1]
    return max(max_omega(t[1]), max_omega(t[2]))

# ---- ランダム項 ----
def rand_term(depth, nmax):
    if depth == 0 or random.random() < 0.3:
        return Z if random.random() < 0.6 else W(random.randint(1, nmax))
    return C(rand_term(depth - 1, nmax), rand_term(depth - 1, nmax))

# ---- n 番目の系の全列挙 ----
def enum_terms(leaves, n):
    """葉の個数がちょうど leaves の n 番目の系の項を全列挙."""
    if leaves == 1:
        return [Z, W(n)]
    out = []
    for la in range(1, leaves):
        for a in enum_terms(la, n):
            for b in enum_terms(leaves - la, n):
                out.append(C(a, b))
    return out

def main():
    random.seed(20260913)
    lines = ['import BmsTc.TC', '', 'open TC', '']
    # 1. 標準形判定 (ランダム)
    cnt_std = 0
    seen = set()
    for _ in range(3000):
        t = rand_term(random.randint(1, 5), random.randint(1, 3))
        if t in seen: continue
        seen.add(t)
        v = is_std(t)
        lines.append(f'#guard isStandard (parse! "{to_str(t)}") == {"true" if v else "false"}')
        cnt_std += 1
    # 標準な項を多めに (列挙から)
    std_terms = {}
    for n in (1, 2, 3):
        std_terms[n] = []
        for lv in range(1, 7):
            for t in enum_terms(lv, n):
                if is_std_n(t, n):
                    std_terms[n].append(t)
    for n in (1, 2, 3):
        for t in random.sample(std_terms[n], min(300, len(std_terms[n]))):
            tc = combined(t)
            lines.append(f'#guard isStandard (parse! "{to_str(tc)}") == true')
            lines.append(f'#guard isStandardN (parse! "{to_str(t)}") {n} == true')
            cnt_std += 2
    # 2. 比較 (標準な項どうし, Python CompareStd)
    cnt_cmp = 0
    for n in (1, 2, 3):
        ts = std_terms[n]
        for _ in range(300):
            a, b = random.choice(ts), random.choice(ts)
            r = OA.CompareStd(to_py(combined(a)), to_py(combined(b)))
            o = {-1: '.lt', 0: '.eq', 1: '.gt'}[r]
            lines.append(f'#guard cmp (parse! "{to_str(combined(a))}") (parse! "{to_str(combined(b))}") == {o}')
            cnt_cmp += 1
    # 3. 基本列 (定義どおり全列挙で計算)
    cnt_fs = 0
    bad_prefix = 0
    for n in (1, 2):
        ts = std_terms[n]
        by_post = sorted(ts, key=lambda t: lex_key(post(t)))
        # 接頭辞定理の検査
        for t in ts:
            p = post(t)
            for i in range(1, len(p)):
                stack = []
                for ch in p[:i]:
                    if ch == '0': stack.append(Z)
                    elif ch == 'W': stack.append(W(n))
                    else:
                        x = stack.pop(); y = stack.pop(); stack.append(C(x, y))
                while len(stack) > 1:
                    x = stack.pop(); y = stack.pop(); stack.append(C(x, y))
                if not is_std_n(stack[0], n):
                    bad_prefix += 1
        # α[k]
        LMAX = 5  # 列挙は葉 ≤ 6, すなわち L ≤ 5
        for α in random.sample(ts, min(250, len(ts))):
            if α == Z or (α[0] == 'C' and α[1] == Z):
                continue  # 0 と後続は基本列なし
            kα = lex_key(post(α))
            for k in range(0, 3):
                m = L(α) + k
                if m > LMAX: break
                cands = [β for β in ts if L(β) <= m and lex_key(post(β)) < kα]
                if not cands: continue
                best = max(cands, key=lambda t: lex_key(post(t)))
                lines.append(f'#guard maxBelowN {n} (parse! "{to_str(α)}") {m} == some (parse! "{to_str(best)}")')
                cnt_fs += 1
            # minAbove
            m = L(α)
            cands = [β for β in ts if L(β) <= m and lex_key(post(β)) > kα]
            if cands:
                best = min(cands, key=lambda t: lex_key(post(t)))
                lines.append(f'#guard minAboveN {n} (parse! "{to_str(α)}") {m} == some (parse! "{to_str(best)}")')
                cnt_fs += 1
    out = os.path.join(ROOT, 'lean', 'tests', 'TCTest.lean')
    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, 'w') as f:
        f.write('\n'.join(lines) + '\n')
    print(f'std={cnt_std} cmp={cnt_cmp} fs={cnt_fs} bad_prefix={bad_prefix} -> {out}')
    for n in (1, 2, 3):
        print(f'system {n}: standard terms with <=6 leaves: {len(std_terms[n])}')

if __name__ == '__main__':
    main()
