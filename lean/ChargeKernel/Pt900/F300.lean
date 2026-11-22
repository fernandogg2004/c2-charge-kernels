/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `222231` (709 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2222310000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310000 : nChk 8 14 kAi kCi kL t_r2222310000 768 784 15872 15888 = some 196880312119089132849856512 := by
  decide +kernel

def t_r2222310001 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310001 : nChk 8 14 kAi kCi kL t_r2222310001 784 800 15872 15888 = some 6134755386017663372230656 := by
  decide +kernel

def t_r2222310002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310002 : nChk 8 14 kAi kCi kL t_r2222310002 768 784 15888 15904 = some 200242671138134300181921792 := by
  decide +kernel

def t_r2222310003 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310003 : nChk 8 14 kAi kCi kL t_r2222310003 784 800 15888 15904 = some 6254554856079010773860352 := by
  decide +kernel

def t_r222231000 : NTree := .node t_r2222310000 t_r2222310001 t_r2222310002 t_r2222310003
theorem k_r222231000 : nChk 8 14 kAi kCi kL t_r222231000 768 800 15872 15904 = some 409512293499320107177869312 :=
  nChk_node rfl rfl k_r2222310000 k_r2222310001 k_r2222310002 k_r2222310003 rfl

def t_r222231001 : NTree := NTree.ofString "10000"
theorem k_r222231001 : nChk 8 14 kAi kCi kL t_r222231001 800 832 15872 15904 = some 2860451863779551565840384 := by
  decide +kernel

def t_r2222310020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310020 : nChk 8 14 kAi kCi kL t_r2222310020 768 784 15904 15920 = some 203222928105978332989882368 := by
  decide +kernel

def t_r2222310021 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310021 : nChk 8 14 kAi kCi kL t_r2222310021 784 800 15904 15920 = some 6319789883991040362283008 := by
  decide +kernel

def t_r2222310022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310022 : nChk 8 14 kAi kCi kL t_r2222310022 768 784 15920 15936 = some 205815111776436494398390272 := by
  decide +kernel

def t_r2222310023 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310023 : nChk 8 14 kAi kCi kL t_r2222310023 784 800 15920 15936 = some 6329478018502240518537216 := by
  decide +kernel

def t_r222231002 : NTree := .node t_r2222310020 t_r2222310021 t_r2222310022 t_r2222310023
theorem k_r222231002 : nChk 8 14 kAi kCi kL t_r222231002 768 800 15904 15936 = some 421687307784908108269092864 :=
  nChk_node rfl rfl k_r2222310020 k_r2222310021 k_r2222310022 k_r2222310023 rfl

def t_r222231003 : NTree := NTree.ofString "10000"
theorem k_r222231003 : nChk 8 14 kAi kCi kL t_r222231003 800 832 15904 15936 = some 0 := by
  decide +kernel

def t_r22223100 : NTree := .node t_r222231000 t_r222231001 t_r222231002 t_r222231003
theorem k_r22223100 : nChk 8 14 kAi kCi kL t_r22223100 768 832 15872 15936 = some 834060053148007767012802560 :=
  nChk_node rfl rfl k_r222231000 k_r222231001 k_r222231002 k_r222231003 rfl

def t_r22223101 : NTree := NTree.ofString "10000"
theorem k_r22223101 : nChk 8 14 kAi kCi kL t_r22223101 832 896 15872 15936 = some 0 := by
  decide +kernel

def t_r2222310200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310200 : nChk 8 14 kAi kCi kL t_r2222310200 768 784 15936 15952 = some 208013314066308821403303936 := by
  decide +kernel

def t_r2222310201 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310201 : nChk 8 14 kAi kCi kL t_r2222310201 784 800 15936 15952 = some 6282548096455639679631360 := by
  decide +kernel

def t_r2222310202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310202 : nChk 8 14 kAi kCi kL t_r2222310202 768 784 15952 15968 = some 209811267701051670625517568 := by
  decide +kernel

def t_r2222310203 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310203 : nChk 8 14 kAi kCi kL t_r2222310203 784 800 15952 15968 = some 6177946167452042092609536 := by
  decide +kernel

def t_r222231020 : NTree := .node t_r2222310200 t_r2222310201 t_r2222310202 t_r2222310203
theorem k_r222231020 : nChk 8 14 kAi kCi kL t_r222231020 768 800 15936 15968 = some 430285076031268173801062400 :=
  nChk_node rfl rfl k_r2222310200 k_r2222310201 k_r2222310202 k_r2222310203 rfl

def t_r222231021 : NTree := NTree.ofString "10000"
theorem k_r222231021 : nChk 8 14 kAi kCi kL t_r222231021 800 832 15936 15968 = some 0 := by
  decide +kernel

def t_r2222310220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310220 : nChk 8 14 kAi kCi kL t_r2222310220 768 784 15968 15984 = some 211202105290212052498907136 := by
  decide +kernel

def t_r2222310221 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310221 : nChk 8 14 kAi kCi kL t_r2222310221 784 800 15968 15984 = some 6014329636384934574686208 := by
  decide +kernel

def t_r2222310222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222310222 : nChk 8 14 kAi kCi kL t_r2222310222 768 784 15984 16000 = some 212179125653184825192873984 := by
  decide +kernel

def t_r2222310223 : NTree := NTree.ofString "1100000100000"
theorem k_r2222310223 : nChk 8 14 kAi kCi kL t_r2222310223 784 800 15984 16000 = some 5790759745926390255452160 := by
  decide +kernel

def t_r222231022 : NTree := .node t_r2222310220 t_r2222310221 t_r2222310222 t_r2222310223
theorem k_r222231022 : nChk 8 14 kAi kCi kL t_r222231022 768 800 15968 16000 = some 435186320325708202521919488 :=
  nChk_node rfl rfl k_r2222310220 k_r2222310221 k_r2222310222 k_r2222310223 rfl

def t_r222231023 : NTree := NTree.ofString "10000"
theorem k_r222231023 : nChk 8 14 kAi kCi kL t_r222231023 800 832 15968 16000 = some 0 := by
  decide +kernel

def t_r22223102 : NTree := .node t_r222231020 t_r222231021 t_r222231022 t_r222231023
theorem k_r22223102 : nChk 8 14 kAi kCi kL t_r22223102 768 832 15936 16000 = some 865471396356976376322981888 :=
  nChk_node rfl rfl k_r222231020 k_r222231021 k_r222231022 k_r222231023 rfl

def t_r22223103 : NTree := NTree.ofString "10000"
theorem k_r22223103 : nChk 8 14 kAi kCi kL t_r22223103 832 896 15936 16000 = some 0 := by
  decide +kernel

def t_r2222310 : NTree := .node t_r22223100 t_r22223101 t_r22223102 t_r22223103
theorem k_r2222310 : nChk 8 14 kAi kCi kL t_r2222310 768 896 15872 16000 = some 1699531449504984143335784448 :=
  nChk_node rfl rfl k_r22223100 k_r22223101 k_r22223102 k_r22223103 rfl

def t_r22223110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22223110 : nChk 8 14 kAi kCi kL t_r22223110 896 960 15872 15936 = some 0 := by
  decide +kernel

def t_r22223111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22223111 : nChk 8 14 kAi kCi kL t_r22223111 960 1024 15872 15936 = some 3455044180240362708664320 := by
  decide +kernel

def t_r22223112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22223112 : nChk 8 14 kAi kCi kL t_r22223112 896 960 15936 16000 = some 0 := by
  decide +kernel

def t_r22223113 : NTree := NTree.ofString "1100001010000010000100001010000010000"
theorem k_r22223113 : nChk 8 14 kAi kCi kL t_r22223113 960 1024 15936 16000 = some 2067639914759506360270848 := by
  decide +kernel

def t_r2222311 : NTree := .node t_r22223110 t_r22223111 t_r22223112 t_r22223113
theorem k_r2222311 : nChk 8 14 kAi kCi kL t_r2222311 896 1024 15872 16000 = some 5522684094999869068935168 :=
  nChk_node rfl rfl k_r22223110 k_r22223111 k_r22223112 k_r22223113 rfl

def t_r2222312000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312000 : nChk 8 14 kAi kCi kL t_r2222312000 768 784 16000 16016 = some 212734634964215578704740352 := by
  decide +kernel

def t_r2222312001 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312001 : nChk 8 14 kAi kCi kL t_r2222312001 784 800 16000 16016 = some 5505709856867523829432320 := by
  decide +kernel

def t_r2222312002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312002 : nChk 8 14 kAi kCi kL t_r2222312002 768 784 16016 16032 = some 212861255144919777977303040 := by
  decide +kernel

def t_r2222312003 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312003 : nChk 8 14 kAi kCi kL t_r2222312003 784 800 16016 16032 = some 5157915493540958482464768 := by
  decide +kernel

def t_r222231200 : NTree := .node t_r2222312000 t_r2222312001 t_r2222312002 t_r2222312003
theorem k_r222231200 : nChk 8 14 kAi kCi kL t_r222231200 768 800 16000 16032 = some 436259515459543838993940480 :=
  nChk_node rfl rfl k_r2222312000 k_r2222312001 k_r2222312002 k_r2222312003 rfl

def t_r222231201 : NTree := NTree.ofString "10000"
theorem k_r222231201 : nChk 8 14 kAi kCi kL t_r222231201 800 832 16000 16032 = some 0 := by
  decide +kernel

def t_r2222312020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312020 : nChk 8 14 kAi kCi kL t_r2222312020 768 784 16032 16048 = some 212550693983015923731136512 := by
  decide +kernel

def t_r2222312021 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312021 : nChk 8 14 kAi kCi kL t_r2222312021 784 800 16032 16048 = some 4746023468373857456357376 := by
  decide +kernel

def t_r2222312022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312022 : nChk 8 14 kAi kCi kL t_r2222312022 768 784 16048 16064 = some 211794673790331314956664832 := by
  decide +kernel

def t_r2222312023 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312023 : nChk 8 14 kAi kCi kL t_r2222312023 784 800 16048 16064 = some 4268579965363310026555392 := by
  decide +kernel

def t_r222231202 : NTree := .node t_r2222312020 t_r2222312021 t_r2222312022 t_r2222312023
theorem k_r222231202 : nChk 8 14 kAi kCi kL t_r222231202 768 800 16032 16064 = some 433359971207084406170714112 :=
  nChk_node rfl rfl k_r2222312020 k_r2222312021 k_r2222312022 k_r2222312023 rfl

def t_r222231203 : NTree := NTree.ofString "10000"
theorem k_r222231203 : nChk 8 14 kAi kCi kL t_r222231203 800 832 16032 16064 = some 0 := by
  decide +kernel

def t_r22223120 : NTree := .node t_r222231200 t_r222231201 t_r222231202 t_r222231203
theorem k_r22223120 : nChk 8 14 kAi kCi kL t_r22223120 768 832 16000 16064 = some 869619486666628245164654592 :=
  nChk_node rfl rfl k_r222231200 k_r222231201 k_r222231202 k_r222231203 rfl

def t_r22223121 : NTree := NTree.ofString "10000"
theorem k_r22223121 : nChk 8 14 kAi kCi kL t_r22223121 832 896 16000 16064 = some 0 := by
  decide +kernel

def t_r2222312200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312200 : nChk 8 14 kAi kCi kL t_r2222312200 768 784 16064 16080 = some 210584374744377307038744576 := by
  decide +kernel

def t_r2222312201 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312201 : nChk 8 14 kAi kCi kL t_r2222312201 784 800 16064 16080 = some 3723892838014125021855744 := by
  decide +kernel

def t_r2222312202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312202 : nChk 8 14 kAi kCi kL t_r2222312202 768 784 16080 16096 = some 209186144491924996868800512 := by
  decide +kernel

def t_r2222312203 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312203 : nChk 8 14 kAi kCi kL t_r2222312203 784 800 16080 16096 = some 3110483113215873226113024 := by
  decide +kernel

def t_r222231220 : NTree := .node t_r2222312200 t_r2222312201 t_r2222312202 t_r2222312203
theorem k_r222231220 : nChk 8 14 kAi kCi kL t_r222231220 768 800 16064 16096 = some 426604895187532302155513856 :=
  nChk_node rfl rfl k_r2222312200 k_r2222312201 k_r2222312202 k_r2222312203 rfl

def t_r222231221 : NTree := NTree.ofString "10000"
theorem k_r222231221 : nChk 8 14 kAi kCi kL t_r222231221 800 832 16064 16096 = some 0 := by
  decide +kernel

def t_r2222312220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312220 : nChk 8 14 kAi kCi kL t_r2222312220 768 784 16096 16112 = some 207545945207988494134149120 := by
  decide +kernel

def t_r2222312221 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312221 : nChk 8 14 kAi kCi kL t_r2222312221 784 800 16096 16112 = some 2426632163307554529607680 := by
  decide +kernel

def t_r2222312222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222312222 : nChk 8 14 kAi kCi kL t_r2222312222 768 784 16112 16128 = some 213441363803914172312322048 := by
  decide +kernel

def t_r2222312223 : NTree := NTree.ofString "1100000100000"
theorem k_r2222312223 : nChk 8 14 kAi kCi kL t_r2222312223 784 800 16112 16128 = some 2212067193282339752902656 := by
  decide +kernel

def t_r222231222 : NTree := .node t_r2222312220 t_r2222312221 t_r2222312222 t_r2222312223
theorem k_r222231222 : nChk 8 14 kAi kCi kL t_r222231222 768 800 16096 16128 = some 425626008368492560728981504 :=
  nChk_node rfl rfl k_r2222312220 k_r2222312221 k_r2222312222 k_r2222312223 rfl

def t_r222231223 : NTree := NTree.ofString "10000"
theorem k_r222231223 : nChk 8 14 kAi kCi kL t_r222231223 800 832 16096 16128 = some 0 := by
  decide +kernel

def t_r22223122 : NTree := .node t_r222231220 t_r222231221 t_r222231222 t_r222231223
theorem k_r22223122 : nChk 8 14 kAi kCi kL t_r22223122 768 832 16064 16128 = some 852230903556024862884495360 :=
  nChk_node rfl rfl k_r222231220 k_r222231221 k_r222231222 k_r222231223 rfl

def t_r22223123 : NTree := NTree.ofString "100010000"
theorem k_r22223123 : nChk 8 14 kAi kCi kL t_r22223123 832 896 16064 16128 = some 0 := by
  decide +kernel

def t_r2222312 : NTree := .node t_r22223120 t_r22223121 t_r22223122 t_r22223123
theorem k_r2222312 : nChk 8 14 kAi kCi kL t_r2222312 768 896 16000 16128 = some 1721850390222653108049149952 :=
  nChk_node rfl rfl k_r22223120 k_r22223121 k_r22223122 k_r22223123 rfl

def t_r22223130 : NTree := NTree.ofString "1100001000100001000010100001000010000"
theorem k_r22223130 : nChk 8 14 kAi kCi kL t_r22223130 896 960 16000 16064 = some 27647016751758776941412352 := by
  decide +kernel

def t_r222231310 : NTree := NTree.ofString "10000"
theorem k_r222231310 : nChk 8 14 kAi kCi kL t_r222231310 960 992 16000 16032 = some 0 := by
  decide +kernel

def t_r222231311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231311 : nChk 8 14 kAi kCi kL t_r222231311 992 1024 16000 16032 = some 0 := by
  decide +kernel

def t_r222231312 : NTree := NTree.ofString "10000"
theorem k_r222231312 : nChk 8 14 kAi kCi kL t_r222231312 960 992 16032 16064 = some 5214084045819951628419072 := by
  decide +kernel

def t_r222231313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231313 : nChk 8 14 kAi kCi kL t_r222231313 992 1024 16032 16064 = some 5374458201328134503006208 := by
  decide +kernel

def t_r22223131 : NTree := .node t_r222231310 t_r222231311 t_r222231312 t_r222231313
theorem k_r22223131 : nChk 8 14 kAi kCi kL t_r22223131 960 1024 16000 16064 = some 10588542247148086131425280 :=
  nChk_node rfl rfl k_r222231310 k_r222231311 k_r222231312 k_r222231313 rfl

def t_r222231320 : NTree := NTree.ofString "10000"
theorem k_r222231320 : nChk 8 14 kAi kCi kL t_r222231320 896 928 16064 16096 = some 0 := by
  decide +kernel

def t_r222231321 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231321 : nChk 8 14 kAi kCi kL t_r222231321 928 960 16064 16096 = some 0 := by
  decide +kernel

def t_r222231322 : NTree := NTree.ofString "100010000"
theorem k_r222231322 : nChk 8 14 kAi kCi kL t_r222231322 896 928 16096 16128 = some 19040593764606207873515520 := by
  decide +kernel

def t_r222231323 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231323 : nChk 8 14 kAi kCi kL t_r222231323 928 960 16096 16128 = some 0 := by
  decide +kernel

def t_r22223132 : NTree := .node t_r222231320 t_r222231321 t_r222231322 t_r222231323
theorem k_r22223132 : nChk 8 14 kAi kCi kL t_r22223132 896 960 16064 16128 = some 19040593764606207873515520 :=
  nChk_node rfl rfl k_r222231320 k_r222231321 k_r222231322 k_r222231323 rfl

def t_r222231330 : NTree := NTree.ofString "100100000"
theorem k_r222231330 : nChk 8 14 kAi kCi kL t_r222231330 960 992 16064 16096 = some 37834390413747700642086912 := by
  decide +kernel

def t_r222231331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231331 : nChk 8 14 kAi kCi kL t_r222231331 992 1024 16064 16096 = some 52087382766651425515634688 := by
  decide +kernel

def t_r222231332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231332 : nChk 8 14 kAi kCi kL t_r222231332 960 992 16096 16128 = some 0 := by
  decide +kernel

def t_r222231333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222231333 : nChk 8 14 kAi kCi kL t_r222231333 992 1024 16096 16128 = some 143118049360980299206361088 := by
  decide +kernel

def t_r22223133 : NTree := .node t_r222231330 t_r222231331 t_r222231332 t_r222231333
theorem k_r22223133 : nChk 8 14 kAi kCi kL t_r22223133 960 1024 16064 16128 = some 233039822541379425364082688 :=
  nChk_node rfl rfl k_r222231330 k_r222231331 k_r222231332 k_r222231333 rfl

def t_r2222313 : NTree := .node t_r22223130 t_r22223131 t_r22223132 t_r22223133
theorem k_r2222313 : nChk 8 14 kAi kCi kL t_r2222313 896 1024 16000 16128 = some 290315975304892496310435840 :=
  nChk_node rfl rfl k_r22223130 k_r22223131 k_r22223132 k_r22223133 rfl

def t_r222231 : NTree := .node t_r2222310 t_r2222311 t_r2222312 t_r2222313
theorem k_r222231 : nChk 8 14 kAi kCi kL t_r222231 768 1024 15872 16128 = some 3717220499127529616764305408 :=
  nChk_node rfl rfl k_r2222310 k_r2222311 k_r2222312 k_r2222313 rfl

end ChargeKernel.Pt900
