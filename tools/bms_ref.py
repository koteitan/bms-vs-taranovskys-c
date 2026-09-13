#!/usr/bin/env python3
"""Reference re-implementation of yaBMS bms.c (BM4 only) in Python.

Used to (1) understand the C semantics before porting to Lean, and
(2) cross-check against the C binary.  Matrices are lists of columns,
each column a list of row entries.
"""


def parse(s):
    cols, brackets = [], []
    i, n = 0, len(s)
    while i < n and s[i] != '[':
        if s[i] == '(':
            j = s.index(')', i)
            body = s[i + 1:j].strip()
            cols.append([int(t) for t in body.split(',')] if body else [])
            i = j + 1
        else:
            i += 1
    while i < n:
        if s[i] == '[':
            j = s.index(']', i)
            brackets.append(int(s[i + 1:j]))
            i = j + 1
        else:
            i += 1
    return cols, brackets


def tostr(m):
    return ''.join('(' + ','.join(str(v) for v in c) + ')' for c in m)


def parent_idx(m):
    xs = len(m)
    ys = len(m[0]) if xs else 0
    pim = [[-1] * ys for _ in range(xs)]
    for x in range(xs):
        c = m[x][0]
        px = x - 1
        while px >= 0 and not (m[px][0] < c):
            px -= 1
        pim[x][0] = px
        for y in range(1, ys):
            c = m[x][y]
            if c == 0:
                pim[x][y] = -1
                continue
            px = pim[x][y - 1]
            while px != -1 and not (m[px][y] < c):
                px = pim[px][y - 1]
            pim[x][y] = px
    return pim


def expand(m, b):
    """bm.c expand() for BM4 with a single bracket b."""
    xs = len(m)
    if xs == 0:
        return []
    ys = len(m[0])
    last = m[-1]
    y = 0
    while y < ys and last[y] != 0:
        y += 1
    lnz = y - 1
    if y == 0 or b == 0:
        return [c[:] for c in m[:-1]]
    pim = parent_idx(m)
    r = pim[xs - 1][lnz]
    bpxs = xs - r - 1
    delta = [last[yy] - m[r][yy] for yy in range(lnz)]
    nzs = lnz + 1
    am = [[0] * nzs for _ in range(bpxs)]
    for yy in range(nzs):
        am[0][yy] = 1
    for x in range(1, bpxs):
        for yy in range(nzs):
            p = pim[r + x][yy]
            am[x][yy] = 0 if p < r else am[p - r][yy]
    out = [c[:] for c in m[:-1]]
    for a in range(1, b + 1):
        for x in range(bpxs):
            col = m[r + x][:]
            for yy in range(lnz):
                col[yy] += a * delta[yy] * am[x][yy]
            out.append(col)
    return out


def expand_all(m, bs):
    for b in bs:
        m = expand(m, b)
    return m


def compare(a, b):
    """lexicographic on flattened entries, then column count (equal row counts)."""
    fa = [v for c in a for v in c]
    fb = [v for c in b for v in c]
    for x, y in zip(fa, fb):
        if x > y:
            return 1
        if x < y:
            return -1
    if len(a) > len(b):
        return 1
    if len(a) < len(b):
        return -1
    return 0


def is_standard(m, fuel=10000):
    xs = len(m)
    if xs == 0:
        return True
    ys = len(m[0])
    # initial diagonal prefix
    s = []
    done = False
    for x in range(xs):
        col = []
        for y in range(ys):
            v = m[x][y]
            if v > x:
                return False
            if v < x:
                col.append(v + 1)
                col += [0] * (ys - y - 1)
                s.append(col)
                done = True
                break
            col.append(x)
        if done:
            break
        s.append(col)
    while fuel > 0:
        fuel -= 1
        c = compare(s, m)
        if c == 0:
            return True
        if c < 0:
            return False
        oldxsm1 = len(s) - 1
        s2 = expand(s, 1)
        bplen = len(s2) - oldxsm1
        n = (xs - oldxsm1) // bplen + 1 if bplen != 0 else 0
        s = expand(s, n)
        s = s[:xs]
        cut = len(s)
        for x in range(len(s)):
            if any(s[x][y] > m[x][y] for y in range(ys)):
                cut = x + 1
                break
        s = s[:cut]
    return False


if __name__ == '__main__':
    import sys
    for arg in sys.argv[1:]:
        m, bs = parse(arg)
        print(tostr(expand_all(m, bs)))
