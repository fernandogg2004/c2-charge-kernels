/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `1` (1 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r1 : NTree := NTree.ofString "0"
theorem k_r1 : nChk 8 14 kAi kCi kL t_r1 8192 16384 0 8192 = some 0 := by
  decide +kernel

end ChargeKernel.Pt900
