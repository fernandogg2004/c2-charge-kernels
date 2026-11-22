/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2003` (376 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2003000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003000 : nChk 8 14 kAi kCi kL t_r2003000 1024 1152 9216 9344 = some 0 := by
  decide +kernel

def t_r2003001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003001 : nChk 8 14 kAi kCi kL t_r2003001 1152 1280 9216 9344 = some 0 := by
  decide +kernel

def t_r2003002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003002 : nChk 8 14 kAi kCi kL t_r2003002 1024 1152 9344 9472 = some 0 := by
  decide +kernel

def t_r2003003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003003 : nChk 8 14 kAi kCi kL t_r2003003 1152 1280 9344 9472 = some 0 := by
  decide +kernel

def t_r200300 : NTree := .node t_r2003000 t_r2003001 t_r2003002 t_r2003003
theorem k_r200300 : nChk 8 14 kAi kCi kL t_r200300 1024 1280 9216 9472 = some 0 :=
  nChk_node rfl rfl k_r2003000 k_r2003001 k_r2003002 k_r2003003 rfl

def t_r200301 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200301 : nChk 8 14 kAi kCi kL t_r200301 1280 1536 9216 9472 = some 0 := by
  decide +kernel

def t_r2003020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003020 : nChk 8 14 kAi kCi kL t_r2003020 1024 1152 9472 9600 = some 0 := by
  decide +kernel

def t_r2003021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003021 : nChk 8 14 kAi kCi kL t_r2003021 1152 1280 9472 9600 = some 0 := by
  decide +kernel

def t_r2003022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003022 : nChk 8 14 kAi kCi kL t_r2003022 1024 1152 9600 9728 = some 0 := by
  decide +kernel

def t_r2003023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003023 : nChk 8 14 kAi kCi kL t_r2003023 1152 1280 9600 9728 = some 0 := by
  decide +kernel

def t_r200302 : NTree := .node t_r2003020 t_r2003021 t_r2003022 t_r2003023
theorem k_r200302 : nChk 8 14 kAi kCi kL t_r200302 1024 1280 9472 9728 = some 0 :=
  nChk_node rfl rfl k_r2003020 k_r2003021 k_r2003022 k_r2003023 rfl

def t_r200303 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200303 : nChk 8 14 kAi kCi kL t_r200303 1280 1536 9472 9728 = some 0 := by
  decide +kernel

def t_r20030 : NTree := .node t_r200300 t_r200301 t_r200302 t_r200303
theorem k_r20030 : nChk 8 14 kAi kCi kL t_r20030 1024 1536 9216 9728 = some 0 :=
  nChk_node rfl rfl k_r200300 k_r200301 k_r200302 k_r200303 rfl

def t_r20031 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20031 : nChk 8 14 kAi kCi kL t_r20031 1536 2048 9216 9728 = some 0 := by
  decide +kernel

def t_r2003200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003200 : nChk 8 14 kAi kCi kL t_r2003200 1024 1152 9728 9856 = some 0 := by
  decide +kernel

def t_r2003201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003201 : nChk 8 14 kAi kCi kL t_r2003201 1152 1280 9728 9856 = some 0 := by
  decide +kernel

def t_r2003202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003202 : nChk 8 14 kAi kCi kL t_r2003202 1024 1152 9856 9984 = some 0 := by
  decide +kernel

def t_r2003203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003203 : nChk 8 14 kAi kCi kL t_r2003203 1152 1280 9856 9984 = some 0 := by
  decide +kernel

def t_r200320 : NTree := .node t_r2003200 t_r2003201 t_r2003202 t_r2003203
theorem k_r200320 : nChk 8 14 kAi kCi kL t_r200320 1024 1280 9728 9984 = some 0 :=
  nChk_node rfl rfl k_r2003200 k_r2003201 k_r2003202 k_r2003203 rfl

def t_r200321 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200321 : nChk 8 14 kAi kCi kL t_r200321 1280 1536 9728 9984 = some 0 := by
  decide +kernel

def t_r2003220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003220 : nChk 8 14 kAi kCi kL t_r2003220 1024 1152 9984 10112 = some 0 := by
  decide +kernel

def t_r2003221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003221 : nChk 8 14 kAi kCi kL t_r2003221 1152 1280 9984 10112 = some 0 := by
  decide +kernel

def t_r2003222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003222 : nChk 8 14 kAi kCi kL t_r2003222 1024 1152 10112 10240 = some 0 := by
  decide +kernel

def t_r2003223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2003223 : nChk 8 14 kAi kCi kL t_r2003223 1152 1280 10112 10240 = some 0 := by
  decide +kernel

def t_r200322 : NTree := .node t_r2003220 t_r2003221 t_r2003222 t_r2003223
theorem k_r200322 : nChk 8 14 kAi kCi kL t_r200322 1024 1280 9984 10240 = some 0 :=
  nChk_node rfl rfl k_r2003220 k_r2003221 k_r2003222 k_r2003223 rfl

def t_r200323 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200323 : nChk 8 14 kAi kCi kL t_r200323 1280 1536 9984 10240 = some 0 := by
  decide +kernel

def t_r20032 : NTree := .node t_r200320 t_r200321 t_r200322 t_r200323
theorem k_r20032 : nChk 8 14 kAi kCi kL t_r20032 1024 1536 9728 10240 = some 0 :=
  nChk_node rfl rfl k_r200320 k_r200321 k_r200322 k_r200323 rfl

def t_r20033 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20033 : nChk 8 14 kAi kCi kL t_r20033 1536 2048 9728 10240 = some 0 := by
  decide +kernel

def t_r2003 : NTree := .node t_r20030 t_r20031 t_r20032 t_r20033
theorem k_r2003 : nChk 8 14 kAi kCi kL t_r2003 1024 2048 9216 10240 = some 0 :=
  nChk_node rfl rfl k_r20030 k_r20031 k_r20032 k_r20033 rfl

end ChargeKernel.Pt900
