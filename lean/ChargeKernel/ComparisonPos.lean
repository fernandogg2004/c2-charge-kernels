/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Comparison
public import ChargeKernel.Transfer

/-!
# The comparison principle under a positivity hypothesis

`weakTypeConstant_two_le_half_integral_of_pos`: if `K ≥ 0` is even, integrable, compactly
supported, at least `1` on the closed unit diamond, and

`∀ ψ test, ψ ≥ 0 → −a ψ(0) ≤ ∫ K · Aψ`   (`A = jumpGen 1`, `a ≥ 0`),

then `c₂ ≤ ½ ∫ K`. The hypothesis says `A K + a δ₀ ≥ 0` as a distribution: it is what Kato's
inequality provides, and it replaces the exact generator identity with a finite measure required by
`weakTypeConstant_two_le_half_integral`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Metric Set
open scoped ENNReal

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

variable {K : (Fin 2 → ℝ) → ℝ} {a : ℝ}

/-- Positivity of the generator is preserved by dilation. -/
theorem pos_dilate (hKint : Integrable K) (ha : 0 ≤ a)
    (hKpos : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ → (∀ z, 0 ≤ ψ z) →
      -(a * ψ 0) ≤ ∫ x, K x * jumpGen 1 ψ x)
    {s : ℝ} (hs : 0 < s) :
    ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ → (∀ z, 0 ≤ ψ z) →
      -((s ^ (-(1 : ℝ)) * a) * ψ 0) ≤ ∫ x, dilate K s x * jumpGen 1 ψ x := by
  intro ψ hψ hψ₀
  rw [jumpGen_dilate_eq hs K hKint ψ hψ]
  have h := hKpos (fun z => ψ (s • z)) (hψ.comp_smul hs.ne') (fun z => hψ₀ _)
  simp only [smul_zero] at h
  have hsp : 0 < s ^ (-(1 : ℝ)) := Real.rpow_pos_of_pos hs _
  have := mul_le_mul_of_nonneg_left h hsp.le
  have _ := ha
  linarith

/-- **The pointwise step under the positivity hypothesis.** -/
theorem exists_exceptional_set_of_pos (hK₀ : ∀ z, 0 ≤ K z) (hKint : Integrable K)
    (hKeven : ∀ z, K (-z) = K z) (hKsupp : HasCompactSupport K) (hKpos' : 0 < ∫ z, K z)
    (ha : 0 ≤ a)
    (hKpos : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ → (∀ z, 0 ≤ ψ z) →
      -(a * ψ 0) ≤ ∫ x, K x * jumpGen 1 ψ x)
    (f : (Fin 2 → ℝ) → ℝ) (Mf b : ℝ) (hfm : Measurable f) (hf₀ : ∀ x, 0 ≤ f x)
    (hfM : ∀ x, f x ≤ Mf) (hfsupp : ∀ x, b < ‖x‖ → f x = 0) (hb : 0 < b) (lam : ℝ)
    (hlam : 0 < lam) :
    ∃ Ω : Set (Fin 2 → ℝ), MeasurableSet Ω ∧
      volume Ω ≤ ENNReal.ofReal ((∫ x, K x) * (∫ x, f x) / lam) ∧
      ∀ s : ℝ, 0 < s → ∀ᵐ x, x ∉ Ω → (∫ y, dilate K s (x - y) * f y) ≤ lam := by
  obtain ⟨κ, hκdef⟩ : ∃ κ : ℝ, κ = lam / (∫ x, K x) := ⟨_, rfl⟩
  have hκ : 0 < κ := by
    rw [hκdef]
    exact div_pos hlam hKpos'
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
    have hkey := convolution_le_of_eq_zero_of_pos (κ := κ)
      (fun z => dilate_nonneg (fun w => hK₀ w) hs z)
      (integrable_dilate hKint hs) (dilate_neg_of_even hKeven s)
      (hasCompactSupport_dilate hKsupp hs) hupint hup₀ hσm hσint hσ₀ hσκ hfint
      hupweak (pos_dilate hKint ha hKpos hs)
    have hlamEq : κ * (∫ y, dilate K s y) = lam := by
      rw [integral_dilate_eq (fun z => hK₀ z) hKint hs, hκdef,
        div_mul_cancel₀ lam hKpos'.ne']
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

/-- **The comparison principle under the positivity hypothesis.** -/
theorem weakTypeConstant_two_le_half_integral_of_pos (hK₀ : ∀ z, 0 ≤ K z)
    (hKint : Integrable K) (hKeven : ∀ z, K (-z) = K z) (hKsupp : HasCompactSupport K)
    (hK₁ : ∀ z, diamondNorm z ≤ 1 → 1 ≤ K z) (ha : 0 ≤ a)
    (hKpos : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ → (∀ z, 0 ≤ ψ z) →
      -(a * ψ 0) ≤ ∫ x, K x * jumpGen 1 ψ x) :
    weakTypeConstant 2 ≤ ENNReal.ofReal ((∫ z, K z) / 2) := by
  have hKpos' := integral_pos_of_one_le hK₀ hKint hK₁
  have hwt : IsKernelWeakTypeBound K (ENNReal.ofReal (∫ x, K x)) :=
    isKernelWeakTypeBound_of_pointwise (fun z => hK₀ z) hKint
      fun g Mg c hgm hg₀ hgM hgsupp hc lam hlam =>
        exists_exceptional_set_of_pos hK₀ hKint hKeven hKsupp hKpos' ha hKpos
          g Mg c hgm hg₀ hgM hgsupp hc lam hlam
  have h := weakTypeConstant_two_le_of_diamond hKint hK₁ hwt
  refine h.trans (le_of_eq ?_)
  rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2), ENNReal.ofReal_ofNat]

end CenteredMaximal.General
