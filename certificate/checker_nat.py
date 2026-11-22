"""Python transliteration of ChargeKernel/CertNat.lean (the natural-number checker). Run as a script, it
compares the natural-number leaf values with the rational ones of checker_rational.py on random leaves.

Usage: python checker_nat.py CERT.json [n_leaves]
"""
import sys, random
from fractions import Fraction as Q
import checker_rational as RL

OFF = 2 ** 32
def nd(x, y): return abs(x - y)
def tsub(x, y): return max(x - y, 0)

def encode(L):
    out = []
    for p, q, b in L:
        P, Qn, B = p * 2 ** 22 + OFF, q * 2 ** 22 + OFF, b * 2 ** 52
        assert P.denominator == Qn.denominator == B.denominator == 1 and P >= 0 and Qn >= 0 and B >= 0
        out.append((int(P), int(Qn), int(B)))
    return out

def pass1(U0, U1, V0, V1, cl):
    smin = smax = 0; pos = True
    for P, Qn, B in cl:
        dmax = max(nd(U0, P), nd(U1, P)) + max(nd(V0, Qn), nd(V1, Qn))
        dmin = tsub(U0, P) + tsub(P, U1) + tsub(V0, Qn) + tsub(Qn, V1)
        smin += B // dmax if dmax else 0
        smax += (B + dmin - 1) // dmin if dmin else 0
        pos = pos and dmin > 0
    return smin, smax, pos

def pass2(U0, U1, V0, V1, cl):
    ok = True; sal = xp = xn = y1p = y1n = y2p = y2n = 0
    for P, Qn, B in cl:
        T = nd(U0 + U1, 2 * P) + nd(V0 + V1, 2 * Qn)
        al = 4 * B // T if T else 0
        be = (B * 2 ** 24 + T * T - 1) // (T * T) if T else 0
        g1, g2 = P <= U0, Qn <= V0
        ok = ok and (g1 or U1 <= P) and (g2 or V1 <= Qn) and al * al * 2 ** 22 <= 4 * B * be
        sal += al
        xp += (be * P if g1 else be * OFF) + (be * Qn if g2 else be * OFF)
        xn += (be * OFF if g1 else be * P) + (be * OFF if g2 else be * Qn)
        if g1: y1p += be
        else: y1n += be
        if g2: y2p += be
        else: y2n += be
    return ok, sal, xp, xn, y1p, y1n, y2p, y2n

def nLeaf(er, es, Ai, Ci, cl, R0, R1, S0, S1):
    U0, U1 = R0 * S0 + OFF, R1 * S1 + OFF
    V0, V1 = R0 * (2 ** es - S1) + OFF, R1 * (2 ** es - S0) + OFF
    X = 2 * es + 3 * er + 53
    smin, smax, pos = pass1(U0, U1, V0, V1, cl)
    K = Ci + smin; A = Ai * 2 ** er; dR = R1 - R0; dS = S1 - S0
    if A <= R0 * K: j1 = 0
    elif R1 * K <= A: j1 = tsub(dS * tsub(Ai * dR * 2 ** (er + 1), K * (R1 * R1 - R0 * R0)) * 6 * 2 ** (X - es - 2 * er - 31), 0)
    else: j1 = dS * tsub(A, R0 * K) * dR * 6 * 2 ** (X - es - 2 * er - 31)
    if pos and R1 * (Ci + smax) <= A:
        ok, sal, xp, xn, y1p, y1n, y2p, y2n = pass2(U0, U1, V0, V1, cl)
        if ok:
            e1 = -((Ci * 2 ** 22 + sal * 2 ** 22) + (xp - xn))
            e2 = y2p - y2n; e3 = (y1p - y1n) - e2
            dR2, dR3, dS2 = R1 * R1 - R0 * R0, R1 ** 3 - R0 ** 3, S1 * S1 - S0 * S0
            j2 = (6 * dS * Ai * dR * 2 ** (X - es - 30 - er) + 3 * dS * e1 * dR2 * 2 ** (X - es - 2 * er - 52)
                  + 2 * dS * e2 * dR3 * 2 ** (X - es - 3 * er - 30) + e3 * dR3 * dS2 * 2 ** (X - 2 * es - 3 * er - 30))
            return min(j1, j2), True
    return j1, False

def leaves(t, cell):
    if t is None: yield cell; return
    for sub, ch in zip(t, RL.children(*cell)): yield from leaves(sub, ch)

if __name__ == "__main__":
    fn = sys.argv[1]; n = int(sys.argv[2]) if len(sys.argv) > 2 else 300
    a, c, m, R, L, T1, T2 = RL.read_cert(fn)
    cl = encode(L); Ai, Ci = a * 2 ** 30, c * 2 ** 30
    assert Ai.denominator == 1 and Ci.denominator == 1; Ai, Ci = int(Ai), int(Ci)
    er, es = 8, 14; assert R == 64
    lv = list(leaves(RL.parse(T2), (Q(0), R, Q(0), Q(1))))
    random.seed(1); sample = random.sample(lv, min(n, len(lv)))
    X = 2 * es + 3 * er + 53; D = 6 * 2 ** X; ntan = 0
    for (r0, r1, s0, s1) in sample:
        v, tan = nLeaf(er, es, Ai, Ci, cl, int(r0 * 2 ** er), int(r1 * 2 ** er), int(s0 * 2 ** es), int(s1 * 2 ** es))
        w = RL.leafVal(a, c, 1, 1, L, r0, r1, s0, s1)
        assert Q(v, D) == w, (r0, r1, s0, s1, Q(v, D), w)
        ntan += tan
    print(f"{len(sample)} random leaves of {len(lv)}: natural-number value / (6*2^{X}) == rational leafVal exactly "
          f"(tangent branch on {ntan})")
