/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CertBridge
public import ChargeKernel.CertSym

/-!
# From a symmetric certificate to `c₂ ≤ B`

For a charge list invariant (up to permutation) under both coordinate reflections, the
quadtree certificates are needed only in the quadrant `(1, 1)`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

theorem psiL_neg_of_perm {a c : ℚ} {L : List Chg} (hPU : (L.map Chg.flipU).Perm L)
    (hPV : (L.map Chg.flipV).Perm L) (z : Fin 2 → ℝ) : psiL a c L (-z) = psiL a c L z := by
  have : -z = zflipU (zflipV z) := by
    funext i; fin_cases i <;> simp [zflipU, zflipV]
  rw [this, psiL_flipU hPU, psiL_flipV hPV]

theorem c2_le_of_cert_sym {a c m R : ℚ} {L : List Chg} {t1 t2 : QTree} {Q Bnd : ℚ}
    (hL : allNonneg L = true) (ha : 0 ≤ a) (hc : 0 < c) (hm : 0 < m) (hR : 0 ≤ R)
    (haR : a ≤ R * c) (hPU : (L.map Chg.flipU).Perm L) (hPV : (L.map Chg.flipV).Perm L)
    (v1 : v1ok a c m 1 1 L t1 0 1 0 1 = true)
    (v2 : v2ok a c 1 1 L t2 0 R 0 1 = true ∧ v2val a c 1 1 L t2 0 R 0 1 ≤ Q)
    (hbound : 4 * Q ≤ 2 * m * Bnd) :
    weakTypeConstant 2 ≤ ENNReal.ofReal Bnd := by
  set D := ChargeData.ofList a c m L with hDdef
  set T := 4 * v2val a c 1 1 L t2 0 R 0 1 with hTdef
  have hD : D.Admissible := by
    refine ⟨?_, ?_, fun i => ?_, ?_⟩
    · show (0 : ℝ) ≤ (a : ℝ); exact_mod_cast ha
    · show (0 : ℝ) < (c : ℝ); exact_mod_cast hc
    · show (0 : ℝ) ≤ ((L.get i).b : ℝ)
      have := List.all_eq_true.1 hL (L.get i) (List.get_mem L i)
      exact_mod_cast of_decide_eq_true this
    · show (0 : ℝ) < (m : ℝ); exact_mod_cast hm
  have hmz : ∀ z, z ≠ 0 → diamondNorm z ≤ 1 → D.m ≤ D.psi z := by
    intro z hz hd
    rw [psi_ofList]
    exact psi_ge_sym hL ha hPU hPV v1 hz hd
  have hlint := lintegral_psi_le_sym hL hc.le hPU hPV hR haR v2.1
  have hT0 : 0 ≤ T := by
    have n1 := (v2_sound hL hc.le (Or.inl rfl) (Or.inl rfl) t2 0 R 0 1 le_rfl hR le_rfl
      zero_le_one le_rfl v2.1).2
    rw [hTdef]; linarith
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
  have hKeven : ∀ z, D.kernel (-z) = D.kernel z := by
    intro z
    unfold ChargeData.kernel
    simp only [neg_eq_zero, hDdef, psi_ofList, psiL_neg_of_perm hPU hPV]
  have ha' : 0 ≤ 4 * Real.pi ^ 2 * D.a / D.m :=
    div_nonneg (by have := hD.a_nonneg; positivity) hD.m_pos.le
  refine (weakTypeConstant_two_le_half_integral_of_pos (D.kernel_nonneg hD)
    (D.integrable_kernel hD) hKeven (D.hasCompactSupport_kernel hD)
    (fun z hz => D.one_le_kernel hD hmz hz) ha'
    (fun φ hφ hφ₀ => D.kernel_pos hD hφ hφ₀)).trans (ENNReal.ofReal_le_ofReal ?_)
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  have hb' : (T : ℝ) ≤ 2 * m * Bnd := by
    have : T ≤ 4 * Q := by rw [hTdef]; linarith [v2.2]
    exact_mod_cast this.trans hbound
  rw [div_le_iff₀ (by norm_num : (0 : ℝ) < 2)]
  calc (∫ z, D.kernel z) ≤ (T : ℝ) / m := hK
    _ ≤ 2 * m * Bnd / m := div_le_div_of_nonneg_right hb' hm'.le
    _ = Bnd * 2 := by field_simp

end CenteredMaximal.General
