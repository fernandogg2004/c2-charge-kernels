/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `222031` (232 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r222031000 : NTree := NTree.ofString "11100000100000100001000010000"
theorem k_r222031000 : nChk 8 14 kAi kCi kL t_r222031000 768 800 14848 14880 = some 198966150242273312693551104 := by
  decide +kernel

def t_r222031001 : NTree := NTree.ofString "1100000100000"
theorem k_r222031001 : nChk 8 14 kAi kCi kL t_r222031001 800 832 14848 14880 = some 0 := by
  decide +kernel

def t_r222031002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031002 : nChk 8 14 kAi kCi kL t_r222031002 768 800 14880 14912 = some 199359448733040449654095872 := by
  decide +kernel

def t_r222031003 : NTree := NTree.ofString "1100000100000"
theorem k_r222031003 : nChk 8 14 kAi kCi kL t_r222031003 800 832 14880 14912 = some 0 := by
  decide +kernel

def t_r22203100 : NTree := .node t_r222031000 t_r222031001 t_r222031002 t_r222031003
theorem k_r22203100 : nChk 8 14 kAi kCi kL t_r22203100 768 832 14848 14912 = some 398325598975313762347646976 :=
  nChk_node rfl rfl k_r222031000 k_r222031001 k_r222031002 k_r222031003 rfl

def t_r22203101 : NTree := NTree.ofString "110000000"
theorem k_r22203101 : nChk 8 14 kAi kCi kL t_r22203101 832 896 14848 14912 = some 0 := by
  decide +kernel

def t_r222031020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031020 : nChk 8 14 kAi kCi kL t_r222031020 768 800 14912 14944 = some 158281911672054305808973824 := by
  decide +kernel

def t_r222031021 : NTree := NTree.ofString "1100000100000"
theorem k_r222031021 : nChk 8 14 kAi kCi kL t_r222031021 800 832 14912 14944 = some 0 := by
  decide +kernel

def t_r222031022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031022 : nChk 8 14 kAi kCi kL t_r222031022 768 800 14944 14976 = some 113646600585138904800165888 := by
  decide +kernel

def t_r222031023 : NTree := NTree.ofString "1100000100000"
theorem k_r222031023 : nChk 8 14 kAi kCi kL t_r222031023 800 832 14944 14976 = some 0 := by
  decide +kernel

def t_r22203102 : NTree := .node t_r222031020 t_r222031021 t_r222031022 t_r222031023
theorem k_r22203102 : nChk 8 14 kAi kCi kL t_r22203102 768 832 14912 14976 = some 271928512257193210609139712 :=
  nChk_node rfl rfl k_r222031020 k_r222031021 k_r222031022 k_r222031023 rfl

def t_r22203103 : NTree := NTree.ofString "10000"
theorem k_r22203103 : nChk 8 14 kAi kCi kL t_r22203103 832 896 14912 14976 = some 0 := by
  decide +kernel

def t_r2220310 : NTree := .node t_r22203100 t_r22203101 t_r22203102 t_r22203103
theorem k_r2220310 : nChk 8 14 kAi kCi kL t_r2220310 768 896 14848 14976 = some 670254111232506972956786688 :=
  nChk_node rfl rfl k_r22203100 k_r22203101 k_r22203102 k_r22203103 rfl

def t_r2220311 : NTree := NTree.ofString "1010000010000"
theorem k_r2220311 : nChk 8 14 kAi kCi kL t_r2220311 896 1024 14848 14976 = some 0 := by
  decide +kernel

def t_r222031200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031200 : nChk 8 14 kAi kCi kL t_r222031200 768 800 14976 15008 = some 79297202712692828361719808 := by
  decide +kernel

def t_r222031201 : NTree := NTree.ofString "110000000"
theorem k_r222031201 : nChk 8 14 kAi kCi kL t_r222031201 800 832 14976 15008 = some 18687623387206307851272192 := by
  decide +kernel

def t_r222031202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031202 : nChk 8 14 kAi kCi kL t_r222031202 768 800 15008 15040 = some 49482185778436790846226432 := by
  decide +kernel

def t_r222031203 : NTree := NTree.ofString "10000"
theorem k_r222031203 : nChk 8 14 kAi kCi kL t_r222031203 800 832 15008 15040 = some 1656040020085834348756992 := by
  decide +kernel

def t_r22203120 : NTree := .node t_r222031200 t_r222031201 t_r222031202 t_r222031203
theorem k_r22203120 : nChk 8 14 kAi kCi kL t_r22203120 768 832 14976 15040 = some 149123051898421761407975424 :=
  nChk_node rfl rfl k_r222031200 k_r222031201 k_r222031202 k_r222031203 rfl

def t_r22203121 : NTree := NTree.ofString "10000"
theorem k_r22203121 : nChk 8 14 kAi kCi kL t_r22203121 832 896 14976 15040 = some 0 := by
  decide +kernel

def t_r222031220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031220 : nChk 8 14 kAi kCi kL t_r222031220 768 800 15040 15072 = some 56325977621580514703966208 := by
  decide +kernel

def t_r222031221 : NTree := NTree.ofString "10000"
theorem k_r222031221 : nChk 8 14 kAi kCi kL t_r222031221 800 832 15040 15072 = some 0 := by
  decide +kernel

def t_r222031222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222031222 : nChk 8 14 kAi kCi kL t_r222031222 768 800 15072 15104 = some 82889871403154088036139008 := by
  decide +kernel

def t_r222031223 : NTree := NTree.ofString "10000"
theorem k_r222031223 : nChk 8 14 kAi kCi kL t_r222031223 800 832 15072 15104 = some 0 := by
  decide +kernel

def t_r22203122 : NTree := .node t_r222031220 t_r222031221 t_r222031222 t_r222031223
theorem k_r22203122 : nChk 8 14 kAi kCi kL t_r22203122 768 832 15040 15104 = some 139215849024734602740105216 :=
  nChk_node rfl rfl k_r222031220 k_r222031221 k_r222031222 k_r222031223 rfl

def t_r22203123 : NTree := NTree.ofString "10000"
theorem k_r22203123 : nChk 8 14 kAi kCi kL t_r22203123 832 896 15040 15104 = some 0 := by
  decide +kernel

def t_r2220312 : NTree := .node t_r22203120 t_r22203121 t_r22203122 t_r22203123
theorem k_r2220312 : nChk 8 14 kAi kCi kL t_r2220312 768 896 14976 15104 = some 288338900923156364148080640 :=
  nChk_node rfl rfl k_r22203120 k_r22203121 k_r22203122 k_r22203123 rfl

def t_r2220313 : NTree := NTree.ofString "1010000010000"
theorem k_r2220313 : nChk 8 14 kAi kCi kL t_r2220313 896 1024 14976 15104 = some 0 := by
  decide +kernel

def t_r222031 : NTree := .node t_r2220310 t_r2220311 t_r2220312 t_r2220313
theorem k_r222031 : nChk 8 14 kAi kCi kL t_r222031 768 1024 14848 15104 = some 958593012155663337104867328 :=
  nChk_node rfl rfl k_r2220310 k_r2220311 k_r2220312 k_r2220313 rfl

end ChargeKernel.Pt900
