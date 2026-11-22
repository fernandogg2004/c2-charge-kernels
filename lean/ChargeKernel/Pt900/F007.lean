/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `000013` (709 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0000130000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130000 : nChk 8 14 kAi kCi kL t_r0000130000 768 784 256 272 = some 213441363803914172312322048 := by
  decide +kernel

def t_r0000130001 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130001 : nChk 8 14 kAi kCi kL t_r0000130001 784 800 256 272 = some 2212067193282339752902656 := by
  decide +kernel

def t_r0000130002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130002 : nChk 8 14 kAi kCi kL t_r0000130002 768 784 272 288 = some 207545945207988494134149120 := by
  decide +kernel

def t_r0000130003 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130003 : nChk 8 14 kAi kCi kL t_r0000130003 784 800 272 288 = some 2426632163307554529607680 := by
  decide +kernel

def t_r000013000 : NTree := .node t_r0000130000 t_r0000130001 t_r0000130002 t_r0000130003
theorem k_r000013000 : nChk 8 14 kAi kCi kL t_r000013000 768 800 256 288 = some 425626008368492560728981504 :=
  nChk_node rfl rfl k_r0000130000 k_r0000130001 k_r0000130002 k_r0000130003 rfl

def t_r000013001 : NTree := NTree.ofString "10000"
theorem k_r000013001 : nChk 8 14 kAi kCi kL t_r000013001 800 832 256 288 = some 0 := by
  decide +kernel

def t_r0000130020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130020 : nChk 8 14 kAi kCi kL t_r0000130020 768 784 288 304 = some 209186144491924996868800512 := by
  decide +kernel

def t_r0000130021 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130021 : nChk 8 14 kAi kCi kL t_r0000130021 784 800 288 304 = some 3110483113215873226113024 := by
  decide +kernel

def t_r0000130022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130022 : nChk 8 14 kAi kCi kL t_r0000130022 768 784 304 320 = some 210584374744377307038744576 := by
  decide +kernel

def t_r0000130023 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130023 : nChk 8 14 kAi kCi kL t_r0000130023 784 800 304 320 = some 3723892838014125021855744 := by
  decide +kernel

def t_r000013002 : NTree := .node t_r0000130020 t_r0000130021 t_r0000130022 t_r0000130023
theorem k_r000013002 : nChk 8 14 kAi kCi kL t_r000013002 768 800 288 320 = some 426604895187532302155513856 :=
  nChk_node rfl rfl k_r0000130020 k_r0000130021 k_r0000130022 k_r0000130023 rfl

def t_r000013003 : NTree := NTree.ofString "10000"
theorem k_r000013003 : nChk 8 14 kAi kCi kL t_r000013003 800 832 288 320 = some 0 := by
  decide +kernel

def t_r00001300 : NTree := .node t_r000013000 t_r000013001 t_r000013002 t_r000013003
theorem k_r00001300 : nChk 8 14 kAi kCi kL t_r00001300 768 832 256 320 = some 852230903556024862884495360 :=
  nChk_node rfl rfl k_r000013000 k_r000013001 k_r000013002 k_r000013003 rfl

def t_r00001301 : NTree := NTree.ofString "101000000"
theorem k_r00001301 : nChk 8 14 kAi kCi kL t_r00001301 832 896 256 320 = some 0 := by
  decide +kernel

def t_r0000130200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130200 : nChk 8 14 kAi kCi kL t_r0000130200 768 784 320 336 = some 211794673790331314956664832 := by
  decide +kernel

def t_r0000130201 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130201 : nChk 8 14 kAi kCi kL t_r0000130201 784 800 320 336 = some 4268579965363310026555392 := by
  decide +kernel

def t_r0000130202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130202 : nChk 8 14 kAi kCi kL t_r0000130202 768 784 336 352 = some 212550693983015923731136512 := by
  decide +kernel

def t_r0000130203 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130203 : nChk 8 14 kAi kCi kL t_r0000130203 784 800 336 352 = some 4746023468373857456357376 := by
  decide +kernel

def t_r000013020 : NTree := .node t_r0000130200 t_r0000130201 t_r0000130202 t_r0000130203
theorem k_r000013020 : nChk 8 14 kAi kCi kL t_r000013020 768 800 320 352 = some 433359971207084406170714112 :=
  nChk_node rfl rfl k_r0000130200 k_r0000130201 k_r0000130202 k_r0000130203 rfl

def t_r000013021 : NTree := NTree.ofString "10000"
theorem k_r000013021 : nChk 8 14 kAi kCi kL t_r000013021 800 832 320 352 = some 0 := by
  decide +kernel

def t_r0000130220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130220 : nChk 8 14 kAi kCi kL t_r0000130220 768 784 352 368 = some 212861255144919777977303040 := by
  decide +kernel

def t_r0000130221 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130221 : nChk 8 14 kAi kCi kL t_r0000130221 784 800 352 368 = some 5157915493540958482464768 := by
  decide +kernel

def t_r0000130222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000130222 : nChk 8 14 kAi kCi kL t_r0000130222 768 784 368 384 = some 212734634964215578704740352 := by
  decide +kernel

def t_r0000130223 : NTree := NTree.ofString "1100000100000"
theorem k_r0000130223 : nChk 8 14 kAi kCi kL t_r0000130223 784 800 368 384 = some 5505709856867523829432320 := by
  decide +kernel

def t_r000013022 : NTree := .node t_r0000130220 t_r0000130221 t_r0000130222 t_r0000130223
theorem k_r000013022 : nChk 8 14 kAi kCi kL t_r000013022 768 800 352 384 = some 436259515459543838993940480 :=
  nChk_node rfl rfl k_r0000130220 k_r0000130221 k_r0000130222 k_r0000130223 rfl

def t_r000013023 : NTree := NTree.ofString "10000"
theorem k_r000013023 : nChk 8 14 kAi kCi kL t_r000013023 800 832 352 384 = some 0 := by
  decide +kernel

def t_r00001302 : NTree := .node t_r000013020 t_r000013021 t_r000013022 t_r000013023
theorem k_r00001302 : nChk 8 14 kAi kCi kL t_r00001302 768 832 320 384 = some 869619486666628245164654592 :=
  nChk_node rfl rfl k_r000013020 k_r000013021 k_r000013022 k_r000013023 rfl

def t_r00001303 : NTree := NTree.ofString "10000"
theorem k_r00001303 : nChk 8 14 kAi kCi kL t_r00001303 832 896 320 384 = some 0 := by
  decide +kernel

def t_r0000130 : NTree := .node t_r00001300 t_r00001301 t_r00001302 t_r00001303
theorem k_r0000130 : nChk 8 14 kAi kCi kL t_r0000130 768 896 256 384 = some 1721850390222653108049149952 :=
  nChk_node rfl rfl k_r00001300 k_r00001301 k_r00001302 k_r00001303 rfl

def t_r000013100 : NTree := NTree.ofString "101000000"
theorem k_r000013100 : nChk 8 14 kAi kCi kL t_r000013100 896 928 256 288 = some 19040593764606207873515520 := by
  decide +kernel

def t_r000013101 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013101 : nChk 8 14 kAi kCi kL t_r000013101 928 960 256 288 = some 0 := by
  decide +kernel

def t_r000013102 : NTree := NTree.ofString "10000"
theorem k_r000013102 : nChk 8 14 kAi kCi kL t_r000013102 896 928 288 320 = some 0 := by
  decide +kernel

def t_r000013103 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013103 : nChk 8 14 kAi kCi kL t_r000013103 928 960 288 320 = some 0 := by
  decide +kernel

def t_r00001310 : NTree := .node t_r000013100 t_r000013101 t_r000013102 t_r000013103
theorem k_r00001310 : nChk 8 14 kAi kCi kL t_r00001310 896 960 256 320 = some 19040593764606207873515520 :=
  nChk_node rfl rfl k_r000013100 k_r000013101 k_r000013102 k_r000013103 rfl

def t_r000013110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013110 : nChk 8 14 kAi kCi kL t_r000013110 960 992 256 288 = some 0 := by
  decide +kernel

def t_r000013111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013111 : nChk 8 14 kAi kCi kL t_r000013111 992 1024 256 288 = some 143118049360980299206361088 := by
  decide +kernel

def t_r000013112 : NTree := NTree.ofString "110000000"
theorem k_r000013112 : nChk 8 14 kAi kCi kL t_r000013112 960 992 288 320 = some 37834390413747700642086912 := by
  decide +kernel

def t_r000013113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013113 : nChk 8 14 kAi kCi kL t_r000013113 992 1024 288 320 = some 52087382766651425515634688 := by
  decide +kernel

def t_r00001311 : NTree := .node t_r000013110 t_r000013111 t_r000013112 t_r000013113
theorem k_r00001311 : nChk 8 14 kAi kCi kL t_r00001311 960 1024 256 320 = some 233039822541379425364082688 :=
  nChk_node rfl rfl k_r000013110 k_r000013111 k_r000013112 k_r000013113 rfl

def t_r00001312 : NTree := NTree.ofString "1100001100001000001000010000101000000"
theorem k_r00001312 : nChk 8 14 kAi kCi kL t_r00001312 896 960 320 384 = some 27647016751758776941412352 := by
  decide +kernel

def t_r000013130 : NTree := NTree.ofString "10000"
theorem k_r000013130 : nChk 8 14 kAi kCi kL t_r000013130 960 992 320 352 = some 5214084045819951628419072 := by
  decide +kernel

def t_r000013131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013131 : nChk 8 14 kAi kCi kL t_r000013131 992 1024 320 352 = some 5374458201328134503006208 := by
  decide +kernel

def t_r000013132 : NTree := NTree.ofString "10000"
theorem k_r000013132 : nChk 8 14 kAi kCi kL t_r000013132 960 992 352 384 = some 0 := by
  decide +kernel

def t_r000013133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000013133 : nChk 8 14 kAi kCi kL t_r000013133 992 1024 352 384 = some 0 := by
  decide +kernel

def t_r00001313 : NTree := .node t_r000013130 t_r000013131 t_r000013132 t_r000013133
theorem k_r00001313 : nChk 8 14 kAi kCi kL t_r00001313 960 1024 320 384 = some 10588542247148086131425280 :=
  nChk_node rfl rfl k_r000013130 k_r000013131 k_r000013132 k_r000013133 rfl

def t_r0000131 : NTree := .node t_r00001310 t_r00001311 t_r00001312 t_r00001313
theorem k_r0000131 : nChk 8 14 kAi kCi kL t_r0000131 896 1024 256 384 = some 290315975304892496310435840 :=
  nChk_node rfl rfl k_r00001310 k_r00001311 k_r00001312 k_r00001313 rfl

def t_r0000132000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132000 : nChk 8 14 kAi kCi kL t_r0000132000 768 784 384 400 = some 212179125653184825192873984 := by
  decide +kernel

def t_r0000132001 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132001 : nChk 8 14 kAi kCi kL t_r0000132001 784 800 384 400 = some 5790759745926390255452160 := by
  decide +kernel

def t_r0000132002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132002 : nChk 8 14 kAi kCi kL t_r0000132002 768 784 400 416 = some 211202105290212052498907136 := by
  decide +kernel

def t_r0000132003 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132003 : nChk 8 14 kAi kCi kL t_r0000132003 784 800 400 416 = some 6014329636384934574686208 := by
  decide +kernel

def t_r000013200 : NTree := .node t_r0000132000 t_r0000132001 t_r0000132002 t_r0000132003
theorem k_r000013200 : nChk 8 14 kAi kCi kL t_r000013200 768 800 384 416 = some 435186320325708202521919488 :=
  nChk_node rfl rfl k_r0000132000 k_r0000132001 k_r0000132002 k_r0000132003 rfl

def t_r000013201 : NTree := NTree.ofString "10000"
theorem k_r000013201 : nChk 8 14 kAi kCi kL t_r000013201 800 832 384 416 = some 0 := by
  decide +kernel

def t_r0000132020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132020 : nChk 8 14 kAi kCi kL t_r0000132020 768 784 416 432 = some 209811267701051670625517568 := by
  decide +kernel

def t_r0000132021 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132021 : nChk 8 14 kAi kCi kL t_r0000132021 784 800 416 432 = some 6177946167452042092609536 := by
  decide +kernel

def t_r0000132022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132022 : nChk 8 14 kAi kCi kL t_r0000132022 768 784 432 448 = some 208013314066308821403303936 := by
  decide +kernel

def t_r0000132023 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132023 : nChk 8 14 kAi kCi kL t_r0000132023 784 800 432 448 = some 6282548096455639679631360 := by
  decide +kernel

def t_r000013202 : NTree := .node t_r0000132020 t_r0000132021 t_r0000132022 t_r0000132023
theorem k_r000013202 : nChk 8 14 kAi kCi kL t_r000013202 768 800 416 448 = some 430285076031268173801062400 :=
  nChk_node rfl rfl k_r0000132020 k_r0000132021 k_r0000132022 k_r0000132023 rfl

def t_r000013203 : NTree := NTree.ofString "10000"
theorem k_r000013203 : nChk 8 14 kAi kCi kL t_r000013203 800 832 416 448 = some 0 := by
  decide +kernel

def t_r00001320 : NTree := .node t_r000013200 t_r000013201 t_r000013202 t_r000013203
theorem k_r00001320 : nChk 8 14 kAi kCi kL t_r00001320 768 832 384 448 = some 865471396356976376322981888 :=
  nChk_node rfl rfl k_r000013200 k_r000013201 k_r000013202 k_r000013203 rfl

def t_r00001321 : NTree := NTree.ofString "10000"
theorem k_r00001321 : nChk 8 14 kAi kCi kL t_r00001321 832 896 384 448 = some 0 := by
  decide +kernel

def t_r0000132200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132200 : nChk 8 14 kAi kCi kL t_r0000132200 768 784 448 464 = some 205815111776436494398390272 := by
  decide +kernel

def t_r0000132201 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132201 : nChk 8 14 kAi kCi kL t_r0000132201 784 800 448 464 = some 6329478018502240518537216 := by
  decide +kernel

def t_r0000132202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132202 : nChk 8 14 kAi kCi kL t_r0000132202 768 784 464 480 = some 203222928105978332989882368 := by
  decide +kernel

def t_r0000132203 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132203 : nChk 8 14 kAi kCi kL t_r0000132203 784 800 464 480 = some 6319789883991040362283008 := by
  decide +kernel

def t_r000013220 : NTree := .node t_r0000132200 t_r0000132201 t_r0000132202 t_r0000132203
theorem k_r000013220 : nChk 8 14 kAi kCi kL t_r000013220 768 800 448 480 = some 421687307784908108269092864 :=
  nChk_node rfl rfl k_r0000132200 k_r0000132201 k_r0000132202 k_r0000132203 rfl

def t_r000013221 : NTree := NTree.ofString "10000"
theorem k_r000013221 : nChk 8 14 kAi kCi kL t_r000013221 800 832 448 480 = some 0 := by
  decide +kernel

def t_r0000132220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132220 : nChk 8 14 kAi kCi kL t_r0000132220 768 784 480 496 = some 200242671138134300181921792 := by
  decide +kernel

def t_r0000132221 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132221 : nChk 8 14 kAi kCi kL t_r0000132221 784 800 480 496 = some 6254554856079010773860352 := by
  decide +kernel

def t_r0000132222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000132222 : nChk 8 14 kAi kCi kL t_r0000132222 768 784 496 512 = some 196880312119089132849856512 := by
  decide +kernel

def t_r0000132223 : NTree := NTree.ofString "1100000100000"
theorem k_r0000132223 : nChk 8 14 kAi kCi kL t_r0000132223 784 800 496 512 = some 6134755386017663372230656 := by
  decide +kernel

def t_r000013222 : NTree := .node t_r0000132220 t_r0000132221 t_r0000132222 t_r0000132223
theorem k_r000013222 : nChk 8 14 kAi kCi kL t_r000013222 768 800 480 512 = some 409512293499320107177869312 :=
  nChk_node rfl rfl k_r0000132220 k_r0000132221 k_r0000132222 k_r0000132223 rfl

def t_r000013223 : NTree := NTree.ofString "10000"
theorem k_r000013223 : nChk 8 14 kAi kCi kL t_r000013223 800 832 480 512 = some 2860451863779551565840384 := by
  decide +kernel

def t_r00001322 : NTree := .node t_r000013220 t_r000013221 t_r000013222 t_r000013223
theorem k_r00001322 : nChk 8 14 kAi kCi kL t_r00001322 768 832 448 512 = some 834060053148007767012802560 :=
  nChk_node rfl rfl k_r000013220 k_r000013221 k_r000013222 k_r000013223 rfl

def t_r00001323 : NTree := NTree.ofString "10000"
theorem k_r00001323 : nChk 8 14 kAi kCi kL t_r00001323 832 896 448 512 = some 0 := by
  decide +kernel

def t_r0000132 : NTree := .node t_r00001320 t_r00001321 t_r00001322 t_r00001323
theorem k_r0000132 : nChk 8 14 kAi kCi kL t_r0000132 768 896 384 512 = some 1699531449504984143335784448 :=
  nChk_node rfl rfl k_r00001320 k_r00001321 k_r00001322 k_r00001323 rfl

def t_r00001330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00001330 : nChk 8 14 kAi kCi kL t_r00001330 896 960 384 448 = some 0 := by
  decide +kernel

def t_r00001331 : NTree := NTree.ofString "1100001010000010000100001010000010000"
theorem k_r00001331 : nChk 8 14 kAi kCi kL t_r00001331 960 1024 384 448 = some 2067639914759506360270848 := by
  decide +kernel

def t_r00001332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00001332 : nChk 8 14 kAi kCi kL t_r00001332 896 960 448 512 = some 0 := by
  decide +kernel

def t_r00001333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00001333 : nChk 8 14 kAi kCi kL t_r00001333 960 1024 448 512 = some 3455044180240362708664320 := by
  decide +kernel

def t_r0000133 : NTree := .node t_r00001330 t_r00001331 t_r00001332 t_r00001333
theorem k_r0000133 : nChk 8 14 kAi kCi kL t_r0000133 896 1024 384 512 = some 5522684094999869068935168 :=
  nChk_node rfl rfl k_r00001330 k_r00001331 k_r00001332 k_r00001333 rfl

def t_r000013 : NTree := .node t_r0000130 t_r0000131 t_r0000132 t_r0000133
theorem k_r000013 : nChk 8 14 kAi kCi kL t_r000013 768 1024 256 512 = some 3717220499127529616764305408 :=
  nChk_node rfl rfl k_r0000130 k_r0000131 k_r0000132 k_r0000133 rfl

end ChargeKernel.Pt900
