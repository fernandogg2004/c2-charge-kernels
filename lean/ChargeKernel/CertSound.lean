/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertTree

/-!
# Quadtree certificates and their soundness
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

/-- A quadtree: subdivision of a cell into four dyadic subcells. -/
inductive QTree where
  | leaf : QTree
  | node : QTree → QTree → QTree → QTree → QTree

/-- Certified upper bound for `∫∫_cell max(r ψ, 0)`. -/
def v2val (a c su sv : ℚ) (L : List Chg) : QTree → ℚ → ℚ → ℚ → ℚ → ℚ
  | .leaf, r0, r1, s0, s1 => leafVal a c su sv L r0 r1 s0 s1
  | .node t1 t2 t3 t4, r0, r1, s0, s1 =>
      v2val a c su sv L t1 r0 ((r0 + r1) / 2) s0 ((s0 + s1) / 2)
        + v2val a c su sv L t2 ((r0 + r1) / 2) r1 s0 ((s0 + s1) / 2)
        + v2val a c su sv L t3 r0 ((r0 + r1) / 2) ((s0 + s1) / 2) s1
        + v2val a c su sv L t4 ((r0 + r1) / 2) r1 ((s0 + s1) / 2) s1

/-- Every leaf value is nonnegative. -/
def v2ok (a c su sv : ℚ) (L : List Chg) : QTree → ℚ → ℚ → ℚ → ℚ → Bool
  | .leaf, r0, r1, s0, s1 => decide (0 ≤ leafVal a c su sv L r0 r1 s0 s1)
  | .node t1 t2 t3 t4, r0, r1, s0, s1 =>
      v2ok a c su sv L t1 r0 ((r0 + r1) / 2) s0 ((s0 + s1) / 2)
        && v2ok a c su sv L t2 ((r0 + r1) / 2) r1 s0 ((s0 + s1) / 2)
        && v2ok a c su sv L t3 r0 ((r0 + r1) / 2) ((s0 + s1) / 2) s1
        && v2ok a c su sv L t4 ((r0 + r1) / 2) r1 ((s0 + s1) / 2) s1

/-- The leaf check of the diamond certificate. -/
def v1leaf (a c m su sv : ℚ) (L : List Chg) (r0 r1 s0 s1 : ℚ) : Bool :=
  let B := cellBox su sv r0 r1 s0 s1
  allPos L B && decide (0 < r1) && decide (r1 * (c + m + smax L B) ≤ a)

def v1ok (a c m su sv : ℚ) (L : List Chg) : QTree → ℚ → ℚ → ℚ → ℚ → Bool
  | .leaf, r0, r1, s0, s1 => v1leaf a c m su sv L r0 r1 s0 s1
  | .node t1 t2 t3 t4, r0, r1, s0, s1 =>
      v1ok a c m su sv L t1 r0 ((r0 + r1) / 2) s0 ((s0 + s1) / 2)
        && v1ok a c m su sv L t2 ((r0 + r1) / 2) r1 s0 ((s0 + s1) / 2)
        && v1ok a c m su sv L t3 r0 ((r0 + r1) / 2) ((s0 + s1) / 2) s1
        && v1ok a c m su sv L t4 ((r0 + r1) / 2) r1 ((s0 + s1) / 2) s1

/-! ### Leaf soundness -/

theorem leaf_sound {a c su sv : ℚ} {L : List Chg} (hL : allNonneg L = true) (hc : 0 ≤ c)
    (hsu : IsSign su) (hsv : IsSign sv) {r0 r1 s0 s1 : ℚ} (hr0 : 0 ≤ r0) (hr : r0 ≤ r1)
    (hs0 : 0 ≤ s0) (hs : s0 ≤ s1) (hs1 : s1 ≤ 1) :
    ∫⁻ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, ENNReal.ofReal (Fpolar a c su sv L x)
        ∂((volume : Measure ℝ).prod volume)
      ≤ ENNReal.ofReal ((leafVal a c su sv L r0 r1 s0 s1 : ℚ) : ℝ) := by
  have hae := ae_ne_charge hsu hsv hr0 hs0 hs1 L (r1 := r1)
  have hmem : ∀ᵐ x ∂(((volume : Measure ℝ).prod (volume : Measure ℝ)).restrict
      (Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1)), x ∈ Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1 :=
    ae_restrict_mem (measurableSet_Ioc.prod measurableSet_Ioc)
  have hin : ∀ x ∈ Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, InCell su sv r0 r1 s0 s1 x :=
    fun x hx => ⟨hsu, hsv, hr0, hs0, hs1, ⟨hx.1.1, hx.1.2⟩, ⟨hx.2.1, hx.2.2⟩⟩
  have b1 := lintegral_le_polyVal hr hs (Fpolar_nonneg a c su sv L) (by
    filter_upwards [hae, hmem] with x hx hxc
    exact j1_pointwise (a := a) hL hc (hin x hxc) hx)
  unfold leafVal
  dsimp only
  split_ifs with ht
  · have b2 := lintegral_le_polyVal hr hs (Fpolar_nonneg a c su sv L) (by
      filter_upwards [hmem] with x hxc
      exact j2_pointwise (a := a) hL hc (hin x hxc) ht)
    rcases le_total (polyVal r0 r1 s0 s1 (j1Coef a c L (cellBox su sv r0 r1 s0 s1) r0 r1).1
        (j1Coef a c L (cellBox su sv r0 r1 s0 s1) r0 r1).2.1
        (j1Coef a c L (cellBox su sv r0 r1 s0 s1) r0 r1).2.2.1
        (j1Coef a c L (cellBox su sv r0 r1 s0 s1) r0 r1).2.2.2)
      (polyVal r0 r1 s0 s1 (j2Coef a c su sv L (cellBox su sv r0 r1 s0 s1)).1
        (j2Coef a c su sv L (cellBox su sv r0 r1 s0 s1)).2.1
        (j2Coef a c su sv L (cellBox su sv r0 r1 s0 s1)).2.2.1
        (j2Coef a c su sv L (cellBox su sv r0 r1 s0 s1)).2.2.2) with h | h
    · rw [min_eq_left h]; exact b1
    · rw [min_eq_right h]; exact b2
  · exact b1

/-! ### Tree soundness -/

theorem Ioc_prod_split {r0 r1 s0 s1 : ℝ} (hr : r0 ≤ r1) (hs : s0 ≤ s1) :
    Ioc r0 r1 ×ˢ Ioc s0 s1 =
      ((Ioc r0 ((r0 + r1) / 2) ×ˢ Ioc s0 ((s0 + s1) / 2)) ∪
        (Ioc ((r0 + r1) / 2) r1 ×ˢ Ioc s0 ((s0 + s1) / 2))) ∪
      ((Ioc r0 ((r0 + r1) / 2) ×ˢ Ioc ((s0 + s1) / 2) s1) ∪
        (Ioc ((r0 + r1) / 2) r1 ×ˢ Ioc ((s0 + s1) / 2) s1)) := by
  rw [← Ioc_union_Ioc_eq_Ioc (by linarith : r0 ≤ (r0 + r1) / 2) (by linarith : (r0 + r1) / 2 ≤ r1),
    ← Ioc_union_Ioc_eq_Ioc (by linarith : s0 ≤ (s0 + s1) / 2) (by linarith : (s0 + s1) / 2 ≤ s1),
    prod_union, union_prod, union_prod]

theorem v2_sound {a c su sv : ℚ} {L : List Chg} (hL : allNonneg L = true) (hc : 0 ≤ c)
    (hsu : IsSign su) (hsv : IsSign sv) :
    ∀ (t : QTree) (r0 r1 s0 s1 : ℚ), 0 ≤ r0 → r0 ≤ r1 → 0 ≤ s0 → s0 ≤ s1 → s1 ≤ 1 →
      v2ok a c su sv L t r0 r1 s0 s1 = true →
      (∫⁻ x in Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1, ENNReal.ofReal (Fpolar a c su sv L x)
          ∂((volume : Measure ℝ).prod volume)
        ≤ ENNReal.ofReal ((v2val a c su sv L t r0 r1 s0 s1 : ℚ) : ℝ))
      ∧ 0 ≤ v2val a c su sv L t r0 r1 s0 s1 := by
  intro t
  induction t with
  | leaf =>
    intro r0 r1 s0 s1 hr0 hr hs0 hs hs1 hok
    simp only [v2ok, decide_eq_true_eq] at hok
    exact ⟨leaf_sound hL hc hsu hsv hr0 hr hs0 hs hs1, hok⟩
  | node t1 t2 t3 t4 ih1 ih2 ih3 ih4 =>
    intro r0 r1 s0 s1 hr0 hr hs0 hs hs1 hok
    simp only [v2ok, Bool.and_eq_true] at hok
    obtain ⟨⟨⟨o1, o2⟩, o3⟩, o4⟩ := hok
    have hrm0 : r0 ≤ (r0 + r1) / 2 := by linarith
    have hrm1 : (r0 + r1) / 2 ≤ r1 := by linarith
    have hsm0 : s0 ≤ (s0 + s1) / 2 := by linarith
    have hsm1 : (s0 + s1) / 2 ≤ s1 := by linarith
    obtain ⟨b1, n1⟩ := ih1 _ _ _ _ hr0 hrm0 hs0 hsm0 (hsm1.trans hs1) o1
    obtain ⟨b2, n2⟩ := ih2 _ _ _ _ (hr0.trans hrm0) hrm1 hs0 hsm0 (hsm1.trans hs1) o2
    obtain ⟨b3, n3⟩ := ih3 _ _ _ _ hr0 hrm0 (hs0.trans hsm0) hsm1 hs1 o3
    obtain ⟨b4, n4⟩ := ih4 _ _ _ _ (hr0.trans hrm0) hrm1 (hs0.trans hsm0) hsm1 hs1 o4
    refine ⟨?_, by simp only [v2val]; linarith⟩
    have hsplit := Ioc_prod_split (r0 := (r0 : ℝ)) (r1 := r1) (s0 := s0) (s1 := s1)
      (by exact_mod_cast hr) (by exact_mod_cast hs)
    push_cast at b1 b2 b3 b4
    rw [hsplit]
    calc _ ≤ ((∫⁻ x in Ioc (r0 : ℝ) ((r0 + r1) / 2) ×ˢ Ioc (s0 : ℝ) ((s0 + s1) / 2),
              ENNReal.ofReal (Fpolar a c su sv L x) ∂((volume : Measure ℝ).prod volume))
            + ∫⁻ x in Ioc (((r0 : ℝ) + r1) / 2) r1 ×ˢ Ioc (s0 : ℝ) ((s0 + s1) / 2),
              ENNReal.ofReal (Fpolar a c su sv L x) ∂((volume : Measure ℝ).prod volume))
          + ((∫⁻ x in Ioc (r0 : ℝ) ((r0 + r1) / 2) ×ˢ Ioc (((s0 : ℝ) + s1) / 2) s1,
              ENNReal.ofReal (Fpolar a c su sv L x) ∂((volume : Measure ℝ).prod volume))
            + ∫⁻ x in Ioc (((r0 : ℝ) + r1) / 2) r1 ×ˢ Ioc (((s0 : ℝ) + s1) / 2) s1,
              ENNReal.ofReal (Fpolar a c su sv L x) ∂((volume : Measure ℝ).prod volume)) :=
          (lintegral_union_le _ _ _).trans
            (add_le_add (lintegral_union_le _ _ _) (lintegral_union_le _ _ _))
      _ ≤ (ENNReal.ofReal ((v2val a c su sv L t1 r0 ((r0 + r1) / 2) s0 ((s0 + s1) / 2) : ℚ) : ℝ)
            + ENNReal.ofReal ((v2val a c su sv L t2 ((r0 + r1) / 2) r1 s0 ((s0 + s1) / 2) : ℚ) : ℝ))
          + (ENNReal.ofReal ((v2val a c su sv L t3 r0 ((r0 + r1) / 2) ((s0 + s1) / 2) s1 : ℚ) : ℝ)
            + ENNReal.ofReal ((v2val a c su sv L t4 ((r0 + r1) / 2) r1 ((s0 + s1) / 2) s1 : ℚ) : ℝ)) :=
          add_le_add (add_le_add b1 b2) (add_le_add b3 b4)
      _ = ENNReal.ofReal ((v2val a c su sv L (.node t1 t2 t3 t4) r0 r1 s0 s1 : ℚ) : ℝ) := by
          have c1 : (0 : ℝ) ≤ (v2val a c su sv L t1 r0 ((r0 + r1) / 2) s0 ((s0 + s1) / 2) : ℚ) := by
            exact_mod_cast n1
          have c2 : (0 : ℝ) ≤ (v2val a c su sv L t2 ((r0 + r1) / 2) r1 s0 ((s0 + s1) / 2) : ℚ) := by
            exact_mod_cast n2
          have c3 : (0 : ℝ) ≤ (v2val a c su sv L t3 r0 ((r0 + r1) / 2) ((s0 + s1) / 2) s1 : ℚ) := by
            exact_mod_cast n3
          have c4 : (0 : ℝ) ≤ (v2val a c su sv L t4 ((r0 + r1) / 2) r1 ((s0 + s1) / 2) s1 : ℚ) := by
            exact_mod_cast n4
          rw [← ENNReal.ofReal_add c1 c2, ← ENNReal.ofReal_add c3 c4,
            ← ENNReal.ofReal_add (add_nonneg c1 c2) (add_nonneg c3 c4)]
          congr 1
          simp only [v2val]
          push_cast
          ring

theorem v1_sound {a c m su sv : ℚ} {L : List Chg} (hL : allNonneg L = true) (ha : 0 ≤ a)
    (hsu : IsSign su) (hsv : IsSign sv) :
    ∀ (t : QTree) (r0 r1 s0 s1 : ℚ), 0 ≤ r0 → r0 ≤ r1 → 0 ≤ s0 → s0 ≤ s1 → s1 ≤ 1 →
      v1ok a c m su sv L t r0 r1 s0 s1 = true →
      ∀ r s : ℝ, (r0 : ℝ) ≤ r → r ≤ r1 → (s0 : ℝ) ≤ s → s ≤ s1 → 0 < r →
        (m : ℝ) ≤ psiL a c L (polar su sv r s) := by
  intro t
  induction t with
  | leaf =>
    intro r0 r1 s0 s1 hr0 hr hs0 hs hs1 hok r s hr0' hr1' hs0' hs1' hrpos
    simp only [v1ok, v1leaf, Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨hpos, hr1pos⟩, hbound⟩ := hok
    have hbox := mem_cellBox hsu hsv hr0 hs0 hs1 ⟨hr0', hr1'⟩ ⟨hs0', hs1'⟩
    have hS := chargeSum_le_smax (z := polar su sv r s) hL hpos hbox.1 hbox.2
    have hs01 : 0 ≤ s ∧ s ≤ 1 :=
      ⟨(by exact_mod_cast hs0 : (0 : ℝ) ≤ s0).trans hs0', hs1'.trans (by exact_mod_cast hs1)⟩
    unfold psiL
    rw [polar_dn hsu.real hsv.real hrpos.le hs01]
    have hr1p : (0 : ℝ) < r1 := by exact_mod_cast hr1pos
    have ha' : (0 : ℝ) ≤ a := by exact_mod_cast ha
    have h1 : (a : ℝ) / r1 ≤ a / r := div_le_div_of_nonneg_left ha' hrpos hr1'
    have h2 : (c : ℝ) + m + smax L (cellBox su sv r0 r1 s0 s1) ≤ a / r1 := by
      rw [le_div_iff₀ hr1p]
      have : ((r1 * (c + m + smax L (cellBox su sv r0 r1 s0 s1)) : ℚ) : ℝ) ≤ (a : ℝ) := by
        exact_mod_cast hbound
      push_cast at this
      linarith
    linarith
  | node t1 t2 t3 t4 ih1 ih2 ih3 ih4 =>
    intro r0 r1 s0 s1 hr0 hr hs0 hs hs1 hok r s hr0' hr1' hs0' hs1' hrpos
    simp only [v1ok, Bool.and_eq_true] at hok
    obtain ⟨⟨⟨o1, o2⟩, o3⟩, o4⟩ := hok
    have hrm0 : r0 ≤ (r0 + r1) / 2 := by linarith
    have hrm1 : (r0 + r1) / 2 ≤ r1 := by linarith
    have hsm0 : s0 ≤ (s0 + s1) / 2 := by linarith
    have hsm1 : (s0 + s1) / 2 ≤ s1 := by linarith
    rcases le_total r (((r0 + r1) / 2 : ℚ) : ℝ) with hrr | hrr <;>
      rcases le_total s (((s0 + s1) / 2 : ℚ) : ℝ) with hss | hss
    · exact ih1 _ _ _ _ hr0 hrm0 hs0 hsm0 (hsm1.trans hs1) o1 r s hr0' hrr hs0' hss hrpos
    · exact ih3 _ _ _ _ hr0 hrm0 (hs0.trans hsm0) hsm1 hs1 o3 r s hr0' hrr hss hs1' hrpos
    · exact ih2 _ _ _ _ (hr0.trans hrm0) hrm1 hs0 hsm0 (hsm1.trans hs1) o2 r s hrr hr1' hs0' hss
        hrpos
    · exact ih4 _ _ _ _ (hr0.trans hrm0) hrm1 (hs0.trans hsm0) hsm1 hs1 o4 r s hrr hr1' hss hs1'
        hrpos

end CenteredMaximal.General
