/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertPoly

/-!
# The certificate checker and its soundness

`v2val` sums certified upper bounds for `∫∫ max(r ψ, 0) dr ds` over the leaves of a quadtree of
diamond-polar cells; `v1ok` certifies `ψ ≥ m` on every leaf of a second quadtree.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

/-! ### First-order leaf bounds -/

/-- Coefficients of the first-order bounding polynomial (zero, linear, or chord). -/
def j1Coef (a c : ℚ) (L : List Chg) (B : Box) (r0 r1 : ℚ) : ℚ × ℚ × ℚ × ℚ :=
  let k := c + smin L B
  if a - r0 * k ≤ 0 then (0, 0, 0, 0)
  else if 0 ≤ a - r1 * k then (a, -k, 0, 0)
  else ((a - r0 * k) * r1 / (r1 - r0), -((a - r0 * k) / (r1 - r0)), 0, 0)

/-! ### Tangent leaf bounds -/

/-- Per-charge tangent data `(σ₁, σ₂, α, β)`. -/
def tanOf (B : Box) (ch : Chg) : ℚ × ℚ × ℚ × ℚ :=
  let σ1 : ℚ := if ch.p ≤ B.u0 then 1 else -1
  let σ2 : ℚ := if ch.q ≤ B.v0 then 1 else -1
  let t0 := σ1 * ((B.u0 + B.u1) / 2 - ch.p) + σ2 * ((B.v0 + B.v1) / 2 - ch.q)
  (σ1, σ2, floorK (2 * ch.b / t0), ceilK (ch.b / (t0 * t0)))

def tanOK (B : Box) (ch : Chg) : Bool :=
  let T := tanOf B ch
  (decide (ch.p ≤ B.u0) || decide (B.u1 ≤ ch.p)) && (decide (ch.q ≤ B.v0) || decide (B.v1 ≤ ch.q))
    && decide (T.2.2.1 ^ 2 ≤ 4 * ch.b * T.2.2.2) && decide (0 ≤ T.2.2.2)

def tanA (B : Box) (ch : Chg) : ℚ :=
  let T := tanOf B ch
  T.2.2.1 - T.2.2.2 * (-(T.1 * ch.p) - T.2.1 * ch.q)

def tanB0 (sv : ℚ) (B : Box) (ch : Chg) : ℚ :=
  let T := tanOf B ch; -(T.2.2.2 * (T.2.1 * sv))

def tanB1 (su sv : ℚ) (B : Box) (ch : Chg) : ℚ :=
  let T := tanOf B ch; -(T.2.2.2 * (T.1 * su - T.2.1 * sv))

def tangentOK (a c : ℚ) (L : List Chg) (B : Box) (r1 : ℚ) : Bool :=
  allPos L B && decide (0 ≤ a - r1 * (c + smax L B)) && L.all (tanOK B)

def j2Coef (a c su sv : ℚ) (L : List Chg) (B : Box) : ℚ × ℚ × ℚ × ℚ :=
  (a, -(c + (L.map (tanA B)).sum), -(L.map (tanB0 sv B)).sum, -(L.map (tanB1 su sv B)).sum)

/-- The certified value of a leaf. -/
def leafVal (a c su sv : ℚ) (L : List Chg) (r0 r1 s0 s1 : ℚ) : ℚ :=
  let B := cellBox su sv r0 r1 s0 s1
  let e := j1Coef a c L B r0 r1
  let v1 := polyVal r0 r1 s0 s1 e.1 e.2.1 e.2.2.1 e.2.2.2
  if tangentOK a c L B r1 then
    let f := j2Coef a c su sv L B
    min v1 (polyVal r0 r1 s0 s1 f.1 f.2.1 f.2.2.1 f.2.2.2)
  else v1

/-! ### Pointwise soundness -/

/-- The integrand in diamond-polar coordinates. -/
def Fpolar (a c su sv : ℚ) (L : List Chg) (x : ℝ × ℝ) : ℝ :=
  max (x.1 * psiL a c L (polar su sv x.1 x.2)) 0

theorem Fpolar_nonneg (a c su sv : ℚ) (L : List Chg) (x : ℝ × ℝ) : 0 ≤ Fpolar a c su sv L x :=
  le_max_right _ _

/-- Common hypotheses on a point of a cell. -/
structure InCell (su sv r0 r1 s0 s1 : ℚ) (x : ℝ × ℝ) : Prop where
  hsu : IsSign su
  hsv : IsSign sv
  hr0 : 0 ≤ r0
  hs0 : 0 ≤ s0
  hs1 : s1 ≤ 1
  hr : (r0 : ℝ) < x.1 ∧ x.1 ≤ r1
  hs : (s0 : ℝ) < x.2 ∧ x.2 ≤ s1

theorem InCell.rpos {su sv r0 r1 s0 s1 : ℚ} {x : ℝ × ℝ} (h : InCell su sv r0 r1 s0 s1 x) :
    0 < x.1 := lt_of_le_of_lt (by exact_mod_cast h.hr0) h.hr.1

theorem InCell.s01 {su sv r0 r1 s0 s1 : ℚ} {x : ℝ × ℝ} (h : InCell su sv r0 r1 s0 s1 x) :
    0 ≤ x.2 ∧ x.2 ≤ 1 :=
  ⟨le_of_lt (lt_of_le_of_lt (by exact_mod_cast h.hs0) h.hs.1),
    h.hs.2.trans (by exact_mod_cast h.hs1)⟩

theorem InCell.box {su sv r0 r1 s0 s1 : ℚ} {x : ℝ × ℝ} (h : InCell su sv r0 r1 s0 s1 x) :
    let B := cellBox su sv r0 r1 s0 s1
    ((B.u0 : ℝ) ≤ polar su sv x.1 x.2 0 ∧ polar su sv x.1 x.2 0 ≤ B.u1) ∧
      ((B.v0 : ℝ) ≤ polar su sv x.1 x.2 1 ∧ polar su sv x.1 x.2 1 ≤ B.v1) :=
  mem_cellBox h.hsu h.hsv h.hr0 h.hs0 h.hs1 ⟨h.hr.1.le, h.hr.2⟩ ⟨h.hs.1.le, h.hs.2⟩

/-- `r ψ ≤ a − r (c + smin)` on a cell. -/
theorem mul_psi_le_smin {a c su sv r0 r1 s0 s1 : ℚ} {L : List Chg} (hL : allNonneg L = true)
    {x : ℝ × ℝ} (h : InCell su sv r0 r1 s0 s1 x)
    (hne : ∀ ch ∈ L, 0 < |polar su sv x.1 x.2 0 - ch.p| + |polar su sv x.1 x.2 1 - ch.q|) :
    x.1 * psiL a c L (polar su sv x.1 x.2)
      ≤ a - x.1 * (((c + smin L (cellBox su sv r0 r1 s0 s1) : ℚ) : ℝ)) := by
  rw [mul_psiL_polar h.hsu.real h.hsv.real h.rpos h.s01]
  have hS := smin_le_chargeSum hL h.box.1 h.box.2 hne
  push_cast
  nlinarith [h.rpos]

theorem j1_pointwise {a c su sv r0 r1 s0 s1 : ℚ} {L : List Chg} (hL : allNonneg L = true)
    (hc : 0 ≤ c) {x : ℝ × ℝ} (h : InCell su sv r0 r1 s0 s1 x)
    (hne : ∀ ch ∈ L, 0 < |polar su sv x.1 x.2 0 - ch.p| + |polar su sv x.1 x.2 1 - ch.q|) :
    let e := j1Coef a c L (cellBox su sv r0 r1 s0 s1) r0 r1
    Fpolar a c su sv L x ≤ polyFn e.1 e.2.1 e.2.2.1 e.2.2.2 x := by
  intro e
  set B := cellBox su sv r0 r1 s0 s1 with hB
  set k := c + smin L B with hk
  have hk0 : 0 ≤ k := add_nonneg hc (smin_nonneg hL B)
  have hk0' : (0 : ℝ) ≤ k := by exact_mod_cast hk0
  have hle := mul_psi_le_smin (a := a) (c := c) hL h hne
  rw [← hB, ← hk] at hle
  have hr := h.hr
  unfold Fpolar
  simp only [e, j1Coef, ← hB, ← hk]
  split_ifs with h1 h2
  · -- zero case
    have h1' : (a : ℝ) - r0 * k ≤ 0 := by exact_mod_cast h1
    simp only [polyFn]
    push_cast
    refine max_le ?_ (by simp)
    nlinarith
  · -- linear case
    have h2' : (0 : ℝ) ≤ a - r1 * k := by exact_mod_cast h2
    simp only [polyFn]
    push_cast
    refine max_le ?_ ?_ <;> nlinarith
  · -- chord case
    have h1' : (0 : ℝ) < a - r0 * k := by
      have : ¬ ((a : ℝ) - r0 * k ≤ 0) := by exact_mod_cast h1
      linarith
    have h2' : (a : ℝ) - r1 * k < 0 := by
      have : ¬ ((0 : ℝ) ≤ a - r1 * k) := by exact_mod_cast h2
      linarith
    have hΔ : (0 : ℝ) < r1 - r0 := by nlinarith
    have hΔq : (r1 : ℚ) - r0 ≠ 0 := by
      have : (0 : ℚ) < r1 - r0 := by exact_mod_cast hΔ
      exact this.ne'
    simp only [polyFn]
    push_cast
    have hchord : (((a : ℝ) - r0 * k) * r1 / (r1 - r0)) + (-((a - r0 * k) / (r1 - r0))) * x.1
        = (a - r0 * k) * (r1 - x.1) / (r1 - r0) := by
      field_simp
      ring
    rw [show ((((a : ℝ) - r0 * k) * r1 / (r1 - r0)) + (-((a - r0 * k) / (r1 - r0))) * x.1
        + 0 * x.1 ^ 2 + 0 * (x.1 ^ 2 * x.2)) = (a - r0 * k) * (r1 - x.1) / (r1 - r0) by
      rw [← hchord]; ring]
    refine max_le ?_ (div_nonneg (mul_nonneg h1'.le (by linarith)) hΔ.le)
    rw [le_div_iff₀ hΔ]
    nlinarith

/-- The tangent sums, as an affine function of the point. -/
theorem tangent_sum {L : List Chg} {B : Box} {su sv : ℚ} (r s : ℝ) :
    (L.map fun ch => (((tanOf B ch).2.2.1 : ℚ) : ℝ) - ((tanOf B ch).2.2.2 : ℝ) *
        ((tanOf B ch).1 * (su * (r * s) - ch.p) + (tanOf B ch).2.1 * (sv * (r * (1 - s)) - ch.q))).sum
      = (L.map fun ch => ((tanA B ch : ℚ) : ℝ)).sum + r * (L.map fun ch => ((tanB0 sv B ch : ℚ) : ℝ)).sum
          + r * s * (L.map fun ch => ((tanB1 su sv B ch : ℚ) : ℝ)).sum := by
  induction L with
  | nil => simp
  | cons ch rest ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [ih]
    simp only [tanA, tanB0, tanB1]
    push_cast
    ring

theorem cast_map_sum (L : List Chg) (f : Chg → ℚ) :
    (((L.map f).sum : ℚ) : ℝ) = (L.map fun ch => ((f ch : ℚ) : ℝ)).sum := by
  rw [Rat.cast_list_sum, List.map_map]
  rfl

theorem j2_pointwise {a c su sv r0 r1 s0 s1 : ℚ} {L : List Chg} (hL : allNonneg L = true)
    (hc : 0 ≤ c) {x : ℝ × ℝ} (h : InCell su sv r0 r1 s0 s1 x)
    (hok : tangentOK a c L (cellBox su sv r0 r1 s0 s1) r1 = true) :
    let f := j2Coef a c su sv L (cellBox su sv r0 r1 s0 s1)
    Fpolar a c su sv L x ≤ polyFn f.1 f.2.1 f.2.2.1 f.2.2.2 x := by
  intro f
  set B := cellBox su sv r0 r1 s0 s1 with hB
  simp only [tangentOK, Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hpos, hposv⟩, htan⟩ := hok
  have hbox := h.box
  rw [← hB] at hbox
  set z := polar su sv x.1 x.2 with hz
  have hr := h.rpos
  -- the charge sum is between the tangent lower bound and `smax`
  have hSmax := chargeSum_le_smax hL hpos hbox.1 hbox.2
  have hS : ((L.map (tanA B)).sum : ℝ) + x.1 * ((L.map (tanB0 sv B)).sum : ℝ)
      + x.1 * x.2 * ((L.map (tanB1 su sv B)).sum : ℝ) ≤ chargeSum L z := by
    rw [cast_map_sum, cast_map_sum, cast_map_sum,
      ← tangent_sum (L := L) (B := B) (su := su) (sv := sv) x.1 x.2]
    unfold chargeSum
    refine list_sum_le_sum fun ch hch => ?_
    have hb : (0 : ℝ) ≤ ch.b := by
      exact_mod_cast of_decide_eq_true (List.all_eq_true.1 hL ch hch)
    have hT := List.all_eq_true.1 htan ch hch
    simp only [tanOK, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at hT
    obtain ⟨⟨⟨hu, hv⟩, hdisc⟩, hβ⟩ := hT
    have hdm : (0 : ℝ) < dmin B ch.p ch.q := by
      exact_mod_cast of_decide_eq_true (List.all_eq_true.1 hpos ch hch)
    obtain ⟨hd, -⟩ := dist_bounds B ch.p ch.q hbox.1.1 hbox.1.2 hbox.2.1 hbox.2.2
    -- the signed form of the distance
    have hσu : |z 0 - ch.p| = (tanOf B ch).1 * (z 0 - ch.p) := by
      simp only [tanOf]
      split_ifs with hp
      · have : (ch.p : ℝ) ≤ z 0 := (by exact_mod_cast hp : (ch.p : ℝ) ≤ B.u0).trans hbox.1.1
        rw [abs_of_nonneg (by linarith)]; push_cast; ring
      · have hp' : B.u1 ≤ ch.p := hu.resolve_left hp
        have : z 0 ≤ (ch.p : ℝ) := hbox.1.2.trans (by exact_mod_cast hp')
        rw [abs_of_nonpos (by linarith)]; push_cast; ring
    have hσv : |z 1 - ch.q| = (tanOf B ch).2.1 * (z 1 - ch.q) := by
      simp only [tanOf]
      split_ifs with hq
      · have : (ch.q : ℝ) ≤ z 1 := (by exact_mod_cast hq : (ch.q : ℝ) ≤ B.v0).trans hbox.2.1
        rw [abs_of_nonneg (by linarith)]; push_cast; ring
      · have hq' : B.v1 ≤ ch.q := hv.resolve_left hq
        have : z 1 ≤ (ch.q : ℝ) := hbox.2.2.trans (by exact_mod_cast hq')
        rw [abs_of_nonpos (by linarith)]; push_cast; ring
    have ht := tangent_le (b := (ch.b : ℝ)) (α := (tanOf B ch).2.2.1) (β := (tanOf B ch).2.2.2)
      (t := |z 0 - ch.p| + |z 1 - ch.q|) hb (by exact_mod_cast hβ)
      (by exact_mod_cast hdisc) (lt_of_lt_of_le hdm hd)
    rw [hσu, hσv] at ht
    rw [hσu, hσv]
    simp only [hz, polar_apply_zero, polar_apply_one] at ht ⊢
    exact ht
  -- positivity of `r ψ` and the bound
  have hrpsi := mul_psiL_polar (a := a) (c := c) (L := L) h.hsu.real h.hsv.real hr h.s01
  rw [← hz] at hrpsi
  have hc' : (0 : ℝ) ≤ c := by exact_mod_cast hc
  have hS0 : 0 ≤ chargeSum L z := by
    unfold chargeSum
    refine List.sum_nonneg fun y hy => ?_
    obtain ⟨ch, hch, rfl⟩ := List.mem_map.1 hy
    have hb : (0 : ℝ) ≤ ch.b := by
      exact_mod_cast of_decide_eq_true (List.all_eq_true.1 hL ch hch)
    exact div_nonneg hb (add_nonneg (abs_nonneg _) (abs_nonneg _))
  have hposv' : (0 : ℝ) ≤ a - r1 * (c + smax L B) := by exact_mod_cast hposv
  have hr1 : x.1 ≤ r1 := h.hr.2
  have hnn : 0 ≤ x.1 * psiL a c L z := by
    rw [hrpsi]
    have : x.1 * (c + chargeSum L z) ≤ (r1 : ℝ) * (c + smax L B) := by
      have h1 : x.1 * (c + chargeSum L z) ≤ (r1 : ℝ) * (c + chargeSum L z) :=
        mul_le_mul_of_nonneg_right hr1 (by linarith)
      have h2 : (r1 : ℝ) * (c + chargeSum L z) ≤ (r1 : ℝ) * (c + smax L B) :=
        mul_le_mul_of_nonneg_left (by push_cast; linarith) (hr.le.trans hr1)
      push_cast at h2 ⊢
      linarith
    push_cast at hposv' this
    linarith
  unfold Fpolar
  rw [max_eq_left hnn, hrpsi]
  have key := mul_le_mul_of_nonneg_left hS hr.le
  simp only [f, j2Coef, polyFn]
  push_cast at key ⊢
  nlinarith [key]

/-! ### Null sets -/

/-- Off a null set of the `r` variable, no point of the cell is a charge. -/
theorem ae_ne_charge {su sv r0 r1 s0 s1 : ℚ} (hsu : IsSign su) (hsv : IsSign sv) (hr0 : 0 ≤ r0)
    (hs0 : 0 ≤ s0) (hs1 : s1 ≤ 1) (L : List Chg) :
    ∀ᵐ x ∂(((volume : Measure ℝ).prod volume).restrict (Ioc (r0 : ℝ) r1 ×ˢ Ioc (s0 : ℝ) s1)),
      ∀ ch ∈ L, 0 < |polar su sv x.1 x.2 0 - ch.p| + |polar su sv x.1 x.2 1 - ch.q| := by
  set T : Set ℝ := (fun ch : Chg => |(ch.p : ℝ)| + |(ch.q : ℝ)|) '' {ch | ch ∈ L} with hT
  have hTfin : T.Finite := L.finite_toSet.image _
  have hnull : ((volume : Measure ℝ).prod (volume : Measure ℝ)) (T ×ˢ (univ : Set ℝ)) = 0 := by
    rw [Measure.prod_prod, hTfin.measure_zero (volume : Measure ℝ), zero_mul]
  have hae : ∀ᵐ x ∂((volume : Measure ℝ).prod (volume : Measure ℝ)), x.1 ∉ T := by
    refine measure_mono_null (fun x hx => ?_) hnull
    exact ⟨by simpa using hx, mem_univ _⟩
  filter_upwards [ae_restrict_of_ae hae, ae_restrict_mem (measurableSet_Ioc.prod measurableSet_Ioc)]
    with x hxT hx ch hch
  have hin : InCell su sv r0 r1 s0 s1 x :=
    ⟨hsu, hsv, hr0, hs0, hs1, ⟨hx.1.1, hx.1.2⟩, ⟨hx.2.1, hx.2.2⟩⟩
  by_contra hle
  push_neg at hle
  have a0 := abs_nonneg (polar su sv x.1 x.2 0 - ch.p)
  have a1 := abs_nonneg (polar su sv x.1 x.2 1 - ch.q)
  have h0 : |polar su sv x.1 x.2 0 - ch.p| = 0 := le_antisymm (by linarith) a0
  have h1 : |polar su sv x.1 x.2 1 - ch.q| = 0 := le_antisymm (by linarith) a1
  rw [abs_eq_zero, sub_eq_zero] at h0 h1
  have hdn := polar_dn hin.hsu.real hin.hsv.real hin.rpos.le hin.s01
  rw [h0, h1] at hdn
  exact hxT ⟨ch, hch, hdn⟩

end CenteredMaximal.General
