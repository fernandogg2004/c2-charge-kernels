/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `222213` (502 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2222130000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130000 : nChk 8 14 kAi kCi kL t_r2222130000 768 784 15616 15632 = some 104771727806017171114426368 := by
  decide +kernel

def t_r2222130001 : NTree := NTree.ofString "10000"
theorem k_r2222130001 : nChk 8 14 kAi kCi kL t_r2222130001 784 800 15616 15632 = some 41858739234569986177499136 := by
  decide +kernel

def t_r2222130002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130002 : nChk 8 14 kAi kCi kL t_r2222130002 768 784 15632 15648 = some 112341698080987422111301632 := by
  decide +kernel

def t_r2222130003 : NTree := NTree.ofString "10000"
theorem k_r2222130003 : nChk 8 14 kAi kCi kL t_r2222130003 784 800 15632 15648 = some 43565953513106443396448256 := by
  decide +kernel

def t_r222213000 : NTree := .node t_r2222130000 t_r2222130001 t_r2222130002 t_r2222130003
theorem k_r222213000 : nChk 8 14 kAi kCi kL t_r222213000 768 800 15616 15648 = some 302538118634681022799675392 :=
  nChk_node rfl rfl k_r2222130000 k_r2222130001 k_r2222130002 k_r2222130003 rfl

def t_r222213001 : NTree := NTree.ofString "10000"
theorem k_r222213001 : nChk 8 14 kAi kCi kL t_r222213001 800 832 15616 15648 = some 10419343918674018601795584 := by
  decide +kernel

def t_r2222130020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130020 : nChk 8 14 kAi kCi kL t_r2222130020 768 784 15648 15664 = some 119972317453937544240562176 := by
  decide +kernel

def t_r2222130021 : NTree := NTree.ofString "10000"
theorem k_r2222130021 : nChk 8 14 kAi kCi kL t_r2222130021 784 800 15648 15664 = some 45186616749312965968134144 := by
  decide +kernel

def t_r2222130022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130022 : nChk 8 14 kAi kCi kL t_r2222130022 768 784 15664 15680 = some 127321043600879616471859200 := by
  decide +kernel

def t_r2222130023 : NTree := NTree.ofString "10000"
theorem k_r2222130023 : nChk 8 14 kAi kCi kL t_r2222130023 784 800 15664 15680 = some 46719987470546903614095360 := by
  decide +kernel

def t_r222213002 : NTree := .node t_r2222130020 t_r2222130021 t_r2222130022 t_r2222130023
theorem k_r222213002 : nChk 8 14 kAi kCi kL t_r222213002 768 800 15648 15680 = some 339199965274677030294650880 :=
  nChk_node rfl rfl k_r2222130020 k_r2222130021 k_r2222130022 k_r2222130023 rfl

def t_r222213003 : NTree := NTree.ofString "10000"
theorem k_r222213003 : nChk 8 14 kAi kCi kL t_r222213003 800 832 15648 15680 = some 15751872490578626199158784 := by
  decide +kernel

def t_r22221300 : NTree := .node t_r222213000 t_r222213001 t_r222213002 t_r222213003
theorem k_r22221300 : nChk 8 14 kAi kCi kL t_r22221300 768 832 15616 15680 = some 667909300318610697895280640 :=
  nChk_node rfl rfl k_r222213000 k_r222213001 k_r222213002 k_r222213003 rfl

def t_r22221301 : NTree := NTree.ofString "0"
theorem k_r22221301 : nChk 8 14 kAi kCi kL t_r22221301 832 896 15616 15680 = some 0 := by
  decide +kernel

def t_r2222130200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130200 : nChk 8 14 kAi kCi kL t_r2222130200 768 784 15680 15696 = some 134385825920313306334101504 := by
  decide +kernel

def t_r2222130201 : NTree := NTree.ofString "10000"
theorem k_r2222130201 : nChk 8 14 kAi kCi kL t_r2222130201 784 800 15680 15696 = some 48165043503808031307595776 := by
  decide +kernel

def t_r2222130202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130202 : nChk 8 14 kAi kCi kL t_r2222130202 768 784 15696 15712 = some 141164315728737944771493888 := by
  decide +kernel

def t_r2222130203 : NTree := NTree.ofString "1100000100000"
theorem k_r2222130203 : nChk 8 14 kAi kCi kL t_r2222130203 784 800 15696 15712 = some 1461045442241358062419968 := by
  decide +kernel

def t_r222213020 : NTree := .node t_r2222130200 t_r2222130201 t_r2222130202 t_r2222130203
theorem k_r222213020 : nChk 8 14 kAi kCi kL t_r222213020 768 800 15680 15712 = some 325176230595100640475611136 :=
  nChk_node rfl rfl k_r2222130200 k_r2222130201 k_r2222130202 k_r2222130203 rfl

def t_r222213021 : NTree := NTree.ofString "10000"
theorem k_r222213021 : nChk 8 14 kAi kCi kL t_r222213021 800 832 15680 15712 = some 19421102825065147042627584 := by
  decide +kernel

def t_r2222130220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130220 : nChk 8 14 kAi kCi kL t_r2222130220 768 784 15712 15728 = some 147654473199515307796856832 := by
  decide +kernel

def t_r2222130221 : NTree := NTree.ofString "1100000100000"
theorem k_r2222130221 : nChk 8 14 kAi kCi kL t_r2222130221 784 800 15712 15728 = some 2126650868907318121070592 := by
  decide +kernel

def t_r2222130222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222130222 : nChk 8 14 kAi kCi kL t_r2222130222 768 784 15728 15744 = some 153853687154588645251350528 := by
  decide +kernel

def t_r2222130223 : NTree := NTree.ofString "1100000100000"
theorem k_r2222130223 : nChk 8 14 kAi kCi kL t_r2222130223 784 800 15728 15744 = some 2746020180070871529947136 := by
  decide +kernel

def t_r222213022 : NTree := .node t_r2222130220 t_r2222130221 t_r2222130222 t_r2222130223
theorem k_r222213022 : nChk 8 14 kAi kCi kL t_r222213022 768 800 15712 15744 = some 306380831403082142699225088 :=
  nChk_node rfl rfl k_r2222130220 k_r2222130221 k_r2222130222 k_r2222130223 rfl

def t_r222213023 : NTree := NTree.ofString "10000"
theorem k_r222213023 : nChk 8 14 kAi kCi kL t_r222213023 800 832 15712 15744 = some 21371024554287899747549184 := by
  decide +kernel

def t_r22221302 : NTree := .node t_r222213020 t_r222213021 t_r222213022 t_r222213023
theorem k_r22221302 : nChk 8 14 kAi kCi kL t_r22221302 768 832 15680 15744 = some 672349189377535829965012992 :=
  nChk_node rfl rfl k_r222213020 k_r222213021 k_r222213022 k_r222213023 rfl

def t_r22221303 : NTree := NTree.ofString "0"
theorem k_r22221303 : nChk 8 14 kAi kCi kL t_r22221303 832 896 15680 15744 = some 0 := by
  decide +kernel

def t_r2222130 : NTree := .node t_r22221300 t_r22221301 t_r22221302 t_r22221303
theorem k_r2222130 : nChk 8 14 kAi kCi kL t_r2222130 768 896 15616 15744 = some 1340258489696146527860293632 :=
  nChk_node rfl rfl k_r22221300 k_r22221301 k_r22221302 k_r22221303 rfl

def t_r2222131 : NTree := NTree.ofString "110000100001000100001100000100000"
theorem k_r2222131 : nChk 8 14 kAi kCi kL t_r2222131 896 1024 15616 15744 = some 0 := by
  decide +kernel

def t_r2222132000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132000 : nChk 8 14 kAi kCi kL t_r2222132000 768 784 15744 15760 = some 159759354954726100470595584 := by
  decide +kernel

def t_r2222132001 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132001 : nChk 8 14 kAi kCi kL t_r2222132001 784 800 15744 15760 = some 3318623752415839518720000 := by
  decide +kernel

def t_r2222132002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132002 : nChk 8 14 kAi kCi kL t_r2222132002 768 784 15760 15776 = some 165368448174624446487724032 := by
  decide +kernel

def t_r2222132003 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132003 : nChk 8 14 kAi kCi kL t_r2222132003 784 800 15760 15776 = some 3843861787536649629990912 := by
  decide +kernel

def t_r222213200 : NTree := .node t_r2222132000 t_r2222132001 t_r2222132002 t_r2222132003
theorem k_r222213200 : nChk 8 14 kAi kCi kL t_r222213200 768 800 15744 15776 = some 332290288669303036107030528 :=
  nChk_node rfl rfl k_r2222132000 k_r2222132001 k_r2222132002 k_r2222132003 rfl

def t_r222213201 : NTree := NTree.ofString "10000"
theorem k_r222213201 : nChk 8 14 kAi kCi kL t_r222213201 800 832 15744 15776 = some 21536418349883155739049984 := by
  decide +kernel

def t_r2222132020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132020 : nChk 8 14 kAi kCi kL t_r2222132020 768 784 15776 15792 = some 170678306848732169839312896 := by
  decide +kernel

def t_r2222132021 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132021 : nChk 8 14 kAi kCi kL t_r2222132021 784 800 15776 15792 = some 4321049747297140803108864 := by
  decide +kernel

def t_r2222132022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132022 : nChk 8 14 kAi kCi kL t_r2222132022 768 784 15792 15808 = some 175685787331653176911724544 := by
  decide +kernel

def t_r2222132023 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132023 : nChk 8 14 kAi kCi kL t_r2222132023 784 800 15792 15808 = some 4749520306318927787458560 := by
  decide +kernel

def t_r222213202 : NTree := .node t_r2222132020 t_r2222132021 t_r2222132022 t_r2222132023
theorem k_r222213202 : nChk 8 14 kAi kCi kL t_r222213202 768 800 15776 15808 = some 355434664234001415341604864 :=
  nChk_node rfl rfl k_r2222132020 k_r2222132021 k_r2222132022 k_r2222132023 rfl

def t_r222213203 : NTree := NTree.ofString "10000"
theorem k_r222213203 : nChk 8 14 kAi kCi kL t_r222213203 800 832 15776 15808 = some 19848606118973365901328384 := by
  decide +kernel

def t_r22221320 : NTree := .node t_r222213200 t_r222213201 t_r222213202 t_r222213203
theorem k_r22221320 : nChk 8 14 kAi kCi kL t_r22221320 768 832 15744 15808 = some 729109977372160973089013760 :=
  nChk_node rfl rfl k_r222213200 k_r222213201 k_r222213202 k_r222213203 rfl

def t_r22221321 : NTree := NTree.ofString "0"
theorem k_r22221321 : nChk 8 14 kAi kCi kL t_r22221321 832 896 15744 15808 = some 0 := by
  decide +kernel

def t_r2222132200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132200 : nChk 8 14 kAi kCi kL t_r2222132200 768 784 15808 15824 = some 180387010659517614614642688 := by
  decide +kernel

def t_r2222132201 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132201 : nChk 8 14 kAi kCi kL t_r2222132201 784 800 15808 15824 = some 5128541260367393433059328 := by
  decide +kernel

def t_r2222132202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132202 : nChk 8 14 kAi kCi kL t_r2222132202 768 784 15824 15840 = some 184779067720887183907749888 := by
  decide +kernel

def t_r2222132203 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132203 : nChk 8 14 kAi kCi kL t_r2222132203 784 800 15824 15840 = some 5457401590140567740743680 := by
  decide +kernel

def t_r222213220 : NTree := .node t_r2222132200 t_r2222132201 t_r2222132202 t_r2222132203
theorem k_r222213220 : nChk 8 14 kAi kCi kL t_r222213220 768 800 15808 15840 = some 375752021230912759696195584 :=
  nChk_node rfl rfl k_r2222132200 k_r2222132201 k_r2222132202 k_r2222132203 rfl

def t_r222213221 : NTree := NTree.ofString "10000"
theorem k_r222213221 : nChk 8 14 kAi kCi kL t_r222213221 800 832 15808 15840 = some 16230911375742771117686784 := by
  decide +kernel

def t_r2222132220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132220 : nChk 8 14 kAi kCi kL t_r2222132220 768 784 15840 15856 = some 189030637806630697684697088 := by
  decide +kernel

def t_r2222132221 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132221 : nChk 8 14 kAi kCi kL t_r2222132221 784 800 15840 15856 = some 5735288323848116298055680 := by
  decide +kernel

def t_r2222132222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222132222 : nChk 8 14 kAi kCi kL t_r2222132222 768 784 15856 15872 = some 193141212147350051714236416 := by
  decide +kernel

def t_r2222132223 : NTree := NTree.ofString "1100000100000"
theorem k_r2222132223 : nChk 8 14 kAi kCi kL t_r2222132223 784 800 15856 15872 = some 5961358036359024413245440 := by
  decide +kernel

def t_r222213222 : NTree := .node t_r2222132220 t_r2222132221 t_r2222132222 t_r2222132223
theorem k_r222213222 : nChk 8 14 kAi kCi kL t_r222213222 768 800 15840 15872 = some 393868496314187890110234624 :=
  nChk_node rfl rfl k_r2222132220 k_r2222132221 k_r2222132222 k_r2222132223 rfl

def t_r222213223 : NTree := NTree.ofString "10000"
theorem k_r222213223 : nChk 8 14 kAi kCi kL t_r222213223 800 832 15840 15872 = some 10599264525227320865193984 := by
  decide +kernel

def t_r22221322 : NTree := .node t_r222213220 t_r222213221 t_r222213222 t_r222213223
theorem k_r22221322 : nChk 8 14 kAi kCi kL t_r22221322 768 832 15808 15872 = some 796450693446070741789310976 :=
  nChk_node rfl rfl k_r222213220 k_r222213221 k_r222213222 k_r222213223 rfl

def t_r22221323 : NTree := NTree.ofString "10000"
theorem k_r22221323 : nChk 8 14 kAi kCi kL t_r22221323 832 896 15808 15872 = some 0 := by
  decide +kernel

def t_r2222132 : NTree := .node t_r22221320 t_r22221321 t_r22221322 t_r22221323
theorem k_r2222132 : nChk 8 14 kAi kCi kL t_r2222132 768 896 15744 15872 = some 1525560670818231714878324736 :=
  nChk_node rfl rfl k_r22221320 k_r22221321 k_r22221322 k_r22221323 rfl

def t_r22221330 : NTree := NTree.ofString "1010000010000"
theorem k_r22221330 : nChk 8 14 kAi kCi kL t_r22221330 896 960 15744 15808 = some 0 := by
  decide +kernel

def t_r22221331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22221331 : nChk 8 14 kAi kCi kL t_r22221331 960 1024 15744 15808 = some 0 := by
  decide +kernel

def t_r22221332 : NTree := NTree.ofString "1010000010000"
theorem k_r22221332 : nChk 8 14 kAi kCi kL t_r22221332 896 960 15808 15872 = some 0 := by
  decide +kernel

def t_r22221333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22221333 : nChk 8 14 kAi kCi kL t_r22221333 960 1024 15808 15872 = some 0 := by
  decide +kernel

def t_r2222133 : NTree := .node t_r22221330 t_r22221331 t_r22221332 t_r22221333
theorem k_r2222133 : nChk 8 14 kAi kCi kL t_r2222133 896 1024 15744 15872 = some 0 :=
  nChk_node rfl rfl k_r22221330 k_r22221331 k_r22221332 k_r22221333 rfl

def t_r222213 : NTree := .node t_r2222130 t_r2222131 t_r2222132 t_r2222133
theorem k_r222213 : nChk 8 14 kAi kCi kL t_r222213 768 1024 15616 15872 = some 2865819160514378242738618368 :=
  nChk_node rfl rfl k_r2222130 k_r2222131 k_r2222132 k_r2222133 rfl

end ChargeKernel.Pt900
