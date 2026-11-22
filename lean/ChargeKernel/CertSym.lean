/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertGlobal

/-!
# Symmetry reduction and the combined subtree checker

* If the charge list is invariant (up to permutation) under the reflections `p ↦ −p` and `q ↦ −q`,
  then `ψ` is invariant under the coordinate reflections, so all four quadrants of diamond-polar
  coordinates carry the same integrand and only the quadrant `(1, 1)` needs a certificate.
* `v2chk` evaluates a quadtree once, returning the certified value if every leaf is nonnegative;
  `bnd_node` assembles bounds of subtrees, so a large certificate can be checked as many small
  kernel computations.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

def Chg.flipU (ch : Chg) : Chg := ⟨-ch.p, ch.q, ch.b⟩
def Chg.flipV (ch : Chg) : Chg := ⟨ch.p, -ch.q, ch.b⟩

def zflipU (z : Fin 2 → ℝ) : Fin 2 → ℝ := ![-z 0, z 1]
def zflipV (z : Fin 2 → ℝ) : Fin 2 → ℝ := ![z 0, -z 1]

theorem chargeSum_perm {L L' : List Chg} (h : L'.Perm L) (z : Fin 2 → ℝ) :
    chargeSum L' z = chargeSum L z := by
  unfold chargeSum
  exact (h.map _).sum_eq

theorem chargeSum_map_flipU (L : List Chg) (z : Fin 2 → ℝ) :
    chargeSum (L.map Chg.flipU) z = chargeSum L (zflipU z) := by
  unfold chargeSum
  rw [List.map_map]
  congr 1
  refine List.map_congr_left fun ch _ => ?_
  simp only [Function.comp_apply, Chg.flipU, zflipU, Matrix.cons_val_zero, Matrix.cons_val_one]
  push_cast
  rw [show z 0 - -(ch.p : ℝ) = -(-z 0 - ch.p) by ring, abs_neg]

theorem chargeSum_map_flipV (L : List Chg) (z : Fin 2 → ℝ) :
    chargeSum (L.map Chg.flipV) z = chargeSum L (zflipV z) := by
  unfold chargeSum
  rw [List.map_map]
  congr 1
  refine List.map_congr_left fun ch _ => ?_
  simp only [Function.comp_apply, Chg.flipV, zflipV, Matrix.cons_val_zero, Matrix.cons_val_one]
  push_cast
  rw [show z 1 - -(ch.q : ℝ) = -(-z 1 - ch.q) by ring, abs_neg]

theorem psiL_flipU {a c : ℚ} {L : List Chg} (hP : (L.map Chg.flipU).Perm L) (z : Fin 2 → ℝ) :
    psiL a c L (zflipU z) = psiL a c L z := by
  unfold psiL
  rw [← chargeSum_map_flipU, chargeSum_perm hP]
  simp [zflipU]

theorem psiL_flipV {a c : ℚ} {L : List Chg} (hP : (L.map Chg.flipV).Perm L) (z : Fin 2 → ℝ) :
    psiL a c L (zflipV z) = psiL a c L z := by
  unfold psiL
  rw [← chargeSum_map_flipV, chargeSum_perm hP]
  simp [zflipV]

theorem polar_neg_u (sv r s : ℝ) : polar (-1) sv r s = zflipU (polar 1 sv r s) := by
  funext i; fin_cases i <;> simp [polar, zflipU]

theorem polar_neg_v (su r s : ℝ) : polar su (-1) r s = zflipV (polar su 1 r s) := by
  funext i; fin_cases i <;> simp [polar, zflipV]

/-- **Symmetric version of the plane bound**: only the quadrant `(1, 1)` is certified. -/
theorem lintegral_psi_le_sym {a c : ℚ} {L : List Chg} (hL : allNonneg L = true) (hc : 0 ≤ c)
    (hPU : (L.map Chg.flipU).Perm L) (hPV : (L.map Chg.flipV).Perm L)
    {R : ℚ} (hR : 0 ≤ R) (haR : a ≤ R * c) {t : QTree}
    (h1 : v2ok a c 1 1 L t 0 R 0 1 = true) :
    ∫⁻ z, ENNReal.ofReal (max (psiL a c L z) 0)
      ≤ ENNReal.ofReal (((4 * v2val a c 1 1 L t 0 R 0 1 : ℚ) : ℝ)) := by
  have hm : Measurable fun z => ENNReal.ofReal (max (psiL a c L z) 0) :=
    ENNReal.measurable_ofReal.comp ((measurable_psiL a c L).max measurable_const)
  have q1 := quadrant_bound hL hc (Or.inl rfl) (Or.inl rfl) hR haR h1
  push_cast at q1
  have e2 : ∀ r s : ℝ, psiL a c L (polar 1 (-1) r s) = psiL a c L (polar 1 1 r s) := fun r s => by
    rw [polar_neg_v, psiL_flipV hPV]
  have e3 : ∀ r s : ℝ, psiL a c L (polar (-1) 1 r s) = psiL a c L (polar 1 1 r s) := fun r s => by
    rw [polar_neg_u, psiL_flipU hPU]
  have e4 : ∀ r s : ℝ, psiL a c L (polar (-1) (-1) r s) = psiL a c L (polar 1 1 r s) :=
    fun r s => by rw [polar_neg_u, psiL_flipU hPU, polar_neg_v, psiL_flipV hPV]
  have n1 := (v2_sound hL hc (Or.inl rfl) (Or.inl rfl) t 0 R 0 1 le_rfl hR le_rfl zero_le_one
    le_rfl h1).2
  have c1 : (0 : ℝ) ≤ (v2val a c 1 1 L t 0 R 0 1 : ℚ) := by exact_mod_cast n1
  rw [lintegral_eq_sum_polar hm]
  simp only [e2, e3, e4]
  push_cast
  have h4 : (4 : ℝ) * (v2val a c 1 1 L t 0 R 0 1 : ℚ)
      = (v2val a c 1 1 L t 0 R 0 1 : ℚ) + (v2val a c 1 1 L t 0 R 0 1 : ℚ)
        + (v2val a c 1 1 L t 0 R 0 1 : ℚ) + (v2val a c 1 1 L t 0 R 0 1 : ℚ) := by ring
  rw [h4, ENNReal.ofReal_add (by positivity) c1, ENNReal.ofReal_add (by positivity) c1,
    ENNReal.ofReal_add c1 c1]
  exact add_le_add (add_le_add (add_le_add q1 q1) q1) q1

/-- **Symmetric version of the diamond bound.** -/
theorem psi_ge_sym {a c m : ℚ} {L : List Chg} (hL : allNonneg L = true) (ha : 0 ≤ a)
    (hPU : (L.map Chg.flipU).Perm L) (hPV : (L.map Chg.flipV).Perm L) {t : QTree}
    (h1 : v1ok a c m 1 1 L t 0 1 0 1 = true)
    {z : Fin 2 → ℝ} (hz : z ≠ 0) (hd : |z 0| + |z 1| ≤ 1) :
    (m : ℝ) ≤ psiL a c L z := by
  set w : Fin 2 → ℝ := ![|z 0|, |z 1|] with hw
  have hpsi : psiL a c L w = psiL a c L z := by
    have hU : ∀ y : Fin 2 → ℝ, psiL a c L ![|y 0|, y 1] = psiL a c L y := by
      intro y
      rcases le_or_gt 0 (y 0) with h | h
      · congr 1; funext i; fin_cases i <;> simp [abs_of_nonneg h]
      · rw [← psiL_flipU hPU y]
        congr 1; funext i; fin_cases i <;> simp [zflipU, abs_of_neg h]
    have hV : ∀ y : Fin 2 → ℝ, psiL a c L ![y 0, |y 1|] = psiL a c L y := by
      intro y
      rcases le_or_gt 0 (y 1) with h | h
      · congr 1; funext i; fin_cases i <;> simp [abs_of_nonneg h]
      · rw [← psiL_flipV hPV y]
        congr 1; funext i; fin_cases i <;> simp [zflipV, abs_of_neg h]
    have := hU ![z 0, |z 1|]
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one] at this
    rw [hw, this, hV]
  rw [← hpsi]
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
  have hpol : polar ((1 : ℚ) : ℝ) ((1 : ℚ) : ℝ) r s = w := by
    funext i
    fin_cases i
    · show ((1 : ℚ) : ℝ) * (r * s) = |z 0|
      rw [hs, mul_div_cancel₀ _ hrpos.ne']; simp
    · show ((1 : ℚ) : ℝ) * (r * (1 - s)) = |z 1|
      rw [hs, mul_sub, mul_one, mul_div_cancel₀ _ hrpos.ne', hr, add_sub_cancel_left]; simp
  have := v1_sound hL ha (Or.inl rfl) (Or.inl rfl) t 0 1 0 1 le_rfl zero_le_one le_rfl
    zero_le_one le_rfl h1 r s (by simpa using hrpos.le) (by simpa using hd) (by simpa using hs01.1)
    (by simpa using hs01.2) hrpos
  rwa [hpol] at this

/-! ### The combined checker -/

/-- Evaluate a quadtree once: the certified value, provided every leaf is nonnegative. -/
def v2chk (a c su sv : ℚ) (L : List Chg) : QTree → ℚ → ℚ → ℚ → ℚ → Option ℚ
  | .leaf, r0, r1, s0, s1 =>
      if 0 ≤ leafVal a c su sv L r0 r1 s0 s1 then some (leafVal a c su sv L r0 r1 s0 s1) else none
  | .node t1 t2 t3 t4, r0, r1, s0, s1 =>
      match v2chk a c su sv L t1 r0 ((r0 + r1) / 2) s0 ((s0 + s1) / 2),
        v2chk a c su sv L t2 ((r0 + r1) / 2) r1 s0 ((s0 + s1) / 2),
        v2chk a c su sv L t3 r0 ((r0 + r1) / 2) ((s0 + s1) / 2) s1,
        v2chk a c su sv L t4 ((r0 + r1) / 2) r1 ((s0 + s1) / 2) s1 with
      | some x1, some x2, some x3, some x4 => some (x1 + x2 + x3 + x4)
      | _, _, _, _ => none

theorem v2chk_spec (a c su sv : ℚ) (L : List Chg) :
    ∀ (t : QTree) (r0 r1 s0 s1 v : ℚ), v2chk a c su sv L t r0 r1 s0 s1 = some v →
      v2ok a c su sv L t r0 r1 s0 s1 = true ∧ v2val a c su sv L t r0 r1 s0 s1 = v := by
  intro t
  induction t with
  | leaf =>
    intro r0 r1 s0 s1 v h
    simp only [v2chk] at h
    split_ifs at h with h0
    · cases h
      exact ⟨by simp [v2ok, h0], rfl⟩
  | node t1 t2 t3 t4 ih1 ih2 ih3 ih4 =>
    intro r0 r1 s0 s1 v h
    simp only [v2chk] at h
    split at h
    · rename_i x1 x2 x3 x4 e1 e2 e3 e4
      cases h
      obtain ⟨o1, w1⟩ := ih1 _ _ _ _ _ e1
      obtain ⟨o2, w2⟩ := ih2 _ _ _ _ _ e2
      obtain ⟨o3, w3⟩ := ih3 _ _ _ _ _ e3
      obtain ⟨o4, w4⟩ := ih4 _ _ _ _ _ e4
      exact ⟨by simp [v2ok, o1, o2, o3, o4], by simp [v2val, w1, w2, w3, w4]⟩
    · cases h

/-- A subtree check with an upper bound. -/
def v2bnd (a c su sv : ℚ) (L : List Chg) (t : QTree) (r0 r1 s0 s1 q : ℚ) : Bool :=
  match v2chk a c su sv L t r0 r1 s0 s1 with
  | some v => decide (v ≤ q)
  | none => false

theorem v2bnd_spec {a c su sv : ℚ} {L : List Chg} {t : QTree} {r0 r1 s0 s1 q : ℚ}
    (h : v2bnd a c su sv L t r0 r1 s0 s1 q = true) :
    v2ok a c su sv L t r0 r1 s0 s1 = true ∧ v2val a c su sv L t r0 r1 s0 s1 ≤ q := by
  unfold v2bnd at h
  split at h
  · rename_i v hv
    obtain ⟨o, e⟩ := v2chk_spec a c su sv L t r0 r1 s0 s1 v hv
    exact ⟨o, e ▸ of_decide_eq_true h⟩
  · cases h

/-- Assembling four subtree bounds. -/
theorem bnd_node {a c su sv : ℚ} {L : List Chg} {t1 t2 t3 t4 : QTree} {r0 r1 s0 s1 rm sm : ℚ}
    (hrm : rm = (r0 + r1) / 2) (hsm : sm = (s0 + s1) / 2) {q1 q2 q3 q4 : ℚ}
    (h1 : v2ok a c su sv L t1 r0 rm s0 sm = true ∧ v2val a c su sv L t1 r0 rm s0 sm ≤ q1)
    (h2 : v2ok a c su sv L t2 rm r1 s0 sm = true ∧ v2val a c su sv L t2 rm r1 s0 sm ≤ q2)
    (h3 : v2ok a c su sv L t3 r0 rm sm s1 = true ∧ v2val a c su sv L t3 r0 rm sm s1 ≤ q3)
    (h4 : v2ok a c su sv L t4 rm r1 sm s1 = true ∧ v2val a c su sv L t4 rm r1 sm s1 ≤ q4) :
    v2ok a c su sv L (.node t1 t2 t3 t4) r0 r1 s0 s1 = true ∧
      v2val a c su sv L (.node t1 t2 t3 t4) r0 r1 s0 s1 ≤ q1 + q2 + q3 + q4 := by
  subst hrm hsm
  refine ⟨by simp [v2ok, h1.1, h2.1, h3.1, h4.1], ?_⟩
  simp only [v2val]
  linarith [h1.2, h2.2, h3.2, h4.2]

end CenteredMaximal.General
