/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertNat
public import ChargeKernel.CertSym

/-!
# The natural-number checker computes exactly the rational checker

For decoded data, `nChk` returns the value of `v2chk` multiplied by `6 · 2^105`, and `nV1 = true`
implies `v1ok = true`. Hence a kernel evaluation of the natural-number checker certifies the same
statement as the rational one, and the soundness theorem `c2_le_of_cert_sym` applies.
-/

@[expose] public section

noncomputable section

namespace CenteredMaximal.General

/-! ### Decoding -/

/-- The tree `QTree` with the same shape. -/
def NTree.toQ : NTree → QTree
  | .leaf => .leaf
  | .node t1 t2 t3 t4 => .node t1.toQ t2.toQ t3.toQ t4.toQ

/-- Decoding an offset position. -/
def decP (P : ℕ) : ℚ := ((P : ℚ) - (nOff : ℕ)) / 2 ^ 22

/-- Decoding the charge list. -/
def NCL.toList : NCL → List Chg
  | .nil => []
  | .cons P Q B t => ⟨decP P, decP Q, (B : ℚ) / 2 ^ 52⟩ :: t.toList

theorem nd_cast (x y : ℕ) : ((nd x y : ℕ) : ℚ) = |(x : ℚ) - y| := by
  unfold nd
  rcases le_total x y with h | h
  · rw [Nat.sub_eq_zero_of_le h, zero_add, Nat.cast_sub h, abs_of_nonpos (by linarith [(Nat.cast_le (α := ℚ)).2 h])]
    ring
  · rw [Nat.sub_eq_zero_of_le h, add_zero, Nat.cast_sub h, abs_of_nonneg (by linarith [(Nat.cast_le (α := ℚ)).2 h])]

theorem decP_sub (x y : ℕ) : decP x - decP y = ((x : ℚ) - y) / 2 ^ 22 := by
  unfold decP; ring

theorem abs_decP_sub (x y : ℕ) : |decP x - decP y| = ((nd x y : ℕ) : ℚ) / 2 ^ 22 := by
  rw [decP_sub, nd_cast, abs_div, abs_of_pos (by positivity : (0 : ℚ) < 2 ^ 22)]

theorem decP_le (x y : ℕ) : decP x ≤ decP y ↔ x ≤ y := by
  unfold decP
  rw [div_le_div_iff_of_pos_right (by positivity), sub_le_sub_iff_right, Nat.cast_le]

/-- The positive part of a one-dimensional gap, for `x₀ ≤ x₁`. -/
theorem gap_cast {x0 x1 p : ℕ} (h : x0 ≤ x1) :
    (((x0 - p) + (p - x1) : ℕ) : ℚ) = max 0 (max ((x0 : ℚ) - p) ((p : ℚ) - x1)) := by
  have h' : (x0 : ℚ) ≤ x1 := by exact_mod_cast h
  rcases le_total p x0 with h1 | h1
  · rw [Nat.sub_eq_zero_of_le (h1.trans h), add_zero, Nat.cast_sub h1]
    have : (p : ℚ) ≤ x0 := by exact_mod_cast h1
    simp only [max_def]; split_ifs <;> linarith
  · rcases le_total p x1 with h2 | h2
    · rw [Nat.sub_eq_zero_of_le h1, Nat.sub_eq_zero_of_le h2, add_zero, Nat.cast_zero]
      have a1 : (x0 : ℚ) ≤ p := by exact_mod_cast h1
      have a2 : (p : ℚ) ≤ x1 := by exact_mod_cast h2
      simp only [max_def]; split_ifs <;> linarith
    · rw [Nat.sub_eq_zero_of_le (h.trans h2), zero_add, Nat.cast_sub h2]
      have : (x1 : ℚ) ≤ p := by exact_mod_cast h2
      simp only [max_def]; split_ifs <;> linarith

/-- A box given by offset natural coordinates. -/
def nBox (U0 U1 V0 V1 : ℕ) : Box := ⟨decP U0, decP U1, decP V0, decP V1⟩

/-- The natural-number `dmax` (scaled by `2^22`). -/
def ndmax (U0 U1 V0 V1 P Q : ℕ) : ℕ := Nat.max (nd U0 P) (nd U1 P) + Nat.max (nd V0 Q) (nd V1 Q)

/-- The natural-number `dmin` (scaled by `2^22`). -/
def ndmin (U0 U1 V0 V1 P Q : ℕ) : ℕ := (U0 - P) + (P - U1) + (V0 - Q) + (Q - V1)

theorem dmax_nBox (U0 U1 V0 V1 P Q : ℕ) :
    dmax (nBox U0 U1 V0 V1) (decP P) (decP Q) = ((ndmax U0 U1 V0 V1 P Q : ℕ) : ℚ) / 2 ^ 22 := by
  unfold dmax ndmax nBox
  simp only [abs_decP_sub, Nat.cast_add, Nat.cast_max]
  rw [max_div_div_right (by positivity), max_div_div_right (by positivity), add_div]

theorem dmin_nBox {U0 U1 V0 V1 : ℕ} (hU : U0 ≤ U1) (hV : V0 ≤ V1) (P Q : ℕ) :
    dmin (nBox U0 U1 V0 V1) (decP P) (decP Q) = ((ndmin U0 U1 V0 V1 P Q : ℕ) : ℚ) / 2 ^ 22 := by
  unfold dmin ndmin nBox
  have e : (((U0 - P) + (P - U1) + (V0 - Q) + (Q - V1) : ℕ) : ℚ) =
      (((U0 - P) + (P - U1) : ℕ) : ℚ) + (((V0 - Q) + (Q - V1) : ℕ) : ℚ) := by push_cast; ring
  rw [e, gap_cast hU, gap_cast hV, add_div]
  simp only [show ∀ x y : ℕ, decP y - decP x = ((y : ℚ) - x) / 2 ^ 22 from
    fun x y => decP_sub y x]
  have h22 : (0 : ℚ) < 2 ^ 22 := by positivity
  rw [← max_div_div_right h22.le, ← max_div_div_right h22.le, zero_div, ← max_div_div_right h22.le,
    ← max_div_div_right h22.le, zero_div]

/-! ### Rounded reciprocals -/

theorem floorK_nat (B D : ℕ) :
    floorK (((B : ℚ) / 2 ^ 52) / ((D : ℚ) / 2 ^ 22)) = ((B / D : ℕ) : ℚ) / 2 ^ 30 := by
  unfold floorK sc
  have : ((B : ℚ) / 2 ^ 52) / ((D : ℚ) / 2 ^ 22) * 2 ^ 30 = (B : ℚ) / D := by
    rcases eq_or_ne (D : ℚ) 0 with h | h
    · rw [h]; simp
    · field_simp
  rw [this, Rat.floor_natCast_div_natCast]
  push_cast; rfl

theorem ceil_nat_div (B D : ℕ) : ⌈(B : ℚ) / D⌉ = (((B + D - 1) / D : ℕ) : ℤ) := by
  rcases Nat.eq_zero_or_pos D with h | h
  · subst h; simp
  rw [Int.ceil_eq_iff]
  have hD : (0 : ℚ) < D := by exact_mod_cast h
  have h1 := Nat.div_mul_le_self (B + D - 1) D
  have h2 := Nat.lt_div_mul_add (a := B + D - 1) h
  set n := (B + D - 1) / D
  have e1 : B ≤ n * D := by omega
  have e2 : n * D < B + D := by omega
  have e1' : (B : ℚ) ≤ n * D := by exact_mod_cast e1
  have e2' : (n : ℚ) * D < B + D := by exact_mod_cast e2
  push_cast
  constructor
  · rw [lt_div_iff₀ hD]; linarith
  · rw [div_le_iff₀ hD]; linarith

theorem ceilK_nat (B D : ℕ) :
    ceilK (((B : ℚ) / 2 ^ 52) / ((D : ℚ) / 2 ^ 22)) = (((B + D - 1) / D : ℕ) : ℚ) / 2 ^ 30 := by
  unfold ceilK sc
  have : ((B : ℚ) / 2 ^ 52) / ((D : ℚ) / 2 ^ 22) * 2 ^ 30 = (B : ℚ) / D := by
    rcases eq_or_ne (D : ℚ) 0 with h | h
    · rw [h]; simp
    · field_simp
  rw [this, ceil_nat_div]
  push_cast; rfl

/-! ### The first pass -/

theorem pass1_spec {U0 U1 V0 V1 : ℕ} (hU : U0 ≤ U1) (hV : V0 ≤ V1) (l : NCL) :
    ∀ (a b : ℕ) (c : Bool),
      ((pass1 U0 U1 V0 V1 l a b c).smin : ℚ) = a + 2 ^ 30 * smin l.toList (nBox U0 U1 V0 V1) ∧
      ((pass1 U0 U1 V0 V1 l a b c).smax : ℚ) = b + 2 ^ 30 * smax l.toList (nBox U0 U1 V0 V1) ∧
      (pass1 U0 U1 V0 V1 l a b c).pos = (c && allPos l.toList (nBox U0 U1 V0 V1)) := by
  induction l with
  | nil => intro a b c; simp [pass1, NCL.toList, smin, smax, allPos]
  | cons P Q B t ih =>
    intro a b c
    obtain ⟨h1, h2, h3⟩ := ih (a + B / ndmax U0 U1 V0 V1 P Q)
      (b + (B + ndmin U0 U1 V0 V1 P Q - 1) / ndmin U0 U1 V0 V1 P Q)
      (c && Nat.blt 0 (ndmin U0 U1 V0 V1 P Q))
    have hm := dmax_nBox U0 U1 V0 V1 P Q
    have hn := dmin_nBox hU hV P Q
    have hstep : pass1 U0 U1 V0 V1 (.cons P Q B t) a b c = pass1 U0 U1 V0 V1 t
        (a + B / ndmax U0 U1 V0 V1 P Q)
        (b + (B + ndmin U0 U1 V0 V1 P Q - 1) / ndmin U0 U1 V0 V1 P Q)
        (c && Nat.blt 0 (ndmin U0 U1 V0 V1 P Q)) := rfl
    rw [hstep]
    refine ⟨?_, ?_, ?_⟩
    · rw [h1]
      simp only [NCL.toList, smin, List.map_cons, List.sum_cons]
      rw [hm, floorK_nat]
      push_cast; ring
    · rw [h2]
      simp only [NCL.toList, smax, List.map_cons, List.sum_cons]
      rw [hn, ceilK_nat]
      push_cast; ring
    · rw [h3]
      simp only [NCL.toList, allPos, List.all_cons]
      rw [hn]
      have : decide ((0 : ℚ) < ((ndmin U0 U1 V0 V1 P Q : ℕ) : ℚ) / 2 ^ 22) =
          Nat.blt 0 (ndmin U0 U1 V0 V1 P Q) := by
        rw [Bool.eq_iff_iff, decide_eq_true_iff, Nat.blt_eq, div_pos_iff_of_pos_right (by positivity),
          Nat.cast_pos]
      rw [this, Bool.and_assoc]

/-! ### The tangent pass -/

theorem floorK_eq {x : ℚ} {n d : ℕ} (h : x * 2 ^ 30 = (n : ℚ) / d) :
    floorK x = ((n / d : ℕ) : ℚ) / 2 ^ 30 := by
  unfold floorK sc
  rw [h, Rat.floor_natCast_div_natCast]
  push_cast; rfl

theorem ceilK_eq {x : ℚ} {n d : ℕ} (h : x * 2 ^ 30 = (n : ℚ) / d) :
    ceilK x = (((n + d - 1) / d : ℕ) : ℚ) / 2 ^ 30 := by
  unfold ceilK sc
  rw [h, ceil_nat_div]
  push_cast; rfl

/-- The decoded charge. -/
def nChg (P Q B : ℕ) : Chg := ⟨decP P, decP Q, (B : ℚ) / 2 ^ 52⟩

/-- Signed half-gap: `σ · ((x₀ + x₁)/2 - p)` equals `|x₀ + x₁ - 2p| / 2^23` when `p` is outside. -/
theorem sigma_mid {x0 x1 p : ℕ} (h : x0 ≤ x1) (hp : p ≤ x0 ∨ x1 ≤ p) :
    (if decP p ≤ decP x0 then (1 : ℚ) else -1) * ((decP x0 + decP x1) / 2 - decP p) =
      ((nd (x0 + x1) (2 * p) : ℕ) : ℚ) / 2 ^ 23 := by
  simp only [nd_cast, decP_le]
  have e : (decP x0 + decP x1) / 2 - decP p = ((x0 : ℚ) + x1 - 2 * p) / 2 ^ 23 := by
    unfold decP; ring
  rw [e]
  push_cast
  have h' : (x0 : ℚ) ≤ x1 := by exact_mod_cast h
  split_ifs with h1
  · have : (p : ℚ) ≤ x0 := by exact_mod_cast h1
    rw [abs_of_nonneg (by linarith)]; ring
  · have h2 : x1 ≤ p := hp.resolve_left h1
    have : (x1 : ℚ) ≤ p := by exact_mod_cast h2
    have : ¬ ((p : ℚ) ≤ x0) := by exact_mod_cast h1
    rw [abs_of_neg (by linarith)]; ring

/-- The tangent data of one charge, under the position condition. -/
theorem tanOf_nat {U0 U1 V0 V1 P Q B : ℕ} (hU : U0 ≤ U1) (hV : V0 ≤ V1)
    (hP : P ≤ U0 ∨ U1 ≤ P) (hQ : Q ≤ V0 ∨ V1 ≤ Q) :
    tanOf (nBox U0 U1 V0 V1) (nChg P Q B) =
      (if P ≤ U0 then 1 else -1, if Q ≤ V0 then 1 else -1,
        ((4 * B / tanT0 U0 U1 V0 V1 P Q : ℕ) : ℚ) / 2 ^ 30,
        (((B * 16777216 + tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q - 1) /
          (tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q) : ℕ) : ℚ) / 2 ^ 30) := by
  have ht : (if decP P ≤ decP U0 then (1 : ℚ) else -1) * ((decP U0 + decP U1) / 2 - decP P) +
      (if decP Q ≤ decP V0 then (1 : ℚ) else -1) * ((decP V0 + decP V1) / 2 - decP Q) =
      ((tanT0 U0 U1 V0 V1 P Q : ℕ) : ℚ) / 2 ^ 23 := by
    rw [sigma_mid hU hP, sigma_mid hV hQ, tanT0]; push_cast; ring
  simp only [tanOf, nBox, nChg, decP_le] at ht ⊢
  rw [ht]
  set T := tanT0 U0 U1 V0 V1 P Q
  refine Prod.ext rfl (Prod.ext rfl (Prod.ext ?_ ?_))
  · apply floorK_eq
    rcases eq_or_ne (T : ℚ) 0 with h | h
    · rw [h]; simp
    · push_cast; field_simp; ring
  · apply ceilK_eq
    rcases eq_or_ne (T : ℚ) 0 with h | h
    · simp [h]
    · push_cast; field_simp; ring

/-- The position condition, as computed. -/
def nPos (U0 U1 V0 V1 P Q : ℕ) : Bool := (Nat.ble P U0 || Nat.ble U1 P) && (Nat.ble Q V0 || Nat.ble V1 Q)

theorem nPos_iff {U0 U1 V0 V1 P Q : ℕ} :
    nPos U0 U1 V0 V1 P Q = true ↔ (P ≤ U0 ∨ U1 ≤ P) ∧ (Q ≤ V0 ∨ V1 ≤ Q) := by
  simp [nPos, Nat.ble_eq]

theorem disc_iff (al be B : ℕ) :
    ((al : ℚ) / 2 ^ 30) ^ 2 ≤ 4 * ((B : ℚ) / 2 ^ 52) * ((be : ℚ) / 2 ^ 30) ↔
      al * al * 4194304 ≤ 4 * B * be := by
  have e1 : ((al : ℚ) / 2 ^ 30) ^ 2 = ((al * al * 4194304 : ℕ) : ℚ) / 2 ^ 82 := by push_cast; ring
  have e2 : 4 * ((B : ℚ) / 2 ^ 52) * ((be : ℚ) / 2 ^ 30) = ((4 * B * be : ℕ) : ℚ) / 2 ^ 82 := by
    push_cast; ring
  rw [e1, e2, div_le_div_iff_of_pos_right (by positivity), Nat.cast_le]

theorem tanOK_nat {U0 U1 V0 V1 P Q B : ℕ} (hU : U0 ≤ U1) (hV : V0 ≤ V1) :
    tanOK (nBox U0 U1 V0 V1) (nChg P Q B) =
      (nPos U0 U1 V0 V1 P Q && Nat.ble (4 * B / tanT0 U0 U1 V0 V1 P Q * (4 * B / tanT0 U0 U1 V0 V1 P Q)
        * 4194304) (4 * B * ((B * 16777216 + tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q - 1) /
          (tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q)))) := by
  by_cases hpos : (P ≤ U0 ∨ U1 ≤ P) ∧ (Q ≤ V0 ∨ V1 ≤ Q)
  · simp only [tanOK, tanOf_nat hU hV hpos.1 hpos.2]
    rw [Bool.eq_iff_iff]
    simp only [nPos, nChg, nBox, decP_le, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq,
      Nat.ble_eq, disc_iff]
    have hb : (0 : ℚ) ≤ (((B * 16777216 + tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q - 1) /
        (tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q) : ℕ) : ℚ) / 2 ^ 30 := by positivity
    tauto
  · rw [Bool.eq_iff_iff]
    simp only [tanOK, nPos, nChg, nBox, decP_le, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq,
      Nat.ble_eq]
    tauto

theorem tan_sums {U0 U1 V0 V1 P Q B : ℕ} (hU : U0 ≤ U1) (hV : V0 ≤ V1)
    (hpos : (P ≤ U0 ∨ U1 ≤ P) ∧ (Q ≤ V0 ∨ V1 ≤ Q)) {al be : ℕ} {g1 g2 : Bool}
    (hal : al = 4 * B / tanT0 U0 U1 V0 V1 P Q)
    (hbe : be = (B * 16777216 + tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q - 1) /
      (tanT0 U0 U1 V0 V1 P Q * tanT0 U0 U1 V0 V1 P Q))
    (hg1 : g1 = Nat.ble P U0) (hg2 : g2 = Nat.ble Q V0) :
    tanA (nBox U0 U1 V0 V1) (nChg P Q B) * 2 ^ 52 =
        (al : ℚ) * 2 ^ 22 + ((((if g1 then be * P else be * nOff) + (if g2 then be * Q else be * nOff) : ℕ) : ℚ)
          - (((if g1 then be * nOff else be * P) + (if g2 then be * nOff else be * Q) : ℕ) : ℚ)) ∧
      -tanB0 1 (nBox U0 U1 V0 V1) (nChg P Q B) * 2 ^ 30 =
        (((if g2 then be else 0 : ℕ)) : ℚ) - (((if g2 then 0 else be : ℕ)) : ℚ) ∧
      (-tanB1 1 1 (nBox U0 U1 V0 V1) (nChg P Q B) - tanB0 1 (nBox U0 U1 V0 V1) (nChg P Q B)) * 2 ^ 30 =
        (((if g1 then be else 0 : ℕ)) : ℚ) - (((if g1 then 0 else be : ℕ)) : ℚ) := by
  subst hal hbe hg1 hg2
  simp only [tanA, tanB0, tanB1]
  rw [tanOf_nat hU hV hpos.1 hpos.2]
  simp only [nChg, Nat.ble_eq]
  refine ⟨?_, ?_, ?_⟩ <;> split_ifs <;> (try simp only [decP, nOff]) <;> push_cast <;> ring

theorem pass2_spec {U0 U1 V0 V1 : ℕ} (hU : U0 ≤ U1) (hV : V0 ≤ V1) (l : NCL) :
    ∀ (ok : Bool) (sal xp xn y1p y1n y2p y2n : ℕ),
      (pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).ok =
          (ok && l.toList.all (tanOK (nBox U0 U1 V0 V1))) ∧
        ((pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).ok = true →
          ((pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).sal : ℚ) * 2 ^ 22 +
              (pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).xp -
              (pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).xn =
            sal * 2 ^ 22 + xp - xn + 2 ^ 52 * (l.toList.map (tanA (nBox U0 U1 V0 V1))).sum ∧
          ((pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).y2p : ℚ) -
              (pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).y2n =
            y2p - y2n + 2 ^ 30 * -(l.toList.map (tanB0 1 (nBox U0 U1 V0 V1))).sum ∧
          ((pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).y1p : ℚ) -
              (pass2 U0 U1 V0 V1 l ok sal xp xn y1p y1n y2p y2n).y1n =
            y1p - y1n + 2 ^ 30 * (-(l.toList.map (tanB1 1 1 (nBox U0 U1 V0 V1))).sum -
              (l.toList.map (tanB0 1 (nBox U0 U1 V0 V1))).sum)) := by
  induction l with
  | nil =>
    intro ok sal xp xn y1p y1n y2p y2n
    simp [pass2, NCL.toList]
  | cons P Q B t ih =>
    intro ok sal xp xn y1p y1n y2p y2n
    set T := tanT0 U0 U1 V0 V1 P Q
    set al := 4 * B / T
    set be := (B * 16777216 + T * T - 1) / (T * T)
    set g1 := Nat.ble P U0
    set g2 := Nat.ble Q V0
    have hstep : pass2 U0 U1 V0 V1 (.cons P Q B t) ok sal xp xn y1p y1n y2p y2n =
        pass2 U0 U1 V0 V1 t (ok && (nPos U0 U1 V0 V1 P Q && Nat.ble (al * al * 4194304) (4 * B * be)))
          (sal + al) (xp + (if g1 then be * P else be * nOff) + (if g2 then be * Q else be * nOff))
          (xn + (if g1 then be * nOff else be * P) + (if g2 then be * nOff else be * Q))
          (if g1 then y1p + be else y1p) (if g1 then y1n else y1n + be)
          (if g2 then y2p + be else y2p) (if g2 then y2n else y2n + be) := by
      simp only [pass2, nPos, Bool.and_assoc]; rfl
    obtain ⟨i1, i2⟩ := ih (ok && (nPos U0 U1 V0 V1 P Q && Nat.ble (al * al * 4194304) (4 * B * be)))
      (sal + al) (xp + (if g1 then be * P else be * nOff) + (if g2 then be * Q else be * nOff))
      (xn + (if g1 then be * nOff else be * P) + (if g2 then be * nOff else be * Q))
      (if g1 then y1p + be else y1p) (if g1 then y1n else y1n + be)
      (if g2 then y2p + be else y2p) (if g2 then y2n else y2n + be)
    have hhead : tanOK (nBox U0 U1 V0 V1) (nChg P Q B) =
        (nPos U0 U1 V0 V1 P Q && Nat.ble (al * al * 4194304) (4 * B * be)) := tanOK_nat hU hV
    rw [hstep]
    refine ⟨?_, fun hok => ?_⟩
    · rw [i1]
      simp only [NCL.toList, List.all_cons]
      rw [← nChg, hhead, Bool.and_assoc]
    · obtain ⟨s1, s2, s3⟩ := i2 hok
      rw [i1] at hok
      have hpos : (P ≤ U0 ∨ U1 ≤ P) ∧ (Q ≤ V0 ∨ V1 ≤ Q) := by
        simp only [Bool.and_eq_true] at hok
        exact nPos_iff.1 hok.1.2.1
      obtain ⟨c1, c2, c3⟩ := tan_sums (B := B) (al := al) (be := be) (g1 := g1) (g2 := g2) hU hV hpos
        rfl rfl rfl rfl
      simp only [NCL.toList, List.map_cons, List.sum_cons]
      rw [← nChg]
      refine ⟨?_, ?_, ?_⟩
      · rw [s1]; push_cast at c1 ⊢; linarith
      · rw [s2]; push_cast at c2 ⊢
        split_ifs at c2 ⊢ <;> push_cast at c2 ⊢ <;> linarith
      · rw [s3]; push_cast at c3 ⊢
        split_ifs at c3 ⊢ <;> push_cast at c3 ⊢ <;> linarith

/-! ### Cells and boxes -/

theorem decP_off (x : ℕ) : decP (x + nOff) = (x : ℚ) / 2 ^ 22 := by
  unfold decP; push_cast; ring

theorem box_eq {er es : ℕ} (h : er + es = 22) {R0 R1 S0 S1 : ℕ} (hS0 : S0 ≤ 2 ^ es)
    (hS1 : S1 ≤ 2 ^ es) :
    cellBox 1 1 ((R0 : ℚ) / 2 ^ er) ((R1 : ℚ) / 2 ^ er) ((S0 : ℚ) / 2 ^ es) ((S1 : ℚ) / 2 ^ es) =
      nBox (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ es - S1) + nOff) (R1 * (2 ^ es - S0) + nOff) := by
  have h22 : (2 : ℚ) ^ 22 = 2 ^ er * 2 ^ es := by rw [← pow_add, h]
  simp only [cellBox, nBox, decP_off, show ¬ ((1 : ℚ) < 0) by norm_num, ite_false]
  have c0 : ((2 ^ es - S1 : ℕ) : ℚ) = 2 ^ es - S1 := by rw [Nat.cast_sub hS1]; push_cast; ring
  have c1 : ((2 ^ es - S0 : ℕ) : ℚ) = 2 ^ es - S0 := by rw [Nat.cast_sub hS0]; push_cast; ring
  rw [Box.mk.injEq]
  push_cast
  rw [c0, c1, h22]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> field_simp

theorem box_mono {es R0 R1 S0 S1 : ℕ} (hR : R0 ≤ R1) (hS : S0 ≤ S1) :
    R0 * S0 + nOff ≤ R1 * S1 + nOff ∧ R0 * (2 ^ es - S1) + nOff ≤ R1 * (2 ^ es - S0) + nOff := by
  constructor
  · exact Nat.add_le_add_right (Nat.mul_le_mul hR hS) _
  · exact Nat.add_le_add_right (Nat.mul_le_mul hR (Nat.sub_le_sub_left hS _)) _

/-! ### The leaf value -/

/-- The first-order leaf bound, scaled by `6 · 2^105` (quadrant `(1, 1)`, `er = 8`, `es = 14`). -/
def nJ1 (Ai K R0 R1 S0 S1 : ℕ) : ℤ :=
  if Nat.ble (Ai * 256) (R0 * K) then 0
  else if Nat.ble (R1 * K) (Ai * 256) then
    (((S1 - S0) * (Ai * (R1 - R0) * 512 - K * (R1 * R1 - R0 * R0)) * 6 * 17592186044416 : ℕ) : ℤ)
  else (((S1 - S0) * (Ai * 256 - R0 * K) * (R1 - R0) * 6 * 17592186044416 : ℕ) : ℤ)

/-- The tangent leaf bound, scaled by `6 · 2^105`. -/
def nJ2 (Ai Ci R0 R1 S0 S1 : ℕ) (p2 : NP2) : ℤ :=
  ((6 * (S1 - S0) * Ai * (R1 - R0) * 9007199254740992 : ℕ) : ℤ)
    + 3 * ((S1 - S0 : ℕ) : ℤ) * -(((Ci * 4194304 + p2.sal * 4194304 : ℕ) : ℤ) + ((p2.xp : ℤ) - p2.xn))
      * ((R1 * R1 - R0 * R0 : ℕ) : ℤ) * ((8388608 : ℕ) : ℤ)
    + 2 * ((S1 - S0 : ℕ) : ℤ) * ((p2.y2p : ℤ) - p2.y2n) * ((R1 * R1 * R1 - R0 * R0 * R0 : ℕ) : ℤ)
      * ((137438953472 : ℕ) : ℤ)
    + (((p2.y1p : ℤ) - p2.y1n) - ((p2.y2p : ℤ) - p2.y2n)) * ((R1 * R1 * R1 - R0 * R0 * R0 : ℕ) : ℤ)
      * ((S1 * S1 - S0 * S0 : ℕ) : ℤ) * ((8388608 : ℕ) : ℤ)

/-- The leaf value as a function of the two pass results. -/
def nLeafF (Ai Ci R0 R1 S0 S1 : ℕ) (p1 : NP1) (p2 : NP2) : ℤ :=
  if p1.pos && Nat.ble (R1 * (Ci + p1.smax)) (Ai * 256) then
    if p2.ok then min (nJ1 Ai (Ci + p1.smin) R0 R1 S0 S1) (nJ2 Ai Ci R0 R1 S0 S1 p2)
    else nJ1 Ai (Ci + p1.smin) R0 R1 S0 S1
  else nJ1 Ai (Ci + p1.smin) R0 R1 S0 S1

theorem nLeaf_unfold (Ai Ci : ℕ) (l : NCL) (R0 R1 S0 S1 : ℕ) :
    nLeaf 8 14 Ai Ci l R0 R1 S0 S1 = nLeafF Ai Ci R0 R1 S0 S1
      (pass1 (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 14 - S1) + nOff)
        (R1 * (2 ^ 14 - S0) + nOff) l 0 0 true)
      (pass2 (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 14 - S1) + nOff)
        (R1 * (2 ^ 14 - S0) + nOff) l true 0 0 0 0 0 0 0) := rfl

theorem ble_iff {a b : ℕ} : Nat.ble a b = true ↔ a ≤ b := by simp [Nat.ble_eq]

theorem cmp_iff (x y : ℕ) (k : ℕ) : (x : ℚ) / 2 ^ k ≤ (y : ℚ) / 2 ^ k ↔ x ≤ y := by
  rw [div_le_div_iff_of_pos_right (by positivity), Nat.cast_le]

theorem j1_val {a c : ℚ} {L : List Chg} {B : Box} {Ai K R0 R1 S0 S1 : ℕ}
    (ha : a = (Ai : ℚ) / 2 ^ 30) (hk : c + smin L B = (K : ℚ) / 2 ^ 30) (hR : R0 ≤ R1) (hS : S0 ≤ S1) :
    let e := j1Coef a c L B ((R0 : ℚ) / 2 ^ 8) ((R1 : ℚ) / 2 ^ 8)
    polyVal ((R0 : ℚ) / 2 ^ 8) ((R1 : ℚ) / 2 ^ 8) ((S0 : ℚ) / 2 ^ 14) ((S1 : ℚ) / 2 ^ 14)
        e.1 e.2.1 e.2.2.1 e.2.2.2 = (nJ1 Ai K R0 R1 S0 S1 : ℚ) / (6 * 2 ^ 105) := by
  intro e
  simp only [e, j1Coef, hk, ha]
  have c1 : (Ai : ℚ) / 2 ^ 30 - (R0 : ℚ) / 2 ^ 8 * ((K : ℚ) / 2 ^ 30) ≤ 0 ↔ Ai * 256 ≤ R0 * K := by
    rw [sub_nonpos, ← cmp_iff _ _ 38]; push_cast
    constructor <;> intro h <;> [skip; skip] <;> nlinarith [h]
  have c2 : 0 ≤ (Ai : ℚ) / 2 ^ 30 - (R1 : ℚ) / 2 ^ 8 * ((K : ℚ) / 2 ^ 30) ↔ R1 * K ≤ Ai * 256 := by
    rw [sub_nonneg, ← cmp_iff _ _ 38]; push_cast
    constructor <;> intro h <;> [skip; skip] <;> nlinarith [h]
  have hS' : ((S1 - S0 : ℕ) : ℚ) = S1 - S0 := Nat.cast_sub hS
  have hR' : ((R1 - R0 : ℕ) : ℚ) = R1 - R0 := Nat.cast_sub hR
  have hRR : R0 * R0 ≤ R1 * R1 := Nat.mul_le_mul hR hR
  have hRR' : ((R1 * R1 - R0 * R0 : ℕ) : ℚ) = R1 * R1 - R0 * R0 := by rw [Nat.cast_sub hRR]; push_cast; ring
  unfold nJ1
  by_cases h1 : Ai * 256 ≤ R0 * K
  · rw [if_pos (c1.2 h1), if_pos (ble_iff.2 h1)]
    simp [polyVal]
  · rw [if_neg (fun h => h1 (c1.1 h)), if_neg (fun h => h1 (ble_iff.1 h))]
    by_cases h2 : R1 * K ≤ Ai * 256
    · rw [if_pos (c2.2 h2), if_pos (ble_iff.2 h2)]
      have key : K * (R1 * R1 - R0 * R0) ≤ Ai * (R1 - R0) * 512 := by
        have : (K : ℚ) * ((R1 : ℚ) * R1 - R0 * R0) ≤ Ai * (R1 - R0) * 512 := by
          have h2' : (R1 : ℚ) * K ≤ Ai * 256 := by exact_mod_cast h2
          have hR0 : (R0 : ℚ) ≤ R1 := by exact_mod_cast hR
          have hK : (0 : ℚ) ≤ K := by positivity
          have hR00 : (0 : ℚ) ≤ R0 := by positivity
          nlinarith [mul_nonneg (sub_nonneg.2 hR0) hK, mul_nonneg (sub_nonneg.2 hR0) (sub_nonneg.2 hR0)]
        rw [← Nat.cast_le (α := ℚ)]; push_cast [hR', hRR']; linarith
      have hkey : ((Ai * (R1 - R0) * 512 - K * (R1 * R1 - R0 * R0) : ℕ) : ℚ) =
          Ai * (R1 - R0) * 512 - K * (R1 * R1 - R0 * R0) := by
        rw [Nat.cast_sub key]; push_cast [hR', hRR']; ring
      simp only [polyVal]
      push_cast [hkey, hS']
      ring
    · rw [if_neg (fun h => h2 (c2.1 h)), if_neg (fun h => h2 (ble_iff.1 h))]
      have hlt : R0 < R1 := by
        by_contra hc
        have : R1 * K ≤ R0 * K := Nat.mul_le_mul_right K (by omega)
        omega
      have hne : (R1 : ℚ) / 2 ^ 8 - (R0 : ℚ) / 2 ^ 8 ≠ 0 := by
        have : (R0 : ℚ) < R1 := by exact_mod_cast hlt
        intro h; field_simp at h; linarith
      have hA : ((Ai * 256 - R0 * K : ℕ) : ℚ) = Ai * 256 - R0 * K := by
        rw [Nat.cast_sub (by omega)]; push_cast; ring
      have hne2 : (R1 : ℚ) - R0 ≠ 0 := by
        have : (R0 : ℚ) < R1 := by exact_mod_cast hlt
        linarith
      have hne3 : -(R0 : ℚ) + R1 ≠ 0 := by
        have : (R0 : ℚ) < R1 := by exact_mod_cast hlt
        linarith
      simp only [polyVal]
      push_cast [hA, hS', hR']
      field_simp
      ring

theorem j2_val {a c : ℚ} {L : List Chg} {B : Box} {Ai Ci R0 R1 S0 S1 : ℕ} {p2 : NP2}
    (ha : a = (Ai : ℚ) / 2 ^ 30) (hc : c = (Ci : ℚ) / 2 ^ 30)
    (hA : (p2.sal : ℚ) * 2 ^ 22 + p2.xp - p2.xn = 2 ^ 52 * (L.map (tanA B)).sum)
    (h2 : (p2.y2p : ℚ) - p2.y2n = 2 ^ 30 * -(L.map (tanB0 1 B)).sum)
    (h1 : (p2.y1p : ℚ) - p2.y1n = 2 ^ 30 * (-(L.map (tanB1 1 1 B)).sum - (L.map (tanB0 1 B)).sum))
    (hR : R0 ≤ R1) (hS : S0 ≤ S1) :
    polyVal ((R0 : ℚ) / 2 ^ 8) ((R1 : ℚ) / 2 ^ 8) ((S0 : ℚ) / 2 ^ 14) ((S1 : ℚ) / 2 ^ 14)
        (j2Coef a c 1 1 L B).1 (j2Coef a c 1 1 L B).2.1 (j2Coef a c 1 1 L B).2.2.1
        (j2Coef a c 1 1 L B).2.2.2 = (nJ2 Ai Ci R0 R1 S0 S1 p2 : ℚ) / (6 * 2 ^ 105) := by
  simp only [j2Coef]
  have eA : (L.map (tanA B)).sum = ((p2.sal : ℚ) * 2 ^ 22 + p2.xp - p2.xn) / 2 ^ 52 := by
    rw [hA]; ring
  have eB0 : -(L.map (tanB0 1 B)).sum = ((p2.y2p : ℚ) - p2.y2n) / 2 ^ 30 := by rw [h2]; ring
  have eB1 : -(L.map (tanB1 1 1 B)).sum =
      ((p2.y1p : ℚ) - p2.y1n) / 2 ^ 30 - ((p2.y2p : ℚ) - p2.y2n) / 2 ^ 30 := by
    rw [h1, h2]; ring
  rw [eB0, eB1, eA, ha, hc]
  have hS' : ((S1 - S0 : ℕ) : ℚ) = S1 - S0 := Nat.cast_sub hS
  have hR' : ((R1 - R0 : ℕ) : ℚ) = R1 - R0 := Nat.cast_sub hR
  have hRR' : ((R1 * R1 - R0 * R0 : ℕ) : ℚ) = R1 * R1 - R0 * R0 := by
    rw [Nat.cast_sub (Nat.mul_le_mul hR hR)]; push_cast; ring
  have hRRR' : ((R1 * R1 * R1 - R0 * R0 * R0 : ℕ) : ℚ) = R1 * R1 * R1 - R0 * R0 * R0 := by
    rw [Nat.cast_sub (Nat.mul_le_mul (Nat.mul_le_mul hR hR) hR)]; push_cast; ring
  have hSS' : ((S1 * S1 - S0 * S0 : ℕ) : ℚ) = S1 * S1 - S0 * S0 := by
    rw [Nat.cast_sub (Nat.mul_le_mul hS hS)]; push_cast; ring
  unfold nJ2 polyVal
  push_cast [hS', hR', hRR', hRRR', hSS']
  ring

theorem nLeaf_eq {Ai Ci : ℕ} {l : NCL} {R0 R1 S0 S1 : ℕ} (hR : R0 ≤ R1) (hS : S0 ≤ S1)
    (hS1 : S1 ≤ 2 ^ 14) :
    leafVal ((Ai : ℚ) / 2 ^ 30) ((Ci : ℚ) / 2 ^ 30) 1 1 l.toList ((R0 : ℚ) / 2 ^ 8) ((R1 : ℚ) / 2 ^ 8)
        ((S0 : ℚ) / 2 ^ 14) ((S1 : ℚ) / 2 ^ 14) =
      (nLeaf 8 14 Ai Ci l R0 R1 S0 S1 : ℚ) / (6 * 2 ^ 105) := by
  have hS0 : S0 ≤ 2 ^ 14 := hS.trans hS1
  obtain ⟨hU, hV⟩ := box_mono (es := 14) hR hS
  have hB := box_eq (er := 8) (es := 14) (R0 := R0) (R1 := R1) rfl hS0 hS1
  obtain ⟨q1, q2, q3⟩ := pass1_spec hU hV l 0 0 true
  obtain ⟨r1, r2⟩ := pass2_spec hU hV l true 0 0 0 0 0 0 0
  rw [nLeaf_unfold]
  unfold leafVal
  simp only [hB]
  generalize pass1 (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 14 - S1) + nOff)
    (R1 * (2 ^ 14 - S0) + nOff) l 0 0 true = p1 at q1 q2 q3 ⊢
  generalize pass2 (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 14 - S1) + nOff)
    (R1 * (2 ^ 14 - S0) + nOff) l true 0 0 0 0 0 0 0 = p2 at r1 r2 ⊢
  generalize nBox (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 14 - S1) + nOff)
    (R1 * (2 ^ 14 - S0) + nOff) = B at q1 q2 q3 r1 r2 ⊢
  have hk : (Ci : ℚ) / 2 ^ 30 + smin l.toList B = ((Ci + p1.smin : ℕ) : ℚ) / 2 ^ 30 := by
    push_cast; rw [q1]; ring
  have hv1 := j1_val (a := (Ai : ℚ) / 2 ^ 30) (L := l.toList) (B := B) (Ai := Ai) (S0 := S0) (S1 := S1) rfl hk hR hS
  simp only at hv1
  have hpos : allPos l.toList B = p1.pos := by rw [q3, Bool.true_and]
  have hall : l.toList.all (tanOK B) = p2.ok := by rw [r1, Bool.true_and]
  have hcond : decide (0 ≤ (Ai : ℚ) / 2 ^ 30 - (R1 : ℚ) / 2 ^ 8 * ((Ci : ℚ) / 2 ^ 30 + smax l.toList B)) =
      Nat.ble (R1 * (Ci + p1.smax)) (Ai * 256) := by
    rw [Bool.eq_iff_iff, decide_eq_true_iff, ble_iff, sub_nonneg]
    have e1 : (R1 : ℚ) / 2 ^ 8 * ((Ci : ℚ) / 2 ^ 30 + smax l.toList B) =
        ((R1 * (Ci + p1.smax) : ℕ) : ℚ) / 2 ^ 38 := by push_cast; rw [q2]; ring
    have e2 : (Ai : ℚ) / 2 ^ 30 = ((Ai * 256 : ℕ) : ℚ) / 2 ^ 38 := by push_cast; ring
    rw [e1, e2, cmp_iff]
  have htan : tangentOK ((Ai : ℚ) / 2 ^ 30) ((Ci : ℚ) / 2 ^ 30) l.toList B ((R1 : ℚ) / 2 ^ 8) =
      ((p1.pos && Nat.ble (R1 * (Ci + p1.smax)) (Ai * 256)) && p2.ok) := by
    unfold tangentOK; rw [hpos, hcond, hall]
  rw [htan, hv1]
  unfold nLeafF
  have h6 : (0 : ℚ) < 6 * 2 ^ 105 := by positivity
  cases hc : (p1.pos && Nat.ble (R1 * (Ci + p1.smax)) (Ai * 256))
  · simp
  · cases ho : p2.ok
    · simp
    · obtain ⟨s1, s2, s3⟩ := r2 ho
      have hv2 := j2_val (L := l.toList) (B := B) (Ai := Ai) (Ci := Ci) (R0 := R0) (R1 := R1)
        (S0 := S0) (S1 := S1) (p2 := p2) rfl rfl (by simpa using s1) (by simpa using s2)
        (by simpa using s3) hR hS
      simp only [Bool.and_self, if_true, Bool.true_and]
      rw [hv2, Int.cast_min, min_div_div_right h6.le]

/-! ### Trees -/

theorem mid_cast {x y : ℕ} (k : ℕ) (h : (x + y) % 2 = 0) :
    (((x + y) / 2 : ℕ) : ℚ) / 2 ^ k = ((x : ℚ) / 2 ^ k + (y : ℚ) / 2 ^ k) / 2 := by
  have : ((x + y) / 2 : ℕ) * 2 = x + y := Nat.div_mul_cancel (Nat.dvd_of_mod_eq_zero h)
  have e : (((x + y) / 2 : ℕ) : ℚ) = ((x : ℚ) + y) / 2 := by
    rw [eq_div_iff (by norm_num)]; exact_mod_cast this
  rw [e]; ring

/-- **The natural-number checker computes the rational checker** (integral tree, `er = 8`,
`es = 14`): `nChk = some v` implies `v2chk = some (v / (6 · 2^105))` on the decoded data. -/
theorem nChk_spec {Ai Ci : ℕ} {l : NCL} (t : NTree) :
    ∀ (R0 R1 S0 S1 : ℕ) (v : ℤ), R0 ≤ R1 → S0 ≤ S1 → S1 ≤ 2 ^ 14 →
      nChk 8 14 Ai Ci l t R0 R1 S0 S1 = some v →
      v2chk ((Ai : ℚ) / 2 ^ 30) ((Ci : ℚ) / 2 ^ 30) 1 1 l.toList t.toQ ((R0 : ℚ) / 2 ^ 8)
        ((R1 : ℚ) / 2 ^ 8) ((S0 : ℚ) / 2 ^ 14) ((S1 : ℚ) / 2 ^ 14) = some ((v : ℚ) / (6 * 2 ^ 105)) := by
  induction t with
  | leaf =>
    intro R0 R1 S0 S1 v hR hS hS1 h
    simp only [nChk] at h
    split_ifs at h with h0
    cases h
    simp only [NTree.toQ, v2chk, nLeaf_eq hR hS hS1]
    rw [if_pos (div_nonneg (by exact_mod_cast h0) (by positivity))]
  | node t1 t2 t3 t4 ih1 ih2 ih3 ih4 =>
    intro R0 R1 S0 S1 v hR hS hS1 h
    simp only [nChk] at h
    split_ifs at h with hp
    split at h
    · rename_i x1 x2 x3 x4 e1 e2 e3 e4
      cases h
      have hm := mid_cast (x := R0) (y := R1) 8 hp.1
      have hn := mid_cast (x := S0) (y := S1) 14 hp.2
      have o1 := ih1 _ _ _ _ _ (by omega) (by omega) (by omega) e1
      have o2 := ih2 _ _ _ _ _ (by omega) (by omega) (by omega) e2
      have o3 := ih3 _ _ _ _ _ (by omega) (by omega) (by omega) e3
      have o4 := ih4 _ _ _ _ _ (by omega) (by omega) (by omega) e4
      rw [hm, hn] at o1 o2 o3 o4
      simp only [NTree.toQ, v2chk, o1, o2, o3, o4]
      congr 1; push_cast; ring
    · cases h

/-! ### The diamond tree -/

theorem nV1Leaf_spec {Ai Ci mN mD : ℕ} (hmD : 0 < mD) {l : NCL} {R0 R1 S0 S1 : ℕ} (hR : R0 ≤ R1)
    (hS : S0 ≤ S1) (hS1 : S1 ≤ 2 ^ 12) (h : nV1Leaf 10 12 Ai Ci mN mD l R0 R1 S0 S1 = true) :
    v1leaf ((Ai : ℚ) / 2 ^ 30) ((Ci : ℚ) / 2 ^ 30) ((mN : ℚ) / mD) 1 1 l.toList ((R0 : ℚ) / 2 ^ 10)
      ((R1 : ℚ) / 2 ^ 10) ((S0 : ℚ) / 2 ^ 12) ((S1 : ℚ) / 2 ^ 12) = true := by
  have hS0 : S0 ≤ 2 ^ 12 := hS.trans hS1
  obtain ⟨hU, hV⟩ := box_mono (es := 12) hR hS
  have hB := box_eq (er := 10) (es := 12) (R0 := R0) (R1 := R1) rfl hS0 hS1
  obtain ⟨-, q2, q3⟩ := pass1_spec hU hV l 0 0 true
  unfold nV1Leaf at h
  unfold v1leaf
  simp only [hB]
  generalize pass1 (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 12 - S1) + nOff)
    (R1 * (2 ^ 12 - S0) + nOff) l 0 0 true = p1 at q2 q3 h
  generalize nBox (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ 12 - S1) + nOff)
    (R1 * (2 ^ 12 - S0) + nOff) = B at q2 q3
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨hp, h0⟩, hc⟩ := h
  have hpos : allPos l.toList B = true := by rw [← hp, q3, Bool.true_and]
  simp only [hpos, Bool.true_and, Bool.and_eq_true, decide_eq_true_eq]
  have hR1 : 0 < R1 := by simpa [Nat.blt_eq] using h0
  have hc' := ble_iff.1 hc
  refine ⟨by positivity, ?_⟩
  have hmD' : (0 : ℚ) < mD := by exact_mod_cast hmD
  have e1 : (R1 : ℚ) / 2 ^ 10 * ((Ci : ℚ) / 2 ^ 30 + (mN : ℚ) / mD + smax l.toList B) =
      ((R1 * (mD * (Ci + p1.smax) + mN * 1073741824) : ℕ) : ℚ) / (2 ^ 40 * mD) := by
    push_cast; rw [q2]; field_simp; ring
  have e2 : (Ai : ℚ) / 2 ^ 30 = ((Ai * mD * 2 ^ 10 : ℕ) : ℚ) / (2 ^ 40 * mD) := by
    push_cast; field_simp; ring
  rw [e1, e2, div_le_div_iff_of_pos_right (by positivity), Nat.cast_le]
  exact hc'

theorem nV1_spec {Ai Ci mN mD : ℕ} (hmD : 0 < mD) {l : NCL} (t : NTree) :
    ∀ (R0 R1 S0 S1 : ℕ), R0 ≤ R1 → S0 ≤ S1 → S1 ≤ 2 ^ 12 →
      nV1 10 12 Ai Ci mN mD l t R0 R1 S0 S1 = true →
      v1ok ((Ai : ℚ) / 2 ^ 30) ((Ci : ℚ) / 2 ^ 30) ((mN : ℚ) / mD) 1 1 l.toList t.toQ ((R0 : ℚ) / 2 ^ 10)
        ((R1 : ℚ) / 2 ^ 10) ((S0 : ℚ) / 2 ^ 12) ((S1 : ℚ) / 2 ^ 12) = true := by
  induction t with
  | leaf =>
    intro R0 R1 S0 S1 hR hS hS1 h
    simp only [nV1] at h
    simp only [NTree.toQ, v1ok]
    exact nV1Leaf_spec hmD hR hS hS1 h
  | node t1 t2 t3 t4 ih1 ih2 ih3 ih4 =>
    intro R0 R1 S0 S1 hR hS hS1 h
    simp only [nV1, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨hp, e1⟩, e2⟩, e3⟩, e4⟩ := h
    have hm := mid_cast (x := R0) (y := R1) 10 hp.1
    have hn := mid_cast (x := S0) (y := S1) 12 hp.2
    have o1 := ih1 _ _ _ _ (by omega) (by omega) (by omega) e1
    have o2 := ih2 _ _ _ _ (by omega) (by omega) (by omega) e2
    have o3 := ih3 _ _ _ _ (by omega) (by omega) (by omega) e3
    have o4 := ih4 _ _ _ _ (by omega) (by omega) (by omega) e4
    rw [hm, hn] at o1 o2 o3 o4
    simp only [NTree.toQ, v1ok, o1, o2, o3, o4, Bool.and_self]

end CenteredMaximal.General
