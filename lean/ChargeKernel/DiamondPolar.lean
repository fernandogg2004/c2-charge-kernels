/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar
public import Mathlib.MeasureTheory.Integral.Lebesgue.Map
public import Mathlib.MeasureTheory.Group.LIntegral
public import Mathlib.MeasureTheory.Integral.Prod

/-!
# Diamond-polar coordinates on the plane

In the quadrant `(σu, σv)` the map `(r, s) ↦ (σu r s, σv r (1 − s))`, `r > 0`, `0 < s < 1`, has
Jacobian `r`, and `|u| + |v| = r`:

`∫⁻ z, f z = ∑_{σu, σv = ±1} ∫⁻_{r > 0} r ∫⁻_{0 < s < 1} f (σu r s, σv r (1 − s))`.

The proof uses only one-dimensional substitutions (reflection, translation, dilation) and
Tonelli's theorem: `∫_{x>0} ∫_{y>0} G(x, y) = ∫_{w>0} ∫_{0<x<w} G(x, w − x) = ∫_{w>0} w ∫_0^1 G(ws, w(1−s))`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

/-- Diamond-polar coordinates in the quadrant of signs `(σu, σv)`. -/
def polar (σu σv r s : ℝ) : Fin 2 → ℝ := ![σu * (r * s), σv * (r * (1 - s))]

/-- Dilation in `ℝ≥0∞`: `∫⁻ f = w ∫⁻ f (w s) ds` for `w > 0`. -/
theorem lintegral_eq_mul_lintegral_comp_mul {f : ℝ → ℝ≥0∞} (hf : Measurable f) {w : ℝ}
    (hw : 0 < w) : ∫⁻ x, f x = ENNReal.ofReal w * ∫⁻ s, f (w * s) := by
  have h := lintegral_map (μ := (volume : Measure ℝ)) hf (measurable_const_mul w)
  rw [Real.map_volume_mul_left hw.ne', lintegral_smul_measure] at h
  rw [← h, smul_eq_mul, ← mul_assoc, ← ENNReal.ofReal_mul hw.le, abs_of_pos (inv_pos.2 hw),
    mul_inv_cancel₀ hw.ne', ENNReal.ofReal_one, one_mul]

/-- Reflection invariance of Lebesgue measure on the line, for lower integrals. -/
theorem lintegral_comp_neg_real {f : ℝ → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ x, f (-x) = ∫⁻ x, f x := by
  have h := lintegral_map (μ := (volume : Measure ℝ)) hf (measurable_const_mul (-1 : ℝ))
  rw [Real.map_volume_mul_left (by norm_num : (-1 : ℝ) ≠ 0)] at h
  simp only [inv_neg, inv_one, abs_neg, abs_one, ENNReal.ofReal_one, one_smul, neg_one_mul] at h
  exact h.symm

/-- Splitting the line at `0`, with the negative half reflected. -/
theorem lintegral_eq_Ioi_add_Ioi_neg {h : ℝ → ℝ≥0∞} (hh : Measurable h) :
    ∫⁻ y, h y = (∫⁻ y in Ioi 0, h y) + ∫⁻ y in Ioi 0, h (-y) := by
  rw [← lintegral_add_compl h (measurableSet_Ioi (a := (0 : ℝ))), compl_Ioi]
  congr 1
  rw [setLIntegral_congr Iio_ae_eq_Iic.symm, ← lintegral_indicator measurableSet_Iio,
    ← lintegral_indicator measurableSet_Ioi,
    ← lintegral_comp_neg_real (hh.indicator measurableSet_Iio)]
  refine lintegral_congr fun y => ?_
  by_cases hy : 0 < y
  · rw [indicator_of_mem (show -y ∈ Iio (0 : ℝ) by simpa using hy),
      indicator_of_mem (show y ∈ Ioi (0 : ℝ) from hy)]
  · rw [indicator_of_notMem (show -y ∉ Iio (0 : ℝ) by simpa using hy),
      indicator_of_notMem (show y ∉ Ioi (0 : ℝ) from hy)]

/-- **One quadrant in diamond-polar coordinates.** -/
theorem lintegral_quadrant {G : ℝ → ℝ → ℝ≥0∞} (hG : Measurable (Function.uncurry G)) :
    (∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, G x y)
      = ∫⁻ r in Ioi 0, ENNReal.ofReal r * ∫⁻ s in Ioo 0 1, G (r * s) (r * (1 - s)) := by
  set F : ℝ → ℝ → ℝ≥0∞ := fun x w => if x < w then G x (w - x) else 0 with hFdef
  have hFm : Measurable (Function.uncurry F) := by
    refine Measurable.ite (measurableSet_lt measurable_fst measurable_snd) ?_ measurable_const
    exact hG.comp (measurable_fst.prodMk (measurable_snd.sub measurable_fst))
  -- step 1: translate the inner variable
  have step1 : ∀ x, (∫⁻ y in Ioi 0, G x y) = ∫⁻ w, F x w := by
    intro x
    have hGx : Measurable (G x) := hG.comp (measurable_const.prodMk measurable_id)
    rw [← lintegral_indicator measurableSet_Ioi,
      ← lintegral_sub_right_eq_self (fun y => (Ioi (0 : ℝ)).indicator (G x) y) x]
    refine lintegral_congr fun w => ?_
    by_cases hxw : x < w
    · rw [indicator_of_mem (show w - x ∈ Ioi (0 : ℝ) by simpa using hxw), hFdef]
      simp [hxw]
    · rw [indicator_of_notMem (show w - x ∉ Ioi (0 : ℝ) by simpa using hxw), hFdef]
      simp [hxw]
  -- step 2: Tonelli
  have step2 : (∫⁻ x in Ioi 0, ∫⁻ w, F x w) = ∫⁻ w, ∫⁻ x in Ioi 0, F x w :=
    lintegral_lintegral_swap hFm.aemeasurable
  -- step 3: dilate the inner variable
  have step3 : ∀ w, (∫⁻ x in Ioi 0, F x w)
      = (Ioi (0 : ℝ)).indicator
          (fun w => ENNReal.ofReal w * ∫⁻ s in Ioo 0 1, G (w * s) (w * (1 - s))) w := by
    intro w
    by_cases hw : 0 < w
    · rw [indicator_of_mem (show w ∈ Ioi (0 : ℝ) from hw), ← lintegral_indicator measurableSet_Ioi]
      have hm : Measurable fun x => (Ioi (0 : ℝ)).indicator (fun x => F x w) x :=
        (hFm.comp (measurable_id.prodMk measurable_const)).indicator measurableSet_Ioi
      rw [lintegral_eq_mul_lintegral_comp_mul hm hw, ← lintegral_indicator measurableSet_Ioo]
      congr 1
      refine lintegral_congr fun s => ?_
      by_cases hs : s ∈ Ioo (0 : ℝ) 1
      · have h1 : w * s ∈ Ioi (0 : ℝ) := mul_pos hw hs.1
        have h2 : w * s < w := by nlinarith [hs.2]
        rw [indicator_of_mem h1, indicator_of_mem hs, hFdef]
        simp only [h2, ite_true]
        congr 1
        ring
      · rw [indicator_of_notMem hs]
        by_cases h1 : w * s ∈ Ioi (0 : ℝ)
        · rw [indicator_of_mem h1, hFdef]
          have h2 : ¬ w * s < w := by
            intro h2
            apply hs
            refine ⟨?_, ?_⟩
            · exact (pos_iff_pos_of_mul_pos (show 0 < w * s from h1)).1 hw
            · by_contra h3
              push_neg at h3
              nlinarith
          simp [h2]
        · rw [indicator_of_notMem h1]
    · rw [indicator_of_notMem (show w ∉ Ioi (0 : ℝ) from hw)]
      rw [setLIntegral_congr_fun measurableSet_Ioi (g := fun _ => (0 : ℝ≥0∞)) fun x hx => by
        have hxw : ¬ x < w := fun h => hw (lt_trans hx h)
        simp [hFdef, hxw]]
      simp
  calc (∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, G x y) = ∫⁻ x in Ioi 0, ∫⁻ w, F x w := by
        simp_rw [step1]
    _ = ∫⁻ w, ∫⁻ x in Ioi 0, F x w := step2
    _ = ∫⁻ w, (Ioi (0 : ℝ)).indicator
          (fun w => ENNReal.ofReal w * ∫⁻ s in Ioo 0 1, G (w * s) (w * (1 - s))) w := by
        simp_rw [step3]
    _ = _ := lintegral_indicator measurableSet_Ioi _

/-- **The plane in diamond-polar coordinates.** -/
theorem lintegral_eq_sum_polar {f : (Fin 2 → ℝ) → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ z, f z = (∫⁻ r in Ioi 0, ENNReal.ofReal r * ∫⁻ s in Ioo 0 1, f (polar 1 1 r s))
      + (∫⁻ r in Ioi 0, ENNReal.ofReal r * ∫⁻ s in Ioo 0 1, f (polar 1 (-1) r s))
      + (∫⁻ r in Ioi 0, ENNReal.ofReal r * ∫⁻ s in Ioo 0 1, f (polar (-1) 1 r s))
      + (∫⁻ r in Ioi 0, ENNReal.ofReal r * ∫⁻ s in Ioo 0 1, f (polar (-1) (-1) r s)) := by
  set g : ℝ → ℝ → ℝ≥0∞ := fun x y => f ![x, y] with hgdef
  have hug : Function.uncurry g = f ∘ (MeasurableEquiv.finTwoArrow (α := ℝ)).symm := by
    funext q
    rfl
  have hgm : Measurable (Function.uncurry g) := by
    rw [hug]
    exact hf.comp (MeasurableEquiv.finTwoArrow (α := ℝ)).symm.measurable
  have h0 : ∫⁻ z, f z = ∫⁻ x, ∫⁻ y, g x y := by
    rw [← (volume_preserving_finTwoArrow ℝ).symm.map_eq, lintegral_map_equiv,
      Measure.volume_eq_prod]
    rw [lintegral_prod (fun q : ℝ × ℝ => f ((MeasurableEquiv.finTwoArrow (α := ℝ)).symm q))
      (hf.comp (MeasurableEquiv.finTwoArrow (α := ℝ)).symm.measurable).aemeasurable]
    rfl
  have hq : ∀ σu σv : ℝ, (∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, g (σu * x) (σv * y))
      = ∫⁻ r in Ioi 0, ENNReal.ofReal r * ∫⁻ s in Ioo 0 1, f (polar σu σv r s) := by
    intro σu σv
    rw [lintegral_quadrant (G := fun x y => g (σu * x) (σv * y))
      (hgm.comp ((measurable_const.mul measurable_fst).prodMk
        (measurable_const.mul measurable_snd)))]
    rfl
  have hin : ∀ x, ∫⁻ y, g x y = (∫⁻ y in Ioi 0, g x y) + ∫⁻ y in Ioi 0, g x (-y) := fun x =>
    lintegral_eq_Ioi_add_Ioi_neg (hgm.comp (measurable_const.prodMk measurable_id))
  have hA : Measurable fun x => ∫⁻ y in Ioi 0, g x y :=
    hgm.lintegral_prod_right'
  have hB : Measurable fun x => ∫⁻ y in Ioi 0, g x (-y) :=
    (hgm.comp (measurable_fst.prodMk measurable_snd.neg)).lintegral_prod_right'
  rw [h0]
  simp_rw [hin]
  rw [lintegral_add_left hA, lintegral_eq_Ioi_add_Ioi_neg hA, lintegral_eq_Ioi_add_Ioi_neg hB]
  have e1 := hq 1 1
  have e2 := hq 1 (-1)
  have e3 := hq (-1) 1
  have e4 := hq (-1) (-1)
  simp only [one_mul, neg_one_mul] at e1 e2 e3 e4
  rw [e1, e2, e3, e4]
  ring

end CenteredMaximal.General
