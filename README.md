# Charge kernels and a kernel-checked bound c₂ ≤ 3.7265

**Author:** Fernando ([@fernandogg2004](https://github.com/fernandogg2004))

Let c₂ be the weak type (1,1) constant of the centred Hardy–Littlewood maximal operator over
axis-parallel squares in the plane: the least C with α·|{Mf > α}| ≤ C‖f‖₁ for all f ∈ L¹(ℝ²) and α > 0.
This repository proves

$$c_2 \le \frac{7453}{2000} = 3.7265$$

in **Lean 4 + Mathlib, checked by Lean's kernel alone**.

[![CI](https://github.com/fernandogg2004/c2-charge-kernels/actions/workflows/ci.yml/badge.svg)](https://github.com/fernandogg2004/c2-charge-kernels/actions/workflows/ci.yml) The proof uses only the standard axioms
(`propext`, `Classical.choice`, `Quot.sound`). It does not use `native_decide`: every number in the
certificate is recomputed by the kernel.

📄 **Paper:** [`paper/paper.pdf`](paper/paper.pdf) (source: [`paper/paper.tex`](paper/paper.tex))

## Where this stands

| bound on c₂ | source | how it is established |
|---|---|---|
| ≥ 1.7027 | Tomar (2026) | Lean |
| ≥ 1.6855 | Lin (2026) | Lean |
| ≤ 3.59123 | Tomar (2026, [repository](https://github.com/tejasvi/square-maximal-weak-type)) | interval arithmetic, and Lean, kernel only (as stated by the author) |
| < 3.616 | Lin, [article](https://coolrmal.github.io/articles/two-partial-balayage-principles/) | computer-assisted; a Lean version existed in an earlier commit of Lin's `partial-balayage-lean`, later removed from its scope |
| **≤ 3.7265** | **this repository** | **Lean, kernel only** |
| ≤ 3.879 | Lin (2026) | Lean |
| ≤ 4 | covering argument | classical |

3.7265 is **neither the best known upper bound nor the best Lean-verified one**: Tomar's
c₂ ≤ 3.59123 is also proved in Lean with kernel-only checks. Both better bounds use fractional
generators of order between 1 and 2, whereas this work uses the Cauchy generator (order 1). For that
generator, a discretized optimization over all kernels gives about 3.64. That is numerical evidence
about a discretization, not a proved limit of the method. What this repository offers instead:
- a different and self-contained construction (charge kernels, whose admissibility is automatic);
- a technique for kernel-checked certificates: an exact natural-number refinement of a rational
  certificate checker, with a proof that it computes exactly the same values.

## The idea in one paragraph

Lin's comparison principle gives c₂ ≤ ½∫K for any kernel K ≥ 0 that is even, integrable, compactly
supported, at least 1 on the unit diamond {|u|+|v| ≤ 1}, and satisfies AK + aδ₀ ≥ 0, where A is the
Cauchy generator. Since A(1/(|u|+|v|)) = −4π²δ₀ (so 1/(|u|+|v|) is a fundamental solution of A up
to a constant), the **charge kernels**

  ψ = a/(|u|+|v|) − Σⱼ bⱼ/(|u−pⱼ|+|v−qⱼ|) − c,   K = ψ₊/m

satisfy the generator condition automatically, by Kato's inequality. That leaves two explicit
inequalities to check: ψ ≥ m on the diamond, and an upper bound on ∫ψ₊. An 820-charge kernel found
by linear programming is certified with exact quadtrees: 1,540 cells for the diamond check and
631,342 cells for the integral. To make the kernel check feasible, the certificate is evaluated by a
natural-number checker that is **proved to compute exactly the same values** as the rational checker.

## What is proved

Main theorem (`lean/ChargeKernel/Pt900/Final.lean`):

```lean
theorem ChargeKernel.Pt900.weakTypeConstant_two_le :
    CenteredMaximal.weakTypeConstant 2 ≤ ENNReal.ofReal (7453 / 2000)
```

`CenteredMaximal.weakTypeConstant` is Yongxi Lin's definition (`CenteredMaximal/Statement.lean` in
the dependency). It takes the supremum of averages over `closedBall x r` in `Fin 2 → ℝ`, which carries
the sup norm, so those balls are exactly the closed squares. The constant is the infimum of all weak
type (1,1) bounds.

The proof covers everything:
- the comparison principle;
- Kato's inequality, via the Cauchy heat semigroup;
- diamond-polar coordinates;
- the soundness of the certificate checker;
- the exactness of the natural-number checker;
- the evaluation of the certificate itself.

## Repository layout

```
paper/                  the paper (LaTeX source and PDF)
lean/                   Lean 4 project (depends on Lin's repository, pinned commit)
  ChargeKernel/         the development
    Comparison*, Transfer, AENonneg        comparison principle for general kernels
    ChargeKernel, ChargeKato, Excessive,
    HeatCalculus, CauchySemigroup, Main    charge kernels and Kato's inequality
    DiamondPolar                           diamond-polar change of variables
    CertBasic … CertSym, CertBridge*       rational certificate checker and its soundness
    CertNat, CertNatSound                  natural-number checker and its exactness proof
    Pt900/                                 generated: data, 310 shard modules, assembly, main theorem
  build.sh              full build (memory-bounded), prints the axioms of the main theorem
certificate/            how the certificate was produced, and independent checkers
  lp/                   linear programs for the kernel (point_lp3.py) and the method's limit (kernel_lp_sym.py)
  pt900.npz             the 820-charge kernel (floating point, LP output)
  pt900d_cert.json      the exact certificate: dyadic data and both quadtrees
  cert_exact.py, tree_float.py, exp_bound.py, merge_tree.py    certificate construction
  checker_rational.py   exact rational re-implementation of the Lean checker (independent check)
  checker_nat.py        Python version of the natural-number checker
  export_lean.py        generates lean/ChargeKernel/Pt900/ from the certificate
```

## Reproducing

### Lean proof

You need Linux, macOS or WSL, [elan](https://github.com/leanprover/elan), about 15 GB of disk, and
time. The kernel checks of the 310 shard modules take about **20 CPU-hours**. Each module needs 1–2 GB
of RAM, so `build.sh` runs them as a bounded queue (`P` at a time) instead of letting `lake` start one
per CPU thread.

```sh
cd lean
./build.sh 4      # 4 shards in parallel (allow ~2 GB RAM each); ends by printing the axioms
```

The expected final output:

```
'ChargeKernel.Pt900.weakTypeConstant_two_le' depends on axioms: [propext, Classical.choice, Quot.sound]
```

**Clean build, verified by the author only:** a fresh clone was built from scratch with
`./build.sh 4` on Ubuntu 26.04 (WSL 2, 20 threads, 8 GB RAM) in 5 h 25 min of wall time (about 20.6
CPU-hours). All 3,579 build jobs succeeded, and the final output was the axioms line above. A summary
of the output (its final 40 lines, with timings) is in
[`logs/clean-build-linux.log`](logs/clean-build-linux.log); the full per-module logs were not kept.
That build was of commit `416f743`, not of the current HEAD. Since then only the paper, the
documentation, the CI workflow and Lean docstrings (comments) have changed; no Lean definition or
proof has. The lockfile `lean/lake-manifest.json` was added afterwards: it is the file that this
build's `lake update` produced, copied from it. This build has **not yet been reproduced
independently**; reports of independent builds are welcome.

### Continuous integration

A full build does not fit a free CI runner, so the [CI workflow](.github/workflows/ci.yml) is
lightweight. On every push it:
- builds all the proof infrastructure, including the comparison principle, Kato's inequality, the
  checker soundness and the exactness of the natural-number checker;
- checks a sample of the certificate shards and the diamond-check module with the kernel;
- prints the axioms of the main soundness theorems;
- scans the sources for `sorry`, `native_decide` and other escapes;
- runs `checker_nat.py` on random leaves.

It does not build the 310 shards or the main theorem.

### Independent checks (Python 3, `numpy`)

```sh
cd certificate
python checker_nat.py pt900d_cert.json 300     # natural-number vs rational leaf values on random leaves
python checker_rational.py pt900d_cert.json    # full exact recheck of the certificate (~1 h on 18 cores)
```

`checker_rational.py` evaluates the certificate in exact rational arithmetic without Lean. It prints the
quadrant value 1.8688227601… (exactly `V/(6·2^105)` with `V` in `lean/ChargeKernel/Pt900/value.txt`)
and the bound c₂ ≤ 3.726466.

### Regenerating the certificate

You also need `scipy` for this. The LP output can differ slightly between SciPy versions; the
certificate in `pt900d_cert.json` is the one the proof uses.

```sh
cd certificate/lp && python point_lp3.py "0.1:1:2.6,0.5:2.6:6" 20 40 ../pt900.npz && cd ..
python cert_exact.py pt900.npz 1e-5                 # dyadic data + diamond tree -> pt900_cert.json
python tree_float.py pt900.npz 1e-7 pt900_tree.json # float-guided integral tree (631,342 leaves)
python merge_tree.py pt900_cert.json pt900_tree.json pt900d_cert.json
python export_lean.py pt900d_cert.json ../lean/ChargeKernel Pt900 7453/2000
```

## Credits

- **Fernando**: author of this work (charge kernels, certificates, formalization, paper).
- **Yongxi Lin**: this work builds on his Lean formalization
  [CoolRmal/centered-maximal-constant](https://github.com/CoolRmal/centered-maximal-constant)
  (Apache 2.0). It provides the definition of c₂, the Cauchy generator and its potential, and the
  comparison argument, and is used here as a Lake dependency at commit `72c022b`.
- The research, the Lean development and the paper were produced with the assistance of Claude
  (Anthropic), under the author's direction.

Related work: Tomar, [square-maximal-weak-type](https://github.com/tejasvi/square-maximal-weak-type)
(doi:10.5281/zenodo.23716077); Lin, [Two partial balayage principles](https://coolrmal.github.io/articles/two-partial-balayage-principles/)
and [partial-balayage-lean](https://github.com/CoolRmal/partial-balayage-lean); Tao et al., [optimization constants, entry 47a](https://teorth.github.io/optimizationproblems/constants/47a.html).

## License

Apache License 2.0, see [LICENSE](LICENSE).
