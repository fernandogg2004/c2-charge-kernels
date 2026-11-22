/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `000031` (502 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0000310000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310000 : nChk 8 14 kAi kCi kL t_r0000310000 768 784 512 528 = some 193141212147350051714236416 := by
  decide +kernel

def t_r0000310001 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310001 : nChk 8 14 kAi kCi kL t_r0000310001 784 800 512 528 = some 5961358036359024413245440 := by
  decide +kernel

def t_r0000310002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310002 : nChk 8 14 kAi kCi kL t_r0000310002 768 784 528 544 = some 189030637806630697684697088 := by
  decide +kernel

def t_r0000310003 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310003 : nChk 8 14 kAi kCi kL t_r0000310003 784 800 528 544 = some 5735288323848116298055680 := by
  decide +kernel

def t_r000031000 : NTree := .node t_r0000310000 t_r0000310001 t_r0000310002 t_r0000310003
theorem k_r000031000 : nChk 8 14 kAi kCi kL t_r000031000 768 800 512 544 = some 393868496314187890110234624 :=
  nChk_node rfl rfl k_r0000310000 k_r0000310001 k_r0000310002 k_r0000310003 rfl

def t_r000031001 : NTree := NTree.ofString "10000"
theorem k_r000031001 : nChk 8 14 kAi kCi kL t_r000031001 800 832 512 544 = some 10599264525227320865193984 := by
  decide +kernel

def t_r0000310020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310020 : nChk 8 14 kAi kCi kL t_r0000310020 768 784 544 560 = some 184779067720887183907749888 := by
  decide +kernel

def t_r0000310021 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310021 : nChk 8 14 kAi kCi kL t_r0000310021 784 800 544 560 = some 5457401590140567740743680 := by
  decide +kernel

def t_r0000310022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310022 : nChk 8 14 kAi kCi kL t_r0000310022 768 784 560 576 = some 180387010659517614614642688 := by
  decide +kernel

def t_r0000310023 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310023 : nChk 8 14 kAi kCi kL t_r0000310023 784 800 560 576 = some 5128541260367393433059328 := by
  decide +kernel

def t_r000031002 : NTree := .node t_r0000310020 t_r0000310021 t_r0000310022 t_r0000310023
theorem k_r000031002 : nChk 8 14 kAi kCi kL t_r000031002 768 800 544 576 = some 375752021230912759696195584 :=
  nChk_node rfl rfl k_r0000310020 k_r0000310021 k_r0000310022 k_r0000310023 rfl

def t_r000031003 : NTree := NTree.ofString "10000"
theorem k_r000031003 : nChk 8 14 kAi kCi kL t_r000031003 800 832 544 576 = some 16230911375742771117686784 := by
  decide +kernel

def t_r00003100 : NTree := .node t_r000031000 t_r000031001 t_r000031002 t_r000031003
theorem k_r00003100 : nChk 8 14 kAi kCi kL t_r00003100 768 832 512 576 = some 796450693446070741789310976 :=
  nChk_node rfl rfl k_r000031000 k_r000031001 k_r000031002 k_r000031003 rfl

def t_r00003101 : NTree := NTree.ofString "10000"
theorem k_r00003101 : nChk 8 14 kAi kCi kL t_r00003101 832 896 512 576 = some 0 := by
  decide +kernel

def t_r0000310200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310200 : nChk 8 14 kAi kCi kL t_r0000310200 768 784 576 592 = some 175685787331653176911724544 := by
  decide +kernel

def t_r0000310201 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310201 : nChk 8 14 kAi kCi kL t_r0000310201 784 800 576 592 = some 4749520306318927787458560 := by
  decide +kernel

def t_r0000310202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310202 : nChk 8 14 kAi kCi kL t_r0000310202 768 784 592 608 = some 170678306848732169839312896 := by
  decide +kernel

def t_r0000310203 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310203 : nChk 8 14 kAi kCi kL t_r0000310203 784 800 592 608 = some 4321049747297140803108864 := by
  decide +kernel

def t_r000031020 : NTree := .node t_r0000310200 t_r0000310201 t_r0000310202 t_r0000310203
theorem k_r000031020 : nChk 8 14 kAi kCi kL t_r000031020 768 800 576 608 = some 355434664234001415341604864 :=
  nChk_node rfl rfl k_r0000310200 k_r0000310201 k_r0000310202 k_r0000310203 rfl

def t_r000031021 : NTree := NTree.ofString "10000"
theorem k_r000031021 : nChk 8 14 kAi kCi kL t_r000031021 800 832 576 608 = some 19848606118973365901328384 := by
  decide +kernel

def t_r0000310220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310220 : nChk 8 14 kAi kCi kL t_r0000310220 768 784 608 624 = some 165368448174624446487724032 := by
  decide +kernel

def t_r0000310221 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310221 : nChk 8 14 kAi kCi kL t_r0000310221 784 800 608 624 = some 3843861787536649629990912 := by
  decide +kernel

def t_r0000310222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000310222 : nChk 8 14 kAi kCi kL t_r0000310222 768 784 624 640 = some 159759354954726100470595584 := by
  decide +kernel

def t_r0000310223 : NTree := NTree.ofString "1100000100000"
theorem k_r0000310223 : nChk 8 14 kAi kCi kL t_r0000310223 784 800 624 640 = some 3318623752415839518720000 := by
  decide +kernel

def t_r000031022 : NTree := .node t_r0000310220 t_r0000310221 t_r0000310222 t_r0000310223
theorem k_r000031022 : nChk 8 14 kAi kCi kL t_r000031022 768 800 608 640 = some 332290288669303036107030528 :=
  nChk_node rfl rfl k_r0000310220 k_r0000310221 k_r0000310222 k_r0000310223 rfl

def t_r000031023 : NTree := NTree.ofString "10000"
theorem k_r000031023 : nChk 8 14 kAi kCi kL t_r000031023 800 832 608 640 = some 21536418349883155739049984 := by
  decide +kernel

def t_r00003102 : NTree := .node t_r000031020 t_r000031021 t_r000031022 t_r000031023
theorem k_r00003102 : nChk 8 14 kAi kCi kL t_r00003102 768 832 576 640 = some 729109977372160973089013760 :=
  nChk_node rfl rfl k_r000031020 k_r000031021 k_r000031022 k_r000031023 rfl

def t_r00003103 : NTree := NTree.ofString "0"
theorem k_r00003103 : nChk 8 14 kAi kCi kL t_r00003103 832 896 576 640 = some 0 := by
  decide +kernel

def t_r0000310 : NTree := .node t_r00003100 t_r00003101 t_r00003102 t_r00003103
theorem k_r0000310 : nChk 8 14 kAi kCi kL t_r0000310 768 896 512 640 = some 1525560670818231714878324736 :=
  nChk_node rfl rfl k_r00003100 k_r00003101 k_r00003102 k_r00003103 rfl

def t_r00003110 : NTree := NTree.ofString "1010000010000"
theorem k_r00003110 : nChk 8 14 kAi kCi kL t_r00003110 896 960 512 576 = some 0 := by
  decide +kernel

def t_r00003111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00003111 : nChk 8 14 kAi kCi kL t_r00003111 960 1024 512 576 = some 0 := by
  decide +kernel

def t_r00003112 : NTree := NTree.ofString "1010000010000"
theorem k_r00003112 : nChk 8 14 kAi kCi kL t_r00003112 896 960 576 640 = some 0 := by
  decide +kernel

def t_r00003113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00003113 : nChk 8 14 kAi kCi kL t_r00003113 960 1024 576 640 = some 0 := by
  decide +kernel

def t_r0000311 : NTree := .node t_r00003110 t_r00003111 t_r00003112 t_r00003113
theorem k_r0000311 : nChk 8 14 kAi kCi kL t_r0000311 896 1024 512 640 = some 0 :=
  nChk_node rfl rfl k_r00003110 k_r00003111 k_r00003112 k_r00003113 rfl

def t_r0000312000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312000 : nChk 8 14 kAi kCi kL t_r0000312000 768 784 640 656 = some 153853687154588645251350528 := by
  decide +kernel

def t_r0000312001 : NTree := NTree.ofString "1100000100000"
theorem k_r0000312001 : nChk 8 14 kAi kCi kL t_r0000312001 784 800 640 656 = some 2746020180070871529947136 := by
  decide +kernel

def t_r0000312002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312002 : nChk 8 14 kAi kCi kL t_r0000312002 768 784 656 672 = some 147654473199515307796856832 := by
  decide +kernel

def t_r0000312003 : NTree := NTree.ofString "1100000100000"
theorem k_r0000312003 : nChk 8 14 kAi kCi kL t_r0000312003 784 800 656 672 = some 2126650868907318121070592 := by
  decide +kernel

def t_r000031200 : NTree := .node t_r0000312000 t_r0000312001 t_r0000312002 t_r0000312003
theorem k_r000031200 : nChk 8 14 kAi kCi kL t_r000031200 768 800 640 672 = some 306380831403082142699225088 :=
  nChk_node rfl rfl k_r0000312000 k_r0000312001 k_r0000312002 k_r0000312003 rfl

def t_r000031201 : NTree := NTree.ofString "10000"
theorem k_r000031201 : nChk 8 14 kAi kCi kL t_r000031201 800 832 640 672 = some 21371024554287899747549184 := by
  decide +kernel

def t_r0000312020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312020 : nChk 8 14 kAi kCi kL t_r0000312020 768 784 672 688 = some 141164315728737944771493888 := by
  decide +kernel

def t_r0000312021 : NTree := NTree.ofString "1100000100000"
theorem k_r0000312021 : nChk 8 14 kAi kCi kL t_r0000312021 784 800 672 688 = some 1461045442241358062419968 := by
  decide +kernel

def t_r0000312022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312022 : nChk 8 14 kAi kCi kL t_r0000312022 768 784 688 704 = some 134385825920313306334101504 := by
  decide +kernel

def t_r0000312023 : NTree := NTree.ofString "10000"
theorem k_r0000312023 : nChk 8 14 kAi kCi kL t_r0000312023 784 800 688 704 = some 48165043503808031307595776 := by
  decide +kernel

def t_r000031202 : NTree := .node t_r0000312020 t_r0000312021 t_r0000312022 t_r0000312023
theorem k_r000031202 : nChk 8 14 kAi kCi kL t_r000031202 768 800 672 704 = some 325176230595100640475611136 :=
  nChk_node rfl rfl k_r0000312020 k_r0000312021 k_r0000312022 k_r0000312023 rfl

def t_r000031203 : NTree := NTree.ofString "10000"
theorem k_r000031203 : nChk 8 14 kAi kCi kL t_r000031203 800 832 672 704 = some 19421102825065147042627584 := by
  decide +kernel

def t_r00003120 : NTree := .node t_r000031200 t_r000031201 t_r000031202 t_r000031203
theorem k_r00003120 : nChk 8 14 kAi kCi kL t_r00003120 768 832 640 704 = some 672349189377535829965012992 :=
  nChk_node rfl rfl k_r000031200 k_r000031201 k_r000031202 k_r000031203 rfl

def t_r00003121 : NTree := NTree.ofString "0"
theorem k_r00003121 : nChk 8 14 kAi kCi kL t_r00003121 832 896 640 704 = some 0 := by
  decide +kernel

def t_r0000312200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312200 : nChk 8 14 kAi kCi kL t_r0000312200 768 784 704 720 = some 127321043600879616471859200 := by
  decide +kernel

def t_r0000312201 : NTree := NTree.ofString "10000"
theorem k_r0000312201 : nChk 8 14 kAi kCi kL t_r0000312201 784 800 704 720 = some 46719987470546903614095360 := by
  decide +kernel

def t_r0000312202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312202 : nChk 8 14 kAi kCi kL t_r0000312202 768 784 720 736 = some 119972317453937544240562176 := by
  decide +kernel

def t_r0000312203 : NTree := NTree.ofString "10000"
theorem k_r0000312203 : nChk 8 14 kAi kCi kL t_r0000312203 784 800 720 736 = some 45186616749312965968134144 := by
  decide +kernel

def t_r000031220 : NTree := .node t_r0000312200 t_r0000312201 t_r0000312202 t_r0000312203
theorem k_r000031220 : nChk 8 14 kAi kCi kL t_r000031220 768 800 704 736 = some 339199965274677030294650880 :=
  nChk_node rfl rfl k_r0000312200 k_r0000312201 k_r0000312202 k_r0000312203 rfl

def t_r000031221 : NTree := NTree.ofString "10000"
theorem k_r000031221 : nChk 8 14 kAi kCi kL t_r000031221 800 832 704 736 = some 15751872490578626199158784 := by
  decide +kernel

def t_r0000312220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312220 : nChk 8 14 kAi kCi kL t_r0000312220 768 784 736 752 = some 112341698080987422111301632 := by
  decide +kernel

def t_r0000312221 : NTree := NTree.ofString "10000"
theorem k_r0000312221 : nChk 8 14 kAi kCi kL t_r0000312221 784 800 736 752 = some 43565953513106443396448256 := by
  decide +kernel

def t_r0000312222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000312222 : nChk 8 14 kAi kCi kL t_r0000312222 768 784 752 768 = some 104771727806017171114426368 := by
  decide +kernel

def t_r0000312223 : NTree := NTree.ofString "10000"
theorem k_r0000312223 : nChk 8 14 kAi kCi kL t_r0000312223 784 800 752 768 = some 41858739234569986177499136 := by
  decide +kernel

def t_r000031222 : NTree := .node t_r0000312220 t_r0000312221 t_r0000312222 t_r0000312223
theorem k_r000031222 : nChk 8 14 kAi kCi kL t_r000031222 768 800 736 768 = some 302538118634681022799675392 :=
  nChk_node rfl rfl k_r0000312220 k_r0000312221 k_r0000312222 k_r0000312223 rfl

def t_r000031223 : NTree := NTree.ofString "10000"
theorem k_r000031223 : nChk 8 14 kAi kCi kL t_r000031223 800 832 736 768 = some 10419343918674018601795584 := by
  decide +kernel

def t_r00003122 : NTree := .node t_r000031220 t_r000031221 t_r000031222 t_r000031223
theorem k_r00003122 : nChk 8 14 kAi kCi kL t_r00003122 768 832 704 768 = some 667909300318610697895280640 :=
  nChk_node rfl rfl k_r000031220 k_r000031221 k_r000031222 k_r000031223 rfl

def t_r00003123 : NTree := NTree.ofString "0"
theorem k_r00003123 : nChk 8 14 kAi kCi kL t_r00003123 832 896 704 768 = some 0 := by
  decide +kernel

def t_r0000312 : NTree := .node t_r00003120 t_r00003121 t_r00003122 t_r00003123
theorem k_r0000312 : nChk 8 14 kAi kCi kL t_r0000312 768 896 640 768 = some 1340258489696146527860293632 :=
  nChk_node rfl rfl k_r00003120 k_r00003121 k_r00003122 k_r00003123 rfl

def t_r0000313 : NTree := NTree.ofString "110100000011000001000001000010000"
theorem k_r0000313 : nChk 8 14 kAi kCi kL t_r0000313 896 1024 640 768 = some 0 := by
  decide +kernel

def t_r000031 : NTree := .node t_r0000310 t_r0000311 t_r0000312 t_r0000313
theorem k_r000031 : nChk 8 14 kAi kCi kL t_r000031 768 1024 512 768 = some 2865819160514378242738618368 :=
  nChk_node rfl rfl k_r0000310 k_r0000311 k_r0000312 k_r0000313 rfl

end ChargeKernel.Pt900
