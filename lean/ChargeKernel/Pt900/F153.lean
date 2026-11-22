/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `03` (10 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r03 : NTree := NTree.ofString "1100000100000"
theorem k_r03 : nChk 8 14 kAi kCi kL t_r03 4096 8192 4096 8192 = some 0 := by
  decide +kernel

end ChargeKernel.Pt900
