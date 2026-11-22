/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200231` (592 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200231000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231000 : nChk 8 14 kAi kCi kL t_r200231000 768 800 9728 9760 = some 204093436268359764676706304 := by
  decide +kernel

def t_r200231001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231001 : nChk 8 14 kAi kCi kL t_r200231001 800 832 9728 9760 = some 16880331919190274418409472 := by
  decide +kernel

def t_r200231002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231002 : nChk 8 14 kAi kCi kL t_r200231002 768 800 9760 9792 = some 215044315011038394741424128 := by
  decide +kernel

def t_r200231003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231003 : nChk 8 14 kAi kCi kL t_r200231003 800 832 9760 9792 = some 21376385531197930529095680 := by
  decide +kernel

def t_r20023100 : NTree := .node t_r200231000 t_r200231001 t_r200231002 t_r200231003
theorem k_r20023100 : nChk 8 14 kAi kCi kL t_r20023100 768 832 9728 9792 = some 457394468729786364365635584 :=
  nChk_node rfl rfl k_r200231000 k_r200231001 k_r200231002 k_r200231003 rfl

def t_r200231010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231010 : nChk 8 14 kAi kCi kL t_r200231010 832 864 9728 9760 = some 0 := by
  decide +kernel

def t_r200231011 : NTree := NTree.ofString "1100000100000"
theorem k_r200231011 : nChk 8 14 kAi kCi kL t_r200231011 864 896 9728 9760 = some 23101370941806397687332864 := by
  decide +kernel

def t_r200231012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231012 : nChk 8 14 kAi kCi kL t_r200231012 832 864 9760 9792 = some 0 := by
  decide +kernel

def t_r200231013 : NTree := NTree.ofString "1100000100000"
theorem k_r200231013 : nChk 8 14 kAi kCi kL t_r200231013 864 896 9760 9792 = some 27387180094076958397169664 := by
  decide +kernel

def t_r20023101 : NTree := .node t_r200231010 t_r200231011 t_r200231012 t_r200231013
theorem k_r20023101 : nChk 8 14 kAi kCi kL t_r20023101 832 896 9728 9792 = some 50488551035883356084502528 :=
  nChk_node rfl rfl k_r200231010 k_r200231011 k_r200231012 k_r200231013 rfl

def t_r200231020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231020 : nChk 8 14 kAi kCi kL t_r200231020 768 800 9792 9824 = some 226151983332152196917624832 := by
  decide +kernel

def t_r200231021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231021 : nChk 8 14 kAi kCi kL t_r200231021 800 832 9792 9824 = some 25252383996869179487551488 := by
  decide +kernel

def t_r200231022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231022 : nChk 8 14 kAi kCi kL t_r200231022 768 800 9824 9856 = some 237883088336389816637718528 := by
  decide +kernel

def t_r200231023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231023 : nChk 8 14 kAi kCi kL t_r200231023 800 832 9824 9856 = some 28504726093826787769319424 := by
  decide +kernel

def t_r20023102 : NTree := .node t_r200231020 t_r200231021 t_r200231022 t_r200231023
theorem k_r20023102 : nChk 8 14 kAi kCi kL t_r20023102 768 832 9792 9856 = some 517792181759237980812214272 :=
  nChk_node rfl rfl k_r200231020 k_r200231021 k_r200231022 k_r200231023 rfl

def t_r200231030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231030 : nChk 8 14 kAi kCi kL t_r200231030 832 864 9792 9824 = some 0 := by
  decide +kernel

def t_r200231031 : NTree := NTree.ofString "1100000100000"
theorem k_r200231031 : nChk 8 14 kAi kCi kL t_r200231031 864 896 9792 9824 = some 31126547687720296397144064 := by
  decide +kernel

def t_r200231032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231032 : nChk 8 14 kAi kCi kL t_r200231032 832 864 9824 9856 = some 0 := by
  decide +kernel

def t_r200231033 : NTree := NTree.ofString "1100000100000"
theorem k_r200231033 : nChk 8 14 kAi kCi kL t_r200231033 864 896 9824 9856 = some 34315764197795339157110784 := by
  decide +kernel

def t_r20023103 : NTree := .node t_r200231030 t_r200231031 t_r200231032 t_r200231033
theorem k_r20023103 : nChk 8 14 kAi kCi kL t_r20023103 832 896 9792 9856 = some 65442311885515635554254848 :=
  nChk_node rfl rfl k_r200231030 k_r200231031 k_r200231032 k_r200231033 rfl

def t_r2002310 : NTree := .node t_r20023100 t_r20023101 t_r20023102 t_r20023103
theorem k_r2002310 : nChk 8 14 kAi kCi kL t_r2002310 768 896 9728 9856 = some 1091117513410423336816607232 :=
  nChk_node rfl rfl k_r20023100 k_r20023101 k_r20023102 k_r20023103 rfl

def t_r20023110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023110 : nChk 8 14 kAi kCi kL t_r20023110 896 960 9728 9792 = some 0 := by
  decide +kernel

def t_r20023111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023111 : nChk 8 14 kAi kCi kL t_r20023111 960 1024 9728 9792 = some 0 := by
  decide +kernel

def t_r20023112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023112 : nChk 8 14 kAi kCi kL t_r20023112 896 960 9792 9856 = some 0 := by
  decide +kernel

def t_r20023113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023113 : nChk 8 14 kAi kCi kL t_r20023113 960 1024 9792 9856 = some 0 := by
  decide +kernel

def t_r2002311 : NTree := .node t_r20023110 t_r20023111 t_r20023112 t_r20023113
theorem k_r2002311 : nChk 8 14 kAi kCi kL t_r2002311 896 1024 9728 9856 = some 0 :=
  nChk_node rfl rfl k_r20023110 k_r20023111 k_r20023112 k_r20023113 rfl

def t_r200231200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231200 : nChk 8 14 kAi kCi kL t_r200231200 768 800 9856 9888 = some 250193091350977200210837504 := by
  decide +kernel

def t_r200231201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231201 : nChk 8 14 kAi kCi kL t_r200231201 800 832 9856 9888 = some 32066804606236690124636160 := by
  decide +kernel

def t_r200231202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231202 : nChk 8 14 kAi kCi kL t_r200231202 768 800 9888 9920 = some 261812764366095544051826688 := by
  decide +kernel

def t_r200231203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231203 : nChk 8 14 kAi kCi kL t_r200231203 800 832 9888 9920 = some 37039811954795417123684352 := by
  decide +kernel

def t_r20023120 : NTree := .node t_r200231200 t_r200231201 t_r200231202 t_r200231203
theorem k_r20023120 : nChk 8 14 kAi kCi kL t_r20023120 768 832 9856 9920 = some 581112472278104851510984704 :=
  nChk_node rfl rfl k_r200231200 k_r200231201 k_r200231202 k_r200231203 rfl

def t_r200231210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231210 : nChk 8 14 kAi kCi kL t_r200231210 832 864 9856 9888 = some 0 := by
  decide +kernel

def t_r200231211 : NTree := NTree.ofString "1100000100000"
theorem k_r200231211 : nChk 8 14 kAi kCi kL t_r200231211 864 896 9856 9888 = some 36951928585566119698366464 := by
  decide +kernel

def t_r200231212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231212 : nChk 8 14 kAi kCi kL t_r200231212 832 864 9888 9920 = some 0 := by
  decide +kernel

def t_r200231213 : NTree := NTree.ofString "1100000100000"
theorem k_r200231213 : nChk 8 14 kAi kCi kL t_r200231213 864 896 9888 9920 = some 39030594176904557487980544 := by
  decide +kernel

def t_r20023121 : NTree := .node t_r200231210 t_r200231211 t_r200231212 t_r200231213
theorem k_r20023121 : nChk 8 14 kAi kCi kL t_r20023121 832 896 9856 9920 = some 75982522762470677186347008 :=
  nChk_node rfl rfl k_r200231210 k_r200231211 k_r200231212 k_r200231213 rfl

def t_r200231220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231220 : nChk 8 14 kAi kCi kL t_r200231220 768 800 9920 9952 = some 271929943807399563613962240 := by
  decide +kernel

def t_r200231221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231221 : nChk 8 14 kAi kCi kL t_r200231221 800 832 9920 9952 = some 42293336076193682266521600 := by
  decide +kernel

def t_r200231222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231222 : nChk 8 14 kAi kCi kL t_r200231222 768 800 9952 9984 = some 282460244567417771998052352 := by
  decide +kernel

def t_r200231223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231223 : nChk 8 14 kAi kCi kL t_r200231223 800 832 9952 9984 = some 48858085012526319758475264 := by
  decide +kernel

def t_r20023122 : NTree := .node t_r200231220 t_r200231221 t_r200231222 t_r200231223
theorem k_r20023122 : nChk 8 14 kAi kCi kL t_r20023122 768 832 9920 9984 = some 645541609463537337637011456 :=
  nChk_node rfl rfl k_r200231220 k_r200231221 k_r200231222 k_r200231223 rfl

def t_r200231230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231230 : nChk 8 14 kAi kCi kL t_r200231230 832 864 9920 9952 = some 0 := by
  decide +kernel

def t_r200231231 : NTree := NTree.ofString "1100000100000"
theorem k_r200231231 : nChk 8 14 kAi kCi kL t_r200231231 864 896 9920 9952 = some 40547575866748929671430144 := by
  decide +kernel

def t_r200231232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200231232 : nChk 8 14 kAi kCi kL t_r200231232 832 864 9952 9984 = some 0 := by
  decide +kernel

def t_r200231233 : NTree := NTree.ofString "1100000100000"
theorem k_r200231233 : nChk 8 14 kAi kCi kL t_r200231233 864 896 9952 9984 = some 41497356925699692485935104 := by
  decide +kernel

def t_r20023123 : NTree := .node t_r200231230 t_r200231231 t_r200231232 t_r200231233
theorem k_r20023123 : nChk 8 14 kAi kCi kL t_r20023123 832 896 9920 9984 = some 82044932792448622157365248 :=
  nChk_node rfl rfl k_r200231230 k_r200231231 k_r200231232 k_r200231233 rfl

def t_r2002312 : NTree := .node t_r20023120 t_r20023121 t_r20023122 t_r20023123
theorem k_r2002312 : nChk 8 14 kAi kCi kL t_r2002312 768 896 9856 9984 = some 1384681537296561488491708416 :=
  nChk_node rfl rfl k_r20023120 k_r20023121 k_r20023122 k_r20023123 rfl

def t_r20023130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023130 : nChk 8 14 kAi kCi kL t_r20023130 896 960 9856 9920 = some 0 := by
  decide +kernel

def t_r20023131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023131 : nChk 8 14 kAi kCi kL t_r20023131 960 1024 9856 9920 = some 0 := by
  decide +kernel

def t_r20023132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023132 : nChk 8 14 kAi kCi kL t_r20023132 896 960 9920 9984 = some 0 := by
  decide +kernel

def t_r20023133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20023133 : nChk 8 14 kAi kCi kL t_r20023133 960 1024 9920 9984 = some 0 := by
  decide +kernel

def t_r2002313 : NTree := .node t_r20023130 t_r20023131 t_r20023132 t_r20023133
theorem k_r2002313 : nChk 8 14 kAi kCi kL t_r2002313 896 1024 9856 9984 = some 0 :=
  nChk_node rfl rfl k_r20023130 k_r20023131 k_r20023132 k_r20023133 rfl

def t_r200231 : NTree := .node t_r2002310 t_r2002311 t_r2002312 t_r2002313
theorem k_r200231 : nChk 8 14 kAi kCi kL t_r200231 768 1024 9728 9984 = some 2475799050706984825308315648 :=
  nChk_node rfl rfl k_r2002310 k_r2002311 k_r2002312 k_r2002313 rfl

end ChargeKernel.Pt900
