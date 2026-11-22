/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200233` (673 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200233000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233000 : nChk 8 14 kAi kCi kL t_r200233000 768 800 9984 10016 = some 292770014015646022936559616 := by
  decide +kernel

def t_r200233001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233001 : nChk 8 14 kAi kCi kL t_r200233001 800 832 9984 10016 = some 54947470919725070640218112 := by
  decide +kernel

def t_r200233002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233002 : nChk 8 14 kAi kCi kL t_r200233002 768 800 10016 10048 = some 301631933721663498696523776 := by
  decide +kernel

def t_r200233003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233003 : nChk 8 14 kAi kCi kL t_r200233003 800 832 10016 10048 = some 63745008318391162396213248 := by
  decide +kernel

def t_r20023300 : NTree := .node t_r200233000 t_r200233001 t_r200233002 t_r200233003
theorem k_r20023300 : nChk 8 14 kAi kCi kL t_r20023300 768 832 9984 10048 = some 713094426975425754669514752 :=
  nChk_node rfl rfl k_r200233000 k_r200233001 k_r200233002 k_r200233003 rfl

def t_r200233010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233010 : nChk 8 14 kAi kCi kL t_r200233010 832 864 9984 10016 = some 0 := by
  decide +kernel

def t_r200233011 : NTree := NTree.ofString "1100000100000"
theorem k_r200233011 : nChk 8 14 kAi kCi kL t_r200233011 864 896 9984 10016 = some 41940526261127697257201664 := by
  decide +kernel

def t_r200233012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233012 : nChk 8 14 kAi kCi kL t_r200233012 832 864 10016 10048 = some 0 := by
  decide +kernel

def t_r200233013 : NTree := NTree.ofString "1100000100000"
theorem k_r200233013 : nChk 8 14 kAi kCi kL t_r200233013 864 896 10016 10048 = some 45436111484925678981218304 := by
  decide +kernel

def t_r20023301 : NTree := .node t_r200233010 t_r200233011 t_r200233012 t_r200233013
theorem k_r20023301 : nChk 8 14 kAi kCi kL t_r20023301 832 896 9984 10048 = some 87376637746053376238419968 :=
  nChk_node rfl rfl k_r200233010 k_r200233011 k_r200233012 k_r200233013 rfl

def t_r200233020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233020 : nChk 8 14 kAi kCi kL t_r200233020 768 800 10048 10080 = some 310318116358936724722679808 := by
  decide +kernel

def t_r200233021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233021 : nChk 8 14 kAi kCi kL t_r200233021 800 832 10048 10080 = some 72864869062964100930207744 := by
  decide +kernel

def t_r200233022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233022 : nChk 8 14 kAi kCi kL t_r200233022 768 800 10080 10112 = some 319621533411998946193047552 := by
  decide +kernel

def t_r200233023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233023 : nChk 8 14 kAi kCi kL t_r200233023 800 832 10080 10112 = some 82756871261088169133604864 := by
  decide +kernel

def t_r20023302 : NTree := .node t_r200233020 t_r200233021 t_r200233022 t_r200233023
theorem k_r20023302 : nChk 8 14 kAi kCi kL t_r20023302 768 832 10048 10112 = some 785561390094987940979539968 :=
  nChk_node rfl rfl k_r200233020 k_r200233021 k_r200233022 k_r200233023 rfl

def t_r200233030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233030 : nChk 8 14 kAi kCi kL t_r200233030 832 864 10048 10080 = some 0 := by
  decide +kernel

def t_r200233031 : NTree := NTree.ofString "11000001000010000"
theorem k_r200233031 : nChk 8 14 kAi kCi kL t_r200233031 864 896 10048 10080 = some 24257449145492858210353152 := by
  decide +kernel

def t_r200233032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233032 : nChk 8 14 kAi kCi kL t_r200233032 832 864 10080 10112 = some 0 := by
  decide +kernel

def t_r200233033 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233033 : nChk 8 14 kAi kCi kL t_r200233033 864 896 10080 10112 = some 0 := by
  decide +kernel

def t_r20023303 : NTree := .node t_r200233030 t_r200233031 t_r200233032 t_r200233033
theorem k_r20023303 : nChk 8 14 kAi kCi kL t_r20023303 832 896 10048 10112 = some 24257449145492858210353152 :=
  nChk_node rfl rfl k_r200233030 k_r200233031 k_r200233032 k_r200233033 rfl

def t_r2002330 : NTree := .node t_r20023300 t_r20023301 t_r20023302 t_r20023303
theorem k_r2002330 : nChk 8 14 kAi kCi kL t_r2002330 768 896 9984 10112 = some 1610289903961959930097827840 :=
  nChk_node rfl rfl k_r20023300 k_r20023301 k_r20023302 k_r20023303 rfl

def t_r20023310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023310 : nChk 8 14 kAi kCi kL t_r20023310 896 960 9984 10048 = some 0 := by
  decide +kernel

def t_r20023311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023311 : nChk 8 14 kAi kCi kL t_r20023311 960 1024 9984 10048 = some 0 := by
  decide +kernel

def t_r20023312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023312 : nChk 8 14 kAi kCi kL t_r20023312 896 960 10048 10112 = some 0 := by
  decide +kernel

def t_r20023313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023313 : nChk 8 14 kAi kCi kL t_r20023313 960 1024 10048 10112 = some 0 := by
  decide +kernel

def t_r2002331 : NTree := .node t_r20023310 t_r20023311 t_r20023312 t_r20023313
theorem k_r2002331 : nChk 8 14 kAi kCi kL t_r2002331 896 1024 9984 10112 = some 0 :=
  nChk_node rfl rfl k_r20023310 k_r20023311 k_r20023312 k_r20023313 rfl

def t_r200233200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r200233200 : nChk 8 14 kAi kCi kL t_r200233200 768 800 10112 10144 = some 236398475345629246283317248 := by
  decide +kernel

def t_r200233201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233201 : nChk 8 14 kAi kCi kL t_r200233201 800 832 10112 10144 = some 93584231308010781910499328 := by
  decide +kernel

def t_r200233202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r200233202 : nChk 8 14 kAi kCi kL t_r200233202 768 800 10144 10176 = some 244835785662772660408418304 := by
  decide +kernel

def t_r200233203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233203 : nChk 8 14 kAi kCi kL t_r200233203 800 832 10144 10176 = some 105643637267926258758451200 := by
  decide +kernel

def t_r20023320 : NTree := .node t_r200233200 t_r200233201 t_r200233202 t_r200233203
theorem k_r20023320 : nChk 8 14 kAi kCi kL t_r20023320 768 832 10112 10176 = some 680462129584338947360686080 :=
  nChk_node rfl rfl k_r200233200 k_r200233201 k_r200233202 k_r200233203 rfl

def t_r200233210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233210 : nChk 8 14 kAi kCi kL t_r200233210 832 864 10112 10144 = some 0 := by
  decide +kernel

def t_r200233211 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233211 : nChk 8 14 kAi kCi kL t_r200233211 864 896 10112 10144 = some 0 := by
  decide +kernel

def t_r200233212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233212 : nChk 8 14 kAi kCi kL t_r200233212 832 864 10144 10176 = some 0 := by
  decide +kernel

def t_r200233213 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233213 : nChk 8 14 kAi kCi kL t_r200233213 864 896 10144 10176 = some 0 := by
  decide +kernel

def t_r20023321 : NTree := .node t_r200233210 t_r200233211 t_r200233212 t_r200233213
theorem k_r20023321 : nChk 8 14 kAi kCi kL t_r20023321 832 896 10112 10176 = some 0 :=
  nChk_node rfl rfl k_r200233210 k_r200233211 k_r200233212 k_r200233213 rfl

def t_r200233220 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r200233220 : nChk 8 14 kAi kCi kL t_r200233220 768 800 10176 10208 = some 253038349645873873302847488 := by
  decide +kernel

def t_r200233221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233221 : nChk 8 14 kAi kCi kL t_r200233221 800 832 10176 10208 = some 118123012359861333814935552 := by
  decide +kernel

def t_r200233222 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r200233222 : nChk 8 14 kAi kCi kL t_r200233222 768 800 10208 10240 = some 261841674618169299069566976 := by
  decide +kernel

def t_r200233223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233223 : nChk 8 14 kAi kCi kL t_r200233223 800 832 10208 10240 = some 130373207121037274464124928 := by
  decide +kernel

def t_r20023322 : NTree := .node t_r200233220 t_r200233221 t_r200233222 t_r200233223
theorem k_r20023322 : nChk 8 14 kAi kCi kL t_r20023322 768 832 10176 10240 = some 763376243744941780651474944 :=
  nChk_node rfl rfl k_r200233220 k_r200233221 k_r200233222 k_r200233223 rfl

def t_r200233230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233230 : nChk 8 14 kAi kCi kL t_r200233230 832 864 10176 10208 = some 0 := by
  decide +kernel

def t_r200233231 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233231 : nChk 8 14 kAi kCi kL t_r200233231 864 896 10176 10208 = some 0 := by
  decide +kernel

def t_r200233232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233232 : nChk 8 14 kAi kCi kL t_r200233232 832 864 10208 10240 = some 0 := by
  decide +kernel

def t_r200233233 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200233233 : nChk 8 14 kAi kCi kL t_r200233233 864 896 10208 10240 = some 0 := by
  decide +kernel

def t_r20023323 : NTree := .node t_r200233230 t_r200233231 t_r200233232 t_r200233233
theorem k_r20023323 : nChk 8 14 kAi kCi kL t_r20023323 832 896 10176 10240 = some 0 :=
  nChk_node rfl rfl k_r200233230 k_r200233231 k_r200233232 k_r200233233 rfl

def t_r2002332 : NTree := .node t_r20023320 t_r20023321 t_r20023322 t_r20023323
theorem k_r2002332 : nChk 8 14 kAi kCi kL t_r2002332 768 896 10112 10240 = some 1443838373329280728012161024 :=
  nChk_node rfl rfl k_r20023320 k_r20023321 k_r20023322 k_r20023323 rfl

def t_r20023330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023330 : nChk 8 14 kAi kCi kL t_r20023330 896 960 10112 10176 = some 7586616646546124036898816 := by
  decide +kernel

def t_r20023331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023331 : nChk 8 14 kAi kCi kL t_r20023331 960 1024 10112 10176 = some 0 := by
  decide +kernel

def t_r20023332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023332 : nChk 8 14 kAi kCi kL t_r20023332 896 960 10176 10240 = some 40952179977847835411349504 := by
  decide +kernel

def t_r20023333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023333 : nChk 8 14 kAi kCi kL t_r20023333 960 1024 10176 10240 = some 0 := by
  decide +kernel

def t_r2002333 : NTree := .node t_r20023330 t_r20023331 t_r20023332 t_r20023333
theorem k_r2002333 : nChk 8 14 kAi kCi kL t_r2002333 896 1024 10112 10240 = some 48538796624393959448248320 :=
  nChk_node rfl rfl k_r20023330 k_r20023331 k_r20023332 k_r20023333 rfl

def t_r200233 : NTree := .node t_r2002330 t_r2002331 t_r2002332 t_r2002333
theorem k_r200233 : nChk 8 14 kAi kCi kL t_r200233 768 1024 9984 10240 = some 3102667073915634617558237184 :=
  nChk_node rfl rfl k_r2002330 k_r2002331 k_r2002332 k_r2002333 rfl

end ChargeKernel.Pt900
