/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertLeaf
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
public import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

/-!
# Exact integrals of the bounding polynomials over cells

`polyFn e (r, s) = e₀ + e₁ r + e₂ r² + e₃ r² s` integrates over `(r₀, r₁] × (s₀, s₁]` to `polyVal`,
and a nonnegative function bounded by it almost everywhere has lower integral at most `polyVal`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

/-- The bounding polynomial `e₀ + e₁ r + e₂ r² + e₃ r² s`. -/
def polyFn (e0 e1 e2 e3 : ℚ) (x : ℝ × ℝ) : ℝ :=
  e0 + e1 * x.1 + e2 * x.1 ^ 2 + e3 * (x.1 ^ 2 * x.2)

/-- Its exact integral over the cell `(r₀, r₁] × (s₀, s₁]`. -/
def polyVal (r0 r1 s0 s1 e0 e1 e2 e3 : ℚ) : ℚ :=
  (s1 - s0) * (e0 * (r1 - r0) + e1 * ((r1 ^ 2 - r0 ^ 2) / 2) + e2 * ((r1 ^ 3 - r0 ^ 3) / 3))
    + e3 * ((r1 ^ 3 - r0 ^ 3) / 3) * ((s1 ^ 2 - s0 ^ 2) / 2)

theorem integral_Ioc_pow {a b : ℝ} (hab : a ≤ b) (n : ℕ) :
    ∫ x in Ioc a b, x ^ n = (b ^ (n + 1) - a ^ (n + 1)) / (n + 1) := by
  rw [← intervalIntegral.integral_of_le hab, integral_pow]

theorem cell_finite (r0 r1 s0 s1 : ℝ) :
    ((volume : Measure ℝ).prod volume) (Ioc r0 r1 ×ˢ Ioc s0 s1) ≠ ⊤ := by
  rw [Measure.prod_prod]
  exact ENNReal.mul_ne_top measure_Ioc_lt_top.ne measure_Ioc_lt_top.ne

theorem integrableOn_monomial (r0 r1 s0 s1 : ℝ) (i j : ℕ) :
    IntegrableOn (fun x : ℝ × ℝ => x.1 ^ i * x.2 ^ j) (Ioc r0 r1 ×ˢ Ioc s0 s1)
      ((volume : Measure ℝ).prod volume) := by
  have hc : Continuous (fun x : ℝ × ℝ => x.1 ^ i * x.2 ^ j) := by fun_prop
  refine (hc.continuousOn.integrableOn_compact
    ((isCompact_Icc (a := r0) (b := r1)).prod (isCompact_Icc (a := s0) (b := s1)))).mono_set ?_
  exact prod_mono Ioc_subset_Icc_self Ioc_subset_Icc_self

theorem integral_monomial {r0 r1 s0 s1 : ℝ} (hr : r0 ≤ r1) (hs : s0 ≤ s1) (i j : ℕ) :
    ∫ x in Ioc r0 r1 ×ˢ Ioc s0 s1, x.1 ^ i * x.2 ^ j ∂((volume : Measure ℝ).prod volume)
      = ((r1 ^ (i + 1) - r0 ^ (i + 1)) / (i + 1)) * ((s1 ^ (j + 1) - s0 ^ (j + 1)) / (j + 1)) := by
  rw [setIntegral_prod_mul (fun r : ℝ => r ^ i) (fun s : ℝ => s ^ j),
    integral_Ioc_pow hr, integral_Ioc_pow hs]

/-- **The integral of the bounding polynomial.** -/
theorem integral_polyFn {r0 r1 s0 s1 : ℚ} (hr : r0 ≤ r1) (hs : s0 ≤ s1) (e0 e1 e2 e3 : ℚ) :
    ∫ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, polyFn e0 e1 e2 e3 x
        ∂((volume : Measure ℝ).prod volume)
      = ((polyVal r0 r1 s0 s1 e0 e1 e2 e3 : ℚ) : ℝ) := by
  have hr' : (r0 : ℝ) ≤ r1 := by exact_mod_cast hr
  have hs' : (s0 : ℝ) ≤ s1 := by exact_mod_cast hs
  have h00 := integral_monomial hr' hs' 0 0
  have h10 := integral_monomial hr' hs' 1 0
  have h20 := integral_monomial hr' hs' 2 0
  have h21 := integral_monomial hr' hs' 2 1
  have i00 := integrableOn_monomial (r0 : ℝ) r1 s0 s1 0 0
  have i10 := integrableOn_monomial (r0 : ℝ) r1 s0 s1 1 0
  have i20 := integrableOn_monomial (r0 : ℝ) r1 s0 s1 2 0
  have i21 := integrableOn_monomial (r0 : ℝ) r1 s0 s1 2 1
  have hfun : (fun x : ℝ × ℝ => polyFn e0 e1 e2 e3 x) = fun x =>
      (e0 : ℝ) * (x.1 ^ 0 * x.2 ^ 0) + (e1 : ℝ) * (x.1 ^ 1 * x.2 ^ 0)
        + (e2 : ℝ) * (x.1 ^ 2 * x.2 ^ 0) + (e3 : ℝ) * (x.1 ^ 2 * x.2 ^ 1) := by
    funext x
    simp only [polyFn, pow_zero, pow_one, mul_one]
  set μc := ((volume : Measure ℝ).prod volume).restrict (Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1)
  have j00 : Integrable (fun x : ℝ × ℝ => (e0 : ℝ) * (x.1 ^ 0 * x.2 ^ 0)) μc := i00.const_mul _
  have j10 : Integrable (fun x : ℝ × ℝ => (e1 : ℝ) * (x.1 ^ 1 * x.2 ^ 0)) μc := i10.const_mul _
  have j20 : Integrable (fun x : ℝ × ℝ => (e2 : ℝ) * (x.1 ^ 2 * x.2 ^ 0)) μc := i20.const_mul _
  have j21 : Integrable (fun x : ℝ × ℝ => (e3 : ℝ) * (x.1 ^ 2 * x.2 ^ 1)) μc := i21.const_mul _
  have ja : Integrable (fun x : ℝ × ℝ => (e0 : ℝ) * (x.1 ^ 0 * x.2 ^ 0)
      + (e1 : ℝ) * (x.1 ^ 1 * x.2 ^ 0)) μc := j00.add j10
  have jb : Integrable (fun x : ℝ × ℝ => (e0 : ℝ) * (x.1 ^ 0 * x.2 ^ 0)
      + (e1 : ℝ) * (x.1 ^ 1 * x.2 ^ 0) + (e2 : ℝ) * (x.1 ^ 2 * x.2 ^ 0)) μc := ja.add j20
  rw [hfun, integral_add jb j21, integral_add ja j20, integral_add j00 j10,
    integral_const_mul, integral_const_mul, integral_const_mul, integral_const_mul,
    h00, h10, h20, h21]
  unfold polyVal
  push_cast
  ring

/-- **Leaf bound.** A nonnegative function bounded a.e. on the cell by the polynomial has lower
integral at most `polyVal`. -/
theorem lintegral_le_polyVal {r0 r1 s0 s1 : ℚ} (hr : r0 ≤ r1) (hs : s0 ≤ s1)
    {e0 e1 e2 e3 : ℚ} {f : ℝ × ℝ → ℝ} (hf0 : ∀ x, 0 ≤ f x)
    (hle : ∀ᵐ x ∂(((volume : Measure ℝ).prod volume).restrict (Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1)),
      f x ≤ polyFn e0 e1 e2 e3 x) :
    ∫⁻ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, ENNReal.ofReal (f x)
        ∂((volume : Measure ℝ).prod volume)
      ≤ ENNReal.ofReal ((polyVal r0 r1 s0 s1 e0 e1 e2 e3 : ℚ) : ℝ) := by
  have hint : IntegrableOn (polyFn e0 e1 e2 e3) (Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1)
      ((volume : Measure ℝ).prod volume) := by
    have hc : Continuous (polyFn e0 e1 e2 e3) := by unfold polyFn; fun_prop
    refine (hc.continuousOn.integrableOn_compact
      ((isCompact_Icc (a := (r0 : ℝ)) (b := r1)).prod
        (isCompact_Icc (a := (s0 : ℝ)) (b := s1)))).mono_set ?_
    exact prod_mono Ioc_subset_Icc_self Ioc_subset_Icc_self
  have hnn : 0 ≤ᵐ[((volume : Measure ℝ).prod volume).restrict (Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1)]
      polyFn e0 e1 e2 e3 := by
    filter_upwards [hle] with x hx
    exact (hf0 x).trans hx
  calc ∫⁻ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, ENNReal.ofReal (f x)
        ∂((volume : Measure ℝ).prod volume)
      ≤ ∫⁻ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, ENNReal.ofReal (polyFn e0 e1 e2 e3 x)
          ∂((volume : Measure ℝ).prod volume) := by
        refine lintegral_mono_ae ?_
        filter_upwards [hle] with x hx
        exact ENNReal.ofReal_le_ofReal hx
    _ = ENNReal.ofReal (∫ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, polyFn e0 e1 e2 e3 x
          ∂((volume : Measure ℝ).prod volume)) :=
        (ofReal_integral_eq_lintegral_ofReal hint hnn).symm
    _ = _ := by rw [integral_polyFn hr hs]

end CenteredMaximal.General
