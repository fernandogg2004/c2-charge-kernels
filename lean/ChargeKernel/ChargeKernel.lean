/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Comparison
public import CenteredMaximal.Cauchy.Potential

/-!
# Charge kernels

For a strength `a ≥ 0`, an offset `c > 0`, finitely many charges `b i ≥ 0` at points `p i`, and a
normalisation `m > 0`, let

`ψ z = a / r(z) − ∑ᵢ bᵢ / r(z − pᵢ) − c`,   `r = diamondNorm`,

and let the *charge kernel* be `K = ψ₊ / m` (patched to `1` at the origin, where Lean's `a / 0 = 0`).

Since `G = 1 / r` is `2π` times the fundamental solution of `A = jumpGen 1`
(`Cauchy.potential_jumpGen`), `Aψ = −2π a δ₀ + 2π ∑ bᵢ δ_{pᵢ}` is a positive measure away from the
origin, and Kato's inequality `A(ψ₊) ≥ 1_{ψ > 0} Aψ` makes the generator of `K` a positive measure
minus a point mass at the origin. In this file that generator condition is the hypothesis `hgen` of
`weakTypeConstant_two_le_of_chargeKernel`; it is proved in `ChargeKato.lean` (`ChargeData.kernel_pos`),
and `Main.lean` combines the two. Everything else needed by the comparison principle is proved here: nonnegativity, evenness (for a configuration symmetric under
`z ↦ −z`), compact support, integrability, and `K ≥ 1` on the unit diamond (from a lower bound
`ψ ≥ m` there).

## Main results

* `ChargeData.kernel_nonneg`, `ChargeData.kernel_neg`, `ChargeData.hasCompactSupport_kernel`,
  `ChargeData.integrable_kernel`, `ChargeData.one_le_kernel`;
* `weakTypeConstant_two_le_of_chargeKernel`: `c₂ ≤ B` from the generator identity, the diamond
  certificate `ψ ≥ m` and the mass certificate `∫ K ≤ 2 B`.
-/

@[expose] public section

noncomputable section

open MeasureTheory Metric Set
open scoped ENNReal

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

/-- The data of a charge kernel. -/
structure ChargeData (n : ℕ) where
  /-- strength of the singularity at the origin -/
  a : ℝ
  /-- constant offset -/
  c : ℝ
  /-- charge positions -/
  p : Fin n → (Fin 2 → ℝ)
  /-- charge strengths -/
  b : Fin n → ℝ
  /-- normalisation -/
  m : ℝ

variable {n : ℕ}

/-- The potential `ψ z = a / r(z) − ∑ bᵢ / r(z − pᵢ) − c`. -/
def ChargeData.psi (D : ChargeData n) (z : Fin 2 → ℝ) : ℝ :=
  D.a / diamondNorm z - ∑ i, D.b i / diamondNorm (z - D.p i) - D.c

/-- The charge kernel `ψ₊ / m`, patched to `1` at the origin. -/
def ChargeData.kernel (D : ChargeData n) (z : Fin 2 → ℝ) : ℝ :=
  if z = 0 then 1 else max (D.psi z) 0 / D.m

/-- Admissible data: nonnegative strengths, positive offset and normalisation. -/
structure ChargeData.Admissible (D : ChargeData n) : Prop where
  a_nonneg : 0 ≤ D.a
  c_pos : 0 < D.c
  b_nonneg : ∀ i, 0 ≤ D.b i
  m_pos : 0 < D.m

/-- The configuration is symmetric under `z ↦ −z` through a permutation of the charges. -/
def ChargeData.Symmetric (D : ChargeData n) : Prop :=
  ∃ σ : Fin n ≃ Fin n, ∀ i, D.p (σ i) = -D.p i ∧ D.b (σ i) = D.b i

variable {D : ChargeData n}

theorem ChargeData.measurable_psi : Measurable D.psi := by
  unfold ChargeData.psi
  refine ((measurable_const.div measurable_diamondNorm).sub ?_).sub measurable_const
  refine Finset.measurable_sum _ fun i _ => ?_
  exact measurable_const.div (measurable_diamondNorm.comp (measurable_id.sub measurable_const))

theorem ChargeData.measurable_kernel : Measurable D.kernel := by
  unfold ChargeData.kernel
  exact Measurable.ite (measurableSet_singleton 0) measurable_const
    ((D.measurable_psi.max measurable_const).div_const _)

theorem ChargeData.kernel_nonneg (hD : D.Admissible) (z : Fin 2 → ℝ) : 0 ≤ D.kernel z := by
  unfold ChargeData.kernel
  split_ifs
  · norm_num
  · exact div_nonneg (le_max_right _ _) hD.m_pos.le

/-- `ψ` is dominated by its singular part. -/
theorem ChargeData.psi_le (hD : D.Admissible) (z : Fin 2 → ℝ) :
    D.psi z ≤ D.a / diamondNorm z - D.c := by
  unfold ChargeData.psi
  have : 0 ≤ ∑ i, D.b i / diamondNorm (z - D.p i) :=
    Finset.sum_nonneg fun i _ => div_nonneg (hD.b_nonneg i) (diamondNorm_nonneg _)
  linarith

/-- Outside the diamond of radius `a / c` the potential is nonpositive. -/
theorem ChargeData.psi_nonpos (hD : D.Admissible) {z : Fin 2 → ℝ}
    (hz : D.a / D.c ≤ diamondNorm z) : D.psi z ≤ 0 := by
  have hle := D.psi_le hD z
  rcases eq_or_lt_of_le (diamondNorm_nonneg z) with h0 | hr
  · rw [← h0, div_zero] at hle
    linarith [hD.c_pos]
  · have hz' : D.a ≤ diamondNorm z * D.c := (div_le_iff₀ hD.c_pos).1 hz
    have h1 : D.a / diamondNorm z ≤ D.c := by
      rw [div_le_iff₀ hr]
      linarith [mul_comm (diamondNorm z) D.c]
    linarith

/-- The kernel vanishes outside the diamond of radius `a / c`. -/
theorem ChargeData.kernel_eq_zero (hD : D.Admissible) {z : Fin 2 → ℝ}
    (hz : D.a / D.c < diamondNorm z) : D.kernel z = 0 := by
  have hz0 : z ≠ 0 := by
    rintro rfl
    have : (0 : ℝ) ≤ D.a / D.c := div_nonneg hD.a_nonneg hD.c_pos.le
    simp [diamondNorm] at hz
    linarith
  unfold ChargeData.kernel
  rw [if_neg hz0, max_eq_right (D.psi_nonpos hD hz.le), zero_div]

/-- The kernel is supported in the sup ball of radius `a / c`. -/
theorem ChargeData.hasCompactSupport_kernel (hD : D.Admissible) : HasCompactSupport D.kernel := by
  refine HasCompactSupport.intro (isCompact_closedBall (0 : Fin 2 → ℝ) (D.a / D.c))
    fun x hx => ?_
  have hnorm : D.a / D.c < ‖x‖ := by
    simpa [mem_closedBall_zero_iff, not_le] using hx
  exact D.kernel_eq_zero hD (hnorm.trans_le (norm_le_diamondNorm x))

/-- The potential is even for a symmetric configuration. -/
theorem ChargeData.psi_neg (hS : D.Symmetric) (z : Fin 2 → ℝ) : D.psi (-z) = D.psi z := by
  obtain ⟨σ, hσ⟩ := hS
  unfold ChargeData.psi
  have hsum : ∑ i, D.b i / diamondNorm (-z - D.p i) = ∑ i, D.b i / diamondNorm (z - D.p i) := by
    rw [← Equiv.sum_comp σ (fun i => D.b i / diamondNorm (-z - D.p i))]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [(hσ i).1, (hσ i).2, show -z - -D.p i = -(z - D.p i) by abel, diamondNorm_neg]
  rw [diamondNorm_neg, hsum]

theorem ChargeData.kernel_neg (hS : D.Symmetric) (z : Fin 2 → ℝ) :
    D.kernel (-z) = D.kernel z := by
  unfold ChargeData.kernel
  simp only [D.psi_neg hS, neg_eq_zero]

/-- The kernel is dominated by a multiple of the Cauchy potential away from the origin. -/
theorem ChargeData.kernel_le (hD : D.Admissible) {z : Fin 2 → ℝ} (hz : z ≠ 0) :
    D.kernel z ≤ (2 * Real.pi * D.a / D.m) * potential z := by
  unfold ChargeData.kernel
  rw [if_neg hz]
  have hr := diamondNorm_pos hz
  have hpot : (2 * Real.pi * D.a / D.m) * potential z = D.a / diamondNorm z / D.m := by
    unfold potential
    field_simp
  rw [hpot]
  refine div_le_div_of_nonneg_right ?_ hD.m_pos.le
  refine max_le ?_ (div_nonneg hD.a_nonneg hr.le)
  linarith [D.psi_le hD z, hD.c_pos]

theorem ChargeData.integrable_kernel (hD : D.Admissible) : Integrable D.kernel := by
  have hsupp : Function.support D.kernel ⊆ closedBall (0 : Fin 2 → ℝ) (D.a / D.c) := by
    intro x hx
    by_contra hx'
    have hnorm : D.a / D.c < ‖x‖ := by
      simpa [mem_closedBall_zero_iff, not_le] using hx'
    exact hx (D.kernel_eq_zero hD (hnorm.trans_le (norm_le_diamondNorm x)))
  rw [← integrableOn_iff_integrable_of_support_subset hsupp]
  have hpot : IntegrableOn (fun z => (2 * Real.pi * D.a / D.m) * potential z)
      (closedBall (0 : Fin 2 → ℝ) (D.a / D.c)) :=
    (integrableOn_potential_closedBall _).const_mul _
  refine hpot.mono' D.measurable_kernel.aestronglyMeasurable.restrict ?_
  have hnull₀ : ∀ᵐ z ∂(volume : Measure (Fin 2 → ℝ)), z ≠ 0 := by
    refine ae_iff.2 (measure_mono_null (fun z hz => ?_) (measure_singleton (0 : Fin 2 → ℝ)))
    simpa using hz
  have hnull : ∀ᵐ z ∂(volume.restrict (closedBall (0 : Fin 2 → ℝ) (D.a / D.c))), z ≠ 0 :=
    ae_restrict_of_ae hnull₀
  filter_upwards [hnull] with z hz
  rw [Real.norm_eq_abs, abs_of_nonneg (D.kernel_nonneg hD z)]
  exact D.kernel_le hD hz

/-- The diamond certificate `ψ ≥ m` gives `K ≥ 1` on the unit diamond. -/
theorem ChargeData.one_le_kernel (hD : D.Admissible)
    (hm : ∀ z, z ≠ 0 → diamondNorm z ≤ 1 → D.m ≤ D.psi z) {z : Fin 2 → ℝ}
    (hz : diamondNorm z ≤ 1) : 1 ≤ D.kernel z := by
  unfold ChargeData.kernel
  split_ifs with h0
  · exact le_rfl
  · rw [le_div_iff₀ hD.m_pos, one_mul]
    exact (hm z h0 hz).trans (le_max_left _ _)

/-- **Upper bound from a charge kernel.** For admissible symmetric data whose kernel satisfies the
generator identity (positive finite measure minus a nonnegative point mass), the diamond
certificate `ψ ≥ m` on the unit diamond, and the mass certificate `∫ K ≤ 2 B`, the weak type
constant satisfies `c₂ ≤ B`. -/
theorem weakTypeConstant_two_le_of_chargeKernel (hD : D.Admissible) (hS : D.Symmetric)
    (hm : ∀ z, z ≠ 0 → diamondNorm z ≤ 1 → D.m ≤ D.psi z)
    (β : Measure (Fin 2 → ℝ)) [IsFiniteMeasure β] {a : ℝ} (ha : 0 ≤ a)
    (hgen : ∀ ψ : (Fin 2 → ℝ) → ℝ, IsTestFunction ψ →
      ∫ x, D.kernel x * jumpGen 1 ψ x = (∫ x, ψ x ∂β) - a * ψ 0)
    {B : ℝ} (hI : ∫ z, D.kernel z ≤ 2 * B) :
    weakTypeConstant 2 ≤ ENNReal.ofReal B := by
  refine (weakTypeConstant_two_le_half_integral (D.kernel_nonneg hD) (D.integrable_kernel hD)
    (D.kernel_neg hS) (D.hasCompactSupport_kernel hD) (fun z hz => D.one_le_kernel hD hm hz)
    β ha hgen).trans (ENNReal.ofReal_le_ofReal ?_)
  linarith

end CenteredMaximal.General
