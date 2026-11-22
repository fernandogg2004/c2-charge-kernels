/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `003` (73 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r00300 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00300 : nChk 8 14 kAi kCi kL t_r00300 2048 2560 2048 2560 = some 0 := by
  decide +kernel

def t_r00301 : NTree := NTree.ofString "10000"
theorem k_r00301 : nChk 8 14 kAi kCi kL t_r00301 2560 3072 2048 2560 = some 0 := by
  decide +kernel

def t_r00302 : NTree := NTree.ofString "11000010000100000"
theorem k_r00302 : nChk 8 14 kAi kCi kL t_r00302 2048 2560 2560 3072 = some 0 := by
  decide +kernel

def t_r00303 : NTree := NTree.ofString "10000"
theorem k_r00303 : nChk 8 14 kAi kCi kL t_r00303 2560 3072 2560 3072 = some 0 := by
  decide +kernel

def t_r0030 : NTree := .node t_r00300 t_r00301 t_r00302 t_r00303
theorem k_r0030 : nChk 8 14 kAi kCi kL t_r0030 2048 3072 2048 3072 = some 0 :=
  nChk_node rfl rfl k_r00300 k_r00301 k_r00302 k_r00303 rfl

def t_r0031 : NTree := NTree.ofString "10000"
theorem k_r0031 : nChk 8 14 kAi kCi kL t_r0031 3072 4096 2048 3072 = some 0 := by
  decide +kernel

def t_r0032 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0032 : nChk 8 14 kAi kCi kL t_r0032 2048 3072 3072 4096 = some 0 := by
  decide +kernel

def t_r0033 : NTree := NTree.ofString "10000"
theorem k_r0033 : nChk 8 14 kAi kCi kL t_r0033 3072 4096 3072 4096 = some 0 := by
  decide +kernel

def t_r003 : NTree := .node t_r0030 t_r0031 t_r0032 t_r0033
theorem k_r003 : nChk 8 14 kAi kCi kL t_r003 2048 4096 2048 4096 = some 0 :=
  nChk_node rfl rfl k_r0030 k_r0031 k_r0032 k_r0033 rfl

end ChargeKernel.Pt900
