/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import CenteredMaximal.Cauchy.Symbol
public import CenteredMaximal.Cauchy.Delta
public import Mathlib.Analysis.Fourier.Convolution

/-!
# The semigroup property of the Cauchy densities

`cauchyDensity h ⋆ cauchyDensity s = cauchyDensity (h + s)`: the Fourier transforms multiply
(`Real.fourier_mul_convolution_eq`) to `e^{−2π h|ξ|} e^{−2π s|ξ|} = e^{−2π (h+s)|ξ|}`, the transform
of `cauchyDensity (h + s)` (`fourierIntegral_cauchyDensity`), and Fourier inversion recovers the
functions, both being continuous and integrable with integrable transforms.
-/

@[expose] public section

noncomputable section

open Filter MeasureTheory Set
open scoped FourierTransform Topology Convolution

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

/-- **The Cauchy semigroup in one dimension.** -/
theorem integral_cauchyDensity_mul_sub {h s : ℝ} (hh : 0 < h) (hs : 0 < s) (x : ℝ) :
    ∫ y, cauchyDensity h y * cauchyDensity s (x - y) = cauchyDensity (h + s) x := by
  set f : ℝ → ℂ := fun y => (cauchyDensity h y : ℂ) with hfdef
  set g : ℝ → ℂ := fun y => (cauchyDensity s y : ℂ) with hgdef
  set k : ℝ → ℂ := fun y => (cauchyDensity (h + s) y : ℂ) with hkdef
  have hhs : 0 < h + s := add_pos hh hs
  have hfi : Integrable f := (integrable_cauchyDensity hh).ofReal
  have hgi : Integrable g := (integrable_cauchyDensity hs).ofReal
  have hki : Integrable k := (integrable_cauchyDensity hhs).ofReal
  set F : ℝ → ℂ := f ⋆[ContinuousLinearMap.mul ℂ ℂ, volume] g with hFdef
  -- the Fourier transforms agree
  have hFT : 𝓕 F = 𝓕 k := by
    funext ξ
    rw [hFdef, Real.fourier_mul_convolution_eq hfi hgi ξ, hfdef, hgdef, hkdef,
      fourierIntegral_cauchyDensity hh, fourierIntegral_cauchyDensity hs,
      fourierIntegral_cauchyDensity hhs, ← Complex.ofReal_mul, ← Real.exp_add]
    congr 2
    ring
  have hkFTi : Integrable (𝓕 k) := by
    have : 𝓕 k = fun ξ : ℝ => ((Real.exp (-(2 * Real.pi * (h + s) * |ξ|)) : ℝ) : ℂ) :=
      funext fun ξ => fourierIntegral_cauchyDensity hhs ξ
    rw [this]
    exact (integrable_exp_neg_mul_abs (by positivity)).ofReal
  have hkc : Continuous k := by
    have := continuous_cauchyDensity hhs
    fun_prop
  have hgc : Continuous g := by
    have := continuous_cauchyDensity hs
    fun_prop
  have hgb : BddAbove (range fun y => ‖g y‖) := by
    refine ⟨1 / (Real.pi * s), ?_⟩
    rintro _ ⟨y, rfl⟩
    simp only [hgdef, Complex.norm_real, Real.norm_eq_abs,
      abs_of_nonneg (cauchyDensity_nonneg hs.le y)]
    exact cauchyDensity_le hs y
  have hFc : Continuous F := hgb.continuous_convolution_right_of_integrable _ hfi hgc
  have hFi : Integrable F := hfi.integrable_convolution _ hgi
  have hFeq : F = k := by
    rw [← hFc.fourierInv_fourier_eq hFi (by rw [hFT]; exact hkFTi), hFT,
      hkc.fourierInv_fourier_eq hki hkFTi]
  have hx := congrFun hFeq x
  rw [hFdef, convolution_mul] at hx
  have hc : (∫ t, f t * g (x - t)) = ((∫ t, cauchyDensity h t * cauchyDensity s (x - t) : ℝ) : ℂ) := by
    rw [← integral_complex_ofReal]
    congr 1
    funext t
    simp [hfdef, hgdef]
  rw [hc, hkdef] at hx
  simp only at hx
  exact_mod_cast hx

end CenteredMaximal.General

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

/-- **The semigroup property of the plane densities**: `p_h ⋆ p_s = p_{h+s}`. -/
theorem integral_heatKernel_mul_sub {h s : ℝ} (hh : 0 < h) (hs : 0 < s) (x : Fin 2 → ℝ) :
    ∫ z, heatKernel h z * heatKernel s (x - z) = heatKernel (h + s) x := by
  have hsplit : (∫ z : Fin 2 → ℝ, heatKernel h z * heatKernel s (x - z))
      = ∫ p : ℝ × ℝ, (cauchyDensity h p.1 * cauchyDensity s (x 0 - p.1))
          * (cauchyDensity h p.2 * cauchyDensity s (x 1 - p.2)) := by
    rw [← (volume_preserving_finTwoArrow ℝ).map_eq, integral_map_equiv]
    refine integral_congr_ae (Filter.Eventually.of_forall fun p => ?_)
    simp only [heatKernel, Pi.sub_apply]
    simp [MeasurableEquiv.finTwoArrow]
    ring
  rw [hsplit, Measure.volume_eq_prod,
    integral_prod_mul (f := fun a => cauchyDensity h a * cauchyDensity s (x 0 - a))
      (g := fun b => cauchyDensity h b * cauchyDensity s (x 1 - b)),
    integral_cauchyDensity_mul_sub hh hs, integral_cauchyDensity_mul_sub hh hs]
  rfl

end CenteredMaximal.General
