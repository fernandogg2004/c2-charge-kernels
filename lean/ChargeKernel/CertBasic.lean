/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.DiamondPolar
public import Mathlib.Algebra.Order.Floor.Ring
public import Mathlib.Data.Rat.Floor

/-!
# Exact arithmetic for the numerical certificates: rounding, boxes, distances

Everything is computed in `ℚ`. Reciprocals are rounded to multiples of `2⁻³⁰` in the safe
direction (`floorK`, `ceilK`). A cell `[r₀, r₁] × [s₀, s₁]` of diamond-polar coordinates in the
quadrant `(σu, σv)` is enclosed in a box `[u₀, u₁] × [v₀, v₁]`, and the ℓ¹ distance from a point of
the box to a charge `(p, q)` lies in `[dmin, dmax]`.
-/

@[expose] public section

noncomputable section

namespace CenteredMaximal.General

/-- A charge: position `(p, q)` and strength `b`. -/
structure Chg where
  p : ℚ
  q : ℚ
  b : ℚ
deriving DecidableEq

/-- The rounding scale `2³⁰`. -/
def sc : ℚ := 2 ^ 30

/-- Round down to a multiple of `2⁻³⁰`. -/
def floorK (x : ℚ) : ℚ := (⌊x * sc⌋ : ℚ) / sc

/-- Round up to a multiple of `2⁻³⁰`. -/
def ceilK (x : ℚ) : ℚ := (⌈x * sc⌉ : ℚ) / sc

theorem sc_pos : (0 : ℚ) < sc := by unfold sc; positivity

theorem floorK_le (x : ℚ) : floorK x ≤ x := by
  unfold floorK
  rw [div_le_iff₀ sc_pos]
  exact Int.floor_le _

theorem le_ceilK (x : ℚ) : x ≤ ceilK x := by
  unfold ceilK
  rw [le_div_iff₀ sc_pos]
  exact Int.le_ceil _

/-- The enclosing box of a cell. -/
structure Box where
  u0 : ℚ
  u1 : ℚ
  v0 : ℚ
  v1 : ℚ

/-- The box of the cell `[r₀, r₁] × [s₀, s₁]` in the quadrant `(σu, σv)`, `σ = ±1`. -/
def cellBox (su sv r0 r1 s0 s1 : ℚ) : Box :=
  { u0 := if su < 0 then -(r1 * s1) else r0 * s0
    u1 := if su < 0 then -(r0 * s0) else r1 * s1
    v0 := if sv < 0 then -(r1 * (1 - s0)) else r0 * (1 - s1)
    v1 := if sv < 0 then -(r0 * (1 - s1)) else r1 * (1 - s0) }

/-- Lower bound for the ℓ¹ distance from the box to `(p, q)`. -/
def dmin (B : Box) (p q : ℚ) : ℚ :=
  max 0 (max (B.u0 - p) (p - B.u1)) + max 0 (max (B.v0 - q) (q - B.v1))

/-- Upper bound for the ℓ¹ distance from the box to `(p, q)`. -/
def dmax (B : Box) (p q : ℚ) : ℚ :=
  max |B.u0 - p| |B.u1 - p| + max |B.v0 - q| |B.v1 - q|

/-- A sign is `1` or `-1`. -/
def IsSign (σ : ℚ) : Prop := σ = 1 ∨ σ = -1

/-- One coordinate of the distance bounds. -/
theorem coord_bounds {x x0 x1 p : ℝ} (h0 : x0 ≤ x) (h1 : x ≤ x1) :
    max 0 (max (x0 - p) (p - x1)) ≤ |x - p| ∧ |x - p| ≤ max |x0 - p| |x1 - p| := by
  constructor
  · refine max_le (abs_nonneg _) (max_le ?_ ?_)
    · exact (by linarith : x0 - p ≤ x - p).trans (le_abs_self _)
    · exact (by linarith : p - x1 ≤ -(x - p)).trans (neg_le_abs _)
  · rcases le_total p x with hpx | hpx
    · rw [abs_of_nonneg (sub_nonneg.2 hpx)]
      exact (by linarith : x - p ≤ x1 - p).trans ((le_abs_self _).trans (le_max_right _ _))
    · rw [abs_of_nonpos (sub_nonpos.2 hpx)]
      exact (by linarith : -(x - p) ≤ -(x0 - p)).trans ((neg_le_abs _).trans (le_max_left _ _))

/-- **Distance bounds**: for a point of the box, `dmin ≤ |u − p| + |v − q| ≤ dmax`. -/
theorem dist_bounds (B : Box) (p q : ℚ) {u v : ℝ} (hu0 : (B.u0 : ℝ) ≤ u) (hu1 : u ≤ B.u1)
    (hv0 : (B.v0 : ℝ) ≤ v) (hv1 : v ≤ B.v1) :
    ((dmin B p q : ℚ) : ℝ) ≤ |u - p| + |v - q| ∧ |u - p| + |v - q| ≤ ((dmax B p q : ℚ) : ℝ) := by
  obtain ⟨a1, a2⟩ := coord_bounds (p := (p : ℝ)) hu0 hu1
  obtain ⟨b1, b2⟩ := coord_bounds (p := (q : ℝ)) hv0 hv1
  unfold dmin dmax
  push_cast
  exact ⟨add_le_add a1 b1, add_le_add a2 b2⟩

/-- **The box contains the cell's image.** -/
theorem mem_cellBox {su sv r0 r1 s0 s1 : ℚ} (hsu : IsSign su) (hsv : IsSign sv)
    (hr0 : 0 ≤ r0) (hs0 : 0 ≤ s0) (hs1 : s1 ≤ 1) {r s : ℝ} (hr : (r0 : ℝ) ≤ r ∧ r ≤ r1)
    (hs : (s0 : ℝ) ≤ s ∧ s ≤ s1) :
    let B := cellBox su sv r0 r1 s0 s1
    ((B.u0 : ℝ) ≤ su * (r * s) ∧ su * (r * s) ≤ B.u1) ∧
      ((B.v0 : ℝ) ≤ sv * (r * (1 - s)) ∧ sv * (r * (1 - s)) ≤ B.v1) := by
  intro B
  have hr0' : (0 : ℝ) ≤ r0 := by exact_mod_cast hr0
  have hs0' : (0 : ℝ) ≤ s0 := by exact_mod_cast hs0
  have hs1' : (s1 : ℝ) ≤ 1 := by exact_mod_cast hs1
  have hrs0 : (r0 : ℝ) * s0 ≤ r * s := mul_le_mul hr.1 hs.1 hs0' (hr0'.trans hr.1)
  have hrs1 : r * s ≤ (r1 : ℝ) * s1 :=
    mul_le_mul hr.2 hs.2 (hs0'.trans hs.1) (hr0'.trans (hr.1.trans hr.2))
  have hw0 : (r0 : ℝ) * (1 - s1) ≤ r * (1 - s) :=
    mul_le_mul hr.1 (by linarith [hs.2]) (by linarith) (hr0'.trans hr.1)
  have hw1 : r * (1 - s) ≤ (r1 : ℝ) * (1 - s0) :=
    mul_le_mul hr.2 (by linarith [hs.1]) (by linarith [hs.2]) (hr0'.trans (hr.1.trans hr.2))
  refine ⟨?_, ?_⟩
  · rcases hsu with h | h
    · have e0 : ((B.u0 : ℚ) : ℝ) = (r0 : ℝ) * s0 := by
        simp only [B, cellBox, h, show ¬ ((1 : ℚ) < 0) by norm_num, if_false]; push_cast; ring
      have e1 : ((B.u1 : ℚ) : ℝ) = (r1 : ℝ) * s1 := by
        simp only [B, cellBox, h, show ¬ ((1 : ℚ) < 0) by norm_num, if_false]; push_cast; ring
      rw [e0, e1, h]; push_cast
      constructor <;> linarith
    · have e0 : ((B.u0 : ℚ) : ℝ) = -((r1 : ℝ) * s1) := by
        simp only [B, cellBox, h, show ((-1 : ℚ) < 0) by norm_num, if_true]; push_cast; ring
      have e1 : ((B.u1 : ℚ) : ℝ) = -((r0 : ℝ) * s0) := by
        simp only [B, cellBox, h, show ((-1 : ℚ) < 0) by norm_num, if_true]; push_cast; ring
      rw [e0, e1, h]; push_cast
      constructor <;> linarith
  · rcases hsv with h | h
    · have e0 : ((B.v0 : ℚ) : ℝ) = (r0 : ℝ) * (1 - s1) := by
        simp only [B, cellBox, h, show ¬ ((1 : ℚ) < 0) by norm_num, if_false]; push_cast; ring
      have e1 : ((B.v1 : ℚ) : ℝ) = (r1 : ℝ) * (1 - s0) := by
        simp only [B, cellBox, h, show ¬ ((1 : ℚ) < 0) by norm_num, if_false]; push_cast; ring
      rw [e0, e1, h]; push_cast
      constructor <;> linarith
    · have e0 : ((B.v0 : ℚ) : ℝ) = -((r1 : ℝ) * (1 - s0)) := by
        simp only [B, cellBox, h, show ((-1 : ℚ) < 0) by norm_num, if_true]; push_cast; ring
      have e1 : ((B.v1 : ℚ) : ℝ) = -((r0 : ℝ) * (1 - s1)) := by
        simp only [B, cellBox, h, show ((-1 : ℚ) < 0) by norm_num, if_true]; push_cast; ring
      rw [e0, e1, h]; push_cast
      constructor <;> linarith

/-- **The tangent inequality** `b/t ≥ α − β t` for `t > 0`, from `α² ≤ 4 b β`, `β ≥ 0`, `b ≥ 0`. -/
theorem tangent_le {b α β t : ℝ} (hb : 0 ≤ b) (hβ : 0 ≤ β) (hdisc : α ^ 2 ≤ 4 * b * β)
    (ht : 0 < t) : α - β * t ≤ b / t := by
  rw [le_div_iff₀ ht]
  rcases eq_or_lt_of_le hβ with h0 | hpos
  · subst h0
    have : α ^ 2 ≤ 0 := by linarith
    have hα : α = 0 := by nlinarith [sq_nonneg α]
    subst hα
    simp
    exact hb
  · nlinarith [sq_nonneg (2 * β * t - α), mul_pos hpos ht]

end CenteredMaximal.General
