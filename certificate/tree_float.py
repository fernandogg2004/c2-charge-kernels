"""Float-guided V2 tree for the Lean checker. Usage: python tree_float.py pts.npz tol out.json"""
import sys, math, json, time, numpy as np
import exp_bound as E
fn, tol, out = sys.argv[1], float(sys.argv[2]), sys.argv[3]
K = E.load(fn); R = 2 ** math.ceil(math.log2(K[0] / K[1])); t = time.time()
bits, tot = E.build_tol(K, R, tol)
print(f"{fn} tol={tol} leaves={bits.count(0)} int psi_+ <~ {4*tot:.5f} => c2 <~ {4*tot/2/1.003:.5f} ({time.time()-t:.0f}s)", flush=True)
json.dump({"R": R, "v2": "".join(map(str, bits)), "total_float": 4 * tot}, open(out, "w"))
