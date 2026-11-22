/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0203` (409 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0203000 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0203000 : nChk 8 14 kAi kCi kL t_r0203000 1024 1152 5120 5248 = some 0 := by
  decide +kernel

def t_r0203001 : NTree := NTree.ofString "1100000100000"
theorem k_r0203001 : nChk 8 14 kAi kCi kL t_r0203001 1152 1280 5120 5248 = some 0 := by
  decide +kernel

def t_r0203002 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0203002 : nChk 8 14 kAi kCi kL t_r0203002 1024 1152 5248 5376 = some 0 := by
  decide +kernel

def t_r0203003 : NTree := NTree.ofString "1100000100000"
theorem k_r0203003 : nChk 8 14 kAi kCi kL t_r0203003 1152 1280 5248 5376 = some 0 := by
  decide +kernel

def t_r020300 : NTree := .node t_r0203000 t_r0203001 t_r0203002 t_r0203003
theorem k_r020300 : nChk 8 14 kAi kCi kL t_r020300 1024 1280 5120 5376 = some 0 :=
  nChk_node rfl rfl k_r0203000 k_r0203001 k_r0203002 k_r0203003 rfl

def t_r020301 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020301 : nChk 8 14 kAi kCi kL t_r020301 1280 1536 5120 5376 = some 0 := by
  decide +kernel

def t_r0203020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0203020 : nChk 8 14 kAi kCi kL t_r0203020 1024 1152 5376 5504 = some 0 := by
  decide +kernel

def t_r0203021 : NTree := NTree.ofString "1100000100000"
theorem k_r0203021 : nChk 8 14 kAi kCi kL t_r0203021 1152 1280 5376 5504 = some 0 := by
  decide +kernel

def t_r0203022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0203022 : nChk 8 14 kAi kCi kL t_r0203022 1024 1152 5504 5632 = some 0 := by
  decide +kernel

def t_r0203023 : NTree := NTree.ofString "1100000100000"
theorem k_r0203023 : nChk 8 14 kAi kCi kL t_r0203023 1152 1280 5504 5632 = some 0 := by
  decide +kernel

def t_r020302 : NTree := .node t_r0203020 t_r0203021 t_r0203022 t_r0203023
theorem k_r020302 : nChk 8 14 kAi kCi kL t_r020302 1024 1280 5376 5632 = some 0 :=
  nChk_node rfl rfl k_r0203020 k_r0203021 k_r0203022 k_r0203023 rfl

def t_r020303 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020303 : nChk 8 14 kAi kCi kL t_r020303 1280 1536 5376 5632 = some 0 := by
  decide +kernel

def t_r02030 : NTree := .node t_r020300 t_r020301 t_r020302 t_r020303
theorem k_r02030 : nChk 8 14 kAi kCi kL t_r02030 1024 1536 5120 5632 = some 0 :=
  nChk_node rfl rfl k_r020300 k_r020301 k_r020302 k_r020303 rfl

def t_r02031 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02031 : nChk 8 14 kAi kCi kL t_r02031 1536 2048 5120 5632 = some 0 := by
  decide +kernel

def t_r0203200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0203200 : nChk 8 14 kAi kCi kL t_r0203200 1024 1152 5632 5760 = some 0 := by
  decide +kernel

def t_r0203201 : NTree := NTree.ofString "1100000100000"
theorem k_r0203201 : nChk 8 14 kAi kCi kL t_r0203201 1152 1280 5632 5760 = some 0 := by
  decide +kernel

def t_r0203202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r0203202 : nChk 8 14 kAi kCi kL t_r0203202 1024 1152 5760 5888 = some 0 := by
  decide +kernel

def t_r0203203 : NTree := NTree.ofString "1100000100000"
theorem k_r0203203 : nChk 8 14 kAi kCi kL t_r0203203 1152 1280 5760 5888 = some 0 := by
  decide +kernel

def t_r020320 : NTree := .node t_r0203200 t_r0203201 t_r0203202 t_r0203203
theorem k_r020320 : nChk 8 14 kAi kCi kL t_r020320 1024 1280 5632 5888 = some 0 :=
  nChk_node rfl rfl k_r0203200 k_r0203201 k_r0203202 k_r0203203 rfl

def t_r020321 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020321 : nChk 8 14 kAi kCi kL t_r020321 1280 1536 5632 5888 = some 0 := by
  decide +kernel

def t_r0203220 : NTree := NTree.ofString "11100000100000100001000010000"
theorem k_r0203220 : nChk 8 14 kAi kCi kL t_r0203220 1024 1152 5888 6016 = some 25799394900561294375518208 := by
  decide +kernel

def t_r0203221 : NTree := NTree.ofString "1100000100000"
theorem k_r0203221 : nChk 8 14 kAi kCi kL t_r0203221 1152 1280 5888 6016 = some 0 := by
  decide +kernel

def t_r0203222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0203222 : nChk 8 14 kAi kCi kL t_r0203222 1024 1152 6016 6144 = some 0 := by
  decide +kernel

def t_r0203223 : NTree := NTree.ofString "11000001000010000"
theorem k_r0203223 : nChk 8 14 kAi kCi kL t_r0203223 1152 1280 6016 6144 = some 0 := by
  decide +kernel

def t_r020322 : NTree := .node t_r0203220 t_r0203221 t_r0203222 t_r0203223
theorem k_r020322 : nChk 8 14 kAi kCi kL t_r020322 1024 1280 5888 6144 = some 25799394900561294375518208 :=
  nChk_node rfl rfl k_r0203220 k_r0203221 k_r0203222 k_r0203223 rfl

def t_r020323 : NTree := NTree.ofString "110000100001000010000"
theorem k_r020323 : nChk 8 14 kAi kCi kL t_r020323 1280 1536 5888 6144 = some 0 := by
  decide +kernel

def t_r02032 : NTree := .node t_r020320 t_r020321 t_r020322 t_r020323
theorem k_r02032 : nChk 8 14 kAi kCi kL t_r02032 1024 1536 5632 6144 = some 25799394900561294375518208 :=
  nChk_node rfl rfl k_r020320 k_r020321 k_r020322 k_r020323 rfl

def t_r02033 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02033 : nChk 8 14 kAi kCi kL t_r02033 1536 2048 5632 6144 = some 0 := by
  decide +kernel

def t_r0203 : NTree := .node t_r02030 t_r02031 t_r02032 t_r02033
theorem k_r0203 : nChk 8 14 kAi kCi kL t_r0203 1024 2048 5120 6144 = some 25799394900561294375518208 :=
  nChk_node rfl rfl k_r02030 k_r02031 k_r02032 k_r02033 rfl

end ChargeKernel.Pt900
