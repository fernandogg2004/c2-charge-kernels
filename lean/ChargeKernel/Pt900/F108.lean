/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `021` (64 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0210 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0210 : nChk 8 14 kAi kCi kL t_r0210 2048 3072 4096 5120 = some 0 := by
  decide +kernel

def t_r0211 : NTree := NTree.ofString "10000"
theorem k_r0211 : nChk 8 14 kAi kCi kL t_r0211 3072 4096 4096 5120 = some 0 := by
  decide +kernel

def t_r0212 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0212 : nChk 8 14 kAi kCi kL t_r0212 2048 3072 5120 6144 = some 0 := by
  decide +kernel

def t_r0213 : NTree := NTree.ofString "10000"
theorem k_r0213 : nChk 8 14 kAi kCi kL t_r0213 3072 4096 5120 6144 = some 0 := by
  decide +kernel

def t_r021 : NTree := .node t_r0210 t_r0211 t_r0212 t_r0213
theorem k_r021 : nChk 8 14 kAi kCi kL t_r021 2048 4096 4096 6144 = some 0 :=
  nChk_node rfl rfl k_r0210 k_r0211 k_r0212 k_r0213 rfl

end ChargeKernel.Pt900
