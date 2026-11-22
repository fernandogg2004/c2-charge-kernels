/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `22231` (178 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2223100 : NTree := NTree.ofString "10000"
theorem k_r2223100 : nChk 8 14 kAi kCi kL t_r2223100 1536 1664 15360 15488 = some 0 := by
  decide +kernel

def t_r2223101 : NTree := NTree.ofString "1010000010000"
theorem k_r2223101 : nChk 8 14 kAi kCi kL t_r2223101 1664 1792 15360 15488 = some 0 := by
  decide +kernel

def t_r2223102 : NTree := NTree.ofString "10000"
theorem k_r2223102 : nChk 8 14 kAi kCi kL t_r2223102 1536 1664 15488 15616 = some 0 := by
  decide +kernel

def t_r2223103 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223103 : nChk 8 14 kAi kCi kL t_r2223103 1664 1792 15488 15616 = some 0 := by
  decide +kernel

def t_r222310 : NTree := .node t_r2223100 t_r2223101 t_r2223102 t_r2223103
theorem k_r222310 : nChk 8 14 kAi kCi kL t_r222310 1536 1792 15360 15616 = some 0 :=
  nChk_node rfl rfl k_r2223100 k_r2223101 k_r2223102 k_r2223103 rfl

def t_r2223110 : NTree := NTree.ofString "11000001000010000"
theorem k_r2223110 : nChk 8 14 kAi kCi kL t_r2223110 1792 1920 15360 15488 = some 0 := by
  decide +kernel

def t_r2223111 : NTree := NTree.ofString "10000"
theorem k_r2223111 : nChk 8 14 kAi kCi kL t_r2223111 1920 2048 15360 15488 = some 0 := by
  decide +kernel

def t_r2223112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223112 : nChk 8 14 kAi kCi kL t_r2223112 1792 1920 15488 15616 = some 0 := by
  decide +kernel

def t_r2223113 : NTree := NTree.ofString "100100000"
theorem k_r2223113 : nChk 8 14 kAi kCi kL t_r2223113 1920 2048 15488 15616 = some 0 := by
  decide +kernel

def t_r222311 : NTree := .node t_r2223110 t_r2223111 t_r2223112 t_r2223113
theorem k_r222311 : nChk 8 14 kAi kCi kL t_r222311 1792 2048 15360 15616 = some 0 :=
  nChk_node rfl rfl k_r2223110 k_r2223111 k_r2223112 k_r2223113 rfl

def t_r2223120 : NTree := NTree.ofString "10000"
theorem k_r2223120 : nChk 8 14 kAi kCi kL t_r2223120 1536 1664 15616 15744 = some 0 := by
  decide +kernel

def t_r2223121 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223121 : nChk 8 14 kAi kCi kL t_r2223121 1664 1792 15616 15744 = some 0 := by
  decide +kernel

def t_r2223122 : NTree := NTree.ofString "100010000"
theorem k_r2223122 : nChk 8 14 kAi kCi kL t_r2223122 1536 1664 15744 15872 = some 0 := by
  decide +kernel

def t_r2223123 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223123 : nChk 8 14 kAi kCi kL t_r2223123 1664 1792 15744 15872 = some 0 := by
  decide +kernel

def t_r222312 : NTree := .node t_r2223120 t_r2223121 t_r2223122 t_r2223123
theorem k_r222312 : nChk 8 14 kAi kCi kL t_r222312 1536 1792 15616 15872 = some 0 :=
  nChk_node rfl rfl k_r2223120 k_r2223121 k_r2223122 k_r2223123 rfl

def t_r2223130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223130 : nChk 8 14 kAi kCi kL t_r2223130 1792 1920 15616 15744 = some 0 := by
  decide +kernel

def t_r2223131 : NTree := NTree.ofString "11000001000010000"
theorem k_r2223131 : nChk 8 14 kAi kCi kL t_r2223131 1920 2048 15616 15744 = some 0 := by
  decide +kernel

def t_r2223132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223132 : nChk 8 14 kAi kCi kL t_r2223132 1792 1920 15744 15872 = some 0 := by
  decide +kernel

def t_r2223133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223133 : nChk 8 14 kAi kCi kL t_r2223133 1920 2048 15744 15872 = some 0 := by
  decide +kernel

def t_r222313 : NTree := .node t_r2223130 t_r2223131 t_r2223132 t_r2223133
theorem k_r222313 : nChk 8 14 kAi kCi kL t_r222313 1792 2048 15616 15872 = some 0 :=
  nChk_node rfl rfl k_r2223130 k_r2223131 k_r2223132 k_r2223133 rfl

def t_r22231 : NTree := .node t_r222310 t_r222311 t_r222312 t_r222313
theorem k_r22231 : nChk 8 14 kAi kCi kL t_r22231 1536 2048 15360 15872 = some 0 :=
  nChk_node rfl rfl k_r222310 k_r222311 k_r222312 k_r222313 rfl

end ChargeKernel.Pt900
