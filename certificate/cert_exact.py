"""Exact (Fraction) mirror of the Lean certificate checker.

Data: a, c, m, charges (p, q, b) dyadic.  Quadrant signs (su, sv) in {+1,-1}^2.
Cell [r0,r1]x[s0,s1];  image bbox  u in su*[r0 s0, r1 s1],  v in sv*[r0(1-s1), r1(1-s0)].
V2 leaf bound (upper bound for  int_cell max(r*psi, 0) dr ds):
   J1  = ds * Jtri(a, r0, r1, c + Smin)             (always valid)
   J2  = int_cell U  (tangent bound)  if positive & non-straddling
   bound = min(J1, J2)
V1 leaf check (psi >= m on the cell, for r in (0, 1]):   a >= r1 * (c + m + Smax).
"""
import sys, math, json, numpy as np
from fractions import Fraction as Fr

KBITS = 30
SC = 1 << KBITS

def floorK(x):  # largest multiple of 2^-K that is <= x
    return Fr(math.floor(x * SC), SC)

def ceilK(x):
    return Fr(math.ceil(x * SC), SC)

def dyad(x, bits):
    return Fr(round(x * (1 << bits)), 1 << bits)

def bbox(r0, r1, s0, s1, su, sv):
    u0, u1 = r0 * s0, r1 * s1
    v0, v1 = r0 * (1 - s1), r1 * (1 - s0)
    if su < 0: u0, u1 = -u1, -u0
    if sv < 0: v0, v1 = -v1, -v0
    return u0, u1, v0, v1

def dists(box, p, q):
    u0, u1, v0, v1 = box
    dmin = max(0, u0 - p, p - u1) + max(0, v0 - q, q - v1)
    dmax = max(abs(u0 - p), abs(u1 - p)) + max(abs(v0 - q), abs(v1 - q))
    return dmin, dmax

def Jtri(a, r0, r1, k):
    if a - r0 * k <= 0: return Fr(0)
    if a - r1 * k >= 0: return a * (r1 - r0) - k * (r1 * r1 - r0 * r0) / 2
    return (a - r0 * k) * (r1 - r0) / 2

def leaf_bound(D, r0, r1, s0, s1, su, sv):
    a, c, ch = D["a"], D["c"], D["ch"]
    box = bbox(r0, r1, s0, s1, su, sv)
    ds = s1 - s0
    Smin = Fr(0); Smax = Fr(0); finite = True
    for (p, q, b) in ch:
        dmin, dmax = dists(box, p, q)
        Smin += floorK(b / dmax)
        if dmin > 0: Smax += ceilK(b / dmin)
        else: finite = False
    J1 = ds * Jtri(a, r0, r1, c + Smin)
    if J1 == 0: return J1
    if not finite or a - r1 * (c + Smax) < 0: return J1
    u0, u1, v0, v1 = box
    um, vm = (u0 + u1) / 2, (v0 + v1) / 2
    A = Fr(0); B0 = Fr(0); B1 = Fr(0)
    for (p, q, b) in ch:
        if u0 < p < u1 or v0 < q < v1: return J1
        s1g = 1 if u0 >= p else -1
        s2g = 1 if v0 >= q else -1
        t0 = s1g * (um - p) + s2g * (vm - q)
        al = floorK(2 * b / t0); be = ceilK(b / (t0 * t0))
        assert al * al <= 4 * b * be
        g0 = s2g * sv; g1 = s1g * su - s2g * sv; e = -s1g * p - s2g * q
        A += al - be * e; B0 += -be * g0; B1 += -be * g1
    R1 = r1 - r0; R2 = (r1 * r1 - r0 * r0) / 2; R3 = (r1 ** 3 - r0 ** 3) / 3
    S1 = (s1 * s1 - s0 * s0) / 2
    J2 = a * R1 * ds - (c + A) * R2 * ds - B0 * R3 * ds - B1 * R3 * S1
    return min(J1, J2)

def v1_ok(D, r0, r1, s0, s1, su, sv):
    a, c, m, ch = D["a"], D["c"], D["m"], D["ch"]
    box = bbox(r0, r1, s0, s1, su, sv)
    Smax = Fr(0)
    for (p, q, b) in ch:
        dmin, _ = dists(box, p, q)
        if dmin <= 0: return False
        Smax += ceilK(b / dmin)
    return a >= r1 * (c + m + Smax)

# ---------- tree construction (float guidance) and exact evaluation ----------
def est_float(Df, r0, r1, s0, s1, su, sv, k=4):
    a, c, P, W = Df
    rs = r0 + (np.arange(k) + .5) / k * (r1 - r0); ss = s0 + (np.arange(k) + .5) / k * (s1 - s0)
    Rr, Ss = np.meshgrid(rs, ss); u = su * Rr * Ss; v = sv * Rr * (1 - Ss)
    S = sum(w / (np.abs(u - p) + np.abs(v - q)) for (p, q), w in zip(P, W))
    return float(np.maximum(a - Rr * (c + S), 0).mean() * (r1 - r0) * (s1 - s0))

def build_v2(D, Df, R, tol, maxdepth=16):
    """returns (preorder bits, exact total) per quadrant"""
    out = []
    import os
    quads = ((1, 1),) if os.environ.get("QUAD1") else ((1, 1), (1, -1), (-1, 1), (-1, -1))
    for su, sv in quads:
        bits = []; total = Fr(0)
        def rec(r0, r1, s0, s1, d):
            nonlocal total
            ub = leaf_bound(D, r0, r1, s0, s1, su, sv)
            if ub == 0 or d >= maxdepth or float(ub) - est_float(Df, float(r0), float(r1), float(s0), float(s1), su, sv) <= tol:
                bits.append(0); total += ub; return
            bits.append(1)
            rm, sm = (r0 + r1) / 2, (s0 + s1) / 2
            rec(r0, rm, s0, sm, d + 1); rec(rm, r1, s0, sm, d + 1)
            rec(r0, rm, sm, s1, d + 1); rec(rm, r1, sm, s1, d + 1)
        rec(Fr(0), Fr(R), Fr(0), Fr(1), 0)
        out.append((bits, total))
    return out

def build_v1(D, maxdepth=18):
    out = []
    for su, sv in ((1, 1), (1, -1), (-1, 1), (-1, -1)):
        bits = []
        def rec(r0, r1, s0, s1, d):
            if v1_ok(D, r0, r1, s0, s1, su, sv):
                bits.append(0); return
            if d >= maxdepth: raise RuntimeError("V1 failed")
            bits.append(1)
            rm, sm = (r0 + r1) / 2, (s0 + s1) / 2
            rec(r0, rm, s0, sm, d + 1); rec(rm, r1, s0, sm, d + 1)
            rec(r0, rm, sm, s1, d + 1); rec(rm, r1, sm, s1, d + 1)
        rec(Fr(0), Fr(1), Fr(0), Fr(1), 0)
        out.append(bits)
    return out

def make_data(fn, pos_bits=12, val_bits=24, m=Fr(999, 1000)):
    import os
    if os.environ.get("CERT_M"): m = Fr(os.environ["CERT_M"])
    d = np.load(fn)
    if "pts" in d.files:   # full symmetric list of point charges
        a = dyad(float(d["a"]), val_bits); c = dyad(float(d["c"]), val_bits)
        ch = [(dyad(float(x), pos_bits), dyad(float(y), pos_bits), dyad(float(b), val_bits))
              for (x, y), b in zip(d["pts"], d["b"])]
        return {"a": a, "c": c, "m": m, "ch": ch}
    a = dyad(float(d["a"]), val_bits); c = dyad(float(d["c"]), val_bits)
    ch = []
    for (p, q), w in zip(d["B"], d["b"]):
        p_, q_ = dyad(float(p), pos_bits), dyad(float(q), pos_bits)
        bw = dyad(float(w), val_bits)
        orbit = [(p_, q_), (-p_, -q_), (q_, p_), (-q_, -p_), (p_, -q_), (-p_, q_), (q_, -p_), (-q_, p_)]
        distinct = len(set(orbit))
        for (x, y) in orbit:   # 8 entries, weight scaled so that the multiset has the right total
            ch.append((x, y, bw * distinct / 8))
    return {"a": a, "c": c, "m": m, "ch": ch}

if __name__ == "__main__":
    fn = sys.argv[1]; tol = float(sys.argv[2])
    D = make_data(fn)
    P = np.array([[float(p), float(q)] for p, q, _ in D["ch"]]); W = np.array([float(b) for _, _, b in D["ch"]])
    Df = (float(D["a"]), float(D["c"]), P, W)
    R = 2 ** math.ceil(math.log2(float(D["a"] / D["c"])))
    v1 = build_v1(D)
    print("V1 leaves per quadrant:", [b.count(0) for b in v1], flush=True)
    v2 = build_v2(D, Df, R, tol)
    tot = sum(t for _, t in v2) * (4 // len(v2))
    print("V2 leaves per quadrant:", [b.count(0) for b, _ in v2])
    print("exact int psi_+ <=", float(tot), " => c2 <=", float(tot / (2 * D["m"])))
    json.dump({"a": str(D["a"]), "c": str(D["c"]), "m": str(D["m"]), "R": R,
               "ch": [[str(p), str(q), str(b)] for p, q, b in D["ch"]],
               "v1": ["".join(map(str, b)) for b in v1],
               "v2": ["".join(map(str, b)) for b, _ in v2],
               "total": str(tot)}, open(fn.replace(".npz", "_cert.json"), "w"))
