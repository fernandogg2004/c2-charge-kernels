/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0003` (592 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0003000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003000 : nChk 8 14 kAi kCi kL t_r0003000 1024 1152 1024 1152 = some 0 := by
  decide +kernel

def t_r0003001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003001 : nChk 8 14 kAi kCi kL t_r0003001 1152 1280 1024 1152 = some 0 := by
  decide +kernel

def t_r0003002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003002 : nChk 8 14 kAi kCi kL t_r0003002 1024 1152 1152 1280 = some 0 := by
  decide +kernel

def t_r0003003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003003 : nChk 8 14 kAi kCi kL t_r0003003 1152 1280 1152 1280 = some 0 := by
  decide +kernel

def t_r000300 : NTree := .node t_r0003000 t_r0003001 t_r0003002 t_r0003003
theorem k_r000300 : nChk 8 14 kAi kCi kL t_r000300 1024 1280 1024 1280 = some 0 :=
  nChk_node rfl rfl k_r0003000 k_r0003001 k_r0003002 k_r0003003 rfl

def t_r0003010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003010 : nChk 8 14 kAi kCi kL t_r0003010 1280 1408 1024 1152 = some 0 := by
  decide +kernel

def t_r0003011 : NTree := NTree.ofString "1100000100000"
theorem k_r0003011 : nChk 8 14 kAi kCi kL t_r0003011 1408 1536 1024 1152 = some 0 := by
  decide +kernel

def t_r0003012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003012 : nChk 8 14 kAi kCi kL t_r0003012 1280 1408 1152 1280 = some 0 := by
  decide +kernel

def t_r0003013 : NTree := NTree.ofString "1100000100000"
theorem k_r0003013 : nChk 8 14 kAi kCi kL t_r0003013 1408 1536 1152 1280 = some 0 := by
  decide +kernel

def t_r000301 : NTree := .node t_r0003010 t_r0003011 t_r0003012 t_r0003013
theorem k_r000301 : nChk 8 14 kAi kCi kL t_r000301 1280 1536 1024 1280 = some 0 :=
  nChk_node rfl rfl k_r0003010 k_r0003011 k_r0003012 k_r0003013 rfl

def t_r0003020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003020 : nChk 8 14 kAi kCi kL t_r0003020 1024 1152 1280 1408 = some 0 := by
  decide +kernel

def t_r0003021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003021 : nChk 8 14 kAi kCi kL t_r0003021 1152 1280 1280 1408 = some 0 := by
  decide +kernel

def t_r0003022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003022 : nChk 8 14 kAi kCi kL t_r0003022 1024 1152 1408 1536 = some 0 := by
  decide +kernel

def t_r0003023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003023 : nChk 8 14 kAi kCi kL t_r0003023 1152 1280 1408 1536 = some 0 := by
  decide +kernel

def t_r000302 : NTree := .node t_r0003020 t_r0003021 t_r0003022 t_r0003023
theorem k_r000302 : nChk 8 14 kAi kCi kL t_r000302 1024 1280 1280 1536 = some 0 :=
  nChk_node rfl rfl k_r0003020 k_r0003021 k_r0003022 k_r0003023 rfl

def t_r0003030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003030 : nChk 8 14 kAi kCi kL t_r0003030 1280 1408 1280 1408 = some 0 := by
  decide +kernel

def t_r0003031 : NTree := NTree.ofString "1100000100000"
theorem k_r0003031 : nChk 8 14 kAi kCi kL t_r0003031 1408 1536 1280 1408 = some 0 := by
  decide +kernel

def t_r0003032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003032 : nChk 8 14 kAi kCi kL t_r0003032 1280 1408 1408 1536 = some 0 := by
  decide +kernel

def t_r0003033 : NTree := NTree.ofString "1100000100000"
theorem k_r0003033 : nChk 8 14 kAi kCi kL t_r0003033 1408 1536 1408 1536 = some 0 := by
  decide +kernel

def t_r000303 : NTree := .node t_r0003030 t_r0003031 t_r0003032 t_r0003033
theorem k_r000303 : nChk 8 14 kAi kCi kL t_r000303 1280 1536 1280 1536 = some 0 :=
  nChk_node rfl rfl k_r0003030 k_r0003031 k_r0003032 k_r0003033 rfl

def t_r00030 : NTree := .node t_r000300 t_r000301 t_r000302 t_r000303
theorem k_r00030 : nChk 8 14 kAi kCi kL t_r00030 1024 1536 1024 1536 = some 0 :=
  nChk_node rfl rfl k_r000300 k_r000301 k_r000302 k_r000303 rfl

def t_r000310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000310 : nChk 8 14 kAi kCi kL t_r000310 1536 1792 1024 1280 = some 0 := by
  decide +kernel

def t_r000311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000311 : nChk 8 14 kAi kCi kL t_r000311 1792 2048 1024 1280 = some 0 := by
  decide +kernel

def t_r000312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000312 : nChk 8 14 kAi kCi kL t_r000312 1536 1792 1280 1536 = some 0 := by
  decide +kernel

def t_r000313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000313 : nChk 8 14 kAi kCi kL t_r000313 1792 2048 1280 1536 = some 0 := by
  decide +kernel

def t_r00031 : NTree := .node t_r000310 t_r000311 t_r000312 t_r000313
theorem k_r00031 : nChk 8 14 kAi kCi kL t_r00031 1536 2048 1024 1536 = some 0 :=
  nChk_node rfl rfl k_r000310 k_r000311 k_r000312 k_r000313 rfl

def t_r0003200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003200 : nChk 8 14 kAi kCi kL t_r0003200 1024 1152 1536 1664 = some 0 := by
  decide +kernel

def t_r0003201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003201 : nChk 8 14 kAi kCi kL t_r0003201 1152 1280 1536 1664 = some 0 := by
  decide +kernel

def t_r0003202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003202 : nChk 8 14 kAi kCi kL t_r0003202 1024 1152 1664 1792 = some 0 := by
  decide +kernel

def t_r0003203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003203 : nChk 8 14 kAi kCi kL t_r0003203 1152 1280 1664 1792 = some 0 := by
  decide +kernel

def t_r000320 : NTree := .node t_r0003200 t_r0003201 t_r0003202 t_r0003203
theorem k_r000320 : nChk 8 14 kAi kCi kL t_r000320 1024 1280 1536 1792 = some 0 :=
  nChk_node rfl rfl k_r0003200 k_r0003201 k_r0003202 k_r0003203 rfl

def t_r0003210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003210 : nChk 8 14 kAi kCi kL t_r0003210 1280 1408 1536 1664 = some 0 := by
  decide +kernel

def t_r0003211 : NTree := NTree.ofString "1100000100000"
theorem k_r0003211 : nChk 8 14 kAi kCi kL t_r0003211 1408 1536 1536 1664 = some 0 := by
  decide +kernel

def t_r0003212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003212 : nChk 8 14 kAi kCi kL t_r0003212 1280 1408 1664 1792 = some 0 := by
  decide +kernel

def t_r0003213 : NTree := NTree.ofString "1100000100000"
theorem k_r0003213 : nChk 8 14 kAi kCi kL t_r0003213 1408 1536 1664 1792 = some 0 := by
  decide +kernel

def t_r000321 : NTree := .node t_r0003210 t_r0003211 t_r0003212 t_r0003213
theorem k_r000321 : nChk 8 14 kAi kCi kL t_r000321 1280 1536 1536 1792 = some 0 :=
  nChk_node rfl rfl k_r0003210 k_r0003211 k_r0003212 k_r0003213 rfl

def t_r0003220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003220 : nChk 8 14 kAi kCi kL t_r0003220 1024 1152 1792 1920 = some 0 := by
  decide +kernel

def t_r0003221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003221 : nChk 8 14 kAi kCi kL t_r0003221 1152 1280 1792 1920 = some 0 := by
  decide +kernel

def t_r0003222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003222 : nChk 8 14 kAi kCi kL t_r0003222 1024 1152 1920 2048 = some 0 := by
  decide +kernel

def t_r0003223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003223 : nChk 8 14 kAi kCi kL t_r0003223 1152 1280 1920 2048 = some 0 := by
  decide +kernel

def t_r000322 : NTree := .node t_r0003220 t_r0003221 t_r0003222 t_r0003223
theorem k_r000322 : nChk 8 14 kAi kCi kL t_r000322 1024 1280 1792 2048 = some 0 :=
  nChk_node rfl rfl k_r0003220 k_r0003221 k_r0003222 k_r0003223 rfl

def t_r0003230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003230 : nChk 8 14 kAi kCi kL t_r0003230 1280 1408 1792 1920 = some 0 := by
  decide +kernel

def t_r0003231 : NTree := NTree.ofString "1100000100000"
theorem k_r0003231 : nChk 8 14 kAi kCi kL t_r0003231 1408 1536 1792 1920 = some 0 := by
  decide +kernel

def t_r0003232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0003232 : nChk 8 14 kAi kCi kL t_r0003232 1280 1408 1920 2048 = some 0 := by
  decide +kernel

def t_r0003233 : NTree := NTree.ofString "1100000100000"
theorem k_r0003233 : nChk 8 14 kAi kCi kL t_r0003233 1408 1536 1920 2048 = some 0 := by
  decide +kernel

def t_r000323 : NTree := .node t_r0003230 t_r0003231 t_r0003232 t_r0003233
theorem k_r000323 : nChk 8 14 kAi kCi kL t_r000323 1280 1536 1792 2048 = some 0 :=
  nChk_node rfl rfl k_r0003230 k_r0003231 k_r0003232 k_r0003233 rfl

def t_r00032 : NTree := .node t_r000320 t_r000321 t_r000322 t_r000323
theorem k_r00032 : nChk 8 14 kAi kCi kL t_r00032 1024 1536 1536 2048 = some 0 :=
  nChk_node rfl rfl k_r000320 k_r000321 k_r000322 k_r000323 rfl

def t_r000330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000330 : nChk 8 14 kAi kCi kL t_r000330 1536 1792 1536 1792 = some 0 := by
  decide +kernel

def t_r000331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000331 : nChk 8 14 kAi kCi kL t_r000331 1792 2048 1536 1792 = some 0 := by
  decide +kernel

def t_r000332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000332 : nChk 8 14 kAi kCi kL t_r000332 1536 1792 1792 2048 = some 0 := by
  decide +kernel

def t_r000333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000333 : nChk 8 14 kAi kCi kL t_r000333 1792 2048 1792 2048 = some 0 := by
  decide +kernel

def t_r00033 : NTree := .node t_r000330 t_r000331 t_r000332 t_r000333
theorem k_r00033 : nChk 8 14 kAi kCi kL t_r00033 1536 2048 1536 2048 = some 0 :=
  nChk_node rfl rfl k_r000330 k_r000331 k_r000332 k_r000333 rfl

def t_r0003 : NTree := .node t_r00030 t_r00031 t_r00032 t_r00033
theorem k_r0003 : nChk 8 14 kAi kCi kL t_r0003 1024 2048 1024 2048 = some 0 :=
  nChk_node rfl rfl k_r00030 k_r00031 k_r00032 k_r00033 rfl

end ChargeKernel.Pt900
