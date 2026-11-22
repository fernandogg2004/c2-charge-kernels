/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200011` (496 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200011000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011000 : nChk 8 14 kAi kCi kL t_r200011000 768 800 8192 8224 = some 6075357914935432165982208 := by
  decide +kernel

def t_r200011001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011001 : nChk 8 14 kAi kCi kL t_r200011001 800 832 8192 8224 = some 0 := by
  decide +kernel

def t_r200011002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011002 : nChk 8 14 kAi kCi kL t_r200011002 768 800 8224 8256 = some 5708338036080393106489344 := by
  decide +kernel

def t_r200011003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011003 : nChk 8 14 kAi kCi kL t_r200011003 800 832 8224 8256 = some 0 := by
  decide +kernel

def t_r20001100 : NTree := .node t_r200011000 t_r200011001 t_r200011002 t_r200011003
theorem k_r20001100 : nChk 8 14 kAi kCi kL t_r20001100 768 832 8192 8256 = some 11783695951015825272471552 :=
  nChk_node rfl rfl k_r200011000 k_r200011001 k_r200011002 k_r200011003 rfl

def t_r20001101 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001101 : nChk 8 14 kAi kCi kL t_r20001101 832 896 8192 8256 = some 55055875517117234033983488 := by
  decide +kernel

def t_r200011020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011020 : nChk 8 14 kAi kCi kL t_r200011020 768 800 8256 8288 = some 4973852097748032137723904 := by
  decide +kernel

def t_r200011021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011021 : nChk 8 14 kAi kCi kL t_r200011021 800 832 8256 8288 = some 0 := by
  decide +kernel

def t_r200011022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011022 : nChk 8 14 kAi kCi kL t_r200011022 768 800 8288 8320 = some 3871261957885549369884672 := by
  decide +kernel

def t_r200011023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011023 : nChk 8 14 kAi kCi kL t_r200011023 800 832 8288 8320 = some 0 := by
  decide +kernel

def t_r20001102 : NTree := .node t_r200011020 t_r200011021 t_r200011022 t_r200011023
theorem k_r20001102 : nChk 8 14 kAi kCi kL t_r20001102 768 832 8256 8320 = some 8845114055633581507608576 :=
  nChk_node rfl rfl k_r200011020 k_r200011021 k_r200011022 k_r200011023 rfl

def t_r20001103 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001103 : nChk 8 14 kAi kCi kL t_r20001103 832 896 8256 8320 = some 52247932454458684782673920 := by
  decide +kernel

def t_r2000110 : NTree := .node t_r20001100 t_r20001101 t_r20001102 t_r20001103
theorem k_r2000110 : nChk 8 14 kAi kCi kL t_r2000110 768 896 8192 8320 = some 127932617978225325596737536 :=
  nChk_node rfl rfl k_r20001100 k_r20001101 k_r20001102 k_r20001103 rfl

def t_r20001110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001110 : nChk 8 14 kAi kCi kL t_r20001110 896 960 8192 8256 = some 0 := by
  decide +kernel

def t_r20001111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001111 : nChk 8 14 kAi kCi kL t_r20001111 960 1024 8192 8256 = some 0 := by
  decide +kernel

def t_r20001112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001112 : nChk 8 14 kAi kCi kL t_r20001112 896 960 8256 8320 = some 0 := by
  decide +kernel

def t_r20001113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001113 : nChk 8 14 kAi kCi kL t_r20001113 960 1024 8256 8320 = some 0 := by
  decide +kernel

def t_r2000111 : NTree := .node t_r20001110 t_r20001111 t_r20001112 t_r20001113
theorem k_r2000111 : nChk 8 14 kAi kCi kL t_r2000111 896 1024 8192 8320 = some 0 :=
  nChk_node rfl rfl k_r20001110 k_r20001111 k_r20001112 k_r20001113 rfl

def t_r200011200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011200 : nChk 8 14 kAi kCi kL t_r200011200 768 800 8320 8352 = some 2399514422698486448259072 := by
  decide +kernel

def t_r200011201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011201 : nChk 8 14 kAi kCi kL t_r200011201 800 832 8320 8352 = some 0 := by
  decide +kernel

def t_r200011202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011202 : nChk 8 14 kAi kCi kL t_r200011202 768 800 8352 8384 = some 611039174069592042504192 := by
  decide +kernel

def t_r200011203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011203 : nChk 8 14 kAi kCi kL t_r200011203 800 832 8352 8384 = some 0 := by
  decide +kernel

def t_r20001120 : NTree := .node t_r200011200 t_r200011201 t_r200011202 t_r200011203
theorem k_r20001120 : nChk 8 14 kAi kCi kL t_r20001120 768 832 8320 8384 = some 3010553596768078490763264 :=
  nChk_node rfl rfl k_r200011200 k_r200011201 k_r200011202 k_r200011203 rfl

def t_r20001121 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001121 : nChk 8 14 kAi kCi kL t_r20001121 832 896 8320 8384 = some 59515986512988395538481152 := by
  decide +kernel

def t_r200011220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011220 : nChk 8 14 kAi kCi kL t_r200011220 768 800 8384 8416 = some 0 := by
  decide +kernel

def t_r200011221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011221 : nChk 8 14 kAi kCi kL t_r200011221 800 832 8384 8416 = some 0 := by
  decide +kernel

def t_r200011222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011222 : nChk 8 14 kAi kCi kL t_r200011222 768 800 8416 8448 = some 0 := by
  decide +kernel

def t_r200011223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200011223 : nChk 8 14 kAi kCi kL t_r200011223 800 832 8416 8448 = some 0 := by
  decide +kernel

def t_r20001122 : NTree := .node t_r200011220 t_r200011221 t_r200011222 t_r200011223
theorem k_r20001122 : nChk 8 14 kAi kCi kL t_r20001122 768 832 8384 8448 = some 0 :=
  nChk_node rfl rfl k_r200011220 k_r200011221 k_r200011222 k_r200011223 rfl

def t_r20001123 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001123 : nChk 8 14 kAi kCi kL t_r20001123 832 896 8384 8448 = some 66914720909415966654332928 := by
  decide +kernel

def t_r2000112 : NTree := .node t_r20001120 t_r20001121 t_r20001122 t_r20001123
theorem k_r2000112 : nChk 8 14 kAi kCi kL t_r2000112 768 896 8320 8448 = some 129441261019172440683577344 :=
  nChk_node rfl rfl k_r20001120 k_r20001121 k_r20001122 k_r20001123 rfl

def t_r20001130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001130 : nChk 8 14 kAi kCi kL t_r20001130 896 960 8320 8384 = some 0 := by
  decide +kernel

def t_r20001131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001131 : nChk 8 14 kAi kCi kL t_r20001131 960 1024 8320 8384 = some 0 := by
  decide +kernel

def t_r20001132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001132 : nChk 8 14 kAi kCi kL t_r20001132 896 960 8384 8448 = some 0 := by
  decide +kernel

def t_r20001133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001133 : nChk 8 14 kAi kCi kL t_r20001133 960 1024 8384 8448 = some 0 := by
  decide +kernel

def t_r2000113 : NTree := .node t_r20001130 t_r20001131 t_r20001132 t_r20001133
theorem k_r2000113 : nChk 8 14 kAi kCi kL t_r2000113 896 1024 8320 8448 = some 0 :=
  nChk_node rfl rfl k_r20001130 k_r20001131 k_r20001132 k_r20001133 rfl

def t_r200011 : NTree := .node t_r2000110 t_r2000111 t_r2000112 t_r2000113
theorem k_r200011 : nChk 8 14 kAi kCi kL t_r200011 768 1024 8192 8448 = some 257373878997397766280314880 :=
  nChk_node rfl rfl k_r2000110 k_r2000111 k_r2000112 k_r2000113 rfl

end ChargeKernel.Pt900
