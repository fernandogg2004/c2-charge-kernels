/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `203` (64 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2030 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2030 : nChk 8 14 kAi kCi kL t_r2030 2048 3072 10240 11264 = some 0 := by
  decide +kernel

def t_r2031 : NTree := NTree.ofString "10000"
theorem k_r2031 : nChk 8 14 kAi kCi kL t_r2031 3072 4096 10240 11264 = some 0 := by
  decide +kernel

def t_r2032 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2032 : nChk 8 14 kAi kCi kL t_r2032 2048 3072 11264 12288 = some 0 := by
  decide +kernel

def t_r2033 : NTree := NTree.ofString "10000"
theorem k_r2033 : nChk 8 14 kAi kCi kL t_r2033 3072 4096 11264 12288 = some 0 := by
  decide +kernel

def t_r203 : NTree := .node t_r2030 t_r2031 t_r2032 t_r2033
theorem k_r203 : nChk 8 14 kAi kCi kL t_r203 2048 4096 10240 12288 = some 0 :=
  nChk_node rfl rfl k_r2030 k_r2031 k_r2032 k_r2033 rfl

end ChargeKernel.Pt900
