/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Final

/-!
# c₂ ≤ 3.7265 for the centred maximal operator over squares

The main theorem is `ChargeKernel.Pt900.weakTypeConstant_two_le`:

  `CenteredMaximal.weakTypeConstant 2 ≤ ENNReal.ofReal (7453 / 2000)`,

where `CenteredMaximal.weakTypeConstant` is Yongxi Lin's definition (`CenteredMaximal/Statement.lean`
in the dependency `centered_maximal_constant`). It is proved with the standard axioms only
(`propext`, `Classical.choice`, `Quot.sound`); every computation is checked by the kernel.
-/
