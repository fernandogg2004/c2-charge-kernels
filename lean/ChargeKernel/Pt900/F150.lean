/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022233` (496 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022233000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233000 : nChk 8 14 kAi kCi kL t_r022233000 768 800 7936 7968 = some 0 := by
  decide +kernel

def t_r022233001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233001 : nChk 8 14 kAi kCi kL t_r022233001 800 832 7936 7968 = some 0 := by
  decide +kernel

def t_r022233002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233002 : nChk 8 14 kAi kCi kL t_r022233002 768 800 7968 8000 = some 0 := by
  decide +kernel

def t_r022233003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233003 : nChk 8 14 kAi kCi kL t_r022233003 800 832 7968 8000 = some 0 := by
  decide +kernel

def t_r02223300 : NTree := .node t_r022233000 t_r022233001 t_r022233002 t_r022233003
theorem k_r02223300 : nChk 8 14 kAi kCi kL t_r02223300 768 832 7936 8000 = some 0 :=
  nChk_node rfl rfl k_r022233000 k_r022233001 k_r022233002 k_r022233003 rfl

def t_r02223301 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223301 : nChk 8 14 kAi kCi kL t_r02223301 832 896 7936 8000 = some 66914720909415966654332928 := by
  decide +kernel

def t_r022233020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233020 : nChk 8 14 kAi kCi kL t_r022233020 768 800 8000 8032 = some 611039174069592042504192 := by
  decide +kernel

def t_r022233021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233021 : nChk 8 14 kAi kCi kL t_r022233021 800 832 8000 8032 = some 0 := by
  decide +kernel

def t_r022233022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233022 : nChk 8 14 kAi kCi kL t_r022233022 768 800 8032 8064 = some 2399514422698486448259072 := by
  decide +kernel

def t_r022233023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233023 : nChk 8 14 kAi kCi kL t_r022233023 800 832 8032 8064 = some 0 := by
  decide +kernel

def t_r02223302 : NTree := .node t_r022233020 t_r022233021 t_r022233022 t_r022233023
theorem k_r02223302 : nChk 8 14 kAi kCi kL t_r02223302 768 832 8000 8064 = some 3010553596768078490763264 :=
  nChk_node rfl rfl k_r022233020 k_r022233021 k_r022233022 k_r022233023 rfl

def t_r02223303 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223303 : nChk 8 14 kAi kCi kL t_r02223303 832 896 8000 8064 = some 59515986512988395538481152 := by
  decide +kernel

def t_r0222330 : NTree := .node t_r02223300 t_r02223301 t_r02223302 t_r02223303
theorem k_r0222330 : nChk 8 14 kAi kCi kL t_r0222330 768 896 7936 8064 = some 129441261019172440683577344 :=
  nChk_node rfl rfl k_r02223300 k_r02223301 k_r02223302 k_r02223303 rfl

def t_r02223310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223310 : nChk 8 14 kAi kCi kL t_r02223310 896 960 7936 8000 = some 0 := by
  decide +kernel

def t_r02223311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223311 : nChk 8 14 kAi kCi kL t_r02223311 960 1024 7936 8000 = some 0 := by
  decide +kernel

def t_r02223312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223312 : nChk 8 14 kAi kCi kL t_r02223312 896 960 8000 8064 = some 0 := by
  decide +kernel

def t_r02223313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223313 : nChk 8 14 kAi kCi kL t_r02223313 960 1024 8000 8064 = some 0 := by
  decide +kernel

def t_r0222331 : NTree := .node t_r02223310 t_r02223311 t_r02223312 t_r02223313
theorem k_r0222331 : nChk 8 14 kAi kCi kL t_r0222331 896 1024 7936 8064 = some 0 :=
  nChk_node rfl rfl k_r02223310 k_r02223311 k_r02223312 k_r02223313 rfl

def t_r022233200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233200 : nChk 8 14 kAi kCi kL t_r022233200 768 800 8064 8096 = some 3871261957885549369884672 := by
  decide +kernel

def t_r022233201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233201 : nChk 8 14 kAi kCi kL t_r022233201 800 832 8064 8096 = some 0 := by
  decide +kernel

def t_r022233202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233202 : nChk 8 14 kAi kCi kL t_r022233202 768 800 8096 8128 = some 4973852097748032137723904 := by
  decide +kernel

def t_r022233203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233203 : nChk 8 14 kAi kCi kL t_r022233203 800 832 8096 8128 = some 0 := by
  decide +kernel

def t_r02223320 : NTree := .node t_r022233200 t_r022233201 t_r022233202 t_r022233203
theorem k_r02223320 : nChk 8 14 kAi kCi kL t_r02223320 768 832 8064 8128 = some 8845114055633581507608576 :=
  nChk_node rfl rfl k_r022233200 k_r022233201 k_r022233202 k_r022233203 rfl

def t_r02223321 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223321 : nChk 8 14 kAi kCi kL t_r02223321 832 896 8064 8128 = some 52247932454458684782673920 := by
  decide +kernel

def t_r022233220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233220 : nChk 8 14 kAi kCi kL t_r022233220 768 800 8128 8160 = some 5708338036080393106489344 := by
  decide +kernel

def t_r022233221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233221 : nChk 8 14 kAi kCi kL t_r022233221 800 832 8128 8160 = some 0 := by
  decide +kernel

def t_r022233222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233222 : nChk 8 14 kAi kCi kL t_r022233222 768 800 8160 8192 = some 6075357914935432165982208 := by
  decide +kernel

def t_r022233223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022233223 : nChk 8 14 kAi kCi kL t_r022233223 800 832 8160 8192 = some 0 := by
  decide +kernel

def t_r02223322 : NTree := .node t_r022233220 t_r022233221 t_r022233222 t_r022233223
theorem k_r02223322 : nChk 8 14 kAi kCi kL t_r02223322 768 832 8128 8192 = some 11783695951015825272471552 :=
  nChk_node rfl rfl k_r022233220 k_r022233221 k_r022233222 k_r022233223 rfl

def t_r02223323 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223323 : nChk 8 14 kAi kCi kL t_r02223323 832 896 8128 8192 = some 55055875517117234033983488 := by
  decide +kernel

def t_r0222332 : NTree := .node t_r02223320 t_r02223321 t_r02223322 t_r02223323
theorem k_r0222332 : nChk 8 14 kAi kCi kL t_r0222332 768 896 8064 8192 = some 127932617978225325596737536 :=
  nChk_node rfl rfl k_r02223320 k_r02223321 k_r02223322 k_r02223323 rfl

def t_r02223330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223330 : nChk 8 14 kAi kCi kL t_r02223330 896 960 8064 8128 = some 0 := by
  decide +kernel

def t_r02223331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223331 : nChk 8 14 kAi kCi kL t_r02223331 960 1024 8064 8128 = some 0 := by
  decide +kernel

def t_r02223332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223332 : nChk 8 14 kAi kCi kL t_r02223332 896 960 8128 8192 = some 0 := by
  decide +kernel

def t_r02223333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223333 : nChk 8 14 kAi kCi kL t_r02223333 960 1024 8128 8192 = some 0 := by
  decide +kernel

def t_r0222333 : NTree := .node t_r02223330 t_r02223331 t_r02223332 t_r02223333
theorem k_r0222333 : nChk 8 14 kAi kCi kL t_r0222333 896 1024 8064 8192 = some 0 :=
  nChk_node rfl rfl k_r02223330 k_r02223331 k_r02223332 k_r02223333 rfl

def t_r022233 : NTree := .node t_r0222330 t_r0222331 t_r0222332 t_r0222333
theorem k_r022233 : nChk 8 14 kAi kCi kL t_r022233 768 1024 7936 8192 = some 257373878997397766280314880 :=
  nChk_node rfl rfl k_r0222330 k_r0222331 k_r0222332 k_r0222333 rfl

end ChargeKernel.Pt900
