/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `023` (64 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0230 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0230 : nChk 8 14 kAi kCi kL t_r0230 2048 3072 6144 7168 = some 0 := by
  decide +kernel

def t_r0231 : NTree := NTree.ofString "10000"
theorem k_r0231 : nChk 8 14 kAi kCi kL t_r0231 3072 4096 6144 7168 = some 0 := by
  decide +kernel

def t_r0232 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0232 : nChk 8 14 kAi kCi kL t_r0232 2048 3072 7168 8192 = some 0 := by
  decide +kernel

def t_r0233 : NTree := NTree.ofString "10000"
theorem k_r0233 : nChk 8 14 kAi kCi kL t_r0233 3072 4096 7168 8192 = some 0 := by
  decide +kernel

def t_r023 : NTree := .node t_r0230 t_r0231 t_r0232 t_r0233
theorem k_r023 : nChk 8 14 kAi kCi kL t_r023 2048 4096 6144 8192 = some 0 :=
  nChk_node rfl rfl k_r0230 k_r0231 k_r0232 k_r0233 rfl

end ChargeKernel.Pt900
