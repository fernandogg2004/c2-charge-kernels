/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2001` (376 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2001000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001000 : nChk 8 14 kAi kCi kL t_r2001000 1024 1152 8192 8320 = some 0 := by
  decide +kernel

def t_r2001001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001001 : nChk 8 14 kAi kCi kL t_r2001001 1152 1280 8192 8320 = some 0 := by
  decide +kernel

def t_r2001002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001002 : nChk 8 14 kAi kCi kL t_r2001002 1024 1152 8320 8448 = some 0 := by
  decide +kernel

def t_r2001003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001003 : nChk 8 14 kAi kCi kL t_r2001003 1152 1280 8320 8448 = some 0 := by
  decide +kernel

def t_r200100 : NTree := .node t_r2001000 t_r2001001 t_r2001002 t_r2001003
theorem k_r200100 : nChk 8 14 kAi kCi kL t_r200100 1024 1280 8192 8448 = some 0 :=
  nChk_node rfl rfl k_r2001000 k_r2001001 k_r2001002 k_r2001003 rfl

def t_r200101 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200101 : nChk 8 14 kAi kCi kL t_r200101 1280 1536 8192 8448 = some 0 := by
  decide +kernel

def t_r2001020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001020 : nChk 8 14 kAi kCi kL t_r2001020 1024 1152 8448 8576 = some 0 := by
  decide +kernel

def t_r2001021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001021 : nChk 8 14 kAi kCi kL t_r2001021 1152 1280 8448 8576 = some 0 := by
  decide +kernel

def t_r2001022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001022 : nChk 8 14 kAi kCi kL t_r2001022 1024 1152 8576 8704 = some 0 := by
  decide +kernel

def t_r2001023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001023 : nChk 8 14 kAi kCi kL t_r2001023 1152 1280 8576 8704 = some 0 := by
  decide +kernel

def t_r200102 : NTree := .node t_r2001020 t_r2001021 t_r2001022 t_r2001023
theorem k_r200102 : nChk 8 14 kAi kCi kL t_r200102 1024 1280 8448 8704 = some 0 :=
  nChk_node rfl rfl k_r2001020 k_r2001021 k_r2001022 k_r2001023 rfl

def t_r200103 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200103 : nChk 8 14 kAi kCi kL t_r200103 1280 1536 8448 8704 = some 0 := by
  decide +kernel

def t_r20010 : NTree := .node t_r200100 t_r200101 t_r200102 t_r200103
theorem k_r20010 : nChk 8 14 kAi kCi kL t_r20010 1024 1536 8192 8704 = some 0 :=
  nChk_node rfl rfl k_r200100 k_r200101 k_r200102 k_r200103 rfl

def t_r20011 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20011 : nChk 8 14 kAi kCi kL t_r20011 1536 2048 8192 8704 = some 0 := by
  decide +kernel

def t_r2001200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001200 : nChk 8 14 kAi kCi kL t_r2001200 1024 1152 8704 8832 = some 0 := by
  decide +kernel

def t_r2001201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001201 : nChk 8 14 kAi kCi kL t_r2001201 1152 1280 8704 8832 = some 0 := by
  decide +kernel

def t_r2001202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001202 : nChk 8 14 kAi kCi kL t_r2001202 1024 1152 8832 8960 = some 0 := by
  decide +kernel

def t_r2001203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001203 : nChk 8 14 kAi kCi kL t_r2001203 1152 1280 8832 8960 = some 0 := by
  decide +kernel

def t_r200120 : NTree := .node t_r2001200 t_r2001201 t_r2001202 t_r2001203
theorem k_r200120 : nChk 8 14 kAi kCi kL t_r200120 1024 1280 8704 8960 = some 0 :=
  nChk_node rfl rfl k_r2001200 k_r2001201 k_r2001202 k_r2001203 rfl

def t_r200121 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200121 : nChk 8 14 kAi kCi kL t_r200121 1280 1536 8704 8960 = some 0 := by
  decide +kernel

def t_r2001220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001220 : nChk 8 14 kAi kCi kL t_r2001220 1024 1152 8960 9088 = some 0 := by
  decide +kernel

def t_r2001221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001221 : nChk 8 14 kAi kCi kL t_r2001221 1152 1280 8960 9088 = some 0 := by
  decide +kernel

def t_r2001222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001222 : nChk 8 14 kAi kCi kL t_r2001222 1024 1152 9088 9216 = some 0 := by
  decide +kernel

def t_r2001223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2001223 : nChk 8 14 kAi kCi kL t_r2001223 1152 1280 9088 9216 = some 0 := by
  decide +kernel

def t_r200122 : NTree := .node t_r2001220 t_r2001221 t_r2001222 t_r2001223
theorem k_r200122 : nChk 8 14 kAi kCi kL t_r200122 1024 1280 8960 9216 = some 0 :=
  nChk_node rfl rfl k_r2001220 k_r2001221 k_r2001222 k_r2001223 rfl

def t_r200123 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200123 : nChk 8 14 kAi kCi kL t_r200123 1280 1536 8960 9216 = some 0 := by
  decide +kernel

def t_r20012 : NTree := .node t_r200120 t_r200121 t_r200122 t_r200123
theorem k_r20012 : nChk 8 14 kAi kCi kL t_r20012 1024 1536 8704 9216 = some 0 :=
  nChk_node rfl rfl k_r200120 k_r200121 k_r200122 k_r200123 rfl

def t_r20013 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20013 : nChk 8 14 kAi kCi kL t_r20013 1536 2048 8704 9216 = some 0 := by
  decide +kernel

def t_r2001 : NTree := .node t_r20010 t_r20011 t_r20012 t_r20013
theorem k_r2001 : nChk 8 14 kAi kCi kL t_r2001 1024 2048 8192 9216 = some 0 :=
  nChk_node rfl rfl k_r20010 k_r20011 k_r20012 k_r20013 rfl

end ChargeKernel.Pt900
