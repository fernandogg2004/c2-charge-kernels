"""Kernel LP with uniform *square* charges.
psi(z) = a/r(z) - sum_j beta_j * Phi_j(z) - c,  Phi_j(z) = int_{Q_j} dy / |z - y|_1  (closed form),
beta_j >= 0 (charge density).  8-fold symmetric orbits of squares on a grid of size hb, outside the
unit diamond.  Objective: (1/2) int psi_+ by midpoint quadrature; constraints psi >= 1 on the
diamond, psi <= 0 on an outer ring.  Then an accurate estimate of int psi_+ on a fine polar grid.
Usage: python square_lp.py hq hb box rmax_b
"""
import sys, numpy as np, scipy.sparse as sp, time
from scipy.optimize import linprog

def Fq(x, y):
    s = x + y
    with np.errstate(divide="ignore", invalid="ignore"):
        return np.where(s > 0, s * np.log(np.where(s > 0, s, 1)), 0.0)

def int_pos(x0, x1, y0, y1):
    return Fq(x1, y1) - Fq(x0, y1) - Fq(x1, y0) + Fq(x0, y0)

def int_abs(x0, x1, y0, y1):
    tot = 0.0
    for (a0, a1) in ((np.maximum(x0, 0), np.maximum(x1, 0)), (np.maximum(-x1, 0), np.maximum(-x0, 0))):
        for (b0, b1) in ((np.maximum(y0, 0), np.maximum(y1, 0)), (np.maximum(-y1, 0), np.maximum(-y0, 0))):
            tot = tot + int_pos(a0, a1, b0, b1)
    return tot

def phi_square(U, V, x0, x1, y0, y1):
    """int over [x0,x1]x[y0,y1] of 1/(|U-x|+|V-y|) dx dy."""
    return int_abs(U - x1, U - x0, V - y1, V - y0)

def orbit_squares(i, j, hb):
    """octant square [i hb,(i+1)hb]x[j hb,(j+1)hb] with j<=i -> its distinct images"""
    x0, x1, y0, y1 = i * hb, (i + 1) * hb, j * hb, (j + 1) * hb
    sq = set()
    for (a0, a1, b0, b1) in ((x0, x1, y0, y1), (y0, y1, x0, x1)):
        for sx in (1, -1):
            for sy in (1, -1):
                xa, xb = sorted((sx * a0, sx * a1)); ya, yb = sorted((sy * b0, sy * b1))
                sq.add((round(xa, 12), round(xb, 12), round(ya, 12), round(yb, 12)))
    return list(sq)

def orbit_phi(U, V, i, j, hb):
    return sum(phi_square(U, V, *q) for q in orbit_squares(i, j, hb))

def solve(hq, hb, box, rmax_b, epsd=1.002):
    n = int(round(box / hq)); Q = []; W = []
    for i in range(n):
        for j in range(i + 1):
            Q.append(((i + .5) * hq, (j + .5) * hq)); W.append(4 * hq * hq if i == j else 8 * hq * hq)
    Q = np.array(Q); W = np.array(W)
    m = 200
    C = [(i / m, j / m) for i in range(m + 1) for j in range(i + 1) if 0 < i + j <= m]
    C += [(t, 1 - t) for t in np.linspace(0.5, 1, 4 * m + 1)]
    C = np.array(C) * epsd
    Rg = np.array([(t, s * t) for t in np.linspace(box, 3 * box, 25) for s in np.linspace(0, 1, 41)])
    orbits = [(i, j) for i in range(int(rmax_b / hb) + 1) for j in range(i + 1)
              if (i + j) * hb >= 1.0 - 1e-12 and (i + j) * hb <= rmax_b]
    t0 = time.time()
    MQ = np.column_stack([orbit_phi(Q[:, 0], Q[:, 1], i, j, hb) for i, j in orbits])
    MC = np.column_stack([orbit_phi(C[:, 0], C[:, 1], i, j, hb) for i, j in orbits])
    MR = np.column_stack([orbit_phi(Rg[:, 0], Rg[:, 1], i, j, hb) for i, j in orbits])
    GQ = 1 / Q.sum(1); GC = 1 / C.sum(1); GR = 1 / Rg.sum(1)
    nQ, nB = len(Q), len(orbits)
    # exact cell integral of 1/r, midpoint for the (smooth) charge potentials, per unit area
    h2 = hq / 2
    GQ = int_abs(Q[:, 0] - h2, Q[:, 0] + h2, Q[:, 1] - h2, Q[:, 1] + h2) / (hq * hq)
    A1 = sp.hstack([sp.csr_matrix(GQ[:, None]), sp.csr_matrix(-np.ones((nQ, 1))), sp.csr_matrix(-MQ), -sp.eye(nQ)])
    A2 = sp.hstack([sp.csr_matrix(-GC[:, None]), sp.csr_matrix(np.ones((len(C), 1))), sp.csr_matrix(MC), sp.csr_matrix((len(C), nQ))])
    A3 = sp.hstack([sp.csr_matrix(GR[:, None]), sp.csr_matrix(-np.ones((len(Rg), 1))), sp.csr_matrix(-MR), sp.csr_matrix((len(Rg), nQ))])
    A = sp.vstack([A1, A2, A3]).tocsr(); b = np.concatenate([np.zeros(nQ), -np.ones(len(C)), np.zeros(len(Rg))])
    cost = np.concatenate([[0, 0], np.zeros(nB), 0.5 * W])
    res = linprog(cost, A_ub=A, b_ub=b, bounds=[(0, None)] * (2 + nB + nQ), method="highs")
    x = res.x
    print(f"hq={hq} hb={hb}: orbits={nB} LP={res.fun:.5f} a={x[0]:.4f} c={x[1]:.4f} active={(x[2:2+nB]>1e-12).sum()}"
          f" ({time.time()-t0:.0f}s)", flush=True)
    return x[0], x[1], [(o, w) for o, w in zip(orbits, x[2:2 + nB]) if w > 1e-12], hb

def estimate(a, c, ch, hb, N=1200):
    """accurate int psi_+ on a polar (r,s) midpoint grid in one quadrant, times 4; and min psi on D"""
    R = a / c
    rr = (np.arange(N) + .5) / N * min(R, 3.0); ss = (np.arange(N) + .5) / N
    Rr, Ss = np.meshgrid(rr, ss); U = Rr * Ss; V = Rr * (1 - Ss)
    S = sum(w * orbit_phi(U, V, i, j, hb) for (i, j), w in ch)
    F = np.maximum(a - Rr * (c + S), 0)
    I = 4 * F.mean() * min(R, 3.0) * 1.0
    m = 400
    Cs = np.array([(i / m, j / m) for i in range(m + 1) for j in range(m + 1) if 0 < i + j <= m])
    Sd = sum(w * orbit_phi(Cs[:, 0], Cs[:, 1], i, j, hb) for (i, j), w in ch)
    psi_min = (a / Cs.sum(1) - Sd - c).min()
    return I, psi_min

if __name__ == "__main__":
    hq, hb, box, rmax = map(float, sys.argv[1:5])
    a, c, ch, hb = solve(hq, hb, box, rmax)
    I, pm = estimate(a, c, ch, hb)
    print(f"  estimate: int psi_+ = {I:.5f}, min psi on D = {pm:.5f}  =>  c2 <~ {I/(2*min(pm,1)):.5f}")
    np.savez(f"sq_{hb}.npz", a=a, c=c, orb=np.array([o for o, _ in ch]), w=np.array([w for _, w in ch]), hb=hb)
