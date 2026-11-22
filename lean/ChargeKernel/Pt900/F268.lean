/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2203` (544 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2203000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203000 : nChk 8 14 kAi kCi kL t_r2203000 1024 1152 13312 13440 = some 0 := by
  decide +kernel

def t_r2203001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203001 : nChk 8 14 kAi kCi kL t_r2203001 1152 1280 13312 13440 = some 0 := by
  decide +kernel

def t_r2203002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203002 : nChk 8 14 kAi kCi kL t_r2203002 1024 1152 13440 13568 = some 0 := by
  decide +kernel

def t_r2203003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203003 : nChk 8 14 kAi kCi kL t_r2203003 1152 1280 13440 13568 = some 0 := by
  decide +kernel

def t_r220300 : NTree := .node t_r2203000 t_r2203001 t_r2203002 t_r2203003
theorem k_r220300 : nChk 8 14 kAi kCi kL t_r220300 1024 1280 13312 13568 = some 0 :=
  nChk_node rfl rfl k_r2203000 k_r2203001 k_r2203002 k_r2203003 rfl

def t_r2203010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203010 : nChk 8 14 kAi kCi kL t_r2203010 1280 1408 13312 13440 = some 0 := by
  decide +kernel

def t_r2203011 : NTree := NTree.ofString "10000"
theorem k_r2203011 : nChk 8 14 kAi kCi kL t_r2203011 1408 1536 13312 13440 = some 0 := by
  decide +kernel

def t_r2203012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203012 : nChk 8 14 kAi kCi kL t_r2203012 1280 1408 13440 13568 = some 0 := by
  decide +kernel

def t_r2203013 : NTree := NTree.ofString "10000"
theorem k_r2203013 : nChk 8 14 kAi kCi kL t_r2203013 1408 1536 13440 13568 = some 0 := by
  decide +kernel

def t_r220301 : NTree := .node t_r2203010 t_r2203011 t_r2203012 t_r2203013
theorem k_r220301 : nChk 8 14 kAi kCi kL t_r220301 1280 1536 13312 13568 = some 0 :=
  nChk_node rfl rfl k_r2203010 k_r2203011 k_r2203012 k_r2203013 rfl

def t_r2203020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203020 : nChk 8 14 kAi kCi kL t_r2203020 1024 1152 13568 13696 = some 0 := by
  decide +kernel

def t_r2203021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203021 : nChk 8 14 kAi kCi kL t_r2203021 1152 1280 13568 13696 = some 0 := by
  decide +kernel

def t_r2203022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203022 : nChk 8 14 kAi kCi kL t_r2203022 1024 1152 13696 13824 = some 0 := by
  decide +kernel

def t_r2203023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203023 : nChk 8 14 kAi kCi kL t_r2203023 1152 1280 13696 13824 = some 0 := by
  decide +kernel

def t_r220302 : NTree := .node t_r2203020 t_r2203021 t_r2203022 t_r2203023
theorem k_r220302 : nChk 8 14 kAi kCi kL t_r220302 1024 1280 13568 13824 = some 0 :=
  nChk_node rfl rfl k_r2203020 k_r2203021 k_r2203022 k_r2203023 rfl

def t_r2203030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203030 : nChk 8 14 kAi kCi kL t_r2203030 1280 1408 13568 13696 = some 0 := by
  decide +kernel

def t_r2203031 : NTree := NTree.ofString "100100000"
theorem k_r2203031 : nChk 8 14 kAi kCi kL t_r2203031 1408 1536 13568 13696 = some 0 := by
  decide +kernel

def t_r2203032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203032 : nChk 8 14 kAi kCi kL t_r2203032 1280 1408 13696 13824 = some 0 := by
  decide +kernel

def t_r2203033 : NTree := NTree.ofString "1100000100000"
theorem k_r2203033 : nChk 8 14 kAi kCi kL t_r2203033 1408 1536 13696 13824 = some 0 := by
  decide +kernel

def t_r220303 : NTree := .node t_r2203030 t_r2203031 t_r2203032 t_r2203033
theorem k_r220303 : nChk 8 14 kAi kCi kL t_r220303 1280 1536 13568 13824 = some 0 :=
  nChk_node rfl rfl k_r2203030 k_r2203031 k_r2203032 k_r2203033 rfl

def t_r22030 : NTree := .node t_r220300 t_r220301 t_r220302 t_r220303
theorem k_r22030 : nChk 8 14 kAi kCi kL t_r22030 1024 1536 13312 13824 = some 0 :=
  nChk_node rfl rfl k_r220300 k_r220301 k_r220302 k_r220303 rfl

def t_r220310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220310 : nChk 8 14 kAi kCi kL t_r220310 1536 1792 13312 13568 = some 0 := by
  decide +kernel

def t_r220311 : NTree := NTree.ofString "10000"
theorem k_r220311 : nChk 8 14 kAi kCi kL t_r220311 1792 2048 13312 13568 = some 0 := by
  decide +kernel

def t_r220312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220312 : nChk 8 14 kAi kCi kL t_r220312 1536 1792 13568 13824 = some 0 := by
  decide +kernel

def t_r220313 : NTree := NTree.ofString "10000"
theorem k_r220313 : nChk 8 14 kAi kCi kL t_r220313 1792 2048 13568 13824 = some 0 := by
  decide +kernel

def t_r22031 : NTree := .node t_r220310 t_r220311 t_r220312 t_r220313
theorem k_r22031 : nChk 8 14 kAi kCi kL t_r22031 1536 2048 13312 13824 = some 0 :=
  nChk_node rfl rfl k_r220310 k_r220311 k_r220312 k_r220313 rfl

def t_r2203200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203200 : nChk 8 14 kAi kCi kL t_r2203200 1024 1152 13824 13952 = some 0 := by
  decide +kernel

def t_r2203201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203201 : nChk 8 14 kAi kCi kL t_r2203201 1152 1280 13824 13952 = some 0 := by
  decide +kernel

def t_r2203202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203202 : nChk 8 14 kAi kCi kL t_r2203202 1024 1152 13952 14080 = some 0 := by
  decide +kernel

def t_r2203203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203203 : nChk 8 14 kAi kCi kL t_r2203203 1152 1280 13952 14080 = some 0 := by
  decide +kernel

def t_r220320 : NTree := .node t_r2203200 t_r2203201 t_r2203202 t_r2203203
theorem k_r220320 : nChk 8 14 kAi kCi kL t_r220320 1024 1280 13824 14080 = some 0 :=
  nChk_node rfl rfl k_r2203200 k_r2203201 k_r2203202 k_r2203203 rfl

def t_r2203210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203210 : nChk 8 14 kAi kCi kL t_r2203210 1280 1408 13824 13952 = some 0 := by
  decide +kernel

def t_r2203211 : NTree := NTree.ofString "1100000100000"
theorem k_r2203211 : nChk 8 14 kAi kCi kL t_r2203211 1408 1536 13824 13952 = some 0 := by
  decide +kernel

def t_r2203212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203212 : nChk 8 14 kAi kCi kL t_r2203212 1280 1408 13952 14080 = some 0 := by
  decide +kernel

def t_r2203213 : NTree := NTree.ofString "1100000100000"
theorem k_r2203213 : nChk 8 14 kAi kCi kL t_r2203213 1408 1536 13952 14080 = some 0 := by
  decide +kernel

def t_r220321 : NTree := .node t_r2203210 t_r2203211 t_r2203212 t_r2203213
theorem k_r220321 : nChk 8 14 kAi kCi kL t_r220321 1280 1536 13824 14080 = some 0 :=
  nChk_node rfl rfl k_r2203210 k_r2203211 k_r2203212 k_r2203213 rfl

def t_r2203220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203220 : nChk 8 14 kAi kCi kL t_r2203220 1024 1152 14080 14208 = some 0 := by
  decide +kernel

def t_r2203221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203221 : nChk 8 14 kAi kCi kL t_r2203221 1152 1280 14080 14208 = some 0 := by
  decide +kernel

def t_r2203222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203222 : nChk 8 14 kAi kCi kL t_r2203222 1024 1152 14208 14336 = some 0 := by
  decide +kernel

def t_r2203223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203223 : nChk 8 14 kAi kCi kL t_r2203223 1152 1280 14208 14336 = some 0 := by
  decide +kernel

def t_r220322 : NTree := .node t_r2203220 t_r2203221 t_r2203222 t_r2203223
theorem k_r220322 : nChk 8 14 kAi kCi kL t_r220322 1024 1280 14080 14336 = some 0 :=
  nChk_node rfl rfl k_r2203220 k_r2203221 k_r2203222 k_r2203223 rfl

def t_r2203230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203230 : nChk 8 14 kAi kCi kL t_r2203230 1280 1408 14080 14208 = some 0 := by
  decide +kernel

def t_r2203231 : NTree := NTree.ofString "1100000100000"
theorem k_r2203231 : nChk 8 14 kAi kCi kL t_r2203231 1408 1536 14080 14208 = some 0 := by
  decide +kernel

def t_r2203232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2203232 : nChk 8 14 kAi kCi kL t_r2203232 1280 1408 14208 14336 = some 0 := by
  decide +kernel

def t_r2203233 : NTree := NTree.ofString "1100000100000"
theorem k_r2203233 : nChk 8 14 kAi kCi kL t_r2203233 1408 1536 14208 14336 = some 0 := by
  decide +kernel

def t_r220323 : NTree := .node t_r2203230 t_r2203231 t_r2203232 t_r2203233
theorem k_r220323 : nChk 8 14 kAi kCi kL t_r220323 1280 1536 14080 14336 = some 0 :=
  nChk_node rfl rfl k_r2203230 k_r2203231 k_r2203232 k_r2203233 rfl

def t_r22032 : NTree := .node t_r220320 t_r220321 t_r220322 t_r220323
theorem k_r22032 : nChk 8 14 kAi kCi kL t_r22032 1024 1536 13824 14336 = some 0 :=
  nChk_node rfl rfl k_r220320 k_r220321 k_r220322 k_r220323 rfl

def t_r220330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220330 : nChk 8 14 kAi kCi kL t_r220330 1536 1792 13824 14080 = some 0 := by
  decide +kernel

def t_r220331 : NTree := NTree.ofString "1100000100000"
theorem k_r220331 : nChk 8 14 kAi kCi kL t_r220331 1792 2048 13824 14080 = some 0 := by
  decide +kernel

def t_r220332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220332 : nChk 8 14 kAi kCi kL t_r220332 1536 1792 14080 14336 = some 0 := by
  decide +kernel

def t_r220333 : NTree := NTree.ofString "11000001000010000"
theorem k_r220333 : nChk 8 14 kAi kCi kL t_r220333 1792 2048 14080 14336 = some 0 := by
  decide +kernel

def t_r22033 : NTree := .node t_r220330 t_r220331 t_r220332 t_r220333
theorem k_r22033 : nChk 8 14 kAi kCi kL t_r22033 1536 2048 13824 14336 = some 0 :=
  nChk_node rfl rfl k_r220330 k_r220331 k_r220332 k_r220333 rfl

def t_r2203 : NTree := .node t_r22030 t_r22031 t_r22032 t_r22033
theorem k_r2203 : nChk 8 14 kAi kCi kL t_r2203 1024 2048 13312 14336 = some 0 :=
  nChk_node rfl rfl k_r22030 k_r22031 k_r22032 k_r22033 rfl

end ChargeKernel.Pt900
