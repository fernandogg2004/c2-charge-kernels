/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `22230` (337 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2223000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223000 : nChk 8 14 kAi kCi kL t_r2223000 1024 1152 15360 15488 = some 0 := by
  decide +kernel

def t_r2223001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223001 : nChk 8 14 kAi kCi kL t_r2223001 1152 1280 15360 15488 = some 0 := by
  decide +kernel

def t_r2223002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223002 : nChk 8 14 kAi kCi kL t_r2223002 1024 1152 15488 15616 = some 0 := by
  decide +kernel

def t_r2223003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223003 : nChk 8 14 kAi kCi kL t_r2223003 1152 1280 15488 15616 = some 0 := by
  decide +kernel

def t_r222300 : NTree := .node t_r2223000 t_r2223001 t_r2223002 t_r2223003
theorem k_r222300 : nChk 8 14 kAi kCi kL t_r222300 1024 1280 15360 15616 = some 0 :=
  nChk_node rfl rfl k_r2223000 k_r2223001 k_r2223002 k_r2223003 rfl

def t_r2223010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223010 : nChk 8 14 kAi kCi kL t_r2223010 1280 1408 15360 15488 = some 0 := by
  decide +kernel

def t_r2223011 : NTree := NTree.ofString "1100000100000"
theorem k_r2223011 : nChk 8 14 kAi kCi kL t_r2223011 1408 1536 15360 15488 = some 0 := by
  decide +kernel

def t_r2223012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223012 : nChk 8 14 kAi kCi kL t_r2223012 1280 1408 15488 15616 = some 0 := by
  decide +kernel

def t_r2223013 : NTree := NTree.ofString "1100000100000"
theorem k_r2223013 : nChk 8 14 kAi kCi kL t_r2223013 1408 1536 15488 15616 = some 0 := by
  decide +kernel

def t_r222301 : NTree := .node t_r2223010 t_r2223011 t_r2223012 t_r2223013
theorem k_r222301 : nChk 8 14 kAi kCi kL t_r222301 1280 1536 15360 15616 = some 0 :=
  nChk_node rfl rfl k_r2223010 k_r2223011 k_r2223012 k_r2223013 rfl

def t_r22230200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22230200 : nChk 8 14 kAi kCi kL t_r22230200 1024 1088 15616 15680 = some 0 := by
  decide +kernel

def t_r22230201 : NTree := NTree.ofString "10000"
theorem k_r22230201 : nChk 8 14 kAi kCi kL t_r22230201 1088 1152 15616 15680 = some 0 := by
  decide +kernel

def t_r22230202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22230202 : nChk 8 14 kAi kCi kL t_r22230202 1024 1088 15680 15744 = some 0 := by
  decide +kernel

def t_r22230203 : NTree := NTree.ofString "10000"
theorem k_r22230203 : nChk 8 14 kAi kCi kL t_r22230203 1088 1152 15680 15744 = some 0 := by
  decide +kernel

def t_r2223020 : NTree := .node t_r22230200 t_r22230201 t_r22230202 t_r22230203
theorem k_r2223020 : nChk 8 14 kAi kCi kL t_r2223020 1024 1152 15616 15744 = some 0 :=
  nChk_node rfl rfl k_r22230200 k_r22230201 k_r22230202 k_r22230203 rfl

def t_r2223021 : NTree := NTree.ofString "11000010000100010000100100000"
theorem k_r2223021 : nChk 8 14 kAi kCi kL t_r2223021 1152 1280 15616 15744 = some 0 := by
  decide +kernel

def t_r22230220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22230220 : nChk 8 14 kAi kCi kL t_r22230220 1024 1088 15744 15808 = some 0 := by
  decide +kernel

def t_r22230221 : NTree := NTree.ofString "10000"
theorem k_r22230221 : nChk 8 14 kAi kCi kL t_r22230221 1088 1152 15744 15808 = some 0 := by
  decide +kernel

def t_r22230222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22230222 : nChk 8 14 kAi kCi kL t_r22230222 1024 1088 15808 15872 = some 0 := by
  decide +kernel

def t_r22230223 : NTree := NTree.ofString "10000"
theorem k_r22230223 : nChk 8 14 kAi kCi kL t_r22230223 1088 1152 15808 15872 = some 0 := by
  decide +kernel

def t_r2223022 : NTree := .node t_r22230220 t_r22230221 t_r22230222 t_r22230223
theorem k_r2223022 : nChk 8 14 kAi kCi kL t_r2223022 1024 1152 15744 15872 = some 0 :=
  nChk_node rfl rfl k_r22230220 k_r22230221 k_r22230222 k_r22230223 rfl

def t_r22230230 : NTree := NTree.ofString "1010000010000"
theorem k_r22230230 : nChk 8 14 kAi kCi kL t_r22230230 1152 1216 15744 15808 = some 0 := by
  decide +kernel

def t_r22230231 : NTree := NTree.ofString "1100000100000"
theorem k_r22230231 : nChk 8 14 kAi kCi kL t_r22230231 1216 1280 15744 15808 = some 0 := by
  decide +kernel

def t_r22230232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22230232 : nChk 8 14 kAi kCi kL t_r22230232 1152 1216 15808 15872 = some 0 := by
  decide +kernel

def t_r22230233 : NTree := NTree.ofString "11000001000010000"
theorem k_r22230233 : nChk 8 14 kAi kCi kL t_r22230233 1216 1280 15808 15872 = some 0 := by
  decide +kernel

def t_r2223023 : NTree := .node t_r22230230 t_r22230231 t_r22230232 t_r22230233
theorem k_r2223023 : nChk 8 14 kAi kCi kL t_r2223023 1152 1280 15744 15872 = some 0 :=
  nChk_node rfl rfl k_r22230230 k_r22230231 k_r22230232 k_r22230233 rfl

def t_r222302 : NTree := .node t_r2223020 t_r2223021 t_r2223022 t_r2223023
theorem k_r222302 : nChk 8 14 kAi kCi kL t_r222302 1024 1280 15616 15872 = some 0 :=
  nChk_node rfl rfl k_r2223020 k_r2223021 k_r2223022 k_r2223023 rfl

def t_r2223030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2223030 : nChk 8 14 kAi kCi kL t_r2223030 1280 1408 15616 15744 = some 0 := by
  decide +kernel

def t_r2223031 : NTree := NTree.ofString "100100000"
theorem k_r2223031 : nChk 8 14 kAi kCi kL t_r2223031 1408 1536 15616 15744 = some 0 := by
  decide +kernel

def t_r22230320 : NTree := NTree.ofString "10100001000010000"
theorem k_r22230320 : nChk 8 14 kAi kCi kL t_r22230320 1280 1344 15744 15808 = some 7265397727383096580374528 := by
  decide +kernel

def t_r22230321 : NTree := NTree.ofString "10000"
theorem k_r22230321 : nChk 8 14 kAi kCi kL t_r22230321 1344 1408 15744 15808 = some 0 := by
  decide +kernel

def t_r22230322 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22230322 : nChk 8 14 kAi kCi kL t_r22230322 1280 1344 15808 15872 = some 0 := by
  decide +kernel

def t_r22230323 : NTree := NTree.ofString "10000"
theorem k_r22230323 : nChk 8 14 kAi kCi kL t_r22230323 1344 1408 15808 15872 = some 0 := by
  decide +kernel

def t_r2223032 : NTree := .node t_r22230320 t_r22230321 t_r22230322 t_r22230323
theorem k_r2223032 : nChk 8 14 kAi kCi kL t_r2223032 1280 1408 15744 15872 = some 7265397727383096580374528 :=
  nChk_node rfl rfl k_r22230320 k_r22230321 k_r22230322 k_r22230323 rfl

def t_r2223033 : NTree := NTree.ofString "1100000100000"
theorem k_r2223033 : nChk 8 14 kAi kCi kL t_r2223033 1408 1536 15744 15872 = some 0 := by
  decide +kernel

def t_r222303 : NTree := .node t_r2223030 t_r2223031 t_r2223032 t_r2223033
theorem k_r222303 : nChk 8 14 kAi kCi kL t_r222303 1280 1536 15616 15872 = some 7265397727383096580374528 :=
  nChk_node rfl rfl k_r2223030 k_r2223031 k_r2223032 k_r2223033 rfl

def t_r22230 : NTree := .node t_r222300 t_r222301 t_r222302 t_r222303
theorem k_r22230 : nChk 8 14 kAi kCi kL t_r22230 1024 1536 15360 15872 = some 7265397727383096580374528 :=
  nChk_node rfl rfl k_r222300 k_r222301 k_r222302 k_r222303 rfl

end ChargeKernel.Pt900
