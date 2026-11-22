/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022013` (592 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022013000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013000 : nChk 8 14 kAi kCi kL t_r022013000 768 800 6400 6432 = some 282460244567417771998052352 := by
  decide +kernel

def t_r022013001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013001 : nChk 8 14 kAi kCi kL t_r022013001 800 832 6400 6432 = some 48858085012526319758475264 := by
  decide +kernel

def t_r022013002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013002 : nChk 8 14 kAi kCi kL t_r022013002 768 800 6432 6464 = some 271929943807399563613962240 := by
  decide +kernel

def t_r022013003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013003 : nChk 8 14 kAi kCi kL t_r022013003 800 832 6432 6464 = some 42293336076193682266521600 := by
  decide +kernel

def t_r02201300 : NTree := .node t_r022013000 t_r022013001 t_r022013002 t_r022013003
theorem k_r02201300 : nChk 8 14 kAi kCi kL t_r02201300 768 832 6400 6464 = some 645541609463537337637011456 :=
  nChk_node rfl rfl k_r022013000 k_r022013001 k_r022013002 k_r022013003 rfl

def t_r022013010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013010 : nChk 8 14 kAi kCi kL t_r022013010 832 864 6400 6432 = some 0 := by
  decide +kernel

def t_r022013011 : NTree := NTree.ofString "1100000100000"
theorem k_r022013011 : nChk 8 14 kAi kCi kL t_r022013011 864 896 6400 6432 = some 41497356925699692485935104 := by
  decide +kernel

def t_r022013012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013012 : nChk 8 14 kAi kCi kL t_r022013012 832 864 6432 6464 = some 0 := by
  decide +kernel

def t_r022013013 : NTree := NTree.ofString "1100000100000"
theorem k_r022013013 : nChk 8 14 kAi kCi kL t_r022013013 864 896 6432 6464 = some 40547575866748929671430144 := by
  decide +kernel

def t_r02201301 : NTree := .node t_r022013010 t_r022013011 t_r022013012 t_r022013013
theorem k_r02201301 : nChk 8 14 kAi kCi kL t_r02201301 832 896 6400 6464 = some 82044932792448622157365248 :=
  nChk_node rfl rfl k_r022013010 k_r022013011 k_r022013012 k_r022013013 rfl

def t_r022013020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013020 : nChk 8 14 kAi kCi kL t_r022013020 768 800 6464 6496 = some 261812764366095544051826688 := by
  decide +kernel

def t_r022013021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013021 : nChk 8 14 kAi kCi kL t_r022013021 800 832 6464 6496 = some 37039811954795417123684352 := by
  decide +kernel

def t_r022013022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013022 : nChk 8 14 kAi kCi kL t_r022013022 768 800 6496 6528 = some 250193091350977200210837504 := by
  decide +kernel

def t_r022013023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013023 : nChk 8 14 kAi kCi kL t_r022013023 800 832 6496 6528 = some 32066804606236690124636160 := by
  decide +kernel

def t_r02201302 : NTree := .node t_r022013020 t_r022013021 t_r022013022 t_r022013023
theorem k_r02201302 : nChk 8 14 kAi kCi kL t_r02201302 768 832 6464 6528 = some 581112472278104851510984704 :=
  nChk_node rfl rfl k_r022013020 k_r022013021 k_r022013022 k_r022013023 rfl

def t_r022013030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013030 : nChk 8 14 kAi kCi kL t_r022013030 832 864 6464 6496 = some 0 := by
  decide +kernel

def t_r022013031 : NTree := NTree.ofString "1100000100000"
theorem k_r022013031 : nChk 8 14 kAi kCi kL t_r022013031 864 896 6464 6496 = some 39030594176904557487980544 := by
  decide +kernel

def t_r022013032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013032 : nChk 8 14 kAi kCi kL t_r022013032 832 864 6496 6528 = some 0 := by
  decide +kernel

def t_r022013033 : NTree := NTree.ofString "1100000100000"
theorem k_r022013033 : nChk 8 14 kAi kCi kL t_r022013033 864 896 6496 6528 = some 36951928585566119698366464 := by
  decide +kernel

def t_r02201303 : NTree := .node t_r022013030 t_r022013031 t_r022013032 t_r022013033
theorem k_r02201303 : nChk 8 14 kAi kCi kL t_r02201303 832 896 6464 6528 = some 75982522762470677186347008 :=
  nChk_node rfl rfl k_r022013030 k_r022013031 k_r022013032 k_r022013033 rfl

def t_r0220130 : NTree := .node t_r02201300 t_r02201301 t_r02201302 t_r02201303
theorem k_r0220130 : nChk 8 14 kAi kCi kL t_r0220130 768 896 6400 6528 = some 1384681537296561488491708416 :=
  nChk_node rfl rfl k_r02201300 k_r02201301 k_r02201302 k_r02201303 rfl

def t_r02201310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201310 : nChk 8 14 kAi kCi kL t_r02201310 896 960 6400 6464 = some 0 := by
  decide +kernel

def t_r02201311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201311 : nChk 8 14 kAi kCi kL t_r02201311 960 1024 6400 6464 = some 0 := by
  decide +kernel

def t_r02201312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201312 : nChk 8 14 kAi kCi kL t_r02201312 896 960 6464 6528 = some 0 := by
  decide +kernel

def t_r02201313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201313 : nChk 8 14 kAi kCi kL t_r02201313 960 1024 6464 6528 = some 0 := by
  decide +kernel

def t_r0220131 : NTree := .node t_r02201310 t_r02201311 t_r02201312 t_r02201313
theorem k_r0220131 : nChk 8 14 kAi kCi kL t_r0220131 896 1024 6400 6528 = some 0 :=
  nChk_node rfl rfl k_r02201310 k_r02201311 k_r02201312 k_r02201313 rfl

def t_r022013200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013200 : nChk 8 14 kAi kCi kL t_r022013200 768 800 6528 6560 = some 237883088336389816637718528 := by
  decide +kernel

def t_r022013201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013201 : nChk 8 14 kAi kCi kL t_r022013201 800 832 6528 6560 = some 28504726093826787769319424 := by
  decide +kernel

def t_r022013202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013202 : nChk 8 14 kAi kCi kL t_r022013202 768 800 6560 6592 = some 226151983332152196917624832 := by
  decide +kernel

def t_r022013203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013203 : nChk 8 14 kAi kCi kL t_r022013203 800 832 6560 6592 = some 25252383996869179487551488 := by
  decide +kernel

def t_r02201320 : NTree := .node t_r022013200 t_r022013201 t_r022013202 t_r022013203
theorem k_r02201320 : nChk 8 14 kAi kCi kL t_r02201320 768 832 6528 6592 = some 517792181759237980812214272 :=
  nChk_node rfl rfl k_r022013200 k_r022013201 k_r022013202 k_r022013203 rfl

def t_r022013210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013210 : nChk 8 14 kAi kCi kL t_r022013210 832 864 6528 6560 = some 0 := by
  decide +kernel

def t_r022013211 : NTree := NTree.ofString "1100000100000"
theorem k_r022013211 : nChk 8 14 kAi kCi kL t_r022013211 864 896 6528 6560 = some 34315764197795339157110784 := by
  decide +kernel

def t_r022013212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013212 : nChk 8 14 kAi kCi kL t_r022013212 832 864 6560 6592 = some 0 := by
  decide +kernel

def t_r022013213 : NTree := NTree.ofString "1100000100000"
theorem k_r022013213 : nChk 8 14 kAi kCi kL t_r022013213 864 896 6560 6592 = some 31126547687720296397144064 := by
  decide +kernel

def t_r02201321 : NTree := .node t_r022013210 t_r022013211 t_r022013212 t_r022013213
theorem k_r02201321 : nChk 8 14 kAi kCi kL t_r02201321 832 896 6528 6592 = some 65442311885515635554254848 :=
  nChk_node rfl rfl k_r022013210 k_r022013211 k_r022013212 k_r022013213 rfl

def t_r022013220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013220 : nChk 8 14 kAi kCi kL t_r022013220 768 800 6592 6624 = some 215044315011038394741424128 := by
  decide +kernel

def t_r022013221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013221 : nChk 8 14 kAi kCi kL t_r022013221 800 832 6592 6624 = some 21376385531197930529095680 := by
  decide +kernel

def t_r022013222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013222 : nChk 8 14 kAi kCi kL t_r022013222 768 800 6624 6656 = some 204093436268359764676706304 := by
  decide +kernel

def t_r022013223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013223 : nChk 8 14 kAi kCi kL t_r022013223 800 832 6624 6656 = some 16880331919190274418409472 := by
  decide +kernel

def t_r02201322 : NTree := .node t_r022013220 t_r022013221 t_r022013222 t_r022013223
theorem k_r02201322 : nChk 8 14 kAi kCi kL t_r02201322 768 832 6592 6656 = some 457394468729786364365635584 :=
  nChk_node rfl rfl k_r022013220 k_r022013221 k_r022013222 k_r022013223 rfl

def t_r022013230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013230 : nChk 8 14 kAi kCi kL t_r022013230 832 864 6592 6624 = some 0 := by
  decide +kernel

def t_r022013231 : NTree := NTree.ofString "1100000100000"
theorem k_r022013231 : nChk 8 14 kAi kCi kL t_r022013231 864 896 6592 6624 = some 27387180094076958397169664 := by
  decide +kernel

def t_r022013232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022013232 : nChk 8 14 kAi kCi kL t_r022013232 832 864 6624 6656 = some 0 := by
  decide +kernel

def t_r022013233 : NTree := NTree.ofString "1100000100000"
theorem k_r022013233 : nChk 8 14 kAi kCi kL t_r022013233 864 896 6624 6656 = some 23101370941806397687332864 := by
  decide +kernel

def t_r02201323 : NTree := .node t_r022013230 t_r022013231 t_r022013232 t_r022013233
theorem k_r02201323 : nChk 8 14 kAi kCi kL t_r02201323 832 896 6592 6656 = some 50488551035883356084502528 :=
  nChk_node rfl rfl k_r022013230 k_r022013231 k_r022013232 k_r022013233 rfl

def t_r0220132 : NTree := .node t_r02201320 t_r02201321 t_r02201322 t_r02201323
theorem k_r0220132 : nChk 8 14 kAi kCi kL t_r0220132 768 896 6528 6656 = some 1091117513410423336816607232 :=
  nChk_node rfl rfl k_r02201320 k_r02201321 k_r02201322 k_r02201323 rfl

def t_r02201330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201330 : nChk 8 14 kAi kCi kL t_r02201330 896 960 6528 6592 = some 0 := by
  decide +kernel

def t_r02201331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201331 : nChk 8 14 kAi kCi kL t_r02201331 960 1024 6528 6592 = some 0 := by
  decide +kernel

def t_r02201332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201332 : nChk 8 14 kAi kCi kL t_r02201332 896 960 6592 6656 = some 0 := by
  decide +kernel

def t_r02201333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02201333 : nChk 8 14 kAi kCi kL t_r02201333 960 1024 6592 6656 = some 0 := by
  decide +kernel

def t_r0220133 : NTree := .node t_r02201330 t_r02201331 t_r02201332 t_r02201333
theorem k_r0220133 : nChk 8 14 kAi kCi kL t_r0220133 896 1024 6528 6656 = some 0 :=
  nChk_node rfl rfl k_r02201330 k_r02201331 k_r02201332 k_r02201333 rfl

def t_r022013 : NTree := .node t_r0220130 t_r0220131 t_r0220132 t_r0220133
theorem k_r022013 : nChk 8 14 kAi kCi kL t_r022013 768 1024 6400 6656 = some 2475799050706984825308315648 :=
  nChk_node rfl rfl k_r0220130 k_r0220131 k_r0220132 k_r0220133 rfl

end ChargeKernel.Pt900
