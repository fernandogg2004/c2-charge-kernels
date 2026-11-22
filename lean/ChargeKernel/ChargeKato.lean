/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.ChargeKernel
public import ChargeKernel.HeatCalculus

/-!
# Kato's inequality for charge kernels, via the Cauchy semigroup

For a charge kernel `K = ψ₊ / m` with `ψ = a/r − ∑ bᵢ/r(· − pᵢ) − c` this file proves

`∀ φ test, φ ≥ 0 → −(4π² a / m) φ(0) ≤ ∫ K · jumpGen 1 φ`,

the positivity hypothesis of `weakTypeConstant_two_le_half_integral_of_pos`.

The pointwise heart (`kato_pointwise`): with `P_h F (x) = ∫ p_h(z) F(x − z) dz`, since `K ≥ ψ/m`
and `P_h` preserves order, at a point with `ψ(x) > 0` one has `P_h K (x) − K(x) ≥ (P_h ψ − ψ)(x)/m`,
and the potential is excessive (`integral_heatKernel_mul_potential`), so the charges only help and
`P_h K − K ≥ −(2π a/m) ∫_{(0,h]} p_t dt`; at a point with `ψ(x) ≤ 0` the left side is `≥ 0`.
-/

@[expose] public section

noncomputable section

open Filter MeasureTheory Set
open scoped ENNReal Topology

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

/-- The semigroup applied to the potential is integrable away from the singularity. -/
theorem integrable_heatKernel_mul_potential {h : ℝ} (hh : 0 < h) {y : Fin 2 → ℝ} (hy : y ≠ 0) :
    Integrable fun z => heatKernel h z * potential (y - z) := by
  have hnn : 0 ≤ᵐ[volume] fun z => heatKernel h z * potential (y - z) :=
    Eventually.of_forall fun z => mul_nonneg (heatKernel_nonneg hh.le z) (potential_nonneg _)
  refine ⟨((continuous_heatKernel hh).measurable.mul
      (measurable_potential.comp (measurable_const.sub measurable_id))).aestronglyMeasurable, ?_⟩
  rw [hasFiniteIntegral_iff_ofReal hnn, lintegral_heatKernel_mul_potential hh]
  calc (∫⁻ t in Ioi h, ENNReal.ofReal (heatKernel t y))
      ≤ ∫⁻ t in Ioi 0, ENNReal.ofReal (heatKernel t y) := lintegral_mono_set (Ioi_subset_Ioi hh.le)
    _ = ENNReal.ofReal (potential y) := (ofReal_potential_eq_lintegral hy).symm
    _ < ⊤ := ENNReal.ofReal_lt_top

/-- `a / r(w) = 2π a · potential w`, also at `w = 0` where both sides are `0` in Lean. -/
theorem div_diamondNorm_eq (a : ℝ) (w : Fin 2 → ℝ) :
    a / diamondNorm w = 2 * Real.pi * a * potential w := by
  unfold potential
  rcases eq_or_ne (diamondNorm w) 0 with h0 | h0
  · simp [h0]
  · have : Real.pi ≠ 0 := Real.pi_ne_zero
    field_simp

variable {n : ℕ} {D : ChargeData n}

/-- The time integral `I_h(y) = ∫_{(0,h]} p_t(y) dt`. -/
def heatTime (h : ℝ) (y : Fin 2 → ℝ) : ℝ := ∫ t in Ioc 0 h, heatKernel t y

theorem heatTime_nonneg {h : ℝ} (y : Fin 2 → ℝ) : 0 ≤ heatTime h y :=
  setIntegral_nonneg measurableSet_Ioc fun t ht => heatKernel_nonneg (le_of_lt ht.1) y

/-- `P_h ψ − ψ` in terms of the time integrals: the singular part at the origin contributes
`−2π a I_h(x)`, each charge `+2π bᵢ I_h(x − pᵢ)`, and the constant nothing. -/
theorem integral_heat_psi {h : ℝ} (hh : 0 < h) {x : Fin 2 → ℝ} (hx0 : x ≠ 0)
    (hxp : ∀ i, x ≠ D.p i) :
    ∫ z, heatKernel h z * D.psi (x - z)
      = D.psi x - 2 * Real.pi * D.a * heatTime h x
        + ∑ i, 2 * Real.pi * D.b i * heatTime h (x - D.p i) := by
  have hxpi : ∀ i, x - D.p i ≠ 0 := fun i => sub_ne_zero.2 (hxp i)
  have hpt : ∀ z, heatKernel h z * D.psi (x - z)
      = 2 * Real.pi * D.a * (heatKernel h z * potential (x - z))
        - ∑ i, 2 * Real.pi * D.b i * (heatKernel h z * potential ((x - D.p i) - z))
        - D.c * heatKernel h z := by
    intro z
    unfold ChargeData.psi
    simp_rw [div_diamondNorm_eq, show ∀ i, x - z - D.p i = x - D.p i - z from
      fun i => by abel]
    rw [mul_sub, mul_sub, Finset.mul_sum]
    have hc : ∀ i, heatKernel h z * (2 * Real.pi * D.b i * potential (x - D.p i - z))
        = 2 * Real.pi * D.b i * (heatKernel h z * potential (x - D.p i - z)) := fun i => by ring
    simp only [hc]
    ring
  have hI0 := integrable_heatKernel_mul_potential hh hx0
  have hIi : ∀ i, Integrable fun z => heatKernel h z * potential ((x - D.p i) - z) :=
    fun i => integrable_heatKernel_mul_potential hh (hxpi i)
  have hsum : Integrable fun z =>
      ∑ i, 2 * Real.pi * D.b i * (heatKernel h z * potential ((x - D.p i) - z)) :=
    integrable_finsetSum _ fun i _ => (hIi i).const_mul _
  have i1 : Integrable fun z => 2 * Real.pi * D.a * (heatKernel h z * potential (x - z)) :=
    hI0.const_mul _
  have i12 : Integrable fun z => 2 * Real.pi * D.a * (heatKernel h z * potential (x - z))
      - ∑ i, 2 * Real.pi * D.b i * (heatKernel h z * potential ((x - D.p i) - z)) := i1.sub hsum
  have i3 : Integrable fun z => D.c * heatKernel h z := (integrable_heatKernel hh).const_mul _
  rw [integral_congr_ae (Eventually.of_forall hpt), integral_sub i12 i3, integral_sub i1 hsum,
    integral_finset_sum _ fun i _ => (hIi i).const_mul _,
    integral_const_mul, integral_const_mul, integral_heatKernel hh,
    integral_heatKernel_mul_potential hh hx0]
  simp_rw [integral_const_mul, integral_heatKernel_mul_potential hh (hxpi _)]
  have hpsi : D.psi x = 2 * Real.pi * D.a * potential x
      - ∑ i, 2 * Real.pi * D.b i * potential (x - D.p i) - D.c := by
    unfold ChargeData.psi
    simp_rw [div_diamondNorm_eq]
  rw [hpsi]
  unfold heatTime
  simp only [mul_sub, Finset.sum_sub_distrib]
  ring

/-- `K ≥ ψ / m` everywhere. -/
theorem ChargeData.psi_div_le_kernel (hD : D.Admissible) (w : Fin 2 → ℝ) :
    D.psi w / D.m ≤ D.kernel w := by
  unfold ChargeData.kernel
  split_ifs with hw
  · subst hw
    have hpsi0 : D.psi 0 ≤ 0 := by
      have := D.psi_le hD 0
      simp only [show diamondNorm (0 : Fin 2 → ℝ) = 0 by simp [diamondNorm], div_zero,
        zero_sub] at this
      linarith [hD.c_pos]
    exact (div_nonpos_of_nonpos_of_nonneg hpsi0 hD.m_pos.le).trans zero_le_one
  · exact div_le_div_of_nonneg_right (le_max_left _ _) hD.m_pos.le

/-- **Kato's inequality, pointwise, along the semigroup.** -/
theorem kato_pointwise (hD : D.Admissible) {h : ℝ} (hh : 0 < h) {x : Fin 2 → ℝ} (hx0 : x ≠ 0)
    (hxp : ∀ i, x ≠ D.p i) :
    -(2 * Real.pi * D.a / D.m * heatTime h x)
      ≤ (∫ z, heatKernel h z * D.kernel (x - z)) - D.kernel x := by
  have hm := hD.m_pos
  have hrhs : 0 ≤ 2 * Real.pi * D.a / D.m * heatTime h x :=
    mul_nonneg (div_nonneg (by have := hD.a_nonneg; positivity) hm.le) (heatTime_nonneg x)
  have hKint : Integrable fun z => heatKernel h z * D.kernel (x - z) := by
    obtain ⟨C, hC⟩ : ∃ C, ∀ z, heatKernel h z ≤ C :=
      ⟨_, fun z => heatKernel_le hh z⟩
    have hk : Integrable fun z => D.kernel (x - z) :=
      (D.integrable_kernel hD).comp_sub_left x
    refine (hk.bdd_mul (c := C) (continuous_heatKernel hh).aestronglyMeasurable
      (Eventually.of_forall fun z => ?_))
    rw [Real.norm_eq_abs, abs_of_nonneg (heatKernel_nonneg hh.le z)]
    exact hC z
  have hPK0 : 0 ≤ ∫ z, heatKernel h z * D.kernel (x - z) :=
    integral_nonneg fun z => mul_nonneg (heatKernel_nonneg hh.le z) (D.kernel_nonneg hD _)
  by_cases hpos : 0 < D.psi x
  · have hKx : D.kernel x = D.psi x / D.m := by
      unfold ChargeData.kernel
      rw [if_neg hx0, max_eq_left hpos.le]
    -- `P_h ψ` is integrable: it is a combination of integrable pieces
    have hPint : Integrable fun z => heatKernel h z * D.psi (x - z) := by
      by_contra hni
      have := integral_heat_psi (D := D) hh hx0 hxp
      rw [integral_undef hni] at this
      -- an integrable decomposition exists; derive it from the explicit pieces instead
      exact hni (by
        have hxpi : ∀ i, x - D.p i ≠ 0 := fun i => sub_ne_zero.2 (hxp i)
        have hI0 := integrable_heatKernel_mul_potential hh hx0
        have hsum : Integrable fun z =>
            ∑ i, 2 * Real.pi * D.b i * (heatKernel h z * potential ((x - D.p i) - z)) :=
          integrable_finsetSum _ fun i _ =>
            (integrable_heatKernel_mul_potential hh (hxpi i)).const_mul _
        refine (((hI0.const_mul (2 * Real.pi * D.a)).sub hsum).sub
          ((integrable_heatKernel hh).const_mul D.c)).congr (Eventually.of_forall fun z => ?_)
        simp only [Pi.sub_apply]
        unfold ChargeData.psi
        simp_rw [div_diamondNorm_eq, show ∀ i, x - z - D.p i = x - D.p i - z from
          fun i => by abel]
        rw [mul_sub (heatKernel h z), mul_sub (heatKernel h z), Finset.mul_sum]
        have hc : ∀ i, heatKernel h z * (2 * Real.pi * D.b i * potential (x - D.p i - z))
            = 2 * Real.pi * D.b i * (heatKernel h z * potential (x - D.p i - z)) :=
          fun i => by ring
        simp only [hc]
        ring)
    have hmono : (∫ z, heatKernel h z * D.psi (x - z)) / D.m
        ≤ ∫ z, heatKernel h z * D.kernel (x - z) := by
      rw [← integral_div]
      refine integral_mono (hPint.div_const _) hKint fun z => ?_
      show heatKernel h z * D.psi (x - z) / D.m ≤ heatKernel h z * D.kernel (x - z)
      rw [mul_div_assoc]
      exact mul_le_mul_of_nonneg_left (D.psi_div_le_kernel hD _) (heatKernel_nonneg hh.le z)
    have hcharges : 0 ≤ ∑ i, 2 * Real.pi * D.b i * heatTime h (x - D.p i) :=
      Finset.sum_nonneg fun i _ =>
        mul_nonneg (mul_nonneg (by positivity) (hD.b_nonneg i)) (heatTime_nonneg _)
    rw [integral_heat_psi hh hx0 hxp] at hmono
    rw [hKx]
    have key : (D.psi x - 2 * Real.pi * D.a * heatTime h x) / D.m
        ≤ (D.psi x - 2 * Real.pi * D.a * heatTime h x
            + ∑ i, 2 * Real.pi * D.b i * heatTime h (x - D.p i)) / D.m :=
      div_le_div_of_nonneg_right (by linarith) hm.le
    have hsplit : (D.psi x - 2 * Real.pi * D.a * heatTime h x) / D.m
        = D.psi x / D.m - 2 * Real.pi * D.a / D.m * heatTime h x := by
      field_simp
    linarith
  · have hKx : D.kernel x = 0 := by
      unfold ChargeData.kernel
      rw [if_neg hx0, max_eq_right (not_lt.1 hpos), zero_div]
    rw [hKx]
    linarith

/-- Restriction in the second factor of a product measure, as a restriction of the product. -/
theorem prod_restrict_right_eq {X : Type*} [MeasurableSpace X] (μ : Measure X) [SFinite μ]
    (t : Set ℝ) :
    μ.prod (volume.restrict t) = (μ.prod volume).restrict (univ ×ˢ t) := by
  rw [← Measure.prod_restrict, Measure.restrict_univ]

/-- The translated semigroup pairing is measurable in the base point. -/
theorem measurable_integral_heatKernel_mul_add {ψ : (Fin 2 → ℝ) → ℝ} (hψ : Measurable ψ)
    (h : ℝ) : Measurable fun x : Fin 2 → ℝ => ∫ z, heatKernel h z * ψ (z + x) := by
  have hm : Measurable fun q : (Fin 2 → ℝ) × (Fin 2 → ℝ) => heatKernel h q.2 * ψ (q.2 + q.1) :=
    ((measurable_heatKernel_uncurry.comp (measurable_const.prodMk measurable_snd))).mul
      (hψ.comp (measurable_snd.add measurable_fst))
  exact (hm.stronglyMeasurable.integral_prod_right'
    (ν := (volume : Measure (Fin 2 → ℝ)))).measurable

/-- **Kato's inequality for charge kernels.** For every nonnegative test function `φ`,
`∫ K · jumpGen 1 φ ≥ −(4π² a / m) φ(0)`. -/
theorem ChargeData.kernel_pos (hD : D.Admissible) {φ : (Fin 2 → ℝ) → ℝ} (hφ : IsTestFunction φ)
    (hφ₀ : ∀ z, 0 ≤ φ z) :
    -((4 * Real.pi ^ 2 * D.a / D.m) * φ 0) ≤ ∫ x, D.kernel x * jumpGen 1 φ x := by
  set K := D.kernel with hKdef
  have hKint : Integrable K := D.integrable_kernel hD
  have hKm : Measurable K := D.measurable_kernel
  have hK₀ : ∀ x, 0 ≤ K x := D.kernel_nonneg hD
  set a' := 2 * Real.pi * D.a / D.m with ha'
  have ha'0 : 0 ≤ a' := div_nonneg (by have := hD.a_nonneg; positivity) hD.m_pos.le
  obtain ⟨M₀, M₂, h₀, h₂⟩ := exists_bounds_of_hasCompactSupport hφ.contDiff_two hφ.2
  have hAc : Continuous (jumpGen 1 φ) :=
    continuous_jumpGen one_pos (by norm_num) hφ.contDiff_two h₀ h₂
  set B := 2 * (2 * M₂ / (2 - 1) + 8 * M₀ / 1) with hB
  have hAb : ∀ z, |jumpGen 1 φ z| ≤ B := fun z =>
    abs_jumpGen_le one_pos (by norm_num) hφ.contDiff_two h₀ h₂ z
  have hφc : Continuous φ := hφ.continuous
  have hφb : ∀ z, |φ z| ≤ M₀ := h₀
  -- the semigroup applied to the generator, in Duhamel's translated form
  set G : ℝ → (Fin 2 → ℝ) → ℝ := fun s x => ∫ z, heatKernel s z * jumpGen 1 φ (z + x)
    with hGdef
  have hGm : Measurable (Function.uncurry G) := by
    have hm : Measurable fun q : (ℝ × (Fin 2 → ℝ)) × (Fin 2 → ℝ) =>
        heatKernel q.1.1 q.2 * jumpGen 1 φ (q.2 + q.1.2) :=
      (measurable_heatKernel_uncurry.comp
        ((measurable_fst.comp measurable_fst).prodMk measurable_snd)).mul
        (hAc.measurable.comp (measurable_snd.add (measurable_snd.comp measurable_fst)))
    exact (hm.stronglyMeasurable.integral_prod_right'
      (ν := (volume : Measure (Fin 2 → ℝ)))).measurable
  have hGb : ∀ s, 0 < s → ∀ x, |G s x| ≤ B := fun s hs x =>
    abs_integral_heatKernel_mul_le (hAc.comp (continuous_id.add continuous_const))
      (fun z => hAb _) hs
  set Φ : ℝ → ℝ := fun s => ∫ x, K x * ((2 * Real.pi)⁻¹ * G s x) with hΦdef
  set Ψ : ℝ → ℝ := fun s => ∫ x, heatKernel s x * φ x with hΨdef
  have hπ : (0 : ℝ) < (2 * Real.pi)⁻¹ := by positivity
  -- step 1: Duhamel and Fubini
  have step1 : ∀ h, 0 < h →
      (∫ x, K x * ((∫ z, heatKernel h z * φ (z + x)) - φ x)) = ∫ s in Ioc 0 h, Φ s := by
    intro h hh
    haveI : IsFiniteMeasure (volume.restrict (Ioc (0 : ℝ) h)) :=
      isFiniteMeasure_restrict.2 measure_Ioc_lt_top.ne
    have hF : Integrable (Function.uncurry fun (x : Fin 2 → ℝ) (s : ℝ) =>
        K x * ((2 * Real.pi)⁻¹ * G s x))
        ((volume : Measure (Fin 2 → ℝ)).prod (volume.restrict (Ioc 0 h))) := by
      have hbound : Integrable (fun q : (Fin 2 → ℝ) × ℝ => |K q.1| * ((2 * Real.pi)⁻¹ * B))
          ((volume : Measure (Fin 2 → ℝ)).prod (volume.restrict (Ioc 0 h))) :=
        hKint.abs.mul_prod (integrable_const _)
      refine hbound.mono' ((hKm.comp measurable_fst).mul (measurable_const.mul
        (hGm.comp (measurable_snd.prodMk measurable_fst)))).aestronglyMeasurable ?_
      rw [prod_restrict_right_eq]
      refine ae_restrict_of_forall_mem (MeasurableSet.univ.prod measurableSet_Ioc) fun q hq => ?_
      have hs : 0 < q.2 := hq.2.1
      show ‖K q.1 * ((2 * Real.pi)⁻¹ * G q.2 q.1)‖ ≤ |K q.1| * ((2 * Real.pi)⁻¹ * B)
      rw [Real.norm_eq_abs, abs_mul, abs_mul, abs_of_pos hπ]
      exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (hGb _ hs _) hπ.le)
        (abs_nonneg _)
    calc (∫ x, K x * ((∫ z, heatKernel h z * φ (z + x)) - φ x))
        = ∫ x, ∫ s in Ioc 0 h, K x * ((2 * Real.pi)⁻¹ * G s x) := by
          refine integral_congr_ae (Eventually.of_forall fun x => ?_)
          show K x * ((∫ z, heatKernel h z * φ (z + x)) - φ x)
            = ∫ s in Ioc 0 h, K x * ((2 * Real.pi)⁻¹ * G s x)
          rw [heat_duhamel_add hφ hh x, ← integral_const_mul]
      _ = ∫ s in Ioc 0 h, Φ s := integral_integral_swap hF
  -- step 2: symmetry of the semigroup
  have step2 : ∀ h, 0 < h →
      (∫ x, K x * ((∫ z, heatKernel h z * φ (z + x)) - φ x))
        = ∫ y, ((∫ z, heatKernel h z * K (y - z)) - K y) * φ y := by
    intro h hh
    have hI1 : Integrable (fun q : (Fin 2 → ℝ) × (Fin 2 → ℝ) =>
        K q.1 * (heatKernel h q.2 * φ (q.2 + q.1))) (volume.prod volume) := by
      refine ((hKint.mul_prod (integrable_heatKernel hh)).mul_bdd (c := M₀)
        ((hφc.comp (continuous_snd.add continuous_fst)).aestronglyMeasurable)
        (Eventually.of_forall fun q => (Real.norm_eq_abs _).trans_le (hφb _))).congr
        (Eventually.of_forall fun q => by simp only [Function.comp_apply, Pi.add_apply]; ring)
    have hI2 : Integrable (fun q : (Fin 2 → ℝ) × (Fin 2 → ℝ) =>
        heatKernel h q.2 * K (q.1 - q.2) * φ q.1) (volume.prod volume) :=
      (integrable_prod_kernel_mul (integrable_heatKernel hh) hKint).mul_bdd (c := M₀)
        ((hφc.comp continuous_fst).aestronglyMeasurable)
        (Eventually.of_forall fun q => (Real.norm_eq_abs _).trans_le (hφb _))
    have hA : (∫ x, K x * ∫ z, heatKernel h z * φ (z + x))
        = ∫ y, (∫ z, heatKernel h z * K (y - z)) * φ y := by
      calc (∫ x, K x * ∫ z, heatKernel h z * φ (z + x))
          = ∫ x, ∫ z, K x * (heatKernel h z * φ (z + x)) :=
            integral_congr_ae (Eventually.of_forall fun x => (integral_const_mul _ _).symm)
        _ = ∫ z, ∫ x, K x * (heatKernel h z * φ (z + x)) := integral_integral_swap hI1
        _ = ∫ z, ∫ y, heatKernel h z * K (y - z) * φ y := by
            refine integral_congr_ae (Eventually.of_forall fun z => ?_)
            show (∫ x, K x * (heatKernel h z * φ (z + x)))
              = ∫ y, heatKernel h z * K (y - z) * φ y
            rw [← integral_sub_right_eq_self (fun x => K x * (heatKernel h z * φ (z + x))) z]
            refine integral_congr_ae (Eventually.of_forall fun y => ?_)
            show K (y - z) * (heatKernel h z * φ (z + (y - z))) = heatKernel h z * K (y - z) * φ y
            rw [show z + (y - z) = y by abel]
            ring
        _ = ∫ y, ∫ z, heatKernel h z * K (y - z) * φ y := (integral_integral_swap hI2).symm
        _ = ∫ y, (∫ z, heatKernel h z * K (y - z)) * φ y :=
            integral_congr_ae (Eventually.of_forall fun y => integral_mul_const _ _)
    have hKφ : Integrable fun x => K x * φ x :=
      hKint.mul_bdd hφc.aestronglyMeasurable
        (Eventually.of_forall fun x => (Real.norm_eq_abs _).trans_le (hφb x))
    have hKP : Integrable fun x => K x * ∫ z, heatKernel h z * φ (z + x) := by
      refine hKint.mul_bdd (c := M₀)
        (measurable_integral_heatKernel_mul_add hφc.measurable h).aestronglyMeasurable
        (Eventually.of_forall fun x => ?_)
      rw [Real.norm_eq_abs]
      exact abs_integral_heatKernel_mul_le (hφc.comp (continuous_id.add continuous_const))
        (fun z => hφb _) hh
    have hPKφ : Integrable fun y => (∫ z, heatKernel h z * K (y - z)) * φ y :=
      hI2.integral_prod_left.congr (Eventually.of_forall fun y => by
        show (∫ z, heatKernel h z * K (y - z) * φ y) = (∫ z, heatKernel h z * K (y - z)) * φ y
        exact integral_mul_const _ _)
    calc (∫ x, K x * ((∫ z, heatKernel h z * φ (z + x)) - φ x))
        = (∫ x, K x * ∫ z, heatKernel h z * φ (z + x)) - ∫ x, K x * φ x := by
          rw [← integral_sub hKP hKφ]
          exact integral_congr_ae (Eventually.of_forall fun x => by simp only; ring)
      _ = (∫ y, (∫ z, heatKernel h z * K (y - z)) * φ y) - ∫ x, K x * φ x := by rw [hA]
      _ = ∫ y, ((∫ z, heatKernel h z * K (y - z)) - K y) * φ y := by
          rw [← integral_sub hPKφ hKφ]
          exact integral_congr_ae (Eventually.of_forall fun x => by simp only; ring)
  -- step 3: integrate Kato's inequality
  have hnull : ∀ᵐ x : Fin 2 → ℝ, x ≠ 0 ∧ ∀ i, x ≠ D.p i := by
    have h0 : ∀ᵐ x : Fin 2 → ℝ, x ≠ 0 := by
      refine ae_iff.2 (measure_mono_null (fun z hz => ?_) (measure_singleton (0 : Fin 2 → ℝ)))
      simpa using hz
    have hi : ∀ i, ∀ᵐ x : Fin 2 → ℝ, x ≠ D.p i := fun i => by
      refine ae_iff.2 (measure_mono_null (fun z hz => ?_) (measure_singleton (D.p i)))
      simpa using hz
    filter_upwards [h0, ae_all_iff.2 hi] with x hx0 hxp using ⟨hx0, hxp⟩
  have step3 : ∀ h, 0 < h →
      -a' * (∫ t in Ioc 0 h, Ψ t) ≤ ∫ y, ((∫ z, heatKernel h z * K (y - z)) - K y) * φ y := by
    intro h hh
    haveI : IsFiniteMeasure (volume.restrict (Ioc (0 : ℝ) h)) :=
      isFiniteMeasure_restrict.2 measure_Ioc_lt_top.ne
    have hTm : Measurable (Function.uncurry fun (x : Fin 2 → ℝ) (t : ℝ) => heatKernel t x * φ x) :=
      (measurable_heatKernel_uncurry.comp (measurable_snd.prodMk measurable_fst)).mul
        (hφc.measurable.comp measurable_fst)
    have hT : Integrable (Function.uncurry fun (x : Fin 2 → ℝ) (t : ℝ) => heatKernel t x * φ x)
        ((volume : Measure (Fin 2 → ℝ)).prod (volume.restrict (Ioc 0 h))) := by
      rw [integrable_prod_iff' hTm.aestronglyMeasurable]
      refine ⟨ae_restrict_of_forall_mem measurableSet_Ioc fun t ht =>
        (integrable_heatKernel ht.1).mul_bdd (c := M₀) hφc.aestronglyMeasurable
          (Eventually.of_forall fun x => (Real.norm_eq_abs _).trans_le (hφb x)), ?_⟩
      have hnm : Measurable fun q : ℝ × (Fin 2 → ℝ) => ‖heatKernel q.1 q.2 * φ q.2‖ :=
        (measurable_heatKernel_uncurry.mul (hφc.measurable.comp measurable_snd)).norm
      refine Measure.integrableOn_of_bounded (M := M₀) (by simp)
        (hnm.stronglyMeasurable.integral_prod_right'
          (ν := (volume : Measure (Fin 2 → ℝ)))).measurable.aestronglyMeasurable
        (ae_restrict_of_forall_mem measurableSet_Ioc fun t ht => ?_)
      have ht0 : 0 < t := ht.1
      show ‖∫ x, ‖heatKernel t x * φ x‖‖ ≤ M₀
      rw [Real.norm_of_nonneg (integral_nonneg fun x => norm_nonneg _)]
      have hb : (∫ x, ‖heatKernel t x * φ x‖) ≤ ∫ x, heatKernel t x * M₀ := by
        refine integral_mono ((integrable_heatKernel ht0).mul_bdd (c := M₀)
          hφc.aestronglyMeasurable
          (Eventually.of_forall fun x => (Real.norm_eq_abs _).trans_le (hφb x))).norm
          ((integrable_heatKernel ht0).mul_const _) fun x => ?_
        show ‖heatKernel t x * φ x‖ ≤ heatKernel t x * M₀
        rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (heatKernel_nonneg ht0.le x)]
        exact mul_le_mul_of_nonneg_left (hφb x) (heatKernel_nonneg ht0.le x)
      rwa [integral_mul_const, integral_heatKernel ht0, one_mul] at hb
    have hHφ : Integrable fun x => heatTime h x * φ x :=
      hT.integral_prod_left.congr (Eventually.of_forall fun x => by
        show (∫ t in Ioc 0 h, heatKernel t x * φ x) = heatTime h x * φ x
        unfold heatTime
        exact integral_mul_const _ _)
    have hTx : (∫ x, heatTime h x * φ x) = ∫ t in Ioc 0 h, Ψ t := by
      calc (∫ x, heatTime h x * φ x) = ∫ x, ∫ t in Ioc 0 h, heatKernel t x * φ x :=
            integral_congr_ae (Eventually.of_forall fun x => by
              show heatTime h x * φ x = ∫ t in Ioc 0 h, heatKernel t x * φ x
              unfold heatTime
              exact (integral_mul_const _ _).symm)
        _ = ∫ t in Ioc 0 h, Ψ t := integral_integral_swap hT
    have hI2 : Integrable (fun q : (Fin 2 → ℝ) × (Fin 2 → ℝ) =>
        heatKernel h q.2 * K (q.1 - q.2) * φ q.1) (volume.prod volume) :=
      (integrable_prod_kernel_mul (integrable_heatKernel hh) hKint).mul_bdd (c := M₀)
        ((hφc.comp continuous_fst).aestronglyMeasurable)
        (Eventually.of_forall fun q => (Real.norm_eq_abs _).trans_le (hφb _))
    have hPKφ : Integrable fun y => (∫ z, heatKernel h z * K (y - z)) * φ y :=
      hI2.integral_prod_left.congr (Eventually.of_forall fun y => by
        show (∫ z, heatKernel h z * K (y - z) * φ y) = (∫ z, heatKernel h z * K (y - z)) * φ y
        exact integral_mul_const _ _)
    have hKφ : Integrable fun x => K x * φ x :=
      hKint.mul_bdd hφc.aestronglyMeasurable
        (Eventually.of_forall fun x => (Real.norm_eq_abs _).trans_le (hφb x))
    have hR : Integrable fun y => ((∫ z, heatKernel h z * K (y - z)) - K y) * φ y :=
      (hPKφ.sub hKφ).congr (Eventually.of_forall fun y => by simp only [Pi.sub_apply]; ring)
    calc -a' * (∫ t in Ioc 0 h, Ψ t) = ∫ x, -a' * heatTime h x * φ x := by
          rw [← hTx, ← integral_const_mul]
          exact integral_congr_ae (Eventually.of_forall fun x => by ring)
      _ ≤ ∫ y, ((∫ z, heatKernel h z * K (y - z)) - K y) * φ y := by
          refine integral_mono_ae ((hHφ.const_mul (-a')).congr
            (Eventually.of_forall fun x => by simp only; ring)) hR ?_
          filter_upwards [hnull] with x hx
          have hk := kato_pointwise hD hh hx.1 hx.2
          have : -a' * heatTime h x ≤ (∫ z, heatKernel h z * K (x - z)) - K x := by
            rw [ha']
            linarith
          exact mul_le_mul_of_nonneg_right this (hφ₀ x)
  -- step 4: combine
  have hmain : ∀ h, 0 < h → h < 1 → -a' * (∫ t in Ioc 0 h, Ψ t) ≤ ∫ s in Ioc 0 h, Φ s :=
    fun h hh _ => by rw [← step1 h hh, step2 h hh]; exact step3 h hh
  -- step 5: the limits as `h → 0⁺`
  have hΦlim : Tendsto Φ (𝓝[>] 0) (𝓝 (∫ x, K x * ((2 * Real.pi)⁻¹ * jumpGen 1 φ x))) := by
    refine tendsto_integral_filter_of_dominated_convergence
      (bound := fun x => |K x| * ((2 * Real.pi)⁻¹ * B))
      (Eventually.of_forall fun s => (hKm.mul (measurable_const.mul
        (hGm.comp (measurable_const.prodMk measurable_id)))).aestronglyMeasurable) ?_
      (hKint.abs.mul_const _) (ae_of_all _ fun x => ?_)
    · filter_upwards [self_mem_nhdsWithin] with s hs
      refine ae_of_all _ fun x => ?_
      show ‖K x * ((2 * Real.pi)⁻¹ * G s x)‖ ≤ |K x| * ((2 * Real.pi)⁻¹ * B)
      rw [Real.norm_eq_abs, abs_mul, abs_mul, abs_of_pos hπ]
      exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (hGb s hs x) hπ.le)
        (abs_nonneg _)
    · have hG : ∀ s, G s x = ∫ z, heatKernel s z * jumpGen 1 φ (x - z) := fun s =>
        (integral_heatKernel_mul_sub_eq s (jumpGen 1 φ) x).symm
      simp only [hG]
      exact ((tendsto_heat_of_continuous hAc hAb x).const_mul _).const_mul _
  have hΨlim : Tendsto Ψ (𝓝[>] 0) (𝓝 (φ 0)) := tendsto_integral_heatKernel_mul_zero hφ
  have hΦm : Measurable Φ := by
    have hm : Measurable fun q : ℝ × (Fin 2 → ℝ) => K q.2 * ((2 * Real.pi)⁻¹ * G q.1 q.2) :=
      (hKm.comp measurable_snd).mul (measurable_const.mul hGm)
    exact (hm.stronglyMeasurable.integral_prod_right'
      (ν := (volume : Measure (Fin 2 → ℝ)))).measurable
  have hΦi : IntegrableOn Φ (Ioc 0 1) := by
    refine Measure.integrableOn_of_bounded (M := (∫ x, |K x|) * ((2 * Real.pi)⁻¹ * B))
      (by simp) hΦm.aestronglyMeasurable
      (ae_restrict_of_forall_mem measurableSet_Ioc fun s hs => ?_)
    have hb := norm_integral_le_of_norm_le (hKint.abs.mul_const ((2 * Real.pi)⁻¹ * B))
      (Eventually.of_forall fun x => by
        show ‖K x * ((2 * Real.pi)⁻¹ * G s x)‖ ≤ |K x| * ((2 * Real.pi)⁻¹ * B)
        rw [Real.norm_eq_abs, abs_mul, abs_mul, abs_of_pos hπ]
        exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (hGb s hs.1 x) hπ.le)
          (abs_nonneg _))
    rwa [integral_mul_const] at hb
  have hΨi : IntegrableOn Ψ (Ioc 0 1) := by
    refine Measure.integrableOn_of_bounded (M := M₀) (by simp)
      (measurable_integral_heatKernel_mul hφc.measurable).aestronglyMeasurable
      (ae_restrict_of_forall_mem measurableSet_Ioc fun s hs => ?_)
    rw [Real.norm_eq_abs]
    exact abs_integral_heatKernel_mul_le hφc hφb hs.1
  -- step 6: the averaging lemma
  have hfin := le_of_integral_Ioc_le (c := -a') one_pos hΦi hΨi hΦlim hΨlim hmain
  have hpull : (∫ x, K x * ((2 * Real.pi)⁻¹ * jumpGen 1 φ x))
      = (2 * Real.pi)⁻¹ * ∫ x, K x * jumpGen 1 φ x := by
    rw [← integral_const_mul]
    exact integral_congr_ae (Eventually.of_forall fun x => by ring)
  rw [hpull] at hfin
  have h2π : (0 : ℝ) < 2 * Real.pi := by positivity
  have hmul := mul_le_mul_of_nonneg_left hfin h2π.le
  rw [← mul_assoc (2 * Real.pi) (2 * Real.pi)⁻¹, mul_inv_cancel₀ h2π.ne', one_mul] at hmul
  have hconst : 4 * Real.pi ^ 2 * D.a / D.m * φ 0 = 2 * Real.pi * (a' * φ 0) := by
    rw [ha']
    field_simp
    ring
  rw [hconst]
  linarith

end CenteredMaximal.General
