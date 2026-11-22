/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertSound

/-!
# Global consequences of the quadtree certificates

* `lintegral_psi_le`: `∫⁻ max(ψ, 0) ≤ ∑_quadrants v2val`;
* `psi_ge_of_v1`: `ψ ≥ m` on the punctured closed unit diamond.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

theorem measurable_chargeSum (L : List Chg) : Measurable (chargeSum L) := by
  unfold chargeSum
  induction L with
  | nil => simp only [List.map_nil, List.sum_nil]; exact measurable_const
  | cons ch rest ih =>
    simp only [List.map_cons, List.sum_cons]
    refine Measurable.add (measurable_const.div ?_) ih
    exact (by fun_prop : Continuous fun z : Fin 2 → ℝ =>
      |z 0 - (ch.p : ℝ)| + |z 1 - (ch.q : ℝ)|).measurable

theorem measurable_psiL (a c : ℚ) (L : List Chg) : Measurable (psiL a c L) := by
  unfold psiL
  refine ((measurable_const.div ?_).sub (measurable_chargeSum L)).sub measurable_const
  exact (by fun_prop : Continuous fun z : Fin 2 → ℝ => |z 0| + |z 1|).measurable

theorem continuous_polar (su sv : ℝ) : Continuous fun x : ℝ × ℝ => polar su sv x.1 x.2 := by
  refine continuous_pi fun i => ?_
  fin_cases i
  · show Continuous fun x : ℝ × ℝ => su * (x.1 * x.2)
    fun_prop
  · show Continuous fun x : ℝ × ℝ => sv * (x.1 * (1 - x.2))
    fun_prop

theorem measurable_Fpolar (a c su sv : ℚ) (L : List Chg) : Measurable (Fpolar a c su sv L) := by
  unfold Fpolar
  exact (measurable_fst.mul ((measurable_psiL a c L).comp
    (continuous_polar su sv).measurable)).max measurable_const

theorem chargeSum_nonneg {L : List Chg} (hL : allNonneg L = true) (z : Fin 2 → ℝ) :
    0 ≤ chargeSum L z := by
  unfold chargeSum
  refine List.sum_nonneg fun y hy => ?_
  obtain ⟨ch, hch, rfl⟩ := List.mem_map.1 hy
  have hb : (0 : ℝ) ≤ ch.b := by
    exact_mod_cast of_decide_eq_true (List.all_eq_true.1 hL ch hch)
  exact div_nonneg hb (add_nonneg (abs_nonneg _) (abs_nonneg _))

/-- **One quadrant.** -/
theorem quadrant_bound {a c su sv : ℚ} {L : List Chg} (hL : allNonneg L = true) (hc : 0 ≤ c)
    (hsu : IsSign su) (hsv : IsSign sv) {R : ℚ} (hR : 0 ≤ R) (haR : a ≤ R * c) {t : QTree}
    (hok : v2ok a c su sv L t 0 R 0 1 = true) :
    (∫⁻ r in Ioi 0, ENNReal.ofReal r *
        ∫⁻ s in Ioo 0 1, ENNReal.ofReal (max (psiL a c L (polar su sv r s)) 0))
      ≤ ENNReal.ofReal ((v2val a c su sv L t 0 R 0 1 : ℚ) : ℝ) := by
  set μ := (volume : Measure ℝ).prod (volume : Measure ℝ)
  have hFm := measurable_Fpolar a c su sv L
  -- move `r` inside
  have h1 : (∫⁻ r in Ioi 0, ENNReal.ofReal r *
        ∫⁻ s in Ioo 0 1, ENNReal.ofReal (max (psiL a c L (polar su sv r s)) 0))
      = ∫⁻ r in Ioi 0, ∫⁻ s in Ioo 0 1, ENNReal.ofReal (Fpolar a c su sv L (r, s)) := by
    refine setLIntegral_congr_fun measurableSet_Ioi fun r hr => ?_
    rw [← lintegral_const_mul' _ _ ENNReal.ofReal_ne_top]
    refine lintegral_congr fun s => ?_
    have hr' : (0 : ℝ) ≤ r := le_of_lt hr
    rw [← ENNReal.ofReal_mul hr', Fpolar, mul_max_of_nonneg _ _ hr', mul_zero]
  -- to the product measure
  have h2 : (∫⁻ r in Ioi 0, ∫⁻ s in Ioo 0 1, ENNReal.ofReal (Fpolar a c su sv L (r, s)))
      = ∫⁻ x in Ioi (0 : ℝ) ×ˢ Ioo (0 : ℝ) 1, ENNReal.ofReal (Fpolar a c su sv L x) ∂μ := by
    rw [← Measure.prod_restrict]
    exact (lintegral_prod (fun x => ENNReal.ofReal (Fpolar a c su sv L x))
      (ENNReal.measurable_ofReal.comp hFm).aemeasurable).symm
  -- beyond `R` the integrand vanishes
  have hzero : ∀ x ∈ Ioi (R : ℝ) ×ˢ Ioo (0 : ℝ) 1, Fpolar a c su sv L x = 0 := by
    intro x hx
    have hrpos : 0 < x.1 := lt_of_le_of_lt (by exact_mod_cast hR) hx.1
    have hs01 : 0 ≤ x.2 ∧ x.2 ≤ 1 := ⟨hx.2.1.le, hx.2.2.le⟩
    unfold Fpolar
    rw [mul_psiL_polar hsu.real hsv.real hrpos hs01]
    refine max_eq_right ?_
    have hS := chargeSum_nonneg hL (polar su sv x.1 x.2)
    have hc' : (0 : ℝ) ≤ c := by exact_mod_cast hc
    have haR' : (a : ℝ) ≤ R * c := by exact_mod_cast haR
    have : (R : ℝ) * c ≤ x.1 * c := mul_le_mul_of_nonneg_right hx.1.le hc'
    nlinarith
  have hsub : Ioi (0 : ℝ) ×ˢ Ioo (0 : ℝ) 1 ⊆
      (Ioc ((0 : ℚ) : ℝ) (R : ℝ) ×ˢ Ioc ((0 : ℚ) : ℝ) ((1 : ℚ) : ℝ)) ∪
        (Ioi (R : ℝ) ×ˢ Ioo (0 : ℝ) 1) := by
    intro x hx
    rcases le_or_gt x.1 R with h | h
    · left
      exact ⟨⟨by simpa using hx.1, h⟩, ⟨by simpa using hx.2.1, by simpa using hx.2.2.le⟩⟩
    · right
      exact ⟨h, hx.2⟩
  have h3 : (∫⁻ x in Ioi (R : ℝ) ×ˢ Ioo (0 : ℝ) 1, ENNReal.ofReal (Fpolar a c su sv L x) ∂μ) = 0 := by
    rw [setLIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo)
      (g := fun _ => (0 : ℝ≥0∞)) fun x hx => by rw [hzero x hx, ENNReal.ofReal_zero]]
    simp
  have hsound := (v2_sound hL hc hsu hsv t 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl hok).1
  rw [h1, h2]
  calc _ ≤ ∫⁻ x in (Ioc ((0 : ℚ) : ℝ) (R : ℝ) ×ˢ Ioc ((0 : ℚ) : ℝ) ((1 : ℚ) : ℝ)) ∪
          (Ioi (R : ℝ) ×ˢ Ioo (0 : ℝ) 1), ENNReal.ofReal (Fpolar a c su sv L x) ∂μ :=
        lintegral_mono_set hsub
    _ ≤ _ := (lintegral_union_le _ _ _).trans (by rw [h3, add_zero]; exact hsound)

/-- **The whole plane.** -/
theorem lintegral_psi_le {a c : ℚ} {L : List Chg} (hL : allNonneg L = true) (hc : 0 ≤ c)
    {R : ℚ} (hR : 0 ≤ R) (haR : a ≤ R * c) {t : QTree}
    (h1 : v2ok a c 1 1 L t 0 R 0 1 = true) (h2 : v2ok a c 1 (-1) L t 0 R 0 1 = true)
    (h3 : v2ok a c (-1) 1 L t 0 R 0 1 = true) (h4 : v2ok a c (-1) (-1) L t 0 R 0 1 = true) :
    ∫⁻ z, ENNReal.ofReal (max (psiL a c L z) 0)
      ≤ ENNReal.ofReal (((v2val a c 1 1 L t 0 R 0 1 + v2val a c 1 (-1) L t 0 R 0 1
          + v2val a c (-1) 1 L t 0 R 0 1 + v2val a c (-1) (-1) L t 0 R 0 1 : ℚ) : ℝ)) := by
  have hm : Measurable fun z => ENNReal.ofReal (max (psiL a c L z) 0) :=
    ENNReal.measurable_ofReal.comp ((measurable_psiL a c L).max measurable_const)
  have p1 : IsSign 1 := Or.inl rfl
  have p2 : IsSign (-1) := Or.inr rfl
  have q1 := quadrant_bound hL hc p1 p1 hR haR h1
  have q2 := quadrant_bound hL hc p1 p2 hR haR h2
  have q3 := quadrant_bound hL hc p2 p1 hR haR h3
  have q4 := quadrant_bound hL hc p2 p2 hR haR h4
  push_cast at q1 q2 q3 q4
  have n1 := (v2_sound hL hc p1 p1 t 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl h1).2
  have n2 := (v2_sound hL hc p1 p2 t 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl h2).2
  have n3 := (v2_sound hL hc p2 p1 t 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl h3).2
  have n4 := (v2_sound hL hc p2 p2 t 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl h4).2
  have c1 : (0 : ℝ) ≤ (v2val a c 1 1 L t 0 R 0 1 : ℚ) := by exact_mod_cast n1
  have c2 : (0 : ℝ) ≤ (v2val a c 1 (-1) L t 0 R 0 1 : ℚ) := by exact_mod_cast n2
  have c3 : (0 : ℝ) ≤ (v2val a c (-1) 1 L t 0 R 0 1 : ℚ) := by exact_mod_cast n3
  have c4 : (0 : ℝ) ≤ (v2val a c (-1) (-1) L t 0 R 0 1 : ℚ) := by exact_mod_cast n4
  rw [lintegral_eq_sum_polar hm]
  push_cast
  rw [ENNReal.ofReal_add (add_nonneg (add_nonneg c1 c2) c3) c4,
    ENNReal.ofReal_add (add_nonneg c1 c2) c3, ENNReal.ofReal_add c1 c2]
  exact add_le_add (add_le_add (add_le_add q1 q2) q3) q4

/-- **The diamond certificate.** -/
theorem psi_ge_of_v1 {a c m : ℚ} {L : List Chg} (hL : allNonneg L = true) (ha : 0 ≤ a)
    {t : QTree}
    (h1 : v1ok a c m 1 1 L t 0 1 0 1 = true) (h2 : v1ok a c m 1 (-1) L t 0 1 0 1 = true)
    (h3 : v1ok a c m (-1) 1 L t 0 1 0 1 = true) (h4 : v1ok a c m (-1) (-1) L t 0 1 0 1 = true)
    {z : Fin 2 → ℝ} (hz : z ≠ 0) (hd : |z 0| + |z 1| ≤ 1) :
    (m : ℝ) ≤ psiL a c L z := by
  set r := |z 0| + |z 1| with hr
  have hrpos : 0 < r := by
    rcases eq_or_lt_of_le (add_nonneg (abs_nonneg (z 0)) (abs_nonneg (z 1))) with h | h
    · exfalso
      apply hz
      have a0 : |z 0| = 0 := le_antisymm (by linarith [abs_nonneg (z 1)]) (abs_nonneg _)
      have a1 : |z 1| = 0 := le_antisymm (by linarith [abs_nonneg (z 0)]) (abs_nonneg _)
      funext i
      fin_cases i
      · simpa using a0
      · simpa using a1
    · exact h
  set s := |z 0| / r with hs
  have hs01 : 0 ≤ s ∧ s ≤ 1 := by
    refine ⟨div_nonneg (abs_nonneg _) hrpos.le, ?_⟩
    rw [div_le_one hrpos]
    linarith [abs_nonneg (z 1)]
  have hpol : ∀ su sv : ℚ, (su : ℝ) * |z 0| = z 0 → (sv : ℝ) * |z 1| = z 1 →
      polar su sv r s = z := by
    intro su sv e0 e1
    funext i
    fin_cases i
    · show (su : ℝ) * (r * s) = z 0
      rw [hs, mul_div_cancel₀ _ hrpos.ne', e0]
    · show (sv : ℝ) * (r * (1 - s)) = z 1
      rw [hs, mul_sub, mul_one, mul_div_cancel₀ _ hrpos.ne', hr, add_sub_cancel_left, e1]
  have key : ∀ su sv : ℚ, IsSign su → IsSign sv →
      v1ok a c m su sv L t 0 1 0 1 = true →
      (su : ℝ) * |z 0| = z 0 → (sv : ℝ) * |z 1| = z 1 → (m : ℝ) ≤ psiL a c L z := by
    intro su sv hsu hsv hok e0 e1
    have := v1_sound hL ha hsu hsv t 0 1 0 1 le_rfl zero_le_one le_rfl zero_le_one le_rfl hok
      r s (by simpa using hrpos.le) (by simpa using hd) (by simpa using hs01.1)
      (by simpa using hs01.2) hrpos
    rwa [hpol su sv e0 e1] at this
  have s0 : ∀ x : ℝ, 0 ≤ x → ((1 : ℚ) : ℝ) * |x| = x := fun x hx => by
    rw [abs_of_nonneg hx]; simp
  have s1 : ∀ x : ℝ, x < 0 → ((-1 : ℚ) : ℝ) * |x| = x := fun x hx => by
    rw [abs_of_neg hx]; simp
  rcases le_or_gt 0 (z 0) with hu | hu <;> rcases le_or_gt 0 (z 1) with hv | hv
  · exact key 1 1 (Or.inl rfl) (Or.inl rfl) h1 (s0 _ hu) (s0 _ hv)
  · exact key 1 (-1) (Or.inl rfl) (Or.inr rfl) h2 (s0 _ hu) (s1 _ hv)
  · exact key (-1) 1 (Or.inr rfl) (Or.inl rfl) h3 (s1 _ hu) (s0 _ hv)
  · exact key (-1) (-1) (Or.inr rfl) (Or.inr rfl) h4 (s1 _ hu) (s1 _ hv)

end CenteredMaximal.General
