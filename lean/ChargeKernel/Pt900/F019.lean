/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `00013` (178 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0001300 : NTree := NTree.ofString "101000000"
theorem k_r0001300 : nChk 8 14 kAi kCi kL t_r0001300 1536 1664 512 640 = some 0 := by
  decide +kernel

def t_r0001301 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001301 : nChk 8 14 kAi kCi kL t_r0001301 1664 1792 512 640 = some 0 := by
  decide +kernel

def t_r0001302 : NTree := NTree.ofString "10000"
theorem k_r0001302 : nChk 8 14 kAi kCi kL t_r0001302 1536 1664 640 768 = some 0 := by
  decide +kernel

def t_r0001303 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001303 : nChk 8 14 kAi kCi kL t_r0001303 1664 1792 640 768 = some 0 := by
  decide +kernel

def t_r000130 : NTree := .node t_r0001300 t_r0001301 t_r0001302 t_r0001303
theorem k_r000130 : nChk 8 14 kAi kCi kL t_r000130 1536 1792 512 768 = some 0 :=
  nChk_node rfl rfl k_r0001300 k_r0001301 k_r0001302 k_r0001303 rfl

def t_r0001310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001310 : nChk 8 14 kAi kCi kL t_r0001310 1792 1920 512 640 = some 0 := by
  decide +kernel

def t_r0001311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001311 : nChk 8 14 kAi kCi kL t_r0001311 1920 2048 512 640 = some 0 := by
  decide +kernel

def t_r0001312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001312 : nChk 8 14 kAi kCi kL t_r0001312 1792 1920 640 768 = some 0 := by
  decide +kernel

def t_r0001313 : NTree := NTree.ofString "11000010000100000"
theorem k_r0001313 : nChk 8 14 kAi kCi kL t_r0001313 1920 2048 640 768 = some 0 := by
  decide +kernel

def t_r000131 : NTree := .node t_r0001310 t_r0001311 t_r0001312 t_r0001313
theorem k_r000131 : nChk 8 14 kAi kCi kL t_r000131 1792 2048 512 768 = some 0 :=
  nChk_node rfl rfl k_r0001310 k_r0001311 k_r0001312 k_r0001313 rfl

def t_r0001320 : NTree := NTree.ofString "10000"
theorem k_r0001320 : nChk 8 14 kAi kCi kL t_r0001320 1536 1664 768 896 = some 0 := by
  decide +kernel

def t_r0001321 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001321 : nChk 8 14 kAi kCi kL t_r0001321 1664 1792 768 896 = some 0 := by
  decide +kernel

def t_r0001322 : NTree := NTree.ofString "10000"
theorem k_r0001322 : nChk 8 14 kAi kCi kL t_r0001322 1536 1664 896 1024 = some 0 := by
  decide +kernel

def t_r0001323 : NTree := NTree.ofString "1010000010000"
theorem k_r0001323 : nChk 8 14 kAi kCi kL t_r0001323 1664 1792 896 1024 = some 0 := by
  decide +kernel

def t_r000132 : NTree := .node t_r0001320 t_r0001321 t_r0001322 t_r0001323
theorem k_r000132 : nChk 8 14 kAi kCi kL t_r000132 1536 1792 768 1024 = some 0 :=
  nChk_node rfl rfl k_r0001320 k_r0001321 k_r0001322 k_r0001323 rfl

def t_r0001330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001330 : nChk 8 14 kAi kCi kL t_r0001330 1792 1920 768 896 = some 0 := by
  decide +kernel

def t_r0001331 : NTree := NTree.ofString "110000000"
theorem k_r0001331 : nChk 8 14 kAi kCi kL t_r0001331 1920 2048 768 896 = some 0 := by
  decide +kernel

def t_r0001332 : NTree := NTree.ofString "11000010000100000"
theorem k_r0001332 : nChk 8 14 kAi kCi kL t_r0001332 1792 1920 896 1024 = some 0 := by
  decide +kernel

def t_r0001333 : NTree := NTree.ofString "10000"
theorem k_r0001333 : nChk 8 14 kAi kCi kL t_r0001333 1920 2048 896 1024 = some 0 := by
  decide +kernel

def t_r000133 : NTree := .node t_r0001330 t_r0001331 t_r0001332 t_r0001333
theorem k_r000133 : nChk 8 14 kAi kCi kL t_r000133 1792 2048 768 1024 = some 0 :=
  nChk_node rfl rfl k_r0001330 k_r0001331 k_r0001332 k_r0001333 rfl

def t_r00013 : NTree := .node t_r000130 t_r000131 t_r000132 t_r000133
theorem k_r00013 : nChk 8 14 kAi kCi kL t_r00013 1536 2048 512 1024 = some 0 :=
  nChk_node rfl rfl k_r000130 k_r000131 k_r000132 k_r000133 rfl

end ChargeKernel.Pt900
