"""Exact rational reference checker for a certificate JSON (independent of Lean).

A line-by-line transliteration of the Lean definitions in ChargeKernel/CertBasic, CertLeaf,
CertTree, CertPoly, CertSound and CertSym, in exact rational arithmetic (Python `fractions`, with
Lean's convention x / 0 = 0). It evaluates the diamond check `v1ok` and the integral check `v2chk`
of quadrant (1, 1) and prints the resulting bound on c2. Work is split over processes.

Usage: python checker_rational.py CERT.json [procs]       (about 1 hour for pt900d_cert.json)
"""
import sys, os, math, time, json
from fractions import Fraction as Q
from multiprocessing import Pool

SC = Q(2 ** 30)

def div(x, y): return Q(0) if y == 0 else x / y
def floorK(x): return Q(math.floor(x * SC)) / SC
def ceilK(x): return Q(math.ceil(x * SC)) / SC

# ---- CertBasic ----
def cellBox(su, sv, r0, r1, s0, s1):
    u0 = -(r1 * s1) if su < 0 else r0 * s0
    u1 = -(r0 * s0) if su < 0 else r1 * s1
    v0 = -(r1 * (1 - s0)) if sv < 0 else r0 * (1 - s1)
    v1 = -(r0 * (1 - s1)) if sv < 0 else r1 * (1 - s0)
    return (u0, u1, v0, v1)

def dmin(B, p, q):
    u0, u1, v0, v1 = B
    return max(Q(0), max(u0 - p, p - u1)) + max(Q(0), max(v0 - q, q - v1))

def dmax(B, p, q):
    u0, u1, v0, v1 = B
    return max(abs(u0 - p), abs(u1 - p)) + max(abs(v0 - q), abs(v1 - q))

# ---- CertLeaf ----
def smin(L, B): return sum((floorK(div(b, dmax(B, p, q))) for p, q, b in L), Q(0))
def smax(L, B): return sum((ceilK(div(b, dmin(B, p, q))) for p, q, b in L), Q(0))
def allPos(L, B): return all(0 < dmin(B, p, q) for p, q, b in L)
def allNonneg(L): return all(0 <= b for p, q, b in L)

# ---- CertPoly ----
def polyVal(r0, r1, s0, s1, e0, e1, e2, e3):
    return ((s1 - s0) * (e0 * (r1 - r0) + e1 * ((r1 ** 2 - r0 ** 2) / 2) + e2 * ((r1 ** 3 - r0 ** 3) / 3))
            + e3 * ((r1 ** 3 - r0 ** 3) / 3) * ((s1 ** 2 - s0 ** 2) / 2))

# ---- CertTree ----
def j1Coef(a, c, L, B, r0, r1):
    k = c + smin(L, B)
    if a - r0 * k <= 0: return (Q(0), Q(0), Q(0), Q(0))
    if 0 <= a - r1 * k: return (a, -k, Q(0), Q(0))
    return (div((a - r0 * k) * r1, r1 - r0), -div(a - r0 * k, r1 - r0), Q(0), Q(0))

def tanOf(B, ch):
    u0, u1, v0, v1 = B; p, q, b = ch
    s1 = Q(1) if p <= u0 else Q(-1)
    s2 = Q(1) if q <= v0 else Q(-1)
    t0 = s1 * ((u0 + u1) / 2 - p) + s2 * ((v0 + v1) / 2 - q)
    return (s1, s2, floorK(div(2 * b, t0)), ceilK(div(b, t0 * t0)))

def tanOK(B, ch):
    u0, u1, v0, v1 = B; p, q, b = ch
    T = tanOf(B, ch)
    return ((p <= u0 or u1 <= p) and (q <= v0 or v1 <= q)
            and T[2] ** 2 <= 4 * b * T[3] and 0 <= T[3])

def tanA(B, ch):
    T = tanOf(B, ch); p, q, b = ch
    return T[2] - T[3] * (-(T[0] * p) - T[1] * q)

def tanB0(sv, B, ch):
    T = tanOf(B, ch); return -(T[3] * (T[1] * sv))

def tanB1(su, sv, B, ch):
    T = tanOf(B, ch); return -(T[3] * (T[0] * su - T[1] * sv))

def tangentOK(a, c, L, B, r1):
    return allPos(L, B) and 0 <= a - r1 * (c + smax(L, B)) and all(tanOK(B, ch) for ch in L)

def j2Coef(a, c, su, sv, L, B):
    return (a, -(c + sum((tanA(B, ch) for ch in L), Q(0))),
            -sum((tanB0(sv, B, ch) for ch in L), Q(0)), -sum((tanB1(su, sv, B, ch) for ch in L), Q(0)))

def leafVal(a, c, su, sv, L, r0, r1, s0, s1):
    B = cellBox(su, sv, r0, r1, s0, s1)
    e = j1Coef(a, c, L, B, r0, r1)
    v1 = polyVal(r0, r1, s0, s1, *e)
    if tangentOK(a, c, L, B, r1):
        f = j2Coef(a, c, su, sv, L, B)
        return min(v1, polyVal(r0, r1, s0, s1, *f))
    return v1

# ---- CertSound / CertSym ----
def v1leaf(a, c, m, su, sv, L, r0, r1, s0, s1):
    B = cellBox(su, sv, r0, r1, s0, s1)
    return allPos(L, B) and 0 < r1 and r1 * (c + m + smax(L, B)) <= a

# trees: preorder bitstrings, parsed as in CertParse (QTree.parse, fuel 64)
def parse(s):
    pos = 0
    def go(n):
        nonlocal pos
        if n == 0 or pos >= len(s): raise ValueError("malformed")
        ch = s[pos]; pos += 1
        if ch == "0": return None
        if ch != "1": raise ValueError("bad char")
        return (go(n - 1), go(n - 1), go(n - 1), go(n - 1))
    t = go(64)
    return t   # trailing characters are ignored by QTree.ofString as well

def children(r0, r1, s0, s1):
    rm, sm = (r0 + r1) / 2, (s0 + s1) / 2
    return [(r0, rm, s0, sm), (rm, r1, s0, sm), (r0, rm, sm, s1), (rm, r1, sm, s1)]

def v2chk(D, t, r0, r1, s0, s1):
    a, c, L = D
    if t is None:
        v = leafVal(a, c, 1, 1, L, r0, r1, s0, s1)
        return v if 0 <= v else None
    tot = Q(0)
    for sub, cell in zip(t, children(r0, r1, s0, s1)):
        x = v2chk(D, sub, *cell)
        if x is None: return None
        tot += x
    return tot

def v1chk(D, t, r0, r1, s0, s1):
    a, c, m, L = D
    if t is None: return v1leaf(a, c, m, 1, 1, L, r0, r1, s0, s1)
    return all(v1chk(D, sub, *cell) for sub, cell in zip(t, children(r0, r1, s0, s1)))

def split(t, cell, depth):
    """list of (subtree, cell) at the given depth (leaves above it kept as they are)"""
    if depth == 0 or t is None: return [(t, cell)]
    out = []
    for sub, ch in zip(t, children(*cell)): out += split(sub, ch, depth - 1)
    return out

G = {}
def w2(job): return v2chk(G["D2"], job[0], *job[1])
def w1(job): return v1chk(G["D1"], job[0], *job[1])
def init(D1, D2): G["D1"] = D1; G["D2"] = D2

# ---- reading the certificate ----
def read_cert(fn):
    d = json.load(open(fn))
    a, c, m, R = Q(d["a"]), Q(d["c"]), Q(d["m"]), Q(d["R"])
    L = [tuple(Q(x) for x in ch) for ch in d["ch"]]
    return a, c, m, R, L, d["v1"][0], d["v2"][0]

if __name__ == "__main__":
    fn = sys.argv[1]; procs = int(sys.argv[2]) if len(sys.argv) > 2 else os.cpu_count()
    a, c, m, R, L, T1, T2 = read_cert(fn)
    print(f"{fn}: {len(L)} charges, a={float(a):.6f} c={float(c):.6f} m={m} R={R}  "
          f"T1 {T1.count('0')} leaves, T2 {T2.count('0')} leaves", flush=True)
    flipU = sorted((-p, q, b) for p, q, b in L); flipV = sorted((p, -q, b) for p, q, b in L)
    print("allNonneg", allNonneg(L), " permU", flipU == sorted(L), " permV", flipV == sorted(L),
          " 0<=a", 0 <= a, " 0<c", 0 < c, " 0<m", 0 < m, " a<=R*c", a <= R * c, flush=True)
    t1 = parse(T1); t2 = parse(T2); t = time.time()
    jobs1 = split(t1, (Q(0), Q(1), Q(0), Q(1)), 3)
    jobs2 = split(t2, (Q(0), Q(R), Q(0), Q(1)), 4)
    with Pool(procs, initializer=init, initargs=((a, c, m, L), (a, c, L))) as P:
        ok1 = all(P.map(w1, jobs1, chunksize=1))
        print(f"v1ok = {ok1}  ({time.time()-t:.0f}s)", flush=True)
        vals = P.map(w2, jobs2, chunksize=1)
    if any(v is None for v in vals):
        print("v2chk = none (a negative leaf)"); sys.exit(1)
    V = sum(vals, Q(0))
    print(f"quadrant (1,1) integral bound v2val = {float(V):.10f}  ({time.time()-t:.0f}s)")
    print(f"=> c2 <= 4 * v2val / (2m) = {float(4 * V / (2 * m)):.6f}")
    print(f"exact v2val = {V.numerator}/{V.denominator}")
