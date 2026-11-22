/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Excessive
public import CenteredMaximal.Transfer.Commutation

/-!
# Calculus of the Cauchy semigroup

* `integral_heatKernel_mul_scaled`: `∫ p_t φ = ∫ p_1(w) φ(t w) dw` (Lin's private scaling lemma);
* `integral_heatKernel_mul_sub_eq`: `∫ p_t(z) F(x − z) dz = ∫ p_t(z) F(z + x) dz` (evenness);
* `tendsto_heat_of_continuous`: `∫ p_t(z) ψ(x − z) dz → ψ(x)` as `t → 0⁺` for bounded continuous `ψ`;
* `heat_duhamel`: `P_h φ(x) − φ(x) = ∫_{(0,h]} (2π)⁻¹ P_s (Aφ)(x) ds` for a test function `φ`;
* `le_of_integral_Ioc_le`: limits at `0⁺` inherit an inequality between integrals over `(0, h]`.
-/

@[expose] public section

noncomputable section

open Filter MeasureTheory Set
open scoped ENNReal Topology

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

/-- The scaling law of the semigroup pairing: `∫ p_t φ = ∫ p_1(w) φ (t w) dw` for `t > 0`. -/
theorem integral_heatKernel_mul_scaled {t : ℝ} (ht : 0 < t) (φ : (Fin 2 → ℝ) → ℝ) :
    (∫ z, heatKernel t z * φ z) = ∫ w, heatKernel 1 w * φ (t • w) := by
  have ht' : t ≠ 0 := ht.ne'
  have hk : ∀ w : Fin 2 → ℝ, heatKernel t (t • w) = (t ^ 2)⁻¹ * heatKernel 1 w := by
    intro w
    have h0 : ∀ u : ℝ, cauchyDensity t (t * u) = t⁻¹ * cauchyDensity 1 u := by
      intro u
      have h2 : (1 : ℝ) + u ^ 2 ≠ 0 := by positivity
      have h3 : t ^ 2 + (t * u) ^ 2 ≠ 0 := by positivity
      rw [cauchyDensity, cauchyDensity]
      field_simp
    simp only [heatKernel, Pi.smul_apply, smul_eq_mul, h0]
    field_simp
  have hcs := Measure.integral_comp_smul (volume : Measure (Fin 2 → ℝ))
    (fun z => heatKernel t z * φ z) t
  rw [Module.finrank_fin_fun] at hcs
  have hL : (∫ w, heatKernel t (t • w) * φ (t • w))
      = (t ^ 2)⁻¹ * ∫ w, heatKernel 1 w * φ (t • w) := by
    rw [← integral_const_mul]
    refine integral_congr_ae (Eventually.of_forall fun w => ?_)
    show heatKernel t (t • w) * φ (t • w) = (t ^ 2)⁻¹ * (heatKernel 1 w * φ (t • w))
    rw [hk w]
    ring
  rw [hL, abs_of_nonneg (by positivity : (0 : ℝ) ≤ (t ^ 2)⁻¹), smul_eq_mul] at hcs
  exact (mul_left_cancel₀ (by positivity : ((t : ℝ) ^ 2)⁻¹ ≠ 0) hcs).symm

/-- Evenness of the density: `∫ p_t(z) F(x − z) dz = ∫ p_t(z) F(z + x) dz`. -/
theorem integral_heatKernel_mul_sub_eq (t : ℝ) (F : (Fin 2 → ℝ) → ℝ) (x : Fin 2 → ℝ) :
    (∫ z, heatKernel t z * F (x - z)) = ∫ z, heatKernel t z * F (z + x) := by
  rw [← integral_neg_eq_self (fun z => heatKernel t z * F (x - z)) volume]
  refine integral_congr_ae (Eventually.of_forall fun z => ?_)
  simp only [heatKernel_neg, sub_neg_eq_add, add_comm x z]

/-- **Approximate identity** for bounded continuous functions. -/
theorem tendsto_heat_of_continuous {ψ : (Fin 2 → ℝ) → ℝ} (hψc : Continuous ψ) {B : ℝ}
    (hψb : ∀ z, |ψ z| ≤ B) (x : Fin 2 → ℝ) :
    Tendsto (fun t => ∫ z, heatKernel t z * ψ (x - z)) (𝓝[>] 0) (𝓝 (ψ x)) := by
  have hp1 : Integrable (heatKernel 1) := integrable_heatKernel one_pos
  have hlim : Tendsto (fun t : ℝ => ∫ w, heatKernel 1 w * ψ (x - t • w)) (𝓝[>] 0)
      (𝓝 (∫ w, heatKernel 1 w * ψ x)) := by
    have hmeas : ∀ u : ℝ, AEStronglyMeasurable
        (fun w : Fin 2 → ℝ => heatKernel 1 w * ψ (x - u • w)) volume := fun u =>
      ((continuous_heatKernel one_pos).mul
        (hψc.comp (continuous_const.sub (continuous_const_smul u)))).aestronglyMeasurable
    refine tendsto_integral_filter_of_dominated_convergence
      (bound := fun w => heatKernel 1 w * B) (Eventually.of_forall hmeas)
      (Eventually.of_forall fun u => Eventually.of_forall fun w => ?_)
      (hp1.mul_const B) (Eventually.of_forall fun w => ?_)
    · show ‖heatKernel 1 w * ψ (x - u • w)‖ ≤ heatKernel 1 w * B
      rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (heatKernel_nonneg one_pos.le w)]
      exact mul_le_mul_of_nonneg_left (hψb _) (heatKernel_nonneg one_pos.le w)
    · show Tendsto (fun u : ℝ => heatKernel 1 w * ψ (x - u • w)) (𝓝[>] (0 : ℝ))
        (𝓝 (heatKernel 1 w * ψ x))
      have hs : Tendsto (fun u : ℝ => x - u • w) (𝓝[>] (0 : ℝ)) (𝓝 x) := by
        have hc : Continuous fun u : ℝ => x - u • w :=
          continuous_const.sub (continuous_id.smul continuous_const)
        simpa using (hc.tendsto 0).mono_left nhdsWithin_le_nhds
      exact Tendsto.const_mul _ ((hψc.tendsto x).comp hs)
  have hval : (∫ w, heatKernel 1 w * ψ x) = ψ x := by
    rw [integral_mul_const, integral_heatKernel one_pos, one_mul]
  rw [← hval]
  refine Tendsto.congr' ?_ hlim
  filter_upwards [self_mem_nhdsWithin] with t ht
  exact (integral_heatKernel_mul_scaled ht fun z => ψ (x - z)).symm

/-- **Averaging lemma.** If `∫_{(0,h]} f ≥ c ∫_{(0,h]} g` for all small `h > 0`, and `f`, `g` are
integrable near `0` with limits `L`, `M` at `0⁺`, then `L ≥ c M`. -/
theorem le_of_integral_Ioc_le {f g : ℝ → ℝ} {L M c : ℝ} {h₀ : ℝ} (hh₀ : 0 < h₀)
    (hf : IntegrableOn f (Ioc 0 h₀)) (hg : IntegrableOn g (Ioc 0 h₀))
    (hfL : Tendsto f (𝓝[>] 0) (𝓝 L)) (hgM : Tendsto g (𝓝[>] 0) (𝓝 M))
    (hint : ∀ h, 0 < h → h < h₀ → c * ∫ s in Ioc 0 h, g s ≤ ∫ s in Ioc 0 h, f s) :
    c * M ≤ L := by
  by_contra hlt
  push_neg at hlt
  set ε := (c * M - L) / 2 with hε
  have hεpos : 0 < ε := by rw [hε]; linarith
  -- near `0⁺`, `f < L + ε/2` and `c g > c M − ε/2`, so `f < c g − ε`
  have hcg : Tendsto (fun s => c * g s) (𝓝[>] 0) (𝓝 (c * M)) := hgM.const_mul c
  have e1 : ∀ᶠ s in 𝓝[>] (0 : ℝ), f s < L + ε / 2 :=
    hfL (Iio_mem_nhds (by linarith))
  have e2 : ∀ᶠ s in 𝓝[>] (0 : ℝ), c * M - ε / 2 < c * g s :=
    hcg (Ioi_mem_nhds (by linarith))
  obtain ⟨δ, hδpos, hδ⟩ : ∃ δ > 0, ∀ s ∈ Ioo 0 δ, f s < L + ε / 2 ∧ c * M - ε / 2 < c * g s := by
    have := (e1.and e2)
    rw [Filter.Eventually, mem_nhdsGT_iff_exists_Ioo_subset] at this
    obtain ⟨u, hu, hsub⟩ := this
    exact ⟨u, hu, fun s hs => hsub hs⟩
  set h := min (δ / 2) (h₀ / 2) with hhdef
  have hhpos : 0 < h := lt_min (by linarith) (by linarith)
  have hhδ : h < δ := (min_le_left _ _).trans_lt (by linarith)
  have hhh₀ : h < h₀ := (min_le_right _ _).trans_lt (by linarith)
  have hsub : Ioc 0 h ⊆ Ioc 0 h₀ := Ioc_subset_Ioc_right hhh₀.le
  have hfI : IntegrableOn f (Ioc 0 h) := hf.mono_set hsub
  have hgI : IntegrableOn (fun s => c * g s) (Ioc 0 h) := (hg.mono_set hsub).const_mul c
  -- integrate the pointwise strict inequality `f + ε ≤ c g` over `(0, h]`
  have hpt : ∀ s ∈ Ioc 0 h, f s + ε ≤ c * g s := by
    intro s hs
    have hs' : s ∈ Ioo 0 δ := ⟨hs.1, hs.2.trans_lt hhδ⟩
    have := hδ s hs'
    linarith [this.1, this.2]
  have hmono : (∫ s in Ioc 0 h, (f s + ε)) ≤ ∫ s in Ioc 0 h, c * g s :=
    setIntegral_mono_on (hfI.add (integrableOn_const (by simp))) hgI measurableSet_Ioc hpt
  rw [integral_add hfI (integrableOn_const (by simp)), setIntegral_const, integral_const_mul,
    Real.volume_real_Ioc_of_le hhpos.le, sub_zero, smul_eq_mul] at hmono
  have hle := hint h hhpos hhh₀
  nlinarith [mul_pos hεpos hhpos]

/-- A bounded continuous function paired with `p_t` stays bounded. -/
theorem abs_integral_heatKernel_mul_le {ψ : (Fin 2 → ℝ) → ℝ} (hψc : Continuous ψ) {B : ℝ}
    (hψb : ∀ z, |ψ z| ≤ B) {t : ℝ} (ht : 0 < t) :
    |∫ z, heatKernel t z * ψ z| ≤ B := by
  have hint : Integrable fun z => heatKernel t z * B := (integrable_heatKernel ht).mul_const B
  have h := norm_integral_le_of_norm_le hint (Eventually.of_forall fun z => by
    show ‖heatKernel t z * ψ z‖ ≤ heatKernel t z * B
    rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (heatKernel_nonneg ht.le z)]
    exact mul_le_mul_of_nonneg_left (hψb z) (heatKernel_nonneg ht.le z))
  rwa [integral_mul_const, integral_heatKernel ht, one_mul, Real.norm_eq_abs] at h

/-- The semigroup pairing is jointly measurable in time. -/
theorem measurable_integral_heatKernel_mul {ψ : (Fin 2 → ℝ) → ℝ} (hψ : Measurable ψ) :
    Measurable fun t => ∫ z, heatKernel t z * ψ z := by
  have hm : Measurable fun q : ℝ × (Fin 2 → ℝ) => heatKernel q.1 q.2 * ψ q.2 :=
    measurable_heatKernel_uncurry.mul (hψ.comp measurable_snd)
  exact (hm.stronglyMeasurable.integral_prod_right' (ν := (volume : Measure (Fin 2 → ℝ)))).measurable

/-- **Duhamel's formula** for the Cauchy semigroup, translated form:
`∫ p_h(z) φ(z + x) dz − φ(x) = ∫_{(0,h]} (2π)⁻¹ ∫ p_s(z) Aφ(z + x) dz ds`. -/
theorem heat_duhamel_add {φ : (Fin 2 → ℝ) → ℝ} (hφ : IsTestFunction φ) {h : ℝ} (hh : 0 < h)
    (x : Fin 2 → ℝ) :
    (∫ z, heatKernel h z * φ (z + x)) - φ x
      = ∫ s in Ioc 0 h, (2 * Real.pi)⁻¹ * ∫ z, heatKernel s z * jumpGen 1 φ (z + x) := by
  set φx : (Fin 2 → ℝ) → ℝ := fun z => φ (z + x) with hφxdef
  have hφx : IsTestFunction φx := hφ.comp_add_right x
  set F : ℝ → ℝ := fun t => ∫ z, heatKernel t z * φx z with hFdef
  set g : ℝ → ℝ := fun t => (2 * Real.pi)⁻¹ * ∫ z, heatKernel t z * jumpGen 1 φ (z + x)
    with hgdef
  have hjx : ∀ z, jumpGen 1 φx z = jumpGen 1 φ (z + x) := fun z => jumpGen_comp_add_right 1 φ x z
  -- the derivative of `F`
  have hderiv : ∀ t ∈ Ioo (0 : ℝ) h, HasDerivAt F (g t) t := by
    intro t ht
    have ht0 : (0 : ℝ) < t := ht.1
    have hD := hasDerivAt_integral_heatKernel_mul hφx ht0
    have hval : (∫ z, deriv (fun t => heatKernel t z) t * φx z) = g t := by
      have h1 : (∫ z, deriv (fun t => heatKernel t z) t * φx z)
          = ∫ z, (1 / (2 * Real.pi)) * (jumpGen 1 (heatKernel t) z * φx z) :=
        integral_congr_ae (Eventually.of_forall fun z => by
          show deriv (fun t => heatKernel t z) t * φx z
            = (1 / (2 * Real.pi)) * (jumpGen 1 (heatKernel t) z * φx z)
          rw [← jumpGen_heatKernel_deriv ht0 z]
          ring)
      rw [h1, integral_const_mul, ← integral_heatKernel_mul_jumpGen ht0 hφx, hgdef, one_div]
      simp only [hjx]
    rw [← hval]
    exact hD
  -- boundedness and measurability of `g`
  obtain ⟨M₀, M₂, h₀, h₂⟩ := exists_bounds_of_hasCompactSupport hφ.contDiff_two hφ.2
  have hAc : Continuous (jumpGen 1 φ) := continuous_jumpGen one_pos (by norm_num) hφ.contDiff_two h₀ h₂
  set B := 2 * (2 * M₂ / (2 - 1) + 8 * M₀ / 1) with hB
  have hAb : ∀ z, |jumpGen 1 φ z| ≤ B := fun z =>
    abs_jumpGen_le one_pos (by norm_num) hφ.contDiff_two h₀ h₂ z
  have hψc : Continuous fun z => jumpGen 1 φ (z + x) := hAc.comp (continuous_id.add continuous_const)
  have hgm : Measurable g :=
    (measurable_integral_heatKernel_mul hψc.measurable).const_mul _
  have hgint : IntegrableOn g (Ioc 0 h) := by
    refine Measure.integrableOn_of_bounded (M := (2 * Real.pi)⁻¹ * B) (by simp)
      hgm.aestronglyMeasurable (ae_restrict_of_forall_mem measurableSet_Ioc fun t ht => ?_)
    rw [hgdef, Real.norm_eq_abs, abs_mul, abs_of_pos (by positivity : (0 : ℝ) < (2 * Real.pi)⁻¹)]
    exact mul_le_mul_of_nonneg_left
      (abs_integral_heatKernel_mul_le hψc (fun z => hAb _) ht.1) (by positivity)
  -- the boundary values
  have ha : Tendsto F (𝓝[>] 0) (𝓝 (φ x)) := by
    have := tendsto_integral_heatKernel_mul_zero hφx
    simpa [hφxdef] using this
  have hFc : ContinuousAt F h := (hasDerivAt_integral_heatKernel_mul hφx hh).continuousAt
  have hb : Tendsto F (𝓝[<] h) (𝓝 (F h)) := hFc.tendsto.mono_left nhdsWithin_le_nhds
  have hftc := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto hh hderiv
    ((intervalIntegrable_iff_integrableOn_Ioc_of_le hh.le).2 hgint) ha hb
  rw [intervalIntegral.integral_of_le hh.le] at hftc
  rw [hftc]

end CenteredMaximal.General
