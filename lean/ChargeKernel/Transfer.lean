/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import CenteredMaximal.Transfer.Commutation
public import ChargeKernel.AENonneg

/-!
# The transfer step under a positivity hypothesis

Lin's `convolution_le_of_eq_zero` assumes the generator identity `∫ K · Aψ = ∫ ψ dβ − a ψ(0)` with a
finite positive measure `β`. Here only its consequence for nonnegative test functions is assumed:

`hKpos : ∀ ψ test, ψ ≥ 0 → −a ψ(0) ≤ ∫ K · Aψ`,

i.e. `A K + a δ₀ ≥ 0` in the sense of distributions. This is exactly the form delivered by Kato's
inequality, and it suffices: the transfer identity becomes the inequality
`∫ (K ⋆ f) w ≤ ∫ (K ⋆ σ) w + a ∫ u w` for nonnegative test functions `w`, and
`ae_nonneg_of_integral_contDiff_nonneg` turns it into a pointwise bound.
-/

@[expose] public section

noncomputable section

open MeasureTheory Metric Set
open scoped ENNReal ContDiff

namespace CenteredMaximal.General

variable {K u σ f : (Fin 2 → ℝ) → ℝ} {κ a : ℝ}

/-- The generator of `K ⋆ φ` at `x` is the pairing of `K` with the generator of a translate of `φ`
(for even `K`). -/
theorem jumpGen_conv_eq (hKint : Integrable K) (hKeven : ∀ z, K (-z) = K z)
    {φ : (Fin 2 → ℝ) → ℝ} (hφ : IsTestFunction φ) (x : Fin 2 → ℝ) :
    jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x = ∫ y, K y * jumpGen 1 (fun z => φ (z + x)) y := by
  rw [jumpGen_convolution one_pos (by norm_num) hKint hφ]
  calc (∫ y, K y * jumpGen 1 φ (x - y))
      = ∫ y, K (-y) * jumpGen 1 φ (-y + x) :=
        integral_congr_ae (Filter.Eventually.of_forall fun y => by
          dsimp only
          rw [hKeven, show -y + x = x - y from by abel])
    _ = ∫ y, K y * jumpGen 1 φ (y + x) :=
        integral_neg_eq_self (fun y => K y * jumpGen 1 φ (y + x)) volume
    _ = ∫ y, K y * jumpGen 1 (fun z => φ (z + x)) y :=
        integral_congr_ae (Filter.Eventually.of_forall fun y => by
          dsimp only
          rw [jumpGen_comp_add_right])

/-- **The transfer inequality.** Against a nonnegative test function `φ`,
`∫ (K ⋆ f) φ ≤ ∫ (K ⋆ σ) φ + a ∫ u φ`. -/
theorem convolution_source_le (hK₀ : ∀ z, 0 ≤ K z) (hKint : Integrable K)
    (hKeven : ∀ z, K (-z) = K z) (hKsupp : HasCompactSupport K) (huint : Integrable u)
    (hu₀ : ∀ x, 0 ≤ u x) (hσint : Integrable σ) (hfint : Integrable f)
    (hu : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ →
      (∫ x, u x * jumpGen 1 ψ x) = ∫ x, (σ x - f x) * ψ x)
    (hKpos : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ → (∀ z, 0 ≤ ψ z) →
      -(a * ψ 0) ≤ ∫ x, K x * jumpGen 1 ψ x)
    {φ : (Fin 2 → ℝ) → ℝ} (hφ : IsTestFunction φ) (hφ₀ : ∀ z, 0 ≤ φ z) :
    (∫ x, (∫ y, K y * f (x - y)) * φ x)
      ≤ (∫ x, (∫ y, K y * σ (x - y)) * φ x) + a * ∫ x, u x * φ x := by
  have _ := hK₀
  obtain ⟨C, hC⟩ := hφ.continuous.bounded_above_of_compact_support hφ.2
  have hψ : IsTestFunction fun z : Fin 2 → ℝ => ∫ y, K y * φ (z - y) :=
    isTestFunction_convolution hKint hKsupp hφ
  obtain ⟨D, hD⟩ := hψ.continuous.bounded_above_of_compact_support hψ.2
  obtain ⟨M₀, M₂, h₀, h₂⟩ := exists_bounds_of_hasCompactSupport hψ.contDiff_two hψ.2
  have hAψc : Continuous (jumpGen 1 fun z : Fin 2 → ℝ => ∫ y, K y * φ (z - y)) :=
    continuous_jumpGen one_pos (by norm_num) hψ.contDiff_two h₀ h₂
  have hAψb : ∀ x, ‖jumpGen 1 (fun z : Fin 2 → ℝ => ∫ y, K y * φ (z - y)) x‖
      ≤ 2 * (2 * M₂ / (2 - 1) + 8 * M₀ / 1) := fun x => by
    rw [Real.norm_eq_abs]
    exact abs_jumpGen_le one_pos (by norm_num) hψ.contDiff_two h₀ h₂ x
  -- the integrand `u · (A(K ⋆ φ) + a φ)` is pointwise nonnegative
  have hL : ∀ x, 0 ≤ u x * (jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x + a * φ x) := by
    intro x
    refine mul_nonneg (hu₀ x) ?_
    rw [jumpGen_conv_eq hKint hKeven hφ x]
    have h := hKpos (fun z => φ (z + x)) (hφ.comp_add_right x) (fun z => hφ₀ _)
    rw [zero_add] at h
    linarith
  have hI₁ : Integrable fun x => u x * jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x :=
    huint.mul_bdd hAψc.aestronglyMeasurable (Filter.Eventually.of_forall hAψb)
  have hI₂ : Integrable fun x => u x * φ x :=
    huint.mul_bdd hφ.continuous.aestronglyMeasurable (Filter.Eventually.of_forall hC)
  have hsum : 0 ≤ (∫ x, u x * jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x)
      + a * ∫ x, u x * φ x := by
    have h := integral_nonneg (μ := volume)
      (f := fun x => u x * (jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x + a * φ x))
      fun x => hL x
    rw [show (fun x => u x * (jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x + a * φ x))
        = fun x => u x * jumpGen 1 (fun z => ∫ y, K y * φ (z - y)) x + a * (u x * φ x) from
          funext fun x => by ring,
      integral_add hI₁ (hI₂.const_mul a), integral_const_mul] at h
    exact h
  have hJ₁ : Integrable fun x : Fin 2 → ℝ => σ x * ∫ y, K y * φ (x - y) :=
    hσint.mul_bdd hψ.continuous.aestronglyMeasurable (Filter.Eventually.of_forall hD)
  have hJ₂ : Integrable fun x : Fin 2 → ℝ => f x * ∫ y, K y * φ (x - y) :=
    hfint.mul_bdd hψ.continuous.aestronglyMeasurable (Filter.Eventually.of_forall hD)
  have hRHS : (∫ x, (σ x - f x) * ∫ y, K y * φ (x - y))
      = (∫ x, (∫ y, K y * σ (x - y)) * φ x) - ∫ x, (∫ y, K y * f (x - y)) * φ x := by
    calc (∫ x, (σ x - f x) * ∫ y, K y * φ (x - y))
        = ∫ x, ((σ x * ∫ y, K y * φ (x - y)) - f x * ∫ y, K y * φ (x - y)) :=
          integral_congr_ae (Filter.Eventually.of_forall fun x => by ring)
      _ = (∫ x, σ x * ∫ y, K y * φ (x - y)) - ∫ x, f x * ∫ y, K y * φ (x - y) :=
          integral_sub hJ₁ hJ₂
      _ = (∫ x, (∫ y, K y * σ (x - y)) * φ x) - ∫ x, (∫ y, K y * f (x - y)) * φ x := by
          rw [integral_mul_convolution_comm hKint hKeven hσint hφ,
            integral_mul_convolution_comm hKint hKeven hfint hφ]
  have h1 := hu _ hψ
  linarith [h1, hRHS, hsum]

/-- **The pointwise bound under the positivity hypothesis.** At almost every point where `u`
vanishes, `K ⋆ f ≤ κ ∫ K`. -/
theorem convolution_le_of_eq_zero_of_pos (hK₀ : ∀ z, 0 ≤ K z) (hKint : Integrable K)
    (hKeven : ∀ z, K (-z) = K z) (hKsupp : HasCompactSupport K) (huint : Integrable u)
    (hu₀ : ∀ x, 0 ≤ u x) (hσm : Measurable σ) (hσint : Integrable σ) (hσ₀ : ∀ x, 0 ≤ σ x)
    (hσκ : ∀ x, σ x ≤ κ) (hfint : Integrable f)
    (hu : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ →
      (∫ x, u x * jumpGen 1 ψ x) = ∫ x, (σ x - f x) * ψ x)
    (hKpos : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ → (∀ z, 0 ≤ ψ z) →
      -(a * ψ 0) ≤ ∫ x, K x * jumpGen 1 ψ x) :
    ∀ᵐ x : Fin 2 → ℝ, u x = 0 → (∫ y, K y * f (x - y)) ≤ κ * ∫ y, K y := by
  set g : (Fin 2 → ℝ) → ℝ :=
    fun x => (∫ y, K y * σ (x - y)) + a * u x - ∫ y, K y * f (x - y) with hgdef
  have hgint : Integrable g :=
    ((integrable_kernel_conv hKint hσint).add (huint.const_mul a)).sub
      (integrable_kernel_conv hKint hfint)
  have hgnn : 0 ≤ᵐ[volume] g := by
    refine ae_nonneg_of_integral_contDiff_nonneg hgint.locallyIntegrable fun w hw hwc hw₀ => ?_
    have hwt : IsTestFunction w := ⟨hw, hwc⟩
    obtain ⟨Cw, hCw⟩ := hwt.continuous.bounded_above_of_compact_support hwt.2
    have i1 : Integrable fun x : Fin 2 → ℝ => (∫ y, K y * σ (x - y)) * w x :=
      (integrable_kernel_conv hKint hσint).mul_bdd hwt.continuous.aestronglyMeasurable
        (Filter.Eventually.of_forall hCw)
    have i2 : Integrable fun x : Fin 2 → ℝ => a * (u x * w x) :=
      (huint.mul_bdd hwt.continuous.aestronglyMeasurable
        (Filter.Eventually.of_forall hCw)).const_mul a
    have i3 : Integrable fun x : Fin 2 → ℝ => (∫ y, K y * f (x - y)) * w x :=
      (integrable_kernel_conv hKint hfint).mul_bdd hwt.continuous.aestronglyMeasurable
        (Filter.Eventually.of_forall hCw)
    have hsplit : (∫ x, w x * g x)
        = (∫ x, (∫ y, K y * σ (x - y)) * w x) + a * (∫ x, u x * w x)
          - ∫ x, (∫ y, K y * f (x - y)) * w x := by
      have hfun : (fun x => w x * g x) = fun x =>
          ((∫ y, K y * σ (x - y)) * w x + a * (u x * w x)) - (∫ y, K y * f (x - y)) * w x :=
        funext fun x => by simp only [hgdef]; ring
      have i12 : Integrable fun x : Fin 2 → ℝ =>
          (∫ y, K y * σ (x - y)) * w x + a * (u x * w x) := i1.add i2
      rw [hfun, integral_sub i12 i3, integral_add i1 i2, integral_const_mul]
    have hle := convolution_source_le hK₀ hKint hKeven hKsupp huint hu₀ hσint hfint hu hKpos
      hwt hw₀
    rw [hsplit]
    linarith
  filter_upwards [hgnn] with x hx hux
  have h1 : (∫ y, K y * σ (x - y)) ≤ κ * ∫ y, K y := by
    have hi1 : Integrable fun y : Fin 2 → ℝ => K y * σ (x - y) :=
      hKint.mul_bdd ((hσm.comp (measurable_const.sub measurable_id)).aestronglyMeasurable)
        (Filter.Eventually.of_forall fun y => by
          rw [Real.norm_eq_abs, abs_of_nonneg (hσ₀ _)]
          exact hσκ _)
    calc (∫ y, K y * σ (x - y)) ≤ ∫ y, K y * κ :=
          integral_mono hi1 (hKint.mul_const κ) fun y =>
            mul_le_mul_of_nonneg_left (hσκ _) (hK₀ y)
      _ = κ * ∫ y, K y := by rw [integral_mul_const]; ring
  have hx' : 0 ≤ (∫ y, K y * σ (x - y)) + a * u x - ∫ y, K y * f (x - y) := hx
  rw [hux, mul_zero, add_zero] at hx'
  linarith

end CenteredMaximal.General
