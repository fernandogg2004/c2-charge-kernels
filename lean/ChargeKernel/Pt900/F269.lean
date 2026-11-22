/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `221` (73 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2210 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2210 : nChk 8 14 kAi kCi kL t_r2210 2048 3072 12288 13312 = some 0 := by
  decide +kernel

def t_r2211 : NTree := NTree.ofString "10000"
theorem k_r2211 : nChk 8 14 kAi kCi kL t_r2211 3072 4096 12288 13312 = some 0 := by
  decide +kernel

def t_r22120 : NTree := NTree.ofString "11000001000010000"
theorem k_r22120 : nChk 8 14 kAi kCi kL t_r22120 2048 2560 13312 13824 = some 0 := by
  decide +kernel

def t_r22121 : NTree := NTree.ofString "10000"
theorem k_r22121 : nChk 8 14 kAi kCi kL t_r22121 2560 3072 13312 13824 = some 0 := by
  decide +kernel

def t_r22122 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22122 : nChk 8 14 kAi kCi kL t_r22122 2048 2560 13824 14336 = some 0 := by
  decide +kernel

def t_r22123 : NTree := NTree.ofString "10000"
theorem k_r22123 : nChk 8 14 kAi kCi kL t_r22123 2560 3072 13824 14336 = some 0 := by
  decide +kernel

def t_r2212 : NTree := .node t_r22120 t_r22121 t_r22122 t_r22123
theorem k_r2212 : nChk 8 14 kAi kCi kL t_r2212 2048 3072 13312 14336 = some 0 :=
  nChk_node rfl rfl k_r22120 k_r22121 k_r22122 k_r22123 rfl

def t_r2213 : NTree := NTree.ofString "10000"
theorem k_r2213 : nChk 8 14 kAi kCi kL t_r2213 3072 4096 13312 14336 = some 0 := by
  decide +kernel

def t_r221 : NTree := .node t_r2210 t_r2211 t_r2212 t_r2213
theorem k_r221 : nChk 8 14 kAi kCi kL t_r221 2048 4096 12288 14336 = some 0 :=
  nChk_node rfl rfl k_r2210 k_r2211 k_r2212 k_r2213 rfl

end ChargeKernel.Pt900
