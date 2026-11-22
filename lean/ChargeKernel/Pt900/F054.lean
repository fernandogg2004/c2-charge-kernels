/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `0021` (544 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0021000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021000 : nChk 8 14 kAi kCi kL t_r0021000 1024 1152 2048 2176 = some 0 := by
  decide +kernel

def t_r0021001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021001 : nChk 8 14 kAi kCi kL t_r0021001 1152 1280 2048 2176 = some 0 := by
  decide +kernel

def t_r0021002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021002 : nChk 8 14 kAi kCi kL t_r0021002 1024 1152 2176 2304 = some 0 := by
  decide +kernel

def t_r0021003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021003 : nChk 8 14 kAi kCi kL t_r0021003 1152 1280 2176 2304 = some 0 := by
  decide +kernel

def t_r002100 : NTree := .node t_r0021000 t_r0021001 t_r0021002 t_r0021003
theorem k_r002100 : nChk 8 14 kAi kCi kL t_r002100 1024 1280 2048 2304 = some 0 :=
  nChk_node rfl rfl k_r0021000 k_r0021001 k_r0021002 k_r0021003 rfl

def t_r0021010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021010 : nChk 8 14 kAi kCi kL t_r0021010 1280 1408 2048 2176 = some 0 := by
  decide +kernel

def t_r0021011 : NTree := NTree.ofString "1100000100000"
theorem k_r0021011 : nChk 8 14 kAi kCi kL t_r0021011 1408 1536 2048 2176 = some 0 := by
  decide +kernel

def t_r0021012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021012 : nChk 8 14 kAi kCi kL t_r0021012 1280 1408 2176 2304 = some 0 := by
  decide +kernel

def t_r0021013 : NTree := NTree.ofString "1100000100000"
theorem k_r0021013 : nChk 8 14 kAi kCi kL t_r0021013 1408 1536 2176 2304 = some 0 := by
  decide +kernel

def t_r002101 : NTree := .node t_r0021010 t_r0021011 t_r0021012 t_r0021013
theorem k_r002101 : nChk 8 14 kAi kCi kL t_r002101 1280 1536 2048 2304 = some 0 :=
  nChk_node rfl rfl k_r0021010 k_r0021011 k_r0021012 k_r0021013 rfl

def t_r0021020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021020 : nChk 8 14 kAi kCi kL t_r0021020 1024 1152 2304 2432 = some 0 := by
  decide +kernel

def t_r0021021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021021 : nChk 8 14 kAi kCi kL t_r0021021 1152 1280 2304 2432 = some 0 := by
  decide +kernel

def t_r0021022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021022 : nChk 8 14 kAi kCi kL t_r0021022 1024 1152 2432 2560 = some 0 := by
  decide +kernel

def t_r0021023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021023 : nChk 8 14 kAi kCi kL t_r0021023 1152 1280 2432 2560 = some 0 := by
  decide +kernel

def t_r002102 : NTree := .node t_r0021020 t_r0021021 t_r0021022 t_r0021023
theorem k_r002102 : nChk 8 14 kAi kCi kL t_r002102 1024 1280 2304 2560 = some 0 :=
  nChk_node rfl rfl k_r0021020 k_r0021021 k_r0021022 k_r0021023 rfl

def t_r0021030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021030 : nChk 8 14 kAi kCi kL t_r0021030 1280 1408 2304 2432 = some 0 := by
  decide +kernel

def t_r0021031 : NTree := NTree.ofString "1100000100000"
theorem k_r0021031 : nChk 8 14 kAi kCi kL t_r0021031 1408 1536 2304 2432 = some 0 := by
  decide +kernel

def t_r0021032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021032 : nChk 8 14 kAi kCi kL t_r0021032 1280 1408 2432 2560 = some 0 := by
  decide +kernel

def t_r0021033 : NTree := NTree.ofString "1100000100000"
theorem k_r0021033 : nChk 8 14 kAi kCi kL t_r0021033 1408 1536 2432 2560 = some 0 := by
  decide +kernel

def t_r002103 : NTree := .node t_r0021030 t_r0021031 t_r0021032 t_r0021033
theorem k_r002103 : nChk 8 14 kAi kCi kL t_r002103 1280 1536 2304 2560 = some 0 :=
  nChk_node rfl rfl k_r0021030 k_r0021031 k_r0021032 k_r0021033 rfl

def t_r00210 : NTree := .node t_r002100 t_r002101 t_r002102 t_r002103
theorem k_r00210 : nChk 8 14 kAi kCi kL t_r00210 1024 1536 2048 2560 = some 0 :=
  nChk_node rfl rfl k_r002100 k_r002101 k_r002102 k_r002103 rfl

def t_r002110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002110 : nChk 8 14 kAi kCi kL t_r002110 1536 1792 2048 2304 = some 0 := by
  decide +kernel

def t_r002111 : NTree := NTree.ofString "11000010000100000"
theorem k_r002111 : nChk 8 14 kAi kCi kL t_r002111 1792 2048 2048 2304 = some 0 := by
  decide +kernel

def t_r002112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002112 : nChk 8 14 kAi kCi kL t_r002112 1536 1792 2304 2560 = some 0 := by
  decide +kernel

def t_r002113 : NTree := NTree.ofString "1100000100000"
theorem k_r002113 : nChk 8 14 kAi kCi kL t_r002113 1792 2048 2304 2560 = some 0 := by
  decide +kernel

def t_r00211 : NTree := .node t_r002110 t_r002111 t_r002112 t_r002113
theorem k_r00211 : nChk 8 14 kAi kCi kL t_r00211 1536 2048 2048 2560 = some 0 :=
  nChk_node rfl rfl k_r002110 k_r002111 k_r002112 k_r002113 rfl

def t_r0021200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021200 : nChk 8 14 kAi kCi kL t_r0021200 1024 1152 2560 2688 = some 0 := by
  decide +kernel

def t_r0021201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021201 : nChk 8 14 kAi kCi kL t_r0021201 1152 1280 2560 2688 = some 0 := by
  decide +kernel

def t_r0021202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021202 : nChk 8 14 kAi kCi kL t_r0021202 1024 1152 2688 2816 = some 0 := by
  decide +kernel

def t_r0021203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021203 : nChk 8 14 kAi kCi kL t_r0021203 1152 1280 2688 2816 = some 0 := by
  decide +kernel

def t_r002120 : NTree := .node t_r0021200 t_r0021201 t_r0021202 t_r0021203
theorem k_r002120 : nChk 8 14 kAi kCi kL t_r002120 1024 1280 2560 2816 = some 0 :=
  nChk_node rfl rfl k_r0021200 k_r0021201 k_r0021202 k_r0021203 rfl

def t_r0021210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021210 : nChk 8 14 kAi kCi kL t_r0021210 1280 1408 2560 2688 = some 0 := by
  decide +kernel

def t_r0021211 : NTree := NTree.ofString "1100000100000"
theorem k_r0021211 : nChk 8 14 kAi kCi kL t_r0021211 1408 1536 2560 2688 = some 0 := by
  decide +kernel

def t_r0021212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021212 : nChk 8 14 kAi kCi kL t_r0021212 1280 1408 2688 2816 = some 0 := by
  decide +kernel

def t_r0021213 : NTree := NTree.ofString "110000000"
theorem k_r0021213 : nChk 8 14 kAi kCi kL t_r0021213 1408 1536 2688 2816 = some 0 := by
  decide +kernel

def t_r002121 : NTree := .node t_r0021210 t_r0021211 t_r0021212 t_r0021213
theorem k_r002121 : nChk 8 14 kAi kCi kL t_r002121 1280 1536 2560 2816 = some 0 :=
  nChk_node rfl rfl k_r0021210 k_r0021211 k_r0021212 k_r0021213 rfl

def t_r0021220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021220 : nChk 8 14 kAi kCi kL t_r0021220 1024 1152 2816 2944 = some 0 := by
  decide +kernel

def t_r0021221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021221 : nChk 8 14 kAi kCi kL t_r0021221 1152 1280 2816 2944 = some 0 := by
  decide +kernel

def t_r0021222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021222 : nChk 8 14 kAi kCi kL t_r0021222 1024 1152 2944 3072 = some 0 := by
  decide +kernel

def t_r0021223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021223 : nChk 8 14 kAi kCi kL t_r0021223 1152 1280 2944 3072 = some 0 := by
  decide +kernel

def t_r002122 : NTree := .node t_r0021220 t_r0021221 t_r0021222 t_r0021223
theorem k_r002122 : nChk 8 14 kAi kCi kL t_r002122 1024 1280 2816 3072 = some 0 :=
  nChk_node rfl rfl k_r0021220 k_r0021221 k_r0021222 k_r0021223 rfl

def t_r0021230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021230 : nChk 8 14 kAi kCi kL t_r0021230 1280 1408 2816 2944 = some 0 := by
  decide +kernel

def t_r0021231 : NTree := NTree.ofString "10000"
theorem k_r0021231 : nChk 8 14 kAi kCi kL t_r0021231 1408 1536 2816 2944 = some 0 := by
  decide +kernel

def t_r0021232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0021232 : nChk 8 14 kAi kCi kL t_r0021232 1280 1408 2944 3072 = some 0 := by
  decide +kernel

def t_r0021233 : NTree := NTree.ofString "10000"
theorem k_r0021233 : nChk 8 14 kAi kCi kL t_r0021233 1408 1536 2944 3072 = some 0 := by
  decide +kernel

def t_r002123 : NTree := .node t_r0021230 t_r0021231 t_r0021232 t_r0021233
theorem k_r002123 : nChk 8 14 kAi kCi kL t_r002123 1280 1536 2816 3072 = some 0 :=
  nChk_node rfl rfl k_r0021230 k_r0021231 k_r0021232 k_r0021233 rfl

def t_r00212 : NTree := .node t_r002120 t_r002121 t_r002122 t_r002123
theorem k_r00212 : nChk 8 14 kAi kCi kL t_r00212 1024 1536 2560 3072 = some 0 :=
  nChk_node rfl rfl k_r002120 k_r002121 k_r002122 k_r002123 rfl

def t_r002130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002130 : nChk 8 14 kAi kCi kL t_r002130 1536 1792 2560 2816 = some 0 := by
  decide +kernel

def t_r002131 : NTree := NTree.ofString "10000"
theorem k_r002131 : nChk 8 14 kAi kCi kL t_r002131 1792 2048 2560 2816 = some 0 := by
  decide +kernel

def t_r002132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r002132 : nChk 8 14 kAi kCi kL t_r002132 1536 1792 2816 3072 = some 0 := by
  decide +kernel

def t_r002133 : NTree := NTree.ofString "10000"
theorem k_r002133 : nChk 8 14 kAi kCi kL t_r002133 1792 2048 2816 3072 = some 0 := by
  decide +kernel

def t_r00213 : NTree := .node t_r002130 t_r002131 t_r002132 t_r002133
theorem k_r00213 : nChk 8 14 kAi kCi kL t_r00213 1536 2048 2560 3072 = some 0 :=
  nChk_node rfl rfl k_r002130 k_r002131 k_r002132 k_r002133 rfl

def t_r0021 : NTree := .node t_r00210 t_r00211 t_r00212 t_r00213
theorem k_r0021 : nChk 8 14 kAi kCi kL t_r0021 1024 2048 2048 3072 = some 0 :=
  nChk_node rfl rfl k_r00210 k_r00211 k_r00212 k_r00213 rfl

end ChargeKernel.Pt900
