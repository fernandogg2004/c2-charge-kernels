/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0223` (376 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0223000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223000 : nChk 8 14 kAi kCi kL t_r0223000 1024 1152 7168 7296 = some 0 := by
  decide +kernel

def t_r0223001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223001 : nChk 8 14 kAi kCi kL t_r0223001 1152 1280 7168 7296 = some 0 := by
  decide +kernel

def t_r0223002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223002 : nChk 8 14 kAi kCi kL t_r0223002 1024 1152 7296 7424 = some 0 := by
  decide +kernel

def t_r0223003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223003 : nChk 8 14 kAi kCi kL t_r0223003 1152 1280 7296 7424 = some 0 := by
  decide +kernel

def t_r022300 : NTree := .node t_r0223000 t_r0223001 t_r0223002 t_r0223003
theorem k_r022300 : nChk 8 14 kAi kCi kL t_r022300 1024 1280 7168 7424 = some 0 :=
  nChk_node rfl rfl k_r0223000 k_r0223001 k_r0223002 k_r0223003 rfl

def t_r022301 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022301 : nChk 8 14 kAi kCi kL t_r022301 1280 1536 7168 7424 = some 0 := by
  decide +kernel

def t_r0223020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223020 : nChk 8 14 kAi kCi kL t_r0223020 1024 1152 7424 7552 = some 0 := by
  decide +kernel

def t_r0223021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223021 : nChk 8 14 kAi kCi kL t_r0223021 1152 1280 7424 7552 = some 0 := by
  decide +kernel

def t_r0223022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223022 : nChk 8 14 kAi kCi kL t_r0223022 1024 1152 7552 7680 = some 0 := by
  decide +kernel

def t_r0223023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223023 : nChk 8 14 kAi kCi kL t_r0223023 1152 1280 7552 7680 = some 0 := by
  decide +kernel

def t_r022302 : NTree := .node t_r0223020 t_r0223021 t_r0223022 t_r0223023
theorem k_r022302 : nChk 8 14 kAi kCi kL t_r022302 1024 1280 7424 7680 = some 0 :=
  nChk_node rfl rfl k_r0223020 k_r0223021 k_r0223022 k_r0223023 rfl

def t_r022303 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022303 : nChk 8 14 kAi kCi kL t_r022303 1280 1536 7424 7680 = some 0 := by
  decide +kernel

def t_r02230 : NTree := .node t_r022300 t_r022301 t_r022302 t_r022303
theorem k_r02230 : nChk 8 14 kAi kCi kL t_r02230 1024 1536 7168 7680 = some 0 :=
  nChk_node rfl rfl k_r022300 k_r022301 k_r022302 k_r022303 rfl

def t_r02231 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02231 : nChk 8 14 kAi kCi kL t_r02231 1536 2048 7168 7680 = some 0 := by
  decide +kernel

def t_r0223200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223200 : nChk 8 14 kAi kCi kL t_r0223200 1024 1152 7680 7808 = some 0 := by
  decide +kernel

def t_r0223201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223201 : nChk 8 14 kAi kCi kL t_r0223201 1152 1280 7680 7808 = some 0 := by
  decide +kernel

def t_r0223202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223202 : nChk 8 14 kAi kCi kL t_r0223202 1024 1152 7808 7936 = some 0 := by
  decide +kernel

def t_r0223203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223203 : nChk 8 14 kAi kCi kL t_r0223203 1152 1280 7808 7936 = some 0 := by
  decide +kernel

def t_r022320 : NTree := .node t_r0223200 t_r0223201 t_r0223202 t_r0223203
theorem k_r022320 : nChk 8 14 kAi kCi kL t_r022320 1024 1280 7680 7936 = some 0 :=
  nChk_node rfl rfl k_r0223200 k_r0223201 k_r0223202 k_r0223203 rfl

def t_r022321 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022321 : nChk 8 14 kAi kCi kL t_r022321 1280 1536 7680 7936 = some 0 := by
  decide +kernel

def t_r0223220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223220 : nChk 8 14 kAi kCi kL t_r0223220 1024 1152 7936 8064 = some 0 := by
  decide +kernel

def t_r0223221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223221 : nChk 8 14 kAi kCi kL t_r0223221 1152 1280 7936 8064 = some 0 := by
  decide +kernel

def t_r0223222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223222 : nChk 8 14 kAi kCi kL t_r0223222 1024 1152 8064 8192 = some 0 := by
  decide +kernel

def t_r0223223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0223223 : nChk 8 14 kAi kCi kL t_r0223223 1152 1280 8064 8192 = some 0 := by
  decide +kernel

def t_r022322 : NTree := .node t_r0223220 t_r0223221 t_r0223222 t_r0223223
theorem k_r022322 : nChk 8 14 kAi kCi kL t_r022322 1024 1280 7936 8192 = some 0 :=
  nChk_node rfl rfl k_r0223220 k_r0223221 k_r0223222 k_r0223223 rfl

def t_r022323 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022323 : nChk 8 14 kAi kCi kL t_r022323 1280 1536 7936 8192 = some 0 := by
  decide +kernel

def t_r02232 : NTree := .node t_r022320 t_r022321 t_r022322 t_r022323
theorem k_r02232 : nChk 8 14 kAi kCi kL t_r02232 1024 1536 7680 8192 = some 0 :=
  nChk_node rfl rfl k_r022320 k_r022321 k_r022322 k_r022323 rfl

def t_r02233 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02233 : nChk 8 14 kAi kCi kL t_r02233 1536 2048 7680 8192 = some 0 := by
  decide +kernel

def t_r0223 : NTree := .node t_r02230 t_r02231 t_r02232 t_r02233
theorem k_r0223 : nChk 8 14 kAi kCi kL t_r0223 1024 2048 7168 8192 = some 0 :=
  nChk_node rfl rfl k_r02230 k_r02231 k_r02232 k_r02233 rfl

end ChargeKernel.Pt900
