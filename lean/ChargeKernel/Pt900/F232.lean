/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2023` (460 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2023000 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023000 : nChk 8 14 kAi kCi kL t_r2023000 1024 1152 11264 11392 = some 0 := by
  decide +kernel

def t_r2023001 : NTree := NTree.ofString "1100000100000"
theorem k_r2023001 : nChk 8 14 kAi kCi kL t_r2023001 1152 1280 11264 11392 = some 0 := by
  decide +kernel

def t_r2023002 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023002 : nChk 8 14 kAi kCi kL t_r2023002 1024 1152 11392 11520 = some 0 := by
  decide +kernel

def t_r2023003 : NTree := NTree.ofString "1100000100000"
theorem k_r2023003 : nChk 8 14 kAi kCi kL t_r2023003 1152 1280 11392 11520 = some 0 := by
  decide +kernel

def t_r202300 : NTree := .node t_r2023000 t_r2023001 t_r2023002 t_r2023003
theorem k_r202300 : nChk 8 14 kAi kCi kL t_r202300 1024 1280 11264 11520 = some 0 :=
  nChk_node rfl rfl k_r2023000 k_r2023001 k_r2023002 k_r2023003 rfl

def t_r202301 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202301 : nChk 8 14 kAi kCi kL t_r202301 1280 1536 11264 11520 = some 0 := by
  decide +kernel

def t_r2023020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023020 : nChk 8 14 kAi kCi kL t_r2023020 1024 1152 11520 11648 = some 0 := by
  decide +kernel

def t_r2023021 : NTree := NTree.ofString "11000001000010000"
theorem k_r2023021 : nChk 8 14 kAi kCi kL t_r2023021 1152 1280 11520 11648 = some 0 := by
  decide +kernel

def t_r2023022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023022 : nChk 8 14 kAi kCi kL t_r2023022 1024 1152 11648 11776 = some 0 := by
  decide +kernel

def t_r2023023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2023023 : nChk 8 14 kAi kCi kL t_r2023023 1152 1280 11648 11776 = some 0 := by
  decide +kernel

def t_r202302 : NTree := .node t_r2023020 t_r2023021 t_r2023022 t_r2023023
theorem k_r202302 : nChk 8 14 kAi kCi kL t_r202302 1024 1280 11520 11776 = some 0 :=
  nChk_node rfl rfl k_r2023020 k_r2023021 k_r2023022 k_r2023023 rfl

def t_r202303 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202303 : nChk 8 14 kAi kCi kL t_r202303 1280 1536 11520 11776 = some 0 := by
  decide +kernel

def t_r20230 : NTree := .node t_r202300 t_r202301 t_r202302 t_r202303
theorem k_r20230 : nChk 8 14 kAi kCi kL t_r20230 1024 1536 11264 11776 = some 0 :=
  nChk_node rfl rfl k_r202300 k_r202301 k_r202302 k_r202303 rfl

def t_r20231 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20231 : nChk 8 14 kAi kCi kL t_r20231 1536 2048 11264 11776 = some 0 := by
  decide +kernel

def t_r2023200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023200 : nChk 8 14 kAi kCi kL t_r2023200 1024 1152 11776 11904 = some 0 := by
  decide +kernel

def t_r2023201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2023201 : nChk 8 14 kAi kCi kL t_r2023201 1152 1280 11776 11904 = some 0 := by
  decide +kernel

def t_r2023202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023202 : nChk 8 14 kAi kCi kL t_r2023202 1024 1152 11904 12032 = some 0 := by
  decide +kernel

def t_r2023203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2023203 : nChk 8 14 kAi kCi kL t_r2023203 1152 1280 11904 12032 = some 0 := by
  decide +kernel

def t_r202320 : NTree := .node t_r2023200 t_r2023201 t_r2023202 t_r2023203
theorem k_r202320 : nChk 8 14 kAi kCi kL t_r202320 1024 1280 11776 12032 = some 0 :=
  nChk_node rfl rfl k_r2023200 k_r2023201 k_r2023202 k_r2023203 rfl

def t_r202321 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202321 : nChk 8 14 kAi kCi kL t_r202321 1280 1536 11776 12032 = some 0 := by
  decide +kernel

def t_r2023220 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023220 : nChk 8 14 kAi kCi kL t_r2023220 1024 1152 12032 12160 = some 0 := by
  decide +kernel

def t_r2023221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2023221 : nChk 8 14 kAi kCi kL t_r2023221 1152 1280 12032 12160 = some 0 := by
  decide +kernel

def t_r2023222 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2023222 : nChk 8 14 kAi kCi kL t_r2023222 1024 1152 12160 12288 = some 0 := by
  decide +kernel

def t_r2023223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2023223 : nChk 8 14 kAi kCi kL t_r2023223 1152 1280 12160 12288 = some 0 := by
  decide +kernel

def t_r202322 : NTree := .node t_r2023220 t_r2023221 t_r2023222 t_r2023223
theorem k_r202322 : nChk 8 14 kAi kCi kL t_r202322 1024 1280 12032 12288 = some 0 :=
  nChk_node rfl rfl k_r2023220 k_r2023221 k_r2023222 k_r2023223 rfl

def t_r202323 : NTree := NTree.ofString "110000100001000010000"
theorem k_r202323 : nChk 8 14 kAi kCi kL t_r202323 1280 1536 12032 12288 = some 13117516604303009573240832 := by
  decide +kernel

def t_r20232 : NTree := .node t_r202320 t_r202321 t_r202322 t_r202323
theorem k_r20232 : nChk 8 14 kAi kCi kL t_r20232 1024 1536 11776 12288 = some 13117516604303009573240832 :=
  nChk_node rfl rfl k_r202320 k_r202321 k_r202322 k_r202323 rfl

def t_r20233 : NTree := NTree.ofString "11100000100000100001100000100001000010000"
theorem k_r20233 : nChk 8 14 kAi kCi kL t_r20233 1536 2048 11776 12288 = some 0 := by
  decide +kernel

def t_r2023 : NTree := .node t_r20230 t_r20231 t_r20232 t_r20233
theorem k_r2023 : nChk 8 14 kAi kCi kL t_r2023 1024 2048 11264 12288 = some 13117516604303009573240832 :=
  nChk_node rfl rfl k_r20230 k_r20231 k_r20232 k_r20233 rfl

end ChargeKernel.Pt900
