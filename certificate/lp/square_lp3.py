"""Multi-resolution square-charge LP (diamond-polar objective, far field controlled).
Squares are orbits of octant cells of several sizes; level = (h, rlo, rhi) keeps cells whose lower-left
diamond radius is in [rlo, rhi).  Usage: python square_lp3.py "h:rlo:rhi,h:rlo:rhi,..." RQ RF out.npz
"""
import sys, numpy as np, scipy.sparse as sp, time
from scipy.optimize import linprog
from square_lp import phi_square
from square_lp2 import rgrid

def orbit_of(x0, x1, y0, y1):
    sq = set()
    for (a0, a1, b0, b1) in ((x0, x1, y0, y1), (y0, y1, x0, x1)):
        for sx in (1, -1):
            for sy in (1, -1):
                xa, xb = sorted((sx * a0, sx * a1)); ya, yb = sorted((sy * b0, sy * b1))
                sq.add((round(xa, 12), round(xb, 12), round(ya, 12), round(yb, 12)))
    return sorted(sq)

def make_orbits(levels):
    orbs = []
    for h, rlo, rhi in levels:
        n = int(rhi / h) + 2
        for i in range(n):
            for j in range(i + 1):
                if rlo - 1e-12 <= (i + j) * h < rhi - 1e-12:
                    orbs.append(orbit_of(i * h, (i + 1) * h, j * h, (j + 1) * h))
    return orbs

def ophi(U, V, orb):
    return sum(phi_square(U, V, *q) for q in orb)

def solve(levels, RQ, RF):
    t0 = time.time()
    orbits = make_orbits(levels)
    re = rgrid(RQ); se = np.linspace(0, 0.5, 26)
    rm = (re[:-1] + re[1:]) / 2; dr = np.diff(re); sm = (se[:-1] + se[1:]) / 2; ds = np.diff(se)
    Rr, Ss = np.meshgrid(rm, sm, indexing="ij"); W = np.outer(dr, ds).ravel() * 8
    Rq = Rr.ravel(); Sq = Ss.ravel(); U = Rq * Sq; V = Rq * (1 - Sq)
    MQ = np.column_stack([ophi(U, V, o) for o in orbits])
    m = 120
    C = [(i / m, j / m) for i in range(m + 1) for j in range(i + 1) if 0 < i + j <= m]
    C += [(t, 1 - t) for t in np.linspace(0.5, 1, 4 * m + 1)]
    C = np.array(C) * 1.002
    MC = np.column_stack([ophi(C[:, 0], C[:, 1], o) for o in orbits])
    Rf = np.array([(t * s, t * (1 - s)) for t in np.geomspace(RQ, RF, 40) for s in np.linspace(0, 0.5, 21)])
    MR = np.column_stack([ophi(Rf[:, 0], Rf[:, 1], o) for o in orbits])
    nQ, nB = len(Rq), len(orbits)
    A1 = sp.hstack([sp.csr_matrix(np.ones((nQ, 1))), sp.csr_matrix(-Rq[:, None]), sp.csr_matrix(-Rq[:, None] * MQ), -sp.eye(nQ)])
    A2 = sp.hstack([sp.csr_matrix(-(1 / C.sum(1))[:, None]), sp.csr_matrix(np.ones((len(C), 1))), sp.csr_matrix(MC), sp.csr_matrix((len(C), nQ))])
    A3 = sp.hstack([sp.csr_matrix((1 / Rf.sum(1))[:, None]), sp.csr_matrix(-np.ones((len(Rf), 1))), sp.csr_matrix(-MR), sp.csr_matrix((len(Rf), nQ))])
    A4 = sp.hstack([sp.csr_matrix([[1.0, -RF]]), sp.csr_matrix((1, nB)), sp.csr_matrix((1, nQ))])
    A = sp.vstack([A1, A2, A3, A4]).tocsr()
    b = np.concatenate([np.zeros(nQ), -np.ones(len(C)), np.zeros(len(Rf)), [0.0]])
    cost = np.concatenate([[0, 0], np.zeros(nB), 0.5 * W])
    res = linprog(cost, A_ub=A, b_ub=b, bounds=[(0, None)] * (2 + nB + nQ), method="highs")
    x = res.x; act = [(o, w) for o, w in zip(orbits, x[2:2 + nB]) if w > 1e-12]
    print(f"levels={levels}: orbits={nB} LP={res.fun:.5f} a={x[0]:.4f} c={x[1]:.4f} active orbits={len(act)}"
          f" squares={sum(len(o) for o, _ in act)} ({time.time()-t0:.0f}s)", flush=True)
    return x[0], x[1], act

def estimate(a, c, act, RF, Nr=3000, Ns=150):
    edges = np.concatenate([np.linspace(0, 3, Nr // 2 + 1), np.geomspace(3, RF, Nr // 2 + 1)[1:]])
    rm = (edges[:-1] + edges[1:]) / 2; dr = np.diff(edges); sm = (np.arange(Ns) + .5) / Ns * 0.5
    total = 0.0
    for k in range(0, len(rm), 200):
        Rr, Ss = np.meshgrid(rm[k:k + 200], sm, indexing="ij")
        S = sum(w * ophi(Rr * Ss, Rr * (1 - Ss), o) for o, w in act)
        total += (np.maximum(a - Rr * (c + S), 0) * dr[k:k + 200, None]).sum() * (0.5 / Ns) * 8
    m = 300
    Cs = np.array([(i / m, j / m) for i in range(m + 1) for j in range(m + 1) if 0 < i + j <= m])
    Sd = sum(w * ophi(Cs[:, 0], Cs[:, 1], o) for o, w in act)
    return total, (a / Cs.sum(1) - Sd - c).min()

if __name__ == "__main__":
    levels = [tuple(map(float, l.split(":"))) for l in sys.argv[1].split(",")]
    RQ, RF = float(sys.argv[2]), float(sys.argv[3]); out = sys.argv[4]
    a, c, act = solve(levels, RQ, RF)
    I, pm = estimate(a, c, act, RF)
    print(f"  estimate: int psi_+ = {I:.5f}, min psi on D = {pm:.5f} => c2 <~ {I/(2*pm):.5f}", flush=True)
    np.savez(out, a=a, c=c, sq=np.array([q for o, _ in act for q in o]),
             w=np.array([w for o, w in act for _ in o]), RF=RF)
