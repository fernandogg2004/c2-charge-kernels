/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
public import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar

/-!
# Nonnegativity from smooth nonnegative test functions

If a locally integrable function `f` on the plane has nonnegative integral against every smooth,
compactly supported, nonnegative function, then `f ≥ 0` almost everywhere. This is the inequality
counterpart of Mathlib's `ae_eq_zero_of_integral_contDiff_smul_eq_zero`, and the proof follows the
same pattern: smooth approximations of indicators of compact sets give `∫_K f ≥ 0` for every
compact `K`, and inner regularity of Lebesgue measure passes to all measurable sets.
-/

@[expose] public section

noncomputable section

open MeasureTheory Metric Set Filter Function
open scoped Topology ENNReal ContDiff

namespace CenteredMaximal.General

variable {f : (Fin 2 → ℝ) → ℝ}

/-- Nonnegative integrals against smooth nonnegative test functions give nonnegative integrals on
compact sets. -/
theorem setIntegral_isCompact_nonneg (hf : LocallyIntegrable f volume)
    (h : ∀ g : (Fin 2 → ℝ) → ℝ, ContDiff ℝ ∞ g → HasCompactSupport g → (∀ x, 0 ≤ g x) →
      0 ≤ ∫ x, g x * f x)
    {s : Set (Fin 2 → ℝ)} (hs : IsCompact s) : 0 ≤ ∫ x in s, f x := by
  obtain ⟨δ, δpos, hδ⟩ : ∃ δ, 0 < δ ∧ IsCompact (cthickening δ s) :=
    hs.exists_isCompact_cthickening
  obtain ⟨u, -, u_pos, u_lim⟩ : ∃ u : ℕ → ℝ, StrictAnti u ∧ (∀ n, u n ∈ Ioo 0 δ)
      ∧ Tendsto u atTop (𝓝 0) := exists_seq_strictAnti_tendsto' δpos
  let v : ℕ → Set (Fin 2 → ℝ) := fun n ↦ thickening (u n) s
  obtain ⟨K, K_compact, vK⟩ : ∃ K, IsCompact K ∧ ∀ n, v n ⊆ K :=
    ⟨_, hδ, fun n ↦ thickening_subset_cthickening_of_le (u_pos n).2.le _⟩
  have : ∀ n, ∃ g : (Fin 2 → ℝ) → ℝ, support g = v n ∧ ContDiff ℝ ∞ g ∧ range g ⊆ Icc 0 1
      ∧ ∀ x ∈ s, g x = 1 := by
    intro n
    rcases exists_contDiff_support_eq_eq_one_iff (n := (⊤ : ℕ∞)) isOpen_thickening hs.isClosed
      (self_subset_thickening (u_pos n).1 s) with ⟨g, g_smooth, g_range, g_supp, hg⟩
    exact ⟨g, g_supp, g_smooth, g_range, fun x hx ↦ (hg x).1 hx⟩
  choose g g_supp g_diff g_range hg using this
  have L : Tendsto (fun n ↦ ∫ x, g n x • f x) atTop (𝓝 (∫ x in s, f x)) := by
    rw [← integral_indicator hs.measurableSet]
    let bound : (Fin 2 → ℝ) → ℝ := K.indicator (fun x ↦ ‖f x‖)
    have A : ∀ n, AEStronglyMeasurable (fun x ↦ g n x • f x) volume :=
      fun n ↦ (g_diff n).continuous.aestronglyMeasurable.smul hf.aestronglyMeasurable
    have B : Integrable bound volume := by
      rw [integrable_indicator_iff K_compact.measurableSet]
      exact (hf.integrableOn_isCompact K_compact).norm
    have C : ∀ n, ∀ᵐ x ∂volume, ‖g n x • f x‖ ≤ bound x := by
      intro n
      filter_upwards with x
      rw [norm_smul]
      refine le_indicator_apply (fun _ ↦ ?_) (fun hxK ↦ ?_)
      · have : ‖g n x‖ ≤ 1 := by
          have := g_range n (mem_range_self (f := g n) x)
          rw [Real.norm_of_nonneg this.1]
          exact this.2
        exact mul_le_of_le_one_left (norm_nonneg _) this
      · have : g n x = 0 := by
          rw [← notMem_support, g_supp]
          contrapose hxK
          exact vK n hxK
        simp [this]
    have D : ∀ᵐ x ∂volume, Tendsto (fun n => g n x • f x) atTop (𝓝 (s.indicator f x)) := by
      filter_upwards with x
      by_cases hxs : x ∈ s
      · have : ∀ n, g n x = 1 := fun n ↦ hg n x hxs
        simp [this, indicator_of_mem hxs f]
      · simp_rw [indicator_of_notMem hxs f]
        apply tendsto_const_nhds.congr'
        suffices H : ∀ᶠ n in atTop, g n x = 0 by
          filter_upwards [H] with n hn using by simp [hn]
        obtain ⟨ε, εpos, hε⟩ : ∃ ε, 0 < ε ∧ x ∉ thickening ε s := by
          rw [← hs.isClosed.closure_eq, closure_eq_iInter_thickening s] at hxs
          simpa using hxs
        filter_upwards [(tendsto_order.1 u_lim).2 _ εpos] with n hn
        rw [← notMem_support, g_supp]
        contrapose hε
        exact thickening_mono hn.le s hε
    exact tendsto_integral_of_dominated_convergence bound A B C D
  have hpos : ∀ n, 0 ≤ ∫ x, g n x • f x := by
    intro n
    have hgc : HasCompactSupport (g n) :=
      HasCompactSupport.of_support_subset_isCompact K_compact (by rw [g_supp]; exact vK n)
    simpa [smul_eq_mul] using h (g n) (g_diff n) hgc fun x => (g_range n (mem_range_self x)).1
  exact ge_of_tendsto' L hpos

/-- **Nonnegativity from smooth nonnegative test functions.** -/
theorem ae_nonneg_of_integral_contDiff_nonneg (hf : LocallyIntegrable f volume)
    (h : ∀ g : (Fin 2 → ℝ) → ℝ, ContDiff ℝ ∞ g → HasCompactSupport g → (∀ x, 0 ≤ g x) →
      0 ≤ ∫ x, g x * f x) :
    0 ≤ᵐ[volume] f := by
  have hball : ∀ n : ℕ, ∀ᵐ x ∂(volume.restrict (closedBall (0 : Fin 2 → ℝ) n)), 0 ≤ f x := by
    intro n
    set B := closedBall (0 : Fin 2 → ℝ) n with hBdef
    have hBc : IsCompact B := isCompact_closedBall _ _
    refine ae_nonneg_of_forall_setIntegral_nonneg (hf.integrableOn_isCompact hBc)
      fun A hA _ => ?_
    rw [Measure.restrict_restrict hA]
    set A' := A ∩ B with hA'def
    have hA'm : MeasurableSet A' := hA.inter hBc.measurableSet
    have hA'fin : volume A' ≠ (⊤ : ℝ≥0∞) :=
      ((measure_mono inter_subset_right).trans_lt hBc.measure_lt_top).ne
    have hε : ∀ k : ℕ, ((k : ℝ≥0∞))⁻¹ ≠ 0 := fun k => ENNReal.inv_ne_zero.2 (ENNReal.natCast_ne_top k)
    choose C hCA hCc hCμ using fun k : ℕ => hA'm.exists_isCompact_lt_add hA'fin (hε k)
    let D : ℕ → Set (Fin 2 → ℝ) := accumulate C
    have hDc : ∀ k, IsCompact (D k) := isCompact_accumulate hCc
    have hDmono : Monotone D := monotone_accumulate
    have hUD : (⋃ k, D k) = ⋃ k, C k := iUnion_accumulate
    have hUsub : (⋃ k, C k) ⊆ A' := iUnion_subset hCA
    -- the compact approximations exhaust `A'` up to a null set
    have hnull : volume (A' \ ⋃ k, C k) = 0 := by
      have hle : ∀ k : ℕ, volume (A' \ ⋃ k, C k) ≤ ((k : ℝ≥0∞))⁻¹ := by
        intro k
        have h1 : volume (A' \ ⋃ k, C k) ≤ volume (A' \ C k) :=
          measure_mono (diff_subset_diff_right (subset_iUnion C k))
        have h2 : volume (A' \ C k) = volume A' - volume (C k) :=
          measure_diff (hCA k) (hCc k).measurableSet.nullMeasurableSet
            ((measure_mono (hCA k)).trans_lt hA'fin.lt_top).ne
        have h3 : volume A' - volume (C k) < ((k : ℝ≥0∞))⁻¹ :=
          ENNReal.sub_lt_of_lt_add (measure_mono (hCA k)) (by rw [add_comm]; exact hCμ k)
        exact h1.trans (h2 ▸ h3.le)
      exact le_antisymm (ge_of_tendsto' ENNReal.tendsto_inv_nat_nhds_zero hle) zero_le
    have hae : A' =ᵐ[volume] (⋃ k, D k) := by
      rw [hUD]
      refine (ae_eq_set.2 ⟨hnull, ?_⟩)
      rw [sdiff_eq_empty.2 hUsub, measure_empty]
    have hint : IntegrableOn f (⋃ k, D k) volume := by
      refine (hf.integrableOn_isCompact hBc).mono_set ?_
      rw [hUD]
      exact hUsub.trans inter_subset_right
    have hT := tendsto_setIntegral_of_monotone (fun k => (hDc k).measurableSet) hDmono hint
    rw [setIntegral_congr_set hae]
    exact ge_of_tendsto' hT fun k => setIntegral_isCompact_nonneg hf h (hDc k)
  have hU : (⋃ n : ℕ, closedBall (0 : Fin 2 → ℝ) n) = univ := iUnion_closedBall_nat 0
  have := (ae_restrict_iUnion_iff (fun n : ℕ => closedBall (0 : Fin 2 → ℝ) n)
    (fun x => 0 ≤ f x)).2 hball
  rw [hU, Measure.restrict_univ] at this
  exact this

end CenteredMaximal.General
