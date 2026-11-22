"""Same as square_lp3 but with POINT charges at the square centers (mass = area): psi has -inf holes."""
import sys, numpy as np
import square_lp3 as S3
def pphi(U, V, orb):
    out = 0.0
    for (x0, x1, y0, y1) in orb:
        A = (x1 - x0) * (y1 - y0)
        out = out + A / (np.abs(U - (x0 + x1) / 2) + np.abs(V - (y0 + y1) / 2))
    return out
S3.ophi = pphi
if __name__ == "__main__":
    levels = [tuple(map(float, l.split(":"))) for l in sys.argv[1].split(",")]
    RQ, RF = float(sys.argv[2]), float(sys.argv[3])
    a, c, act = S3.solve(levels, RQ, RF)
    I, pm = S3.estimate(a, c, act, RF)
    print(f"  POINT estimate: int psi_+ = {I:.5f}, min psi on D = {pm:.5f} => c2 <~ {I/(2*pm):.5f}", flush=True)
    np.savez(sys.argv[4], a=a, c=c, pts=np.array([((x0+x1)/2,(y0+y1)/2) for o,_ in act for (x0,x1,y0,y1) in o]),
             b=np.array([w*(x1-x0)*(y1-y0) for o,w in act for (x0,x1,y0,y1) in o]), RF=RF)
