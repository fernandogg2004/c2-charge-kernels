/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertBasic

/-!
# Pointwise leaf bounds for the certificates

For a list of charges `L` and the potential
`ψ_L(z) = a / (|z₀| + |z₁|) − ∑_{(p,q,b) ∈ L} b / (|z₀ − p| + |z₁ − q|) − c`,
and a cell of diamond-polar coordinates with box `B`:

* `S ≥ smin = ∑ floorK (b / dmax)` and, if every `dmin > 0`, `S ≤ smax = ∑ ceilK (b / dmin)`;
* hence `r ψ ≤ a − r (c + smin)` and `ψ ≥ a/r − c − smax` on the cell.
-/

@[expose] public section

noncomputable section

namespace CenteredMaximal.General

/-- The charge sum `S_L(z) = ∑ b / (|z₀ − p| + |z₁ − q|)`. -/
def chargeSum (L : List Chg) (z : Fin 2 → ℝ) : ℝ :=
  (L.map fun ch => (ch.b : ℝ) / (|z 0 - ch.p| + |z 1 - ch.q|)).sum

/-- The potential of the certificate. -/
def psiL (a c : ℚ) (L : List Chg) (z : Fin 2 → ℝ) : ℝ :=
  (a : ℝ) / (|z 0| + |z 1|) - chargeSum L z - c

/-- Rounded lower bound of the charge sum on a box. -/
def smin (L : List Chg) (B : Box) : ℚ := (L.map fun ch => floorK (ch.b / dmax B ch.p ch.q)).sum

/-- Rounded upper bound of the charge sum on a box (meaningful when every `dmin > 0`). -/
def smax (L : List Chg) (B : Box) : ℚ := (L.map fun ch => ceilK (ch.b / dmin B ch.p ch.q)).sum

/-- All charges are at positive distance from the box. -/
def allPos (L : List Chg) (B : Box) : Bool := L.all fun ch => decide (0 < dmin B ch.p ch.q)

/-- All strengths are nonnegative. -/
def allNonneg (L : List Chg) : Bool := L.all fun ch => decide (0 ≤ ch.b)

theorem list_sum_le_sum {α : Type*} {L : List α} {f g : α → ℝ} (h : ∀ x ∈ L, f x ≤ g x) :
    (L.map f).sum ≤ (L.map g).sum := by
  induction L with
  | nil => simp
  | cons x xs ih =>
    simp only [List.map_cons, List.sum_cons]
    exact add_le_add (h x (by simp)) (ih fun y hy => h y (by simp [hy]))

theorem polar_apply_zero (su sv r s : ℝ) : polar su sv r s 0 = su * (r * s) := rfl
theorem polar_apply_one (su sv r s : ℝ) : polar su sv r s 1 = sv * (r * (1 - s)) := rfl

theorem abs_sign_mul {σ x : ℝ} (hσ : σ = 1 ∨ σ = -1) : |σ * x| = |x| := by
  rcases hσ with h | h <;> subst h <;> simp

/-- In diamond-polar coordinates the diamond radius is `r`. -/
theorem polar_dn {su sv : ℝ} (hsu : su = 1 ∨ su = -1) (hsv : sv = 1 ∨ sv = -1) {r s : ℝ}
    (hr : 0 ≤ r) (hs : 0 ≤ s ∧ s ≤ 1) :
    |polar su sv r s 0| + |polar su sv r s 1| = r := by
  rw [polar_apply_zero, polar_apply_one, abs_sign_mul hsu, abs_sign_mul hsv,
    abs_of_nonneg (mul_nonneg hr hs.1), abs_of_nonneg (mul_nonneg hr (by linarith [hs.2]))]
  ring

theorem IsSign.real {σ : ℚ} (h : IsSign σ) : (σ : ℝ) = 1 ∨ (σ : ℝ) = -1 := by
  rcases h with h | h <;> subst h <;> simp

/-- **Lower bound for the charge sum.** -/
theorem smin_le_chargeSum {L : List Chg} (hL : allNonneg L = true) {B : Box} {z : Fin 2 → ℝ}
    (hz0 : (B.u0 : ℝ) ≤ z 0 ∧ z 0 ≤ B.u1) (hz1 : (B.v0 : ℝ) ≤ z 1 ∧ z 1 ≤ B.v1)
    (hne : ∀ ch ∈ L, 0 < |z 0 - ch.p| + |z 1 - ch.q|) :
    ((smin L B : ℚ) : ℝ) ≤ chargeSum L z := by
  unfold smin chargeSum
  rw [Rat.cast_list_sum, List.map_map]
  refine list_sum_le_sum fun ch hch => ?_
  have hb : (0 : ℝ) ≤ ch.b := by
    have := List.all_eq_true.1 hL ch hch
    exact_mod_cast (of_decide_eq_true this)
  obtain ⟨-, hdmax⟩ := dist_bounds B ch.p ch.q hz0.1 hz0.2 hz1.1 hz1.2
  have hd := hne ch hch
  simp only [Function.comp_apply]
  calc ((floorK (ch.b / dmax B ch.p ch.q) : ℚ) : ℝ) ≤ ((ch.b / dmax B ch.p ch.q : ℚ) : ℝ) := by
        exact_mod_cast floorK_le _
    _ ≤ (ch.b : ℝ) / (|z 0 - ch.p| + |z 1 - ch.q|) := by
        push_cast
        rcases eq_or_lt_of_le ((le_of_lt hd).trans hdmax) with h0 | hpos
        · rw [← h0, div_zero]
          exact div_nonneg hb hd.le
        · exact div_le_div_of_nonneg_left hb hd hdmax

/-- **Upper bound for the charge sum.** -/
theorem chargeSum_le_smax {L : List Chg} (hL : allNonneg L = true) {B : Box}
    (hpos : allPos L B = true) {z : Fin 2 → ℝ}
    (hz0 : (B.u0 : ℝ) ≤ z 0 ∧ z 0 ≤ B.u1) (hz1 : (B.v0 : ℝ) ≤ z 1 ∧ z 1 ≤ B.v1) :
    chargeSum L z ≤ ((smax L B : ℚ) : ℝ) := by
  unfold smax chargeSum
  rw [Rat.cast_list_sum, List.map_map]
  refine list_sum_le_sum fun ch hch => ?_
  have hb : (0 : ℝ) ≤ ch.b := by
    have := List.all_eq_true.1 hL ch hch
    exact_mod_cast (of_decide_eq_true this)
  have hdm : (0 : ℝ) < dmin B ch.p ch.q := by
    have := List.all_eq_true.1 hpos ch hch
    exact_mod_cast (of_decide_eq_true this)
  obtain ⟨hdmin, -⟩ := dist_bounds B ch.p ch.q hz0.1 hz0.2 hz1.1 hz1.2
  simp only [Function.comp_apply]
  calc (ch.b : ℝ) / (|z 0 - ch.p| + |z 1 - ch.q|) ≤ (ch.b : ℝ) / (dmin B ch.p ch.q : ℚ) :=
        div_le_div_of_nonneg_left hb hdm hdmin
    _ = ((ch.b / dmin B ch.p ch.q : ℚ) : ℝ) := by push_cast; rfl
    _ ≤ ((ceilK (ch.b / dmin B ch.p ch.q) : ℚ) : ℝ) := by exact_mod_cast le_ceilK _

theorem smin_nonneg {L : List Chg} (hL : allNonneg L = true) (B : Box) : 0 ≤ smin L B := by
  unfold smin
  refine List.sum_nonneg fun x hx => ?_
  obtain ⟨ch, hch, rfl⟩ := List.mem_map.1 hx
  have hb : 0 ≤ ch.b := of_decide_eq_true (List.all_eq_true.1 hL ch hch)
  unfold floorK
  have hq : 0 ≤ ch.b / dmax B ch.p ch.q := by
    unfold dmax
    exact div_nonneg hb (add_nonneg (le_max_of_le_left (abs_nonneg _))
      (le_max_of_le_left (abs_nonneg _)))
  have : (0 : ℤ) ≤ ⌊ch.b / dmax B ch.p ch.q * sc⌋ :=
    Int.floor_nonneg.2 (mul_nonneg hq sc_pos.le)
  exact div_nonneg (by exact_mod_cast this) sc_pos.le

/-- On a cell, `r ψ = a − r (c + S)` for `r > 0`. -/
theorem mul_psiL_polar {a c : ℚ} {L : List Chg} {su sv r s : ℝ} (hsu : su = 1 ∨ su = -1)
    (hsv : sv = 1 ∨ sv = -1) (hr : 0 < r) (hs : 0 ≤ s ∧ s ≤ 1) :
    r * psiL a c L (polar su sv r s) = a - r * (c + chargeSum L (polar su sv r s)) := by
  unfold psiL
  rw [polar_dn hsu hsv hr.le hs]
  field_simp
  ring

end CenteredMaximal.General
