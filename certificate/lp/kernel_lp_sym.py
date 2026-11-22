"""Symmetry-reduced grid LP (K(i,j) = K(|i|,|j|) = K(|j|,|i|)).  Same discretisation as kernel_lp.py."""
import sys, numpy as np, scipy.sparse as sp, time
from scipy.optimize import linprog

def solve(h, box, diag_scheme="sum"):
    N = int(round(box / h))
    var = {}
    for i in range(N + 1):
        for j in range(i + 1):
            var[(i, j)] = len(var)
    def vid(i, j):
        i, j = abs(i), abs(j)
        if j > i: i, j = j, i
        return var[(i, j)] if i <= N else None
    nv = len(var)
    rows, cols, vals = [], [], []
    w = np.zeros(2 * N + 2); w[1:] = 1.0 / np.arange(1, 2 * N + 2) ** 2
    diag = 2 * np.pi ** 2 / 3
    r = 0
    for (i, j), t in var.items():
        if i == 0 and j == 0: continue
        acc = {t: diag}
        for k in range(-2 * N - 1, 2 * N + 2):
            if k == 0: continue
            for (a, b) in ((i + k, j), (i, j + k)):
                if abs(a) <= N and abs(b) <= N:
                    v = vid(a, b); acc[v] = acc.get(v, 0) - w[abs(k)]
        for v, c in acc.items(): rows.append(r); cols.append(v); vals.append(c)
        r += 1
    A = sp.csr_matrix((vals, (rows, cols)), shape=(r, nv))
    mult = np.zeros(nv); lb = np.zeros(nv)
    for (i, j), t in var.items():
        m = (1 if i == 0 else 2) * (1 if j == 0 else 2)   # sign multiplicity
        if i != j: m *= 2                                  # swap multiplicity
        mult[t] = m
        if (i + j) * h <= 1 + 1e-12: lb[t] = 1.0
    c = 0.5 * h * h * mult
    t0 = time.time()
    res = linprog(c, A_ub=A, b_ub=np.zeros(r), bounds=list(zip(lb, [None] * nv)), method="highs")
    K = np.zeros((N + 1, N + 1))
    for (i, j), t in var.items(): K[i, j] = K[j, i] = res.x[t]
    return res.fun, K, time.time() - t0

if __name__ == "__main__":
    box = float(sys.argv[1])
    for inv in [int(a) for a in sys.argv[2:]]:
        h = 1.0 / inv
        val, K, dt = solve(h, box)
        N = K.shape[0] - 1
        supp_ax = max(i for i in range(N + 1) if K[i, 0] > 1e-9) * h
        print(f"h=1/{inv}: bound={val:.6f}  spike K(0)h^2/2={K[0,0]*h*h/2:.4f}  axis support={supp_ax:.3f}  time={dt:.1f}s", flush=True)
        np.save(f"Ksym_{inv}.npy", K)
