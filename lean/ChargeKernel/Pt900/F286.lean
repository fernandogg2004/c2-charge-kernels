/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2221` (592 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2221000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221000 : nChk 8 14 kAi kCi kL t_r2221000 1024 1152 14336 14464 = some 0 := by
  decide +kernel

def t_r2221001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221001 : nChk 8 14 kAi kCi kL t_r2221001 1152 1280 14336 14464 = some 0 := by
  decide +kernel

def t_r2221002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221002 : nChk 8 14 kAi kCi kL t_r2221002 1024 1152 14464 14592 = some 0 := by
  decide +kernel

def t_r2221003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221003 : nChk 8 14 kAi kCi kL t_r2221003 1152 1280 14464 14592 = some 0 := by
  decide +kernel

def t_r222100 : NTree := .node t_r2221000 t_r2221001 t_r2221002 t_r2221003
theorem k_r222100 : nChk 8 14 kAi kCi kL t_r222100 1024 1280 14336 14592 = some 0 :=
  nChk_node rfl rfl k_r2221000 k_r2221001 k_r2221002 k_r2221003 rfl

def t_r2221010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221010 : nChk 8 14 kAi kCi kL t_r2221010 1280 1408 14336 14464 = some 0 := by
  decide +kernel

def t_r2221011 : NTree := NTree.ofString "1100000100000"
theorem k_r2221011 : nChk 8 14 kAi kCi kL t_r2221011 1408 1536 14336 14464 = some 0 := by
  decide +kernel

def t_r2221012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221012 : nChk 8 14 kAi kCi kL t_r2221012 1280 1408 14464 14592 = some 0 := by
  decide +kernel

def t_r2221013 : NTree := NTree.ofString "1100000100000"
theorem k_r2221013 : nChk 8 14 kAi kCi kL t_r2221013 1408 1536 14464 14592 = some 0 := by
  decide +kernel

def t_r222101 : NTree := .node t_r2221010 t_r2221011 t_r2221012 t_r2221013
theorem k_r222101 : nChk 8 14 kAi kCi kL t_r222101 1280 1536 14336 14592 = some 0 :=
  nChk_node rfl rfl k_r2221010 k_r2221011 k_r2221012 k_r2221013 rfl

def t_r2221020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221020 : nChk 8 14 kAi kCi kL t_r2221020 1024 1152 14592 14720 = some 0 := by
  decide +kernel

def t_r2221021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221021 : nChk 8 14 kAi kCi kL t_r2221021 1152 1280 14592 14720 = some 0 := by
  decide +kernel

def t_r2221022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221022 : nChk 8 14 kAi kCi kL t_r2221022 1024 1152 14720 14848 = some 0 := by
  decide +kernel

def t_r2221023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221023 : nChk 8 14 kAi kCi kL t_r2221023 1152 1280 14720 14848 = some 0 := by
  decide +kernel

def t_r222102 : NTree := .node t_r2221020 t_r2221021 t_r2221022 t_r2221023
theorem k_r222102 : nChk 8 14 kAi kCi kL t_r222102 1024 1280 14592 14848 = some 0 :=
  nChk_node rfl rfl k_r2221020 k_r2221021 k_r2221022 k_r2221023 rfl

def t_r2221030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221030 : nChk 8 14 kAi kCi kL t_r2221030 1280 1408 14592 14720 = some 0 := by
  decide +kernel

def t_r2221031 : NTree := NTree.ofString "1100000100000"
theorem k_r2221031 : nChk 8 14 kAi kCi kL t_r2221031 1408 1536 14592 14720 = some 0 := by
  decide +kernel

def t_r2221032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221032 : nChk 8 14 kAi kCi kL t_r2221032 1280 1408 14720 14848 = some 0 := by
  decide +kernel

def t_r2221033 : NTree := NTree.ofString "1100000100000"
theorem k_r2221033 : nChk 8 14 kAi kCi kL t_r2221033 1408 1536 14720 14848 = some 0 := by
  decide +kernel

def t_r222103 : NTree := .node t_r2221030 t_r2221031 t_r2221032 t_r2221033
theorem k_r222103 : nChk 8 14 kAi kCi kL t_r222103 1280 1536 14592 14848 = some 0 :=
  nChk_node rfl rfl k_r2221030 k_r2221031 k_r2221032 k_r2221033 rfl

def t_r22210 : NTree := .node t_r222100 t_r222101 t_r222102 t_r222103
theorem k_r22210 : nChk 8 14 kAi kCi kL t_r22210 1024 1536 14336 14848 = some 0 :=
  nChk_node rfl rfl k_r222100 k_r222101 k_r222102 k_r222103 rfl

def t_r222110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222110 : nChk 8 14 kAi kCi kL t_r222110 1536 1792 14336 14592 = some 0 := by
  decide +kernel

def t_r222111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222111 : nChk 8 14 kAi kCi kL t_r222111 1792 2048 14336 14592 = some 0 := by
  decide +kernel

def t_r222112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222112 : nChk 8 14 kAi kCi kL t_r222112 1536 1792 14592 14848 = some 0 := by
  decide +kernel

def t_r222113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222113 : nChk 8 14 kAi kCi kL t_r222113 1792 2048 14592 14848 = some 0 := by
  decide +kernel

def t_r22211 : NTree := .node t_r222110 t_r222111 t_r222112 t_r222113
theorem k_r22211 : nChk 8 14 kAi kCi kL t_r22211 1536 2048 14336 14848 = some 0 :=
  nChk_node rfl rfl k_r222110 k_r222111 k_r222112 k_r222113 rfl

def t_r2221200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221200 : nChk 8 14 kAi kCi kL t_r2221200 1024 1152 14848 14976 = some 0 := by
  decide +kernel

def t_r2221201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221201 : nChk 8 14 kAi kCi kL t_r2221201 1152 1280 14848 14976 = some 0 := by
  decide +kernel

def t_r2221202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221202 : nChk 8 14 kAi kCi kL t_r2221202 1024 1152 14976 15104 = some 0 := by
  decide +kernel

def t_r2221203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221203 : nChk 8 14 kAi kCi kL t_r2221203 1152 1280 14976 15104 = some 0 := by
  decide +kernel

def t_r222120 : NTree := .node t_r2221200 t_r2221201 t_r2221202 t_r2221203
theorem k_r222120 : nChk 8 14 kAi kCi kL t_r222120 1024 1280 14848 15104 = some 0 :=
  nChk_node rfl rfl k_r2221200 k_r2221201 k_r2221202 k_r2221203 rfl

def t_r2221210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221210 : nChk 8 14 kAi kCi kL t_r2221210 1280 1408 14848 14976 = some 0 := by
  decide +kernel

def t_r2221211 : NTree := NTree.ofString "1100000100000"
theorem k_r2221211 : nChk 8 14 kAi kCi kL t_r2221211 1408 1536 14848 14976 = some 0 := by
  decide +kernel

def t_r2221212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221212 : nChk 8 14 kAi kCi kL t_r2221212 1280 1408 14976 15104 = some 0 := by
  decide +kernel

def t_r2221213 : NTree := NTree.ofString "1100000100000"
theorem k_r2221213 : nChk 8 14 kAi kCi kL t_r2221213 1408 1536 14976 15104 = some 0 := by
  decide +kernel

def t_r222121 : NTree := .node t_r2221210 t_r2221211 t_r2221212 t_r2221213
theorem k_r222121 : nChk 8 14 kAi kCi kL t_r222121 1280 1536 14848 15104 = some 0 :=
  nChk_node rfl rfl k_r2221210 k_r2221211 k_r2221212 k_r2221213 rfl

def t_r2221220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221220 : nChk 8 14 kAi kCi kL t_r2221220 1024 1152 15104 15232 = some 0 := by
  decide +kernel

def t_r2221221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221221 : nChk 8 14 kAi kCi kL t_r2221221 1152 1280 15104 15232 = some 0 := by
  decide +kernel

def t_r2221222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221222 : nChk 8 14 kAi kCi kL t_r2221222 1024 1152 15232 15360 = some 0 := by
  decide +kernel

def t_r2221223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221223 : nChk 8 14 kAi kCi kL t_r2221223 1152 1280 15232 15360 = some 0 := by
  decide +kernel

def t_r222122 : NTree := .node t_r2221220 t_r2221221 t_r2221222 t_r2221223
theorem k_r222122 : nChk 8 14 kAi kCi kL t_r222122 1024 1280 15104 15360 = some 0 :=
  nChk_node rfl rfl k_r2221220 k_r2221221 k_r2221222 k_r2221223 rfl

def t_r2221230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221230 : nChk 8 14 kAi kCi kL t_r2221230 1280 1408 15104 15232 = some 0 := by
  decide +kernel

def t_r2221231 : NTree := NTree.ofString "1100000100000"
theorem k_r2221231 : nChk 8 14 kAi kCi kL t_r2221231 1408 1536 15104 15232 = some 0 := by
  decide +kernel

def t_r2221232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2221232 : nChk 8 14 kAi kCi kL t_r2221232 1280 1408 15232 15360 = some 0 := by
  decide +kernel

def t_r2221233 : NTree := NTree.ofString "1100000100000"
theorem k_r2221233 : nChk 8 14 kAi kCi kL t_r2221233 1408 1536 15232 15360 = some 0 := by
  decide +kernel

def t_r222123 : NTree := .node t_r2221230 t_r2221231 t_r2221232 t_r2221233
theorem k_r222123 : nChk 8 14 kAi kCi kL t_r222123 1280 1536 15104 15360 = some 0 :=
  nChk_node rfl rfl k_r2221230 k_r2221231 k_r2221232 k_r2221233 rfl

def t_r22212 : NTree := .node t_r222120 t_r222121 t_r222122 t_r222123
theorem k_r22212 : nChk 8 14 kAi kCi kL t_r22212 1024 1536 14848 15360 = some 0 :=
  nChk_node rfl rfl k_r222120 k_r222121 k_r222122 k_r222123 rfl

def t_r222130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222130 : nChk 8 14 kAi kCi kL t_r222130 1536 1792 14848 15104 = some 0 := by
  decide +kernel

def t_r222131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222131 : nChk 8 14 kAi kCi kL t_r222131 1792 2048 14848 15104 = some 0 := by
  decide +kernel

def t_r222132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222132 : nChk 8 14 kAi kCi kL t_r222132 1536 1792 15104 15360 = some 0 := by
  decide +kernel

def t_r222133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222133 : nChk 8 14 kAi kCi kL t_r222133 1792 2048 15104 15360 = some 0 := by
  decide +kernel

def t_r22213 : NTree := .node t_r222130 t_r222131 t_r222132 t_r222133
theorem k_r22213 : nChk 8 14 kAi kCi kL t_r22213 1536 2048 14848 15360 = some 0 :=
  nChk_node rfl rfl k_r222130 k_r222131 k_r222132 k_r222133 rfl

def t_r2221 : NTree := .node t_r22210 t_r22211 t_r22212 t_r22213
theorem k_r2221 : nChk 8 14 kAi kCi kL t_r2221 1024 2048 14336 15360 = some 0 :=
  nChk_node rfl rfl k_r22210 k_r22211 k_r22212 k_r22213 rfl

end ChargeKernel.Pt900
