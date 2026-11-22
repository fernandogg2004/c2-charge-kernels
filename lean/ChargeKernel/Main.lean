/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.ComparisonPos
public import ChargeKernel.ChargeKato

/-!
# Upper bounds for `c₂` from charge kernels

`weakTypeConstant_two_le_of_charge`: for admissible charge data symmetric under `z ↦ −z`,

* if `ψ ≥ m` on the punctured closed unit diamond (the *diamond certificate*), and
* if `∫ K ≤ 2B` for the charge kernel `K = ψ₊/m` (the *mass certificate*),

then `c₂ ≤ B`. The generator hypothesis of the comparison principle is discharged by Kato's
inequality (`ChargeData.kernel_pos`); the only remaining inputs are the two numerical
certificates about the explicit function `ψ`.
-/

@[expose] public section

noncomputable section

open MeasureTheory

namespace CenteredMaximal.General

open CenteredMaximal.Cauchy

variable {n : ℕ} {D : ChargeData n}

/-- **Upper bound for `c₂` from a charge kernel**, with the generator condition proved. -/
theorem weakTypeConstant_two_le_of_charge (hD : D.Admissible) (hS : D.Symmetric)
    (hm : ∀ z, z ≠ 0 → diamondNorm z ≤ 1 → D.m ≤ D.psi z)
    {B : ℝ} (hI : ∫ z, D.kernel z ≤ 2 * B) :
    weakTypeConstant 2 ≤ ENNReal.ofReal B := by
  have ha : 0 ≤ 4 * Real.pi ^ 2 * D.a / D.m :=
    div_nonneg (by have := hD.a_nonneg; positivity) hD.m_pos.le
  refine (weakTypeConstant_two_le_half_integral_of_pos (D.kernel_nonneg hD)
    (D.integrable_kernel hD) (D.kernel_neg hS) (D.hasCompactSupport_kernel hD)
    (fun z hz => D.one_le_kernel hD hm hz) ha
    (fun φ hφ hφ₀ => D.kernel_pos hD hφ hφ₀)).trans (ENNReal.ofReal_le_ofReal ?_)
  linarith

end CenteredMaximal.General
