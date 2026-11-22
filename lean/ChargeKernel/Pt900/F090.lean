/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0201` (460 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0201000 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201000 : nChk 8 14 kAi kCi kL t_r0201000 1024 1152 4096 4224 = some 0 := by
  decide +kernel

def t_r0201001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0201001 : nChk 8 14 kAi kCi kL t_r0201001 1152 1280 4096 4224 = some 0 := by
  decide +kernel

def t_r0201002 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201002 : nChk 8 14 kAi kCi kL t_r0201002 1024 1152 4224 4352 = some 0 := by
  decide +kernel

def t_r0201003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0201003 : nChk 8 14 kAi kCi kL t_r0201003 1152 1280 4224 4352 = some 0 := by
  decide +kernel

def t_r020100 : NTree := .node t_r0201000 t_r0201001 t_r0201002 t_r0201003
theorem k_r020100 : nChk 8 14 kAi kCi kL t_r020100 1024 1280 4096 4352 = some 0 :=
  nChk_node rfl rfl k_r0201000 k_r0201001 k_r0201002 k_r0201003 rfl

def t_r020101 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020101 : nChk 8 14 kAi kCi kL t_r020101 1280 1536 4096 4352 = some 13117516604303009573240832 := by
  decide +kernel

def t_r0201020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201020 : nChk 8 14 kAi kCi kL t_r0201020 1024 1152 4352 4480 = some 0 := by
  decide +kernel

def t_r0201021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0201021 : nChk 8 14 kAi kCi kL t_r0201021 1152 1280 4352 4480 = some 0 := by
  decide +kernel

def t_r0201022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201022 : nChk 8 14 kAi kCi kL t_r0201022 1024 1152 4480 4608 = some 0 := by
  decide +kernel

def t_r0201023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0201023 : nChk 8 14 kAi kCi kL t_r0201023 1152 1280 4480 4608 = some 0 := by
  decide +kernel

def t_r020102 : NTree := .node t_r0201020 t_r0201021 t_r0201022 t_r0201023
theorem k_r020102 : nChk 8 14 kAi kCi kL t_r020102 1024 1280 4352 4608 = some 0 :=
  nChk_node rfl rfl k_r0201020 k_r0201021 k_r0201022 k_r0201023 rfl

def t_r020103 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020103 : nChk 8 14 kAi kCi kL t_r020103 1280 1536 4352 4608 = some 0 := by
  decide +kernel

def t_r02010 : NTree := .node t_r020100 t_r020101 t_r020102 t_r020103
theorem k_r02010 : nChk 8 14 kAi kCi kL t_r02010 1024 1536 4096 4608 = some 13117516604303009573240832 :=
  nChk_node rfl rfl k_r020100 k_r020101 k_r020102 k_r020103 rfl

def t_r02011 : NTree := NTree.ofString "11100001000010000010000110000010000010000"
theorem k_r02011 : nChk 8 14 kAi kCi kL t_r02011 1536 2048 4096 4608 = some 0 := by
  decide +kernel

def t_r0201200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201200 : nChk 8 14 kAi kCi kL t_r0201200 1024 1152 4608 4736 = some 0 := by
  decide +kernel

def t_r0201201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0201201 : nChk 8 14 kAi kCi kL t_r0201201 1152 1280 4608 4736 = some 0 := by
  decide +kernel

def t_r0201202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201202 : nChk 8 14 kAi kCi kL t_r0201202 1024 1152 4736 4864 = some 0 := by
  decide +kernel

def t_r0201203 : NTree := NTree.ofString "11000010000100000"
theorem k_r0201203 : nChk 8 14 kAi kCi kL t_r0201203 1152 1280 4736 4864 = some 0 := by
  decide +kernel

def t_r020120 : NTree := .node t_r0201200 t_r0201201 t_r0201202 t_r0201203
theorem k_r020120 : nChk 8 14 kAi kCi kL t_r020120 1024 1280 4608 4864 = some 0 :=
  nChk_node rfl rfl k_r0201200 k_r0201201 k_r0201202 k_r0201203 rfl

def t_r020121 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020121 : nChk 8 14 kAi kCi kL t_r020121 1280 1536 4608 4864 = some 0 := by
  decide +kernel

def t_r0201220 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201220 : nChk 8 14 kAi kCi kL t_r0201220 1024 1152 4864 4992 = some 0 := by
  decide +kernel

def t_r0201221 : NTree := NTree.ofString "1100000100000"
theorem k_r0201221 : nChk 8 14 kAi kCi kL t_r0201221 1152 1280 4864 4992 = some 0 := by
  decide +kernel

def t_r0201222 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0201222 : nChk 8 14 kAi kCi kL t_r0201222 1024 1152 4992 5120 = some 0 := by
  decide +kernel

def t_r0201223 : NTree := NTree.ofString "1100000100000"
theorem k_r0201223 : nChk 8 14 kAi kCi kL t_r0201223 1152 1280 4992 5120 = some 0 := by
  decide +kernel

def t_r020122 : NTree := .node t_r0201220 t_r0201221 t_r0201222 t_r0201223
theorem k_r020122 : nChk 8 14 kAi kCi kL t_r020122 1024 1280 4864 5120 = some 0 :=
  nChk_node rfl rfl k_r0201220 k_r0201221 k_r0201222 k_r0201223 rfl

def t_r020123 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020123 : nChk 8 14 kAi kCi kL t_r020123 1280 1536 4864 5120 = some 0 := by
  decide +kernel

def t_r02012 : NTree := .node t_r020120 t_r020121 t_r020122 t_r020123
theorem k_r02012 : nChk 8 14 kAi kCi kL t_r02012 1024 1536 4608 5120 = some 0 :=
  nChk_node rfl rfl k_r020120 k_r020121 k_r020122 k_r020123 rfl

def t_r02013 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02013 : nChk 8 14 kAi kCi kL t_r02013 1536 2048 4608 5120 = some 0 := by
  decide +kernel

def t_r0201 : NTree := .node t_r02010 t_r02011 t_r02012 t_r02013
theorem k_r0201 : nChk 8 14 kAi kCi kL t_r0201 1024 2048 4096 5120 = some 13117516604303009573240832 :=
  nChk_node rfl rfl k_r02010 k_r02011 k_r02012 k_r02013 rfl

end ChargeKernel.Pt900
