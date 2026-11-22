"""Square-charge kernel LP with the objective in diamond-polar coordinates (octant), covering the far field.
int psi_+ = 8 * int_0^inf int_0^{1/2} max(a - r(c + S(rs, r(1-s))), 0) ds dr.
Constraints: psi >= 1 on the unit diamond (samples, slightly enlarged); psi <= 0 on samples r in [RQ, RF];
RF * c >= a so that psi <= a/r - c <= 0 for r >= RF.
Usage: python square_lp2.py hb rmax_b RQ RF out.npz
"""
import sys, numpy as np, scipy.sparse as sp, time
from scipy.optimize import linprog
from square_lp import orbit_phi, orbit_squares

def rgrid(RQ):
    edges = list(np.arange(0, 2.5, 0.02)) + list(np.arange(2.5, 8, 0.1)) + list(np.arange(8, RQ + 1e-9, 0.5))
    edges = np.array(sorted(set(np.round(edges, 10)) | {RQ}))
    return edges

def build(hb, rmax_b, RQ, RF):
    re = rgrid(RQ); se = np.linspace(0, 0.5, 26)
    rm = (re[:-1] + re[1:]) / 2; dr = np.diff(re); sm = (se[:-1] + se[1:]) / 2; ds = np.diff(se)
    Rr, Ss = np.meshgrid(rm, sm, indexing="ij"); W = np.outer(dr, ds).ravel() * 8
    Rq = Rr.ravel(); Sq = Ss.ravel(); U = Rq * Sq; V = Rq * (1 - Sq)
    orbits = [(i, j) for i in range(int(rmax_b / hb) + 1) for j in range(i + 1)
              if (i + j) * hb >= 1.0 - 1e-12 and (i + j) * hb <= rmax_b]
    MQ = np.column_stack([orbit_phi(U, V, i, j, hb) for i, j in orbits])
    m = 120
    C = [(i / m, j / m) for i in range(m + 1) for j in range(i + 1) if 0 < i + j <= m]
    C += [(t, 1 - t) for t in np.linspace(0.5, 1, 4 * m + 1)]
    C = np.array(C) * 1.002
    MC = np.column_stack([orbit_phi(C[:, 0], C[:, 1], i, j, hb) for i, j in orbits])
    Rf = np.array([(t * s, t * (1 - s)) for t in np.geomspace(RQ, RF, 40) for s in np.linspace(0, 0.5, 21)])
    MR = np.column_stack([orbit_phi(Rf[:, 0], Rf[:, 1], i, j, hb) for i, j in orbits])
    return dict(Rq=Rq, W=W, MQ=MQ, C=C, MC=MC, Rf=Rf, MR=MR, orbits=orbits)

def solve(hb, rmax_b, RQ, RF):
    t0 = time.time()
    B = build(hb, rmax_b, RQ, RF)
    Rq, W, MQ, C, MC, Rf, MR, orbits = B["Rq"], B["W"], B["MQ"], B["C"], B["MC"], B["Rf"], B["MR"], B["orbits"]
    nQ, nB = len(Rq), len(orbits)
    # s_k >= a - r c - r S  :  a - r c - r * MQ beta - s <= 0
    A1 = sp.hstack([sp.csr_matrix(np.ones((nQ, 1))), sp.csr_matrix(-Rq[:, None]),
                    sp.csr_matrix(-Rq[:, None] * MQ), -sp.eye(nQ)])
    GC = 1 / C.sum(1)
    A2 = sp.hstack([sp.csr_matrix(-GC[:, None]), sp.csr_matrix(np.ones((len(C), 1))), sp.csr_matrix(MC),
                    sp.csr_matrix((len(C), nQ))])
    GR = 1 / Rf.sum(1)
    A3 = sp.hstack([sp.csr_matrix(GR[:, None]), sp.csr_matrix(-np.ones((len(Rf), 1))), sp.csr_matrix(-MR),
                    sp.csr_matrix((len(Rf), nQ))])
    A4 = sp.hstack([sp.csr_matrix([[1.0, -RF]]), sp.csr_matrix((1, nB)), sp.csr_matrix((1, nQ))])
    A = sp.vstack([A1, A2, A3, A4]).tocsr()
    b = np.concatenate([np.zeros(nQ), -np.ones(len(C)), np.zeros(len(Rf)), [0.0]])
    cost = np.concatenate([[0, 0], np.zeros(nB), 0.5 * W])
    res = linprog(cost, A_ub=A, b_ub=b, bounds=[(0, None)] * (2 + nB + nQ), method="highs")
    x = res.x
    print(f"hb={hb} rmax_b={rmax_b} RQ={RQ} RF={RF}: orbits={nB} LP={res.fun:.5f} a={x[0]:.4f} c={x[1]:.4f}"
          f" ({time.time()-t0:.0f}s)", flush=True)
    return x[0], x[1], [(o, w) for o, w in zip(orbits, x[2:2 + nB]) if w > 1e-12]

def estimate(a, c, ch, hb, RF, Nr=4000, Ns=200):
    """int psi_+ over r in [0, RF] (psi <= 0 beyond RF since RF c >= a), fine graded polar grid"""
    edges = np.concatenate([np.linspace(0, 3, Nr // 2 + 1), np.geomspace(3, RF, Nr // 2 + 1)[1:]])
    rm = (edges[:-1] + edges[1:]) / 2; dr = np.diff(edges)
    sm = (np.arange(Ns) + .5) / Ns * 0.5
    total = 0.0
    for k in range(0, len(rm), 200):
        Rr, Ss = np.meshgrid(rm[k:k + 200], sm, indexing="ij")
        S = sum(w * orbit_phi(Rr * Ss, Rr * (1 - Ss), i, j, hb) for (i, j), w in ch)
        F = np.maximum(a - Rr * (c + S), 0)
        total += (F * dr[k:k + 200, None]).sum() * (0.5 / Ns) * 8
    m = 400
    Cs = np.array([(i / m, j / m) for i in range(m + 1) for j in range(m + 1) if 0 < i + j <= m])
    Sd = sum(w * orbit_phi(Cs[:, 0], Cs[:, 1], i, j, hb) for (i, j), w in ch)
    return total, (a / Cs.sum(1) - Sd - c).min()

if __name__ == "__main__":
    hb, rmax_b, RQ, RF = map(float, sys.argv[1:5]); out = sys.argv[5]
    a, c, ch = solve(hb, rmax_b, RQ, RF)
    I, pm = estimate(a, c, ch, hb, RF)
    print(f"  estimate: int psi_+ = {I:.5f}, min psi on D = {pm:.5f}, a/c = {a/c:.2f} => c2 <~ {I/(2*min(pm,1)):.5f}"
          f" (with m = min psi: {I/(2*pm):.5f})", flush=True)
    np.savez(out, a=a, c=c, orb=np.array([o for o, _ in ch]), w=np.array([w for _, w in ch]), hb=hb, RF=RF)
