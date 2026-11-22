"""Merge a float-guided V2 tree into an exact certificate JSON (a, c, m, ch, v1 kept).
The quadrant value is re-evaluated in floats on the dyadic charges; total = 4*(value + margin).
Lean's v2bnd then checks the exact rational value against this bound.
Usage: python merge_tree.py cert.json tree.json out.json [margin]"""
import sys, json, numpy as np
from fractions import Fraction as Fr
import exp_bound as E
cert, tree, out = sys.argv[1:4]; margin = float(sys.argv[4]) if len(sys.argv) > 4 else 2e-5
d = json.load(open(cert)); t = json.load(open(tree))
ch = np.array([[float(Fr(x)) for x in c] for c in d["ch"]])
K = (float(Fr(d["a"])), float(Fr(d["c"])), ch[:, 0], ch[:, 1], ch[:, 2])
bits = t["v2"]; pos = 0; tot = 0.0
st = [(0.0, float(t["R"]), 0.0, 1.0)]
while st:
    r0, r1, s0, s1 = st.pop(); b = bits[pos]; pos += 1
    if b == "0": tot += E.leaf(K, r0, r1, s0, s1, "tan"); continue
    rm, sm = (r0 + r1) / 2, (s0 + s1) / 2
    st.extend([(rm, r1, sm, s1), (r0, rm, sm, s1), (rm, r1, s0, sm), (r0, rm, s0, sm)])
assert pos == len(bits) and int(d["R"]) == int(t["R"])
Q = tot + margin
print(f"leaves {bits.count('0')}  quadrant {tot:.6f}  => c2 <= {4*Q/(2*float(Fr(d['m']))):.5f}")
d["v2"] = [bits]; d["total"] = str(Fr(4 * Q).limit_denominator(1 << 40))
json.dump(d, open(out, "w"))
