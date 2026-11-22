/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.CauchySemigroup

/-!
# The Cauchy potential is excessive

With `P_h F (y) = ∫ p_h(z) F(y − z) dz` and the potential `G = ∫₀^∞ p_t dt`
(`Cauchy.integral_Ioi_heatKernel`), the semigroup property `p_h ⋆ p_t = p_{h+t}` gives

`P_h G (y) = ∫_h^∞ p_t(y) dt = G(y) − ∫_{(0, h]} p_t(y) dt`   for `y ≠ 0`,

so in particular `P_h G ≤ G`. Tonelli's theorem is applied in `ℝ≥0∞`.
-/

@[expose] public section

noncomputable section

open Filter MeasureTheory Set
open scoped ENNReal Topology

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

theorem measurable_heatKernel_uncurry :
    Measurable fun q : ℝ × (Fin 2 → ℝ) => heatKernel q.1 q.2 := by
  unfold heatKernel cauchyDensity
  fun_prop

theorem heatKernel_le {t : ℝ} (ht : 0 < t) (z : Fin 2 → ℝ) :
    heatKernel t z ≤ (1 / (Real.pi * t)) * (1 / (Real.pi * t)) :=
  mul_le_mul (cauchyDensity_le ht _) (cauchyDensity_le ht _) (cauchyDensity_nonneg ht.le _)
    (by positivity)

/-- The potential as a lower integral in time. -/
theorem ofReal_potential_eq_lintegral {w : Fin 2 → ℝ} (hw : w ≠ 0) :
    ENNReal.ofReal (potential w) = ∫⁻ t in Ioi 0, ENNReal.ofReal (heatKernel t w) := by
  rw [← integral_Ioi_heatKernel hw]
  exact ofReal_integral_eq_lintegral_ofReal (integrableOn_Ioi_heatKernel hw)
    (ae_restrict_of_forall_mem measurableSet_Ioi fun t ht => heatKernel_nonneg (le_of_lt ht) w)

/-- **The semigroup applied to the potential, in `ℝ≥0∞`.** -/
theorem lintegral_heatKernel_mul_potential {h : ℝ} (hh : 0 < h) {y : Fin 2 → ℝ} :
    ∫⁻ z, ENNReal.ofReal (heatKernel h z * potential (y - z))
      = ∫⁻ t in Ioi h, ENNReal.ofReal (heatKernel t y) := by
  -- step 1: expand the potential in time (for `z ≠ y`)
  have hae : ∀ᵐ z : Fin 2 → ℝ, z ≠ y := by
    refine ae_iff.2 (measure_mono_null (fun z hz => ?_) (measure_singleton y))
    simpa using hz
  have step1 : (∫⁻ z, ENNReal.ofReal (heatKernel h z * potential (y - z)))
      = ∫⁻ z, ∫⁻ t in Ioi 0, ENNReal.ofReal (heatKernel h z * heatKernel t (y - z)) := by
    refine lintegral_congr_ae ?_
    filter_upwards [hae] with z hz
    have hyz : y - z ≠ 0 := sub_ne_zero.2 (Ne.symm hz)
    rw [ENNReal.ofReal_mul (heatKernel_nonneg hh.le z), ofReal_potential_eq_lintegral hyz,
      ← lintegral_const_mul' _ _ ENNReal.ofReal_ne_top]
    refine setLIntegral_congr_fun measurableSet_Ioi fun t ht => ?_
    rw [ENNReal.ofReal_mul (heatKernel_nonneg hh.le z)]
  -- step 2: Tonelli
  have hmeas : AEMeasurable (Function.uncurry fun (z : Fin 2 → ℝ) (t : ℝ) =>
      ENNReal.ofReal (heatKernel h z * heatKernel t (y - z)))
      ((volume : Measure (Fin 2 → ℝ)).prod (volume.restrict (Ioi (0 : ℝ)))) := by
    refine Measurable.aemeasurable (ENNReal.measurable_ofReal.comp ?_)
    have h1 : Measurable fun q : (Fin 2 → ℝ) × ℝ => heatKernel h q.1 :=
      (measurable_heatKernel_uncurry.comp (measurable_const.prodMk measurable_fst))
    have h2 : Measurable fun q : (Fin 2 → ℝ) × ℝ => heatKernel q.2 (y - q.1) :=
      measurable_heatKernel_uncurry.comp
        (measurable_snd.prodMk (measurable_const.sub measurable_fst))
    exact h1.mul h2
  have step2 := lintegral_lintegral_swap hmeas
  -- step 3: the inner integral is the semigroup
  have step3 : (∫⁻ t in Ioi 0, ∫⁻ z, ENNReal.ofReal (heatKernel h z * heatKernel t (y - z)))
      = ∫⁻ t in Ioi 0, ENNReal.ofReal (heatKernel (t + h) y) := by
    refine setLIntegral_congr_fun measurableSet_Ioi fun t ht => ?_
    have ht' : (0 : ℝ) < t := ht
    have hint : Integrable fun z => heatKernel h z * heatKernel t (y - z) := by
      refine (integrable_heatKernel hh).mul_bdd (c := (1 / (Real.pi * t)) * (1 / (Real.pi * t)))
        ((continuous_heatKernel ht').comp (continuous_const.sub continuous_id)).aestronglyMeasurable
        (Eventually.of_forall fun z => ?_)
      rw [Real.norm_eq_abs, abs_of_nonneg (heatKernel_nonneg ht'.le _)]
      exact heatKernel_le ht' _
    rw [← ofReal_integral_eq_lintegral_ofReal hint
      (Eventually.of_forall fun z => mul_nonneg (heatKernel_nonneg hh.le z)
        (heatKernel_nonneg ht'.le _)),
      integral_heatKernel_mul_sub hh ht' y, add_comm]
  -- step 4: shift time
  have step4 : (∫⁻ t in Ioi 0, ENNReal.ofReal (heatKernel (t + h) y))
      = ∫⁻ t in Ioi h, ENNReal.ofReal (heatKernel t y) := by
    have hmp := (measurePreserving_add_right (volume : Measure ℝ) h)
    have hpre : (fun t : ℝ => t + h) ⁻¹' Ioi h = Ioi 0 := by
      ext t
      simp
    rw [← hpre]
    exact hmp.setLIntegral_comp_preimage_emb (measurableEmbedding_addRight h)
      (fun t => ENNReal.ofReal (heatKernel t y)) (Ioi h)
  rw [step1, step2, step3, step4]

/-- **The potential is excessive**: `P_h G (y) = G(y) − ∫_{(0,h]} p_t(y) dt` for `y ≠ 0`. -/
theorem integral_heatKernel_mul_potential {h : ℝ} (hh : 0 < h) {y : Fin 2 → ℝ} (hy : y ≠ 0) :
    ∫ z, heatKernel h z * potential (y - z)
      = potential y - ∫ t in Ioc 0 h, heatKernel t y := by
  have hIoi : IntegrableOn (fun t => heatKernel t y) (Ioi 0) := integrableOn_Ioi_heatKernel hy
  have hIoih : IntegrableOn (fun t => heatKernel t y) (Ioi h) :=
    hIoi.mono_set (Ioi_subset_Ioi hh.le)
  have hIoc : IntegrableOn (fun t => heatKernel t y) (Ioc 0 h) :=
    hIoi.mono_set Ioc_subset_Ioi_self
  have hsplit : potential y = (∫ t in Ioc 0 h, heatKernel t y) + ∫ t in Ioi h, heatKernel t y := by
    rw [← integral_Ioi_heatKernel hy, ← Ioc_union_Ioi_eq_Ioi hh.le,
      setIntegral_union (Ioc_disjoint_Ioi le_rfl) measurableSet_Ioi hIoc hIoih]
  have hnn : 0 ≤ᵐ[volume] fun z => heatKernel h z * potential (y - z) :=
    Eventually.of_forall fun z => mul_nonneg (heatKernel_nonneg hh.le z) (potential_nonneg _)
  have hm : AEStronglyMeasurable (fun z => heatKernel h z * potential (y - z)) volume :=
    ((continuous_heatKernel hh).measurable.mul
      (measurable_potential.comp (measurable_const.sub measurable_id))).aestronglyMeasurable
  rw [integral_eq_lintegral_of_nonneg_ae hnn hm, lintegral_heatKernel_mul_potential hh,
    ← ofReal_integral_eq_lintegral_ofReal hIoih
      (ae_restrict_of_forall_mem measurableSet_Ioi fun t ht =>
        heatKernel_nonneg (le_of_lt (hh.trans ht)) y),
    ENNReal.toReal_ofReal (setIntegral_nonneg measurableSet_Ioi fun t ht =>
        heatKernel_nonneg (le_of_lt (hh.trans ht)) y)]
  linarith

end CenteredMaximal.General
