/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0023` (463 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0023000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023000 : nChk 8 14 kAi kCi kL t_r0023000 1024 1152 3072 3200 = some 0 := by
  decide +kernel

def t_r0023001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023001 : nChk 8 14 kAi kCi kL t_r0023001 1152 1280 3072 3200 = some 0 := by
  decide +kernel

def t_r0023002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023002 : nChk 8 14 kAi kCi kL t_r0023002 1024 1152 3200 3328 = some 0 := by
  decide +kernel

def t_r0023003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023003 : nChk 8 14 kAi kCi kL t_r0023003 1152 1280 3200 3328 = some 0 := by
  decide +kernel

def t_r002300 : NTree := .node t_r0023000 t_r0023001 t_r0023002 t_r0023003
theorem k_r002300 : nChk 8 14 kAi kCi kL t_r002300 1024 1280 3072 3328 = some 0 :=
  nChk_node rfl rfl k_r0023000 k_r0023001 k_r0023002 k_r0023003 rfl

def t_r0023010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023010 : nChk 8 14 kAi kCi kL t_r0023010 1280 1408 3072 3200 = some 0 := by
  decide +kernel

def t_r0023011 : NTree := NTree.ofString "10000"
theorem k_r0023011 : nChk 8 14 kAi kCi kL t_r0023011 1408 1536 3072 3200 = some 0 := by
  decide +kernel

def t_r0023012 : NTree := NTree.ofString "1100000100000"
theorem k_r0023012 : nChk 8 14 kAi kCi kL t_r0023012 1280 1408 3200 3328 = some 0 := by
  decide +kernel

def t_r0023013 : NTree := NTree.ofString "10000"
theorem k_r0023013 : nChk 8 14 kAi kCi kL t_r0023013 1408 1536 3200 3328 = some 0 := by
  decide +kernel

def t_r002301 : NTree := .node t_r0023010 t_r0023011 t_r0023012 t_r0023013
theorem k_r002301 : nChk 8 14 kAi kCi kL t_r002301 1280 1536 3072 3328 = some 0 :=
  nChk_node rfl rfl k_r0023010 k_r0023011 k_r0023012 k_r0023013 rfl

def t_r0023020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023020 : nChk 8 14 kAi kCi kL t_r0023020 1024 1152 3328 3456 = some 0 := by
  decide +kernel

def t_r0023021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023021 : nChk 8 14 kAi kCi kL t_r0023021 1152 1280 3328 3456 = some 0 := by
  decide +kernel

def t_r0023022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023022 : nChk 8 14 kAi kCi kL t_r0023022 1024 1152 3456 3584 = some 0 := by
  decide +kernel

def t_r0023023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023023 : nChk 8 14 kAi kCi kL t_r0023023 1152 1280 3456 3584 = some 0 := by
  decide +kernel

def t_r002302 : NTree := .node t_r0023020 t_r0023021 t_r0023022 t_r0023023
theorem k_r002302 : nChk 8 14 kAi kCi kL t_r002302 1024 1280 3328 3584 = some 0 :=
  nChk_node rfl rfl k_r0023020 k_r0023021 k_r0023022 k_r0023023 rfl

def t_r002303 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r002303 : nChk 8 14 kAi kCi kL t_r002303 1280 1536 3328 3584 = some 0 := by
  decide +kernel

def t_r00230 : NTree := .node t_r002300 t_r002301 t_r002302 t_r002303
theorem k_r00230 : nChk 8 14 kAi kCi kL t_r00230 1024 1536 3072 3584 = some 0 :=
  nChk_node rfl rfl k_r002300 k_r002301 k_r002302 k_r002303 rfl

def t_r002310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002310 : nChk 8 14 kAi kCi kL t_r002310 1536 1792 3072 3328 = some 0 := by
  decide +kernel

def t_r002311 : NTree := NTree.ofString "10000"
theorem k_r002311 : nChk 8 14 kAi kCi kL t_r002311 1792 2048 3072 3328 = some 0 := by
  decide +kernel

def t_r002312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002312 : nChk 8 14 kAi kCi kL t_r002312 1536 1792 3328 3584 = some 0 := by
  decide +kernel

def t_r002313 : NTree := NTree.ofString "10000"
theorem k_r002313 : nChk 8 14 kAi kCi kL t_r002313 1792 2048 3328 3584 = some 0 := by
  decide +kernel

def t_r00231 : NTree := .node t_r002310 t_r002311 t_r002312 t_r002313
theorem k_r00231 : nChk 8 14 kAi kCi kL t_r00231 1536 2048 3072 3584 = some 0 :=
  nChk_node rfl rfl k_r002310 k_r002311 k_r002312 k_r002313 rfl

def t_r0023200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023200 : nChk 8 14 kAi kCi kL t_r0023200 1024 1152 3584 3712 = some 0 := by
  decide +kernel

def t_r0023201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023201 : nChk 8 14 kAi kCi kL t_r0023201 1152 1280 3584 3712 = some 0 := by
  decide +kernel

def t_r0023202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023202 : nChk 8 14 kAi kCi kL t_r0023202 1024 1152 3712 3840 = some 0 := by
  decide +kernel

def t_r0023203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023203 : nChk 8 14 kAi kCi kL t_r0023203 1152 1280 3712 3840 = some 0 := by
  decide +kernel

def t_r002320 : NTree := .node t_r0023200 t_r0023201 t_r0023202 t_r0023203
theorem k_r002320 : nChk 8 14 kAi kCi kL t_r002320 1024 1280 3584 3840 = some 0 :=
  nChk_node rfl rfl k_r0023200 k_r0023201 k_r0023202 k_r0023203 rfl

def t_r002321 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r002321 : nChk 8 14 kAi kCi kL t_r002321 1280 1536 3584 3840 = some 0 := by
  decide +kernel

def t_r0023220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023220 : nChk 8 14 kAi kCi kL t_r0023220 1024 1152 3840 3968 = some 0 := by
  decide +kernel

def t_r0023221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023221 : nChk 8 14 kAi kCi kL t_r0023221 1152 1280 3840 3968 = some 0 := by
  decide +kernel

def t_r0023222 : NTree := NTree.ofString "110010000010000110000010000010000"
theorem k_r0023222 : nChk 8 14 kAi kCi kL t_r0023222 1024 1152 3968 4096 = some 14421221794968358424150016 := by
  decide +kernel

def t_r0023223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0023223 : nChk 8 14 kAi kCi kL t_r0023223 1152 1280 3968 4096 = some 0 := by
  decide +kernel

def t_r002322 : NTree := .node t_r0023220 t_r0023221 t_r0023222 t_r0023223
theorem k_r002322 : nChk 8 14 kAi kCi kL t_r002322 1024 1280 3840 4096 = some 14421221794968358424150016 :=
  nChk_node rfl rfl k_r0023220 k_r0023221 k_r0023222 k_r0023223 rfl

def t_r002323 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r002323 : nChk 8 14 kAi kCi kL t_r002323 1280 1536 3840 4096 = some 0 := by
  decide +kernel

def t_r00232 : NTree := .node t_r002320 t_r002321 t_r002322 t_r002323
theorem k_r00232 : nChk 8 14 kAi kCi kL t_r00232 1024 1536 3584 4096 = some 14421221794968358424150016 :=
  nChk_node rfl rfl k_r002320 k_r002321 k_r002322 k_r002323 rfl

def t_r002330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002330 : nChk 8 14 kAi kCi kL t_r002330 1536 1792 3584 3840 = some 0 := by
  decide +kernel

def t_r002331 : NTree := NTree.ofString "10000"
theorem k_r002331 : nChk 8 14 kAi kCi kL t_r002331 1792 2048 3584 3840 = some 0 := by
  decide +kernel

def t_r002332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002332 : nChk 8 14 kAi kCi kL t_r002332 1536 1792 3840 4096 = some 0 := by
  decide +kernel

def t_r002333 : NTree := NTree.ofString "10000"
theorem k_r002333 : nChk 8 14 kAi kCi kL t_r002333 1792 2048 3840 4096 = some 0 := by
  decide +kernel

def t_r00233 : NTree := .node t_r002330 t_r002331 t_r002332 t_r002333
theorem k_r00233 : nChk 8 14 kAi kCi kL t_r00233 1536 2048 3584 4096 = some 0 :=
  nChk_node rfl rfl k_r002330 k_r002331 k_r002332 k_r002333 rfl

def t_r0023 : NTree := .node t_r00230 t_r00231 t_r00232 t_r00233
theorem k_r0023 : nChk 8 14 kAi kCi kL t_r0023 1024 2048 3072 4096 = some 14421221794968358424150016 :=
  nChk_node rfl rfl k_r00230 k_r00231 k_r00232 k_r00233 rfl

end ChargeKernel.Pt900
