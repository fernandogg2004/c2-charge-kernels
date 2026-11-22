/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0221` (376 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0221000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221000 : nChk 8 14 kAi kCi kL t_r0221000 1024 1152 6144 6272 = some 0 := by
  decide +kernel

def t_r0221001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221001 : nChk 8 14 kAi kCi kL t_r0221001 1152 1280 6144 6272 = some 0 := by
  decide +kernel

def t_r0221002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221002 : nChk 8 14 kAi kCi kL t_r0221002 1024 1152 6272 6400 = some 0 := by
  decide +kernel

def t_r0221003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221003 : nChk 8 14 kAi kCi kL t_r0221003 1152 1280 6272 6400 = some 0 := by
  decide +kernel

def t_r022100 : NTree := .node t_r0221000 t_r0221001 t_r0221002 t_r0221003
theorem k_r022100 : nChk 8 14 kAi kCi kL t_r022100 1024 1280 6144 6400 = some 0 :=
  nChk_node rfl rfl k_r0221000 k_r0221001 k_r0221002 k_r0221003 rfl

def t_r022101 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022101 : nChk 8 14 kAi kCi kL t_r022101 1280 1536 6144 6400 = some 0 := by
  decide +kernel

def t_r0221020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221020 : nChk 8 14 kAi kCi kL t_r0221020 1024 1152 6400 6528 = some 0 := by
  decide +kernel

def t_r0221021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221021 : nChk 8 14 kAi kCi kL t_r0221021 1152 1280 6400 6528 = some 0 := by
  decide +kernel

def t_r0221022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221022 : nChk 8 14 kAi kCi kL t_r0221022 1024 1152 6528 6656 = some 0 := by
  decide +kernel

def t_r0221023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221023 : nChk 8 14 kAi kCi kL t_r0221023 1152 1280 6528 6656 = some 0 := by
  decide +kernel

def t_r022102 : NTree := .node t_r0221020 t_r0221021 t_r0221022 t_r0221023
theorem k_r022102 : nChk 8 14 kAi kCi kL t_r022102 1024 1280 6400 6656 = some 0 :=
  nChk_node rfl rfl k_r0221020 k_r0221021 k_r0221022 k_r0221023 rfl

def t_r022103 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022103 : nChk 8 14 kAi kCi kL t_r022103 1280 1536 6400 6656 = some 0 := by
  decide +kernel

def t_r02210 : NTree := .node t_r022100 t_r022101 t_r022102 t_r022103
theorem k_r02210 : nChk 8 14 kAi kCi kL t_r02210 1024 1536 6144 6656 = some 0 :=
  nChk_node rfl rfl k_r022100 k_r022101 k_r022102 k_r022103 rfl

def t_r02211 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02211 : nChk 8 14 kAi kCi kL t_r02211 1536 2048 6144 6656 = some 0 := by
  decide +kernel

def t_r0221200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221200 : nChk 8 14 kAi kCi kL t_r0221200 1024 1152 6656 6784 = some 0 := by
  decide +kernel

def t_r0221201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221201 : nChk 8 14 kAi kCi kL t_r0221201 1152 1280 6656 6784 = some 0 := by
  decide +kernel

def t_r0221202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221202 : nChk 8 14 kAi kCi kL t_r0221202 1024 1152 6784 6912 = some 0 := by
  decide +kernel

def t_r0221203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221203 : nChk 8 14 kAi kCi kL t_r0221203 1152 1280 6784 6912 = some 0 := by
  decide +kernel

def t_r022120 : NTree := .node t_r0221200 t_r0221201 t_r0221202 t_r0221203
theorem k_r022120 : nChk 8 14 kAi kCi kL t_r022120 1024 1280 6656 6912 = some 0 :=
  nChk_node rfl rfl k_r0221200 k_r0221201 k_r0221202 k_r0221203 rfl

def t_r022121 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022121 : nChk 8 14 kAi kCi kL t_r022121 1280 1536 6656 6912 = some 0 := by
  decide +kernel

def t_r0221220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221220 : nChk 8 14 kAi kCi kL t_r0221220 1024 1152 6912 7040 = some 0 := by
  decide +kernel

def t_r0221221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221221 : nChk 8 14 kAi kCi kL t_r0221221 1152 1280 6912 7040 = some 0 := by
  decide +kernel

def t_r0221222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221222 : nChk 8 14 kAi kCi kL t_r0221222 1024 1152 7040 7168 = some 0 := by
  decide +kernel

def t_r0221223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0221223 : nChk 8 14 kAi kCi kL t_r0221223 1152 1280 7040 7168 = some 0 := by
  decide +kernel

def t_r022122 : NTree := .node t_r0221220 t_r0221221 t_r0221222 t_r0221223
theorem k_r022122 : nChk 8 14 kAi kCi kL t_r022122 1024 1280 6912 7168 = some 0 :=
  nChk_node rfl rfl k_r0221220 k_r0221221 k_r0221222 k_r0221223 rfl

def t_r022123 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022123 : nChk 8 14 kAi kCi kL t_r022123 1280 1536 6912 7168 = some 0 := by
  decide +kernel

def t_r02212 : NTree := .node t_r022120 t_r022121 t_r022122 t_r022123
theorem k_r02212 : nChk 8 14 kAi kCi kL t_r02212 1024 1536 6656 7168 = some 0 :=
  nChk_node rfl rfl k_r022120 k_r022121 k_r022122 k_r022123 rfl

def t_r02213 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02213 : nChk 8 14 kAi kCi kL t_r02213 1536 2048 6656 7168 = some 0 := by
  decide +kernel

def t_r0221 : NTree := .node t_r02210 t_r02211 t_r02212 t_r02213
theorem k_r0221 : nChk 8 14 kAi kCi kL t_r0221 1024 2048 6144 7168 = some 0 :=
  nChk_node rfl rfl k_r02210 k_r02211 k_r02212 k_r02213 rfl

end ChargeKernel.Pt900
