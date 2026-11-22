/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import CenteredMaximal.Cauchy.Assembly

/-!
# The comparison principle for an arbitrary kernel

`CenteredMaximal.Cauchy.Assembly` proves `c₂ ≤ ½ ∫ K` for one specific comparison kernel. The
argument only uses the following properties of the kernel `K`:

* `K ≥ 0`, `K` is even, integrable, and has compact support;
* `K ≥ 1` on the closed unit diamond `{|u| + |v| ≤ 1}`;
* the generator identity `∫ K · A ψ = ∫ ψ dβ − a ψ(0)` for every test function `ψ`, with `β` a
  finite (positive) measure and `a ≥ 0`, where `A = jumpGen 1`.

This file states and proves the comparison principle in that generality:

`weakTypeConstant_two_le_half_integral : weakTypeConstant 2 ≤ ofReal ((∫ K) / 2)`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Metric Set
open scoped ENNReal

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

variable {K : (Fin 2 → ℝ) → ℝ}

/-- Dilations of an even kernel are even. -/
theorem dilate_neg_of_even (hKeven : ∀ z, K (-z) = K z) (s : ℝ) (x : Fin 2 → ℝ) :
    dilate K s (-x) = dilate K s x := by
  rw [dilate, dilate, smul_neg, hKeven]

/-- Dilations of a compactly supported kernel are compactly supported. -/
theorem hasCompactSupport_dilate (hKsupp : HasCompactSupport K) {s : ℝ} (hs : 0 < s) :
    HasCompactSupport (dilate K s) := by
  have h : HasCompactSupport fun x : Fin 2 → ℝ => K (s⁻¹ • x) :=
    hKsupp.comp_smul (inv_ne_zero hs.ne')
  exact h.mul_left

/-- A kernel that is at least `1` on the unit diamond has positive mass. -/
theorem integral_pos_of_one_le (hK₀ : ∀ z, 0 ≤ K z) (hKint : Integrable K)
    (hK₁ : ∀ z, diamondNorm z ≤ 1 → 1 ≤ K z) : 0 < ∫ z, K z := by
  rw [integral_pos_iff_support_of_nonneg (fun z => hK₀ z) hKint]
  have hsub : ball (0 : Fin 2 → ℝ) (1 / 2) ⊆ Function.support K := by
    intro z hz
    have hz' : ‖z‖ < 1 / 2 := mem_ball_zero_iff.1 hz
    have hd : diamondNorm z ≤ 1 := by
      have h0 : |z 0| ≤ ‖z‖ := by simpa using norm_le_pi_norm z 0
      have h1 : |z 1| ≤ ‖z‖ := by simpa using norm_le_pi_norm z 1
      simp only [diamondNorm]
      linarith
    exact (lt_of_lt_of_le one_pos (hK₁ z hd)).ne'
  exact lt_of_lt_of_le (measure_ball_pos volume _ (by norm_num)) (measure_mono hsub)

/-- **The pointwise step for an arbitrary kernel** (the argument of
`Cauchy.exists_exceptional_set`). -/
theorem exists_exceptional_set_general (hK₀ : ∀ z, 0 ≤ K z) (hKint : Integrable K)
    (hKeven : ∀ z, K (-z) = K z) (hKsupp : HasCompactSupport K) (hKpos : 0 < ∫ z, K z)
    (β : Measure (Fin 2 → ℝ)) [IsFiniteMeasure β] {a : ℝ} (ha : 0 ≤ a)
    (hgen : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ →
      ∫ x, K x * jumpGen 1 ψ x = (∫ x, ψ x ∂β) - a * ψ 0)
    (f : (Fin 2 → ℝ) → ℝ) (Mf b : ℝ) (hfm : Measurable f) (hf₀ : ∀ x, 0 ≤ f x)
    (hfM : ∀ x, f x ≤ Mf) (hfsupp : ∀ x, b < ‖x‖ → f x = 0) (hb : 0 < b) (lam : ℝ)
    (hlam : 0 < lam) :
    ∃ Ω : Set (Fin 2 → ℝ), MeasurableSet Ω ∧
      volume Ω ≤ ENNReal.ofReal ((∫ x, K x) * (∫ x, f x) / lam) ∧
      ∀ s : ℝ, 0 < s → ∀ᵐ x, x ∉ Ω → (∫ y, dilate K s (x - y) * f y) ≤ lam := by
  obtain ⟨κ, hκdef⟩ : ∃ κ : ℝ, κ = lam / (∫ x, K x) := ⟨_, rfl⟩
  have hκ : 0 < κ := by
    rw [hκdef]
    exact div_pos hlam hKpos
  have hfint : Integrable f := by
    have hg : Integrable ((closedBall (0 : Fin 2 → ℝ) b).indicator fun _ => Mf) volume :=
      (integrableOn_const (volume_closedBall_ne_top hb.le)).integrable_indicator
        measurableSet_closedBall
    refine hg.mono' hfm.aestronglyMeasurable (ae_of_all _ fun x => ?_)
    rw [Real.norm_eq_abs, abs_of_nonneg (hf₀ x)]
    by_cases hx : x ∈ closedBall (0 : Fin 2 → ℝ) b
    · rw [indicator_of_mem hx]
      exact hfM x
    · rw [indicator_of_notMem hx, hfsupp x (by simpa [mem_closedBall, dist_eq_norm] using hx)]
  obtain ⟨u, σ, hum, hu₀ae, huint, hσm, hσ₀, hσκ, hσint, hweak, -, -, hvolu, -⟩ :=
    exists_obstacle_solution (α := 1) zero_lt_one (by norm_num) hκ hfm hf₀ hfM hb hfsupp
  obtain ⟨uPos, hupdef⟩ : ∃ v : (Fin 2 → ℝ) → ℝ, v = fun x => max (u x) 0 := ⟨_, rfl⟩
  have hupapp : ∀ x, uPos x = max (u x) 0 := fun x => by rw [hupdef]
  have hupm : Measurable uPos := by
    rw [hupdef]
    exact hum.max measurable_const
  have hup₀ : ∀ x, 0 ≤ uPos x := fun x => by
    rw [hupapp x]
    exact le_max_right _ _
  have hupeq : uPos =ᵐ[volume] u := by
    filter_upwards [hu₀ae] with x hx
    rw [hupapp x]
    exact max_eq_left hx
  have hupint : Integrable uPos := huint.congr hupeq.symm
  have hupweak : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ →
      (∫ x, uPos x * jumpGen 1 ψ x) = ∫ x, (σ x - f x) * ψ x := by
    intro ψ hψ
    have heq : (fun x => uPos x * jumpGen 1 ψ x) =ᵐ[volume] fun x => u x * jumpGen 1 ψ x := by
      filter_upwards [hupeq] with x hx
      rw [hx]
    exact (integral_congr_ae heq).trans (hweak ψ hψ)
  refine ⟨{x | 0 < uPos x}, measurableSet_lt measurable_const hupm, ?_, ?_⟩
  · have hset : {x | 0 < uPos x} = {x | 0 < u x} := by
      ext x
      simp [hupapp]
    have harith : (∫ x, f x) / κ = (∫ x, K x) * (∫ x, f x) / lam := by
      rw [hκdef, div_div_eq_mul_div]
      ring
    rw [hset]
    exact hvolu.trans (le_of_eq (by rw [harith]))
  · intro s hs
    obtain ⟨β', hβ'fin, a', -, hgen'⟩ := exists_gen_dilate hKint ha hgen hs
    haveI : IsFiniteMeasure β' := hβ'fin
    have hkey := convolution_le_of_eq_zero (α := 1) zero_lt_one (by norm_num)
      (fun z => dilate_nonneg (fun w => hK₀ w) hs z)
      (integrable_dilate hKint hs) (dilate_neg_of_even hKeven s)
      (hasCompactSupport_dilate hKsupp hs) hupm hupint hup₀ hσm hσint hσ₀ hσκ hfint
      hupweak hgen'
    have hlamEq : κ * (∫ y, dilate K s y) = lam := by
      rw [integral_dilate_eq (fun z => hK₀ z) hKint hs, hκdef,
        div_mul_cancel₀ lam hKpos.ne']
    have hflip : ∀ x : Fin 2 → ℝ, (∫ y, dilate K s y * f (x - y))
        = ∫ y, dilate K s (x - y) * f y := fun x =>
      calc (∫ y, dilate K s y * f (x - y))
          = ∫ y, dilate K s (x - y) * f (x - (x - y)) :=
            (integral_sub_left_eq_self
              (fun y => dilate K s y * f (x - y)) volume x).symm
        _ = ∫ y, dilate K s (x - y) * f y :=
            integral_congr_ae (Filter.Eventually.of_forall fun y => by
              simp only [sub_sub_cancel])
    filter_upwards [hkey] with x hx hxΩ
    have hnot : ¬ (0 < uPos x) := by simpa using hxΩ
    have hux : uPos x = 0 := le_antisymm (not_lt.1 hnot) (hup₀ x)
    rw [← hflip x, ← hlamEq]
    exact hx hux

/-- **The comparison principle for an arbitrary kernel.** If `K` is nonnegative, even,
integrable, compactly supported, at least `1` on the closed unit diamond, and its generator is a
finite positive measure minus a nonnegative point mass at the origin, then `c₂ ≤ ½ ∫ K`. -/
theorem weakTypeConstant_two_le_half_integral (hK₀ : ∀ z, 0 ≤ K z) (hKint : Integrable K)
    (hKeven : ∀ z, K (-z) = K z) (hKsupp : HasCompactSupport K)
    (hK₁ : ∀ z, diamondNorm z ≤ 1 → 1 ≤ K z)
    (β : Measure (Fin 2 → ℝ)) [IsFiniteMeasure β] {a : ℝ} (ha : 0 ≤ a)
    (hgen : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ →
      ∫ x, K x * jumpGen 1 ψ x = (∫ x, ψ x ∂β) - a * ψ 0) :
    weakTypeConstant 2 ≤ ENNReal.ofReal ((∫ z, K z) / 2) := by
  have hKpos := integral_pos_of_one_le hK₀ hKint hK₁
  have hwt : IsKernelWeakTypeBound K (ENNReal.ofReal (∫ x, K x)) :=
    isKernelWeakTypeBound_of_pointwise (fun z => hK₀ z) hKint
      fun g Mg c hgm hg₀ hgM hgsupp hc lam hlam =>
        exists_exceptional_set_general hK₀ hKint hKeven hKsupp hKpos β ha hgen
          g Mg c hgm hg₀ hgM hgsupp hc lam hlam
  have h := weakTypeConstant_two_le_of_diamond hKint hK₁ hwt
  refine h.trans (le_of_eq ?_)
  rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2), ENNReal.ofReal_ofNat]

end CenteredMaximal.General
