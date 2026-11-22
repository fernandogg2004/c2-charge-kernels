/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertGlobal
public import ChargeKernel.Main

/-!
# From a checked certificate to `c₂ ≤ B`

`c2_le_of_cert`: for charges `L = base ++ base.map neg` (so that the kernel is even), if the
quadtree checks pass then `c₂ ≤ B` for every `B` with `∑ v2val ≤ 2 m B`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

/-- Reflection of a charge through the origin. -/
def Chg.neg (ch : Chg) : Chg := ⟨-ch.p, -ch.q, ch.b⟩

/-- The charge data of a list. -/
def ChargeData.ofList (a c m : ℚ) (L : List Chg) : ChargeData L.length where
  a := a
  c := c
  p := fun i => ![((L.get i).p : ℝ), ((L.get i).q : ℝ)]
  b := fun i => ((L.get i).b : ℝ)
  m := m

theorem sum_get_eq_map_sum {α : Type*} (L : List α) (f : α → ℝ) :
    ∑ i : Fin L.length, f (L.get i) = (L.map f).sum := by
  rw [← List.sum_ofFn]
  congr 1
  conv_rhs => rw [← List.ofFn_get L]
  rw [List.map_ofFn]
  rfl

theorem psi_ofList (a c m : ℚ) (L : List Chg) (z : Fin 2 → ℝ) :
    (ChargeData.ofList a c m L).psi z = psiL a c L z := by
  unfold ChargeData.psi psiL chargeSum
  simp only [ChargeData.ofList, diamondNorm]
  congr 2
  rw [← sum_get_eq_map_sum L (fun ch => (ch.b : ℝ) / (|z 0 - ch.p| + |z 1 - ch.q|))]
  rfl

theorem chargeSum_append (L₁ L₂ : List Chg) (z : Fin 2 → ℝ) :
    chargeSum (L₁ ++ L₂) z = chargeSum L₁ z + chargeSum L₂ z := by
  unfold chargeSum
  rw [List.map_append, List.sum_append]

theorem chargeSum_map_neg (B : List Chg) (z : Fin 2 → ℝ) :
    chargeSum (B.map Chg.neg) z = chargeSum B (-z) := by
  unfold chargeSum
  rw [List.map_map]
  congr 1
  refine List.map_congr_left fun ch _ => ?_
  simp only [Function.comp_apply, Chg.neg, Pi.neg_apply]
  push_cast
  rw [show z 0 - -(ch.p : ℝ) = -(-z 0 - ch.p) by ring, show z 1 - -(ch.q : ℝ) = -(-z 1 - ch.q) by ring,
    abs_neg, abs_neg]

theorem chargeSum_sym (B : List Chg) (z : Fin 2 → ℝ) :
    chargeSum (B ++ B.map Chg.neg) (-z) = chargeSum (B ++ B.map Chg.neg) z := by
  rw [chargeSum_append, chargeSum_append, chargeSum_map_neg, chargeSum_map_neg, neg_neg]
  ring

theorem psiL_sym (a c : ℚ) (B : List Chg) (z : Fin 2 → ℝ) :
    psiL a c (B ++ B.map Chg.neg) (-z) = psiL a c (B ++ B.map Chg.neg) z := by
  unfold psiL
  rw [chargeSum_sym]
  simp only [Pi.neg_apply, abs_neg]

theorem kernel_neg_ofList (a c m : ℚ) (B : List Chg) (z : Fin 2 → ℝ) :
    (ChargeData.ofList a c m (B ++ B.map Chg.neg)).kernel (-z)
      = (ChargeData.ofList a c m (B ++ B.map Chg.neg)).kernel z := by
  unfold ChargeData.kernel
  simp only [neg_eq_zero, psi_ofList, psiL_sym]

/-- **The final assembly.** -/
theorem c2_le_of_cert {a c m R : ℚ} {B : List Chg} {t1 t2 : QTree} {Bnd : ℚ}
    (hL : allNonneg (B ++ B.map Chg.neg) = true) (ha : 0 ≤ a) (hc : 0 < c) (hm : 0 < m)
    (hR : 0 ≤ R) (haR : a ≤ R * c)
    (v1a : v1ok a c m 1 1 (B ++ B.map Chg.neg) t1 0 1 0 1 = true)
    (v1b : v1ok a c m 1 (-1) (B ++ B.map Chg.neg) t1 0 1 0 1 = true)
    (v1c : v1ok a c m (-1) 1 (B ++ B.map Chg.neg) t1 0 1 0 1 = true)
    (v1d : v1ok a c m (-1) (-1) (B ++ B.map Chg.neg) t1 0 1 0 1 = true)
    (v2a : v2ok a c 1 1 (B ++ B.map Chg.neg) t2 0 R 0 1 = true)
    (v2b : v2ok a c 1 (-1) (B ++ B.map Chg.neg) t2 0 R 0 1 = true)
    (v2c : v2ok a c (-1) 1 (B ++ B.map Chg.neg) t2 0 R 0 1 = true)
    (v2d : v2ok a c (-1) (-1) (B ++ B.map Chg.neg) t2 0 R 0 1 = true)
    (hbound : v2val a c 1 1 (B ++ B.map Chg.neg) t2 0 R 0 1
        + v2val a c 1 (-1) (B ++ B.map Chg.neg) t2 0 R 0 1
        + v2val a c (-1) 1 (B ++ B.map Chg.neg) t2 0 R 0 1
        + v2val a c (-1) (-1) (B ++ B.map Chg.neg) t2 0 R 0 1 ≤ 2 * m * Bnd) :
    weakTypeConstant 2 ≤ ENNReal.ofReal Bnd := by
  set L := B ++ B.map Chg.neg with hLdef
  set D := ChargeData.ofList a c m L with hDdef
  set T := v2val a c 1 1 L t2 0 R 0 1 + v2val a c 1 (-1) L t2 0 R 0 1
    + v2val a c (-1) 1 L t2 0 R 0 1 + v2val a c (-1) (-1) L t2 0 R 0 1 with hTdef
  have hD : D.Admissible := by
    refine ⟨?_, ?_, fun i => ?_, ?_⟩
    · show (0 : ℝ) ≤ (a : ℝ); exact_mod_cast ha
    · show (0 : ℝ) < (c : ℝ); exact_mod_cast hc
    · show (0 : ℝ) ≤ ((L.get i).b : ℝ)
      have := List.all_eq_true.1 hL (L.get i) (List.get_mem L i)
      exact_mod_cast of_decide_eq_true this
    · show (0 : ℝ) < (m : ℝ); exact_mod_cast hm
  -- the diamond certificate
  have hmz : ∀ z, z ≠ 0 → diamondNorm z ≤ 1 → D.m ≤ D.psi z := by
    intro z hz hd
    rw [psi_ofList]
    exact psi_ge_of_v1 hL ha v1a v1b v1c v1d hz hd
  -- the mass certificate
  have hlint := lintegral_psi_le hL hc.le hR haR v2a v2b v2c v2d
  have hT0 : 0 ≤ T := by
    have p1 : IsSign (1 : ℚ) := Or.inl rfl
    have p2 : IsSign (-1 : ℚ) := Or.inr rfl
    have n1 := (v2_sound hL hc.le p1 p1 t2 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl v2a).2
    have n2 := (v2_sound hL hc.le p1 p2 t2 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl v2b).2
    have n3 := (v2_sound hL hc.le p2 p1 t2 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl v2c).2
    have n4 := (v2_sound hL hc.le p2 p2 t2 0 R 0 1 le_rfl hR le_rfl zero_le_one le_rfl v2d).2
    rw [hTdef]
    linarith
  have hpsi_int : (∫ z, max (psiL a c L z) 0) ≤ (T : ℝ) := by
    rw [integral_eq_lintegral_of_nonneg_ae (f := fun z => max (psiL a c L z) 0)
      (Filter.Eventually.of_forall fun z => le_max_right _ _)
      ((measurable_psiL a c L).max measurable_const).aestronglyMeasurable]
    exact ENNReal.toReal_le_of_le_ofReal (by exact_mod_cast hT0) hlint
  have hK : (∫ z, D.kernel z) ≤ (T : ℝ) / m := by
    have hae : (fun z => D.kernel z) =ᵐ[volume] fun z => max (psiL a c L z) 0 / m := by
      have h0 : ∀ᵐ z : Fin 2 → ℝ, z ≠ 0 := by
        refine ae_iff.2 (measure_mono_null (fun z hz => ?_) (measure_singleton (0 : Fin 2 → ℝ)))
        simpa using hz
      filter_upwards [h0] with z hz
      show (if z = 0 then 1 else max (D.psi z) 0 / D.m) = max (psiL a c L z) 0 / m
      rw [if_neg hz, hDdef, psi_ofList]
      rfl
    rw [integral_congr_ae hae, integral_div]
    exact div_le_div_of_nonneg_right hpsi_int (by exact_mod_cast hm.le)
  have ha' : 0 ≤ 4 * Real.pi ^ 2 * D.a / D.m :=
    div_nonneg (by have := hD.a_nonneg; positivity) hD.m_pos.le
  refine (weakTypeConstant_two_le_half_integral_of_pos (D.kernel_nonneg hD)
    (D.integrable_kernel hD) (kernel_neg_ofList a c m B) (D.hasCompactSupport_kernel hD)
    (fun z hz => D.one_le_kernel hD hmz hz) ha'
    (fun φ hφ hφ₀ => D.kernel_pos hD hφ hφ₀)).trans (ENNReal.ofReal_le_ofReal ?_)
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  have hb' : (T : ℝ) ≤ 2 * m * Bnd := by exact_mod_cast hbound
  rw [div_le_iff₀ (by norm_num : (0 : ℝ) < 2)]
  calc (∫ z, D.kernel z) ≤ (T : ℝ) / m := hK
    _ ≤ 2 * m * Bnd / m := div_le_div_of_nonneg_right hb' hm'.le
    _ = Bnd * 2 := by field_simp

end CenteredMaximal.General
