/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `000213` (232 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r000213000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213000 : nChk 8 14 kAi kCi kL t_r000213000 768 800 1280 1312 = some 82889871403154088036139008 := by
  decide +kernel

def t_r000213001 : NTree := NTree.ofString "10000"
theorem k_r000213001 : nChk 8 14 kAi kCi kL t_r000213001 800 832 1280 1312 = some 0 := by
  decide +kernel

def t_r000213002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213002 : nChk 8 14 kAi kCi kL t_r000213002 768 800 1312 1344 = some 56325977621580514703966208 := by
  decide +kernel

def t_r000213003 : NTree := NTree.ofString "10000"
theorem k_r000213003 : nChk 8 14 kAi kCi kL t_r000213003 800 832 1312 1344 = some 0 := by
  decide +kernel

def t_r00021300 : NTree := .node t_r000213000 t_r000213001 t_r000213002 t_r000213003
theorem k_r00021300 : nChk 8 14 kAi kCi kL t_r00021300 768 832 1280 1344 = some 139215849024734602740105216 :=
  nChk_node rfl rfl k_r000213000 k_r000213001 k_r000213002 k_r000213003 rfl

def t_r00021301 : NTree := NTree.ofString "10000"
theorem k_r00021301 : nChk 8 14 kAi kCi kL t_r00021301 832 896 1280 1344 = some 0 := by
  decide +kernel

def t_r000213020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213020 : nChk 8 14 kAi kCi kL t_r000213020 768 800 1344 1376 = some 49482185778436790846226432 := by
  decide +kernel

def t_r000213021 : NTree := NTree.ofString "10000"
theorem k_r000213021 : nChk 8 14 kAi kCi kL t_r000213021 800 832 1344 1376 = some 1656040020085834348756992 := by
  decide +kernel

def t_r000213022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213022 : nChk 8 14 kAi kCi kL t_r000213022 768 800 1376 1408 = some 79297202712692828361719808 := by
  decide +kernel

def t_r000213023 : NTree := NTree.ofString "100100000"
theorem k_r000213023 : nChk 8 14 kAi kCi kL t_r000213023 800 832 1376 1408 = some 18687623387206307851272192 := by
  decide +kernel

def t_r00021302 : NTree := .node t_r000213020 t_r000213021 t_r000213022 t_r000213023
theorem k_r00021302 : nChk 8 14 kAi kCi kL t_r00021302 768 832 1344 1408 = some 149123051898421761407975424 :=
  nChk_node rfl rfl k_r000213020 k_r000213021 k_r000213022 k_r000213023 rfl

def t_r00021303 : NTree := NTree.ofString "10000"
theorem k_r00021303 : nChk 8 14 kAi kCi kL t_r00021303 832 896 1344 1408 = some 0 := by
  decide +kernel

def t_r0002130 : NTree := .node t_r00021300 t_r00021301 t_r00021302 t_r00021303
theorem k_r0002130 : nChk 8 14 kAi kCi kL t_r0002130 768 896 1280 1408 = some 288338900923156364148080640 :=
  nChk_node rfl rfl k_r00021300 k_r00021301 k_r00021302 k_r00021303 rfl

def t_r0002131 : NTree := NTree.ofString "1010000010000"
theorem k_r0002131 : nChk 8 14 kAi kCi kL t_r0002131 896 1024 1280 1408 = some 0 := by
  decide +kernel

def t_r000213200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213200 : nChk 8 14 kAi kCi kL t_r000213200 768 800 1408 1440 = some 113646600585138904800165888 := by
  decide +kernel

def t_r000213201 : NTree := NTree.ofString "1100000100000"
theorem k_r000213201 : nChk 8 14 kAi kCi kL t_r000213201 800 832 1408 1440 = some 0 := by
  decide +kernel

def t_r000213202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213202 : nChk 8 14 kAi kCi kL t_r000213202 768 800 1440 1472 = some 158281911672054305808973824 := by
  decide +kernel

def t_r000213203 : NTree := NTree.ofString "1100000100000"
theorem k_r000213203 : nChk 8 14 kAi kCi kL t_r000213203 800 832 1440 1472 = some 0 := by
  decide +kernel

def t_r00021320 : NTree := .node t_r000213200 t_r000213201 t_r000213202 t_r000213203
theorem k_r00021320 : nChk 8 14 kAi kCi kL t_r00021320 768 832 1408 1472 = some 271928512257193210609139712 :=
  nChk_node rfl rfl k_r000213200 k_r000213201 k_r000213202 k_r000213203 rfl

def t_r00021321 : NTree := NTree.ofString "10000"
theorem k_r00021321 : nChk 8 14 kAi kCi kL t_r00021321 832 896 1408 1472 = some 0 := by
  decide +kernel

def t_r000213220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000213220 : nChk 8 14 kAi kCi kL t_r000213220 768 800 1472 1504 = some 199359448733040449654095872 := by
  decide +kernel

def t_r000213221 : NTree := NTree.ofString "1100000100000"
theorem k_r000213221 : nChk 8 14 kAi kCi kL t_r000213221 800 832 1472 1504 = some 0 := by
  decide +kernel

def t_r000213222 : NTree := NTree.ofString "11000010000110000010000010000"
theorem k_r000213222 : nChk 8 14 kAi kCi kL t_r000213222 768 800 1504 1536 = some 198966150242273312693551104 := by
  decide +kernel

def t_r000213223 : NTree := NTree.ofString "1100000100000"
theorem k_r000213223 : nChk 8 14 kAi kCi kL t_r000213223 800 832 1504 1536 = some 0 := by
  decide +kernel

def t_r00021322 : NTree := .node t_r000213220 t_r000213221 t_r000213222 t_r000213223
theorem k_r00021322 : nChk 8 14 kAi kCi kL t_r00021322 768 832 1472 1536 = some 398325598975313762347646976 :=
  nChk_node rfl rfl k_r000213220 k_r000213221 k_r000213222 k_r000213223 rfl

def t_r00021323 : NTree := NTree.ofString "100100000"
theorem k_r00021323 : nChk 8 14 kAi kCi kL t_r00021323 832 896 1472 1536 = some 0 := by
  decide +kernel

def t_r0002132 : NTree := .node t_r00021320 t_r00021321 t_r00021322 t_r00021323
theorem k_r0002132 : nChk 8 14 kAi kCi kL t_r0002132 768 896 1408 1536 = some 670254111232506972956786688 :=
  nChk_node rfl rfl k_r00021320 k_r00021321 k_r00021322 k_r00021323 rfl

def t_r0002133 : NTree := NTree.ofString "1010000010000"
theorem k_r0002133 : nChk 8 14 kAi kCi kL t_r0002133 896 1024 1408 1536 = some 0 := by
  decide +kernel

def t_r000213 : NTree := .node t_r0002130 t_r0002131 t_r0002132 t_r0002133
theorem k_r000213 : nChk 8 14 kAi kCi kL t_r000213 768 1024 1280 1536 = some 958593012155663337104867328 :=
  nChk_node rfl rfl k_r0002130 k_r0002131 k_r0002132 k_r0002133 rfl

end ChargeKernel.Pt900
