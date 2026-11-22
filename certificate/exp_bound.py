"""Float experiment: how tight are the quadtree leaf bounds (quadrant (1,1)) for point-charge kernels?
mode 'tan': current Lean bound (tangent only if no charge coordinate straddles the cell).
mode 'sec': |u-p| <= secant over [u0,u1] (exact when not straddling), so the tangent bound always applies
            when no charge lies in the closed box.
Best-first refinement on gap = ub - est, up to a leaf budget.  Usage: python exp_bound.py pts.npz mode budget
"""
import sys, heapq, math, numpy as np

def load(fn):
    d = np.load(fn); return float(d["a"]), float(d["c"]), d["pts"][:, 0].astype(float), d["pts"][:, 1].astype(float), d["b"].astype(float)

def Jtri(a, r0, r1, k):
    if a - r0 * k <= 0: return 0.0
    if a - r1 * k >= 0: return a * (r1 - r0) - k * (r1 * r1 - r0 * r0) / 2
    return (a - r0 * k) * (r1 - r0) / 2

def leaf(K, r0, r1, s0, s1, mode):
    a, c, P, Q, B = K
    u0, u1, v0, v1 = r0 * s0, r1 * s1, r0 * (1 - s1), r1 * (1 - s0)
    du = np.maximum(0, np.maximum(u0 - P, P - u1)); dv = np.maximum(0, np.maximum(v0 - Q, Q - v1))
    dmin = du + dv
    dmax = np.maximum(abs(u0 - P), abs(u1 - P)) + np.maximum(abs(v0 - Q), abs(v1 - Q))
    Smin = (B / dmax).sum(); ds = s1 - s0
    J1 = ds * Jtri(a, r0, r1, c + Smin)
    if J1 == 0: return 0.0
    if (dmin <= 0).any(): return J1
    Smax = (B / dmin).sum()
    contour = a - r1 * (c + Smax) < 0
    if contour and mode != "chord": return J1
    if mode == "tan":
        if ((u0 < P) & (P < u1)).any() or ((v0 < Q) & (Q < v1)).any(): return J1
    # linear upper bound l(u,v) = gu*u + gv*v + e for |u-P|+|v-Q|
    au0, au1 = abs(u0 - P), abs(u1 - P); av0, av1 = abs(v0 - Q), abs(v1 - Q)
    gu = (au1 - au0) / (u1 - u0); gv = (av1 - av0) / (v1 - v0)
    e = au0 - gu * u0 + av0 - gv * v0
    um, vm = (u0 + u1) / 2, (v0 + v1) / 2
    t0 = gu * um + gv * vm + e
    al = 2 * B / t0; be = B / t0 ** 2
    # S >= sum al - be*(gu u + gv v + e);  u = r s, v = r - r s
    A = (al - be * e).sum(); Bv = -(be * gv).sum(); Bu = -(be * gu).sum()
    # r*psi <= a - r(c + A) - r^2 (Bv + (Bu - Bv) s)
    B0, B1 = Bv, Bu - Bv
    R1 = r1 - r0; R2 = (r1 ** 2 - r0 ** 2) / 2; R3 = (r1 ** 3 - r0 ** 3) / 3; S1 = (s1 ** 2 - s0 ** 2) / 2
    J2 = a * R1 * ds - (c + A) * R2 * ds - B0 * R3 * ds - B1 * R3 * S1
    if not contour: return min(J1, J2)
    k = c + A; t1 = sorted([r0 * k, r1 * k]); w = sorted([B0 + B1 * s0, B0 + B1 * s1])
    p2 = [x * y for x in (r0 * r0, r1 * r1) for y in w]
    L = a - t1[1] - max(p2); H = a - t1[0] - min(p2)
    if H <= 0: return 0.0
    if L >= 0: return min(J1, J2)
    area = (r1 - r0) * ds
    return min(J1, H * (J2 - L * area) / (H - L))

def est(K, r0, r1, s0, s1, k=6):
    a, c, P, Q, B = K
    rs = r0 + (np.arange(k) + .5) / k * (r1 - r0); ss = s0 + (np.arange(k) + .5) / k * (s1 - s0)
    Rr, Ss = np.meshgrid(rs, ss); U = (Rr * Ss).ravel(); V = (Rr * (1 - Ss)).ravel()
    S = (B[None] / (np.abs(U[:, None] - P[None]) + np.abs(V[:, None] - Q[None]))).sum(1)
    return float(np.maximum(a - Rr.ravel() * (c + S), 0).mean() * (r1 - r0) * (s1 - s0))

def run(K, mode, budget, R):
    root = (0.0, R, 0.0, 1.0, 0)
    def item(cell):
        ub = leaf(K, *cell[:4], mode)
        g = 0.0 if ub == 0 or cell[4] >= 18 else ub - est(K, *cell[:4])
        return (-g, cell, ub)
    H = [item(root)]; n = 1
    while n < budget:
        g, cell, ub = heapq.heappop(H)
        if -g <= 1e-12: heapq.heappush(H, (g, cell, ub)); break
        r0, r1, s0, s1, d = cell; rm, sm = (r0 + r1) / 2, (s0 + s1) / 2
        for ch in ((r0, rm, s0, sm, d + 1), (rm, r1, s0, sm, d + 1), (r0, rm, sm, s1, d + 1), (rm, r1, sm, s1, d + 1)):
            heapq.heappush(H, item(ch))
        n += 3
    tot = sum(ub for _, _, ub in H); gap = sum(-g for g, _, _ in H)
    return n, tot, gap

if __name__ == "__main__":
    fn, mode = sys.argv[1], sys.argv[2]
    K = load(fn); R = 2 ** math.ceil(math.log2(K[0] / K[1]))
    for budget in map(int, sys.argv[3].split(",")):
        n, tot, gap = run(K, mode, budget, R)
        print(f"{fn} {mode} leaves={n} int psi_+ <= {4*tot:.5f} (gap {4*gap:.5f}) => c2 <= {4*tot/2/1.003:.5f}", flush=True)

def build_tol(K, R, tol, mode="tan", maxdepth=18):
    """preorder bits (1 = split), float total, same child order as cert_exact"""
    bits = []; tot = [0.0]
    st = [(0.0, float(R), 0.0, 1.0, 0)]
    while st:
        r0, r1, s0, s1, d = st.pop()
        ub = leaf(K, r0, r1, s0, s1, mode)
        if ub == 0 or d >= maxdepth or ub - est(K, r0, r1, s0, s1) <= tol:
            bits.append(0); tot[0] += ub; continue
        bits.append(1); rm, sm = (r0 + r1) / 2, (s0 + s1) / 2
        st.extend([(rm, r1, sm, s1, d + 1), (r0, rm, sm, s1, d + 1), (rm, r1, s0, sm, d + 1), (r0, rm, s0, sm, d + 1)])
    return bits, tot[0]
