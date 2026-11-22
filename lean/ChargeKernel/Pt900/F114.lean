/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022011` (673 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022011000 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r022011000 : nChk 8 14 kAi kCi kL t_r022011000 768 800 6144 6176 = some 261841674618169299069566976 := by
  decide +kernel

def t_r022011001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011001 : nChk 8 14 kAi kCi kL t_r022011001 800 832 6144 6176 = some 130373207121037274464124928 := by
  decide +kernel

def t_r022011002 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r022011002 : nChk 8 14 kAi kCi kL t_r022011002 768 800 6176 6208 = some 253038349645873873302847488 := by
  decide +kernel

def t_r022011003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011003 : nChk 8 14 kAi kCi kL t_r022011003 800 832 6176 6208 = some 118123012359861333814935552 := by
  decide +kernel

def t_r02201100 : NTree := .node t_r022011000 t_r022011001 t_r022011002 t_r022011003
theorem k_r02201100 : nChk 8 14 kAi kCi kL t_r02201100 768 832 6144 6208 = some 763376243744941780651474944 :=
  nChk_node rfl rfl k_r022011000 k_r022011001 k_r022011002 k_r022011003 rfl

def t_r022011010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011010 : nChk 8 14 kAi kCi kL t_r022011010 832 864 6144 6176 = some 0 := by
  decide +kernel

def t_r022011011 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011011 : nChk 8 14 kAi kCi kL t_r022011011 864 896 6144 6176 = some 0 := by
  decide +kernel

def t_r022011012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011012 : nChk 8 14 kAi kCi kL t_r022011012 832 864 6176 6208 = some 0 := by
  decide +kernel

def t_r022011013 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011013 : nChk 8 14 kAi kCi kL t_r022011013 864 896 6176 6208 = some 0 := by
  decide +kernel

def t_r02201101 : NTree := .node t_r022011010 t_r022011011 t_r022011012 t_r022011013
theorem k_r02201101 : nChk 8 14 kAi kCi kL t_r02201101 832 896 6144 6208 = some 0 :=
  nChk_node rfl rfl k_r022011010 k_r022011011 k_r022011012 k_r022011013 rfl

def t_r022011020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r022011020 : nChk 8 14 kAi kCi kL t_r022011020 768 800 6208 6240 = some 244835785662772660408418304 := by
  decide +kernel

def t_r022011021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011021 : nChk 8 14 kAi kCi kL t_r022011021 800 832 6208 6240 = some 105643637267926258758451200 := by
  decide +kernel

def t_r022011022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r022011022 : nChk 8 14 kAi kCi kL t_r022011022 768 800 6240 6272 = some 236398475345629246283317248 := by
  decide +kernel

def t_r022011023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011023 : nChk 8 14 kAi kCi kL t_r022011023 800 832 6240 6272 = some 93584231308010781910499328 := by
  decide +kernel

def t_r02201102 : NTree := .node t_r022011020 t_r022011021 t_r022011022 t_r022011023
theorem k_r02201102 : nChk 8 14 kAi kCi kL t_r02201102 768 832 6208 6272 = some 680462129584338947360686080 :=
  nChk_node rfl rfl k_r022011020 k_r022011021 k_r022011022 k_r022011023 rfl

def t_r022011030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011030 : nChk 8 14 kAi kCi kL t_r022011030 832 864 6208 6240 = some 0 := by
  decide +kernel

def t_r022011031 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011031 : nChk 8 14 kAi kCi kL t_r022011031 864 896 6208 6240 = some 0 := by
  decide +kernel

def t_r022011032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011032 : nChk 8 14 kAi kCi kL t_r022011032 832 864 6240 6272 = some 0 := by
  decide +kernel

def t_r022011033 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011033 : nChk 8 14 kAi kCi kL t_r022011033 864 896 6240 6272 = some 0 := by
  decide +kernel

def t_r02201103 : NTree := .node t_r022011030 t_r022011031 t_r022011032 t_r022011033
theorem k_r02201103 : nChk 8 14 kAi kCi kL t_r02201103 832 896 6208 6272 = some 0 :=
  nChk_node rfl rfl k_r022011030 k_r022011031 k_r022011032 k_r022011033 rfl

def t_r0220110 : NTree := .node t_r02201100 t_r02201101 t_r02201102 t_r02201103
theorem k_r0220110 : nChk 8 14 kAi kCi kL t_r0220110 768 896 6144 6272 = some 1443838373329280728012161024 :=
  nChk_node rfl rfl k_r02201100 k_r02201101 k_r02201102 k_r02201103 rfl

def t_r02201110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201110 : nChk 8 14 kAi kCi kL t_r02201110 896 960 6144 6208 = some 40952179977847835411349504 := by
  decide +kernel

def t_r02201111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201111 : nChk 8 14 kAi kCi kL t_r02201111 960 1024 6144 6208 = some 0 := by
  decide +kernel

def t_r02201112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201112 : nChk 8 14 kAi kCi kL t_r02201112 896 960 6208 6272 = some 7586616646546124036898816 := by
  decide +kernel

def t_r02201113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201113 : nChk 8 14 kAi kCi kL t_r02201113 960 1024 6208 6272 = some 0 := by
  decide +kernel

def t_r0220111 : NTree := .node t_r02201110 t_r02201111 t_r02201112 t_r02201113
theorem k_r0220111 : nChk 8 14 kAi kCi kL t_r0220111 896 1024 6144 6272 = some 48538796624393959448248320 :=
  nChk_node rfl rfl k_r02201110 k_r02201111 k_r02201112 k_r02201113 rfl

def t_r022011200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011200 : nChk 8 14 kAi kCi kL t_r022011200 768 800 6272 6304 = some 319621533411998946193047552 := by
  decide +kernel

def t_r022011201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011201 : nChk 8 14 kAi kCi kL t_r022011201 800 832 6272 6304 = some 82756871261088169133604864 := by
  decide +kernel

def t_r022011202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011202 : nChk 8 14 kAi kCi kL t_r022011202 768 800 6304 6336 = some 310318116358936724722679808 := by
  decide +kernel

def t_r022011203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011203 : nChk 8 14 kAi kCi kL t_r022011203 800 832 6304 6336 = some 72864869062964100930207744 := by
  decide +kernel

def t_r02201120 : NTree := .node t_r022011200 t_r022011201 t_r022011202 t_r022011203
theorem k_r02201120 : nChk 8 14 kAi kCi kL t_r02201120 768 832 6272 6336 = some 785561390094987940979539968 :=
  nChk_node rfl rfl k_r022011200 k_r022011201 k_r022011202 k_r022011203 rfl

def t_r022011210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011210 : nChk 8 14 kAi kCi kL t_r022011210 832 864 6272 6304 = some 0 := by
  decide +kernel

def t_r022011211 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011211 : nChk 8 14 kAi kCi kL t_r022011211 864 896 6272 6304 = some 0 := by
  decide +kernel

def t_r022011212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011212 : nChk 8 14 kAi kCi kL t_r022011212 832 864 6304 6336 = some 0 := by
  decide +kernel

def t_r022011213 : NTree := NTree.ofString "11000010000100000"
theorem k_r022011213 : nChk 8 14 kAi kCi kL t_r022011213 864 896 6304 6336 = some 24257449145492858210353152 := by
  decide +kernel

def t_r02201121 : NTree := .node t_r022011210 t_r022011211 t_r022011212 t_r022011213
theorem k_r02201121 : nChk 8 14 kAi kCi kL t_r02201121 832 896 6272 6336 = some 24257449145492858210353152 :=
  nChk_node rfl rfl k_r022011210 k_r022011211 k_r022011212 k_r022011213 rfl

def t_r022011220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011220 : nChk 8 14 kAi kCi kL t_r022011220 768 800 6336 6368 = some 301631933721663498696523776 := by
  decide +kernel

def t_r022011221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011221 : nChk 8 14 kAi kCi kL t_r022011221 800 832 6336 6368 = some 63745008318391162396213248 := by
  decide +kernel

def t_r022011222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011222 : nChk 8 14 kAi kCi kL t_r022011222 768 800 6368 6400 = some 292770014015646022936559616 := by
  decide +kernel

def t_r022011223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011223 : nChk 8 14 kAi kCi kL t_r022011223 800 832 6368 6400 = some 54947470919725070640218112 := by
  decide +kernel

def t_r02201122 : NTree := .node t_r022011220 t_r022011221 t_r022011222 t_r022011223
theorem k_r02201122 : nChk 8 14 kAi kCi kL t_r02201122 768 832 6336 6400 = some 713094426975425754669514752 :=
  nChk_node rfl rfl k_r022011220 k_r022011221 k_r022011222 k_r022011223 rfl

def t_r022011230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011230 : nChk 8 14 kAi kCi kL t_r022011230 832 864 6336 6368 = some 0 := by
  decide +kernel

def t_r022011231 : NTree := NTree.ofString "1100000100000"
theorem k_r022011231 : nChk 8 14 kAi kCi kL t_r022011231 864 896 6336 6368 = some 45436111484925678981218304 := by
  decide +kernel

def t_r022011232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022011232 : nChk 8 14 kAi kCi kL t_r022011232 832 864 6368 6400 = some 0 := by
  decide +kernel

def t_r022011233 : NTree := NTree.ofString "1100000100000"
theorem k_r022011233 : nChk 8 14 kAi kCi kL t_r022011233 864 896 6368 6400 = some 41940526261127697257201664 := by
  decide +kernel

def t_r02201123 : NTree := .node t_r022011230 t_r022011231 t_r022011232 t_r022011233
theorem k_r02201123 : nChk 8 14 kAi kCi kL t_r02201123 832 896 6336 6400 = some 87376637746053376238419968 :=
  nChk_node rfl rfl k_r022011230 k_r022011231 k_r022011232 k_r022011233 rfl

def t_r0220112 : NTree := .node t_r02201120 t_r02201121 t_r02201122 t_r02201123
theorem k_r0220112 : nChk 8 14 kAi kCi kL t_r0220112 768 896 6272 6400 = some 1610289903961959930097827840 :=
  nChk_node rfl rfl k_r02201120 k_r02201121 k_r02201122 k_r02201123 rfl

def t_r02201130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201130 : nChk 8 14 kAi kCi kL t_r02201130 896 960 6272 6336 = some 0 := by
  decide +kernel

def t_r02201131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201131 : nChk 8 14 kAi kCi kL t_r02201131 960 1024 6272 6336 = some 0 := by
  decide +kernel

def t_r02201132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201132 : nChk 8 14 kAi kCi kL t_r02201132 896 960 6336 6400 = some 0 := by
  decide +kernel

def t_r02201133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201133 : nChk 8 14 kAi kCi kL t_r02201133 960 1024 6336 6400 = some 0 := by
  decide +kernel

def t_r0220113 : NTree := .node t_r02201130 t_r02201131 t_r02201132 t_r02201133
theorem k_r0220113 : nChk 8 14 kAi kCi kL t_r0220113 896 1024 6272 6400 = some 0 :=
  nChk_node rfl rfl k_r02201130 k_r02201131 k_r02201132 k_r02201133 rfl

def t_r022011 : NTree := .node t_r0220110 t_r0220111 t_r0220112 t_r0220113
theorem k_r022011 : nChk 8 14 kAi kCi kL t_r022011 768 1024 6144 6400 = some 3102667073915634617558237184 :=
  nChk_node rfl rfl k_r0220110 k_r0220111 k_r0220112 k_r0220113 rfl

end ChargeKernel.Pt900
