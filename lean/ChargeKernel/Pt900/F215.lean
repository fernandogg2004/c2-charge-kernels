/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2021` (409 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2021000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2021000 : nChk 8 14 kAi kCi kL t_r2021000 1024 1152 10240 10368 = some 0 := by
  decide +kernel

def t_r2021001 : NTree := NTree.ofString "11000010000100000"
theorem k_r2021001 : nChk 8 14 kAi kCi kL t_r2021001 1152 1280 10240 10368 = some 0 := by
  decide +kernel

def t_r2021002 : NTree := NTree.ofString "11000010000110000010000010000"
theorem k_r2021002 : nChk 8 14 kAi kCi kL t_r2021002 1024 1152 10368 10496 = some 25799394900561294375518208 := by
  decide +kernel

def t_r2021003 : NTree := NTree.ofString "1100000100000"
theorem k_r2021003 : nChk 8 14 kAi kCi kL t_r2021003 1152 1280 10368 10496 = some 0 := by
  decide +kernel

def t_r202100 : NTree := .node t_r2021000 t_r2021001 t_r2021002 t_r2021003
theorem k_r202100 : nChk 8 14 kAi kCi kL t_r202100 1024 1280 10240 10496 = some 25799394900561294375518208 :=
  nChk_node rfl rfl k_r2021000 k_r2021001 k_r2021002 k_r2021003 rfl

def t_r202101 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202101 : nChk 8 14 kAi kCi kL t_r202101 1280 1536 10240 10496 = some 0 := by
  decide +kernel

def t_r2021020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2021020 : nChk 8 14 kAi kCi kL t_r2021020 1024 1152 10496 10624 = some 0 := by
  decide +kernel

def t_r2021021 : NTree := NTree.ofString "1100000100000"
theorem k_r2021021 : nChk 8 14 kAi kCi kL t_r2021021 1152 1280 10496 10624 = some 0 := by
  decide +kernel

def t_r2021022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2021022 : nChk 8 14 kAi kCi kL t_r2021022 1024 1152 10624 10752 = some 0 := by
  decide +kernel

def t_r2021023 : NTree := NTree.ofString "1100000100000"
theorem k_r2021023 : nChk 8 14 kAi kCi kL t_r2021023 1152 1280 10624 10752 = some 0 := by
  decide +kernel

def t_r202102 : NTree := .node t_r2021020 t_r2021021 t_r2021022 t_r2021023
theorem k_r202102 : nChk 8 14 kAi kCi kL t_r202102 1024 1280 10496 10752 = some 0 :=
  nChk_node rfl rfl k_r2021020 k_r2021021 k_r2021022 k_r2021023 rfl

def t_r202103 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202103 : nChk 8 14 kAi kCi kL t_r202103 1280 1536 10496 10752 = some 0 := by
  decide +kernel

def t_r20210 : NTree := .node t_r202100 t_r202101 t_r202102 t_r202103
theorem k_r20210 : nChk 8 14 kAi kCi kL t_r20210 1024 1536 10240 10752 = some 25799394900561294375518208 :=
  nChk_node rfl rfl k_r202100 k_r202101 k_r202102 k_r202103 rfl

def t_r20211 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20211 : nChk 8 14 kAi kCi kL t_r20211 1536 2048 10240 10752 = some 0 := by
  decide +kernel

def t_r2021200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2021200 : nChk 8 14 kAi kCi kL t_r2021200 1024 1152 10752 10880 = some 0 := by
  decide +kernel

def t_r2021201 : NTree := NTree.ofString "1100000100000"
theorem k_r2021201 : nChk 8 14 kAi kCi kL t_r2021201 1152 1280 10752 10880 = some 0 := by
  decide +kernel

def t_r2021202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2021202 : nChk 8 14 kAi kCi kL t_r2021202 1024 1152 10880 11008 = some 0 := by
  decide +kernel

def t_r2021203 : NTree := NTree.ofString "1100000100000"
theorem k_r2021203 : nChk 8 14 kAi kCi kL t_r2021203 1152 1280 10880 11008 = some 0 := by
  decide +kernel

def t_r202120 : NTree := .node t_r2021200 t_r2021201 t_r2021202 t_r2021203
theorem k_r202120 : nChk 8 14 kAi kCi kL t_r202120 1024 1280 10752 11008 = some 0 :=
  nChk_node rfl rfl k_r2021200 k_r2021201 k_r2021202 k_r2021203 rfl

def t_r202121 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202121 : nChk 8 14 kAi kCi kL t_r202121 1280 1536 10752 11008 = some 0 := by
  decide +kernel

def t_r2021220 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2021220 : nChk 8 14 kAi kCi kL t_r2021220 1024 1152 11008 11136 = some 0 := by
  decide +kernel

def t_r2021221 : NTree := NTree.ofString "1100000100000"
theorem k_r2021221 : nChk 8 14 kAi kCi kL t_r2021221 1152 1280 11008 11136 = some 0 := by
  decide +kernel

def t_r2021222 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2021222 : nChk 8 14 kAi kCi kL t_r2021222 1024 1152 11136 11264 = some 0 := by
  decide +kernel

def t_r2021223 : NTree := NTree.ofString "1100000100000"
theorem k_r2021223 : nChk 8 14 kAi kCi kL t_r2021223 1152 1280 11136 11264 = some 0 := by
  decide +kernel

def t_r202122 : NTree := .node t_r2021220 t_r2021221 t_r2021222 t_r2021223
theorem k_r202122 : nChk 8 14 kAi kCi kL t_r202122 1024 1280 11008 11264 = some 0 :=
  nChk_node rfl rfl k_r2021220 k_r2021221 k_r2021222 k_r2021223 rfl

def t_r202123 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202123 : nChk 8 14 kAi kCi kL t_r202123 1280 1536 11008 11264 = some 0 := by
  decide +kernel

def t_r20212 : NTree := .node t_r202120 t_r202121 t_r202122 t_r202123
theorem k_r20212 : nChk 8 14 kAi kCi kL t_r20212 1024 1536 10752 11264 = some 0 :=
  nChk_node rfl rfl k_r202120 k_r202121 k_r202122 k_r202123 rfl

def t_r20213 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20213 : nChk 8 14 kAi kCi kL t_r20213 1536 2048 10752 11264 = some 0 := by
  decide +kernel

def t_r2021 : NTree := .node t_r20210 t_r20211 t_r20212 t_r20213
theorem k_r2021 : nChk 8 14 kAi kCi kL t_r2021 1024 2048 10240 11264 = some 25799394900561294375518208 :=
  nChk_node rfl rfl k_r20210 k_r20211 k_r20212 k_r20213 rfl

end ChargeKernel.Pt900
