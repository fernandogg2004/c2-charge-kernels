/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `222211` (388 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2222110000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110000 : nChk 8 14 kAi kCi kL t_r2222110000 768 784 15360 15376 = some 26346566994839472294592512 := by
  decide +kernel

def t_r2222110001 : NTree := NTree.ofString "10000"
theorem k_r2222110001 : nChk 8 14 kAi kCi kL t_r2222110001 784 800 15360 15376 = some 17920411483735305379381248 := by
  decide +kernel

def t_r2222110002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110002 : nChk 8 14 kAi kCi kL t_r2222110002 768 784 15376 15392 = some 29759710370945723082473472 := by
  decide +kernel

def t_r2222110003 : NTree := NTree.ofString "10000"
theorem k_r2222110003 : nChk 8 14 kAi kCi kL t_r2222110003 784 800 15376 15392 = some 19775385371252477732585472 := by
  decide +kernel

def t_r222211000 : NTree := .node t_r2222110000 t_r2222110001 t_r2222110002 t_r2222110003
theorem k_r222211000 : nChk 8 14 kAi kCi kL t_r222211000 768 800 15360 15392 = some 93802074220772978489032704 :=
  nChk_node rfl rfl k_r2222110000 k_r2222110001 k_r2222110002 k_r2222110003 rfl

def t_r222211001 : NTree := NTree.ofString "10000"
theorem k_r222211001 : nChk 8 14 kAi kCi kL t_r222211001 800 832 15360 15392 = some 0 := by
  decide +kernel

def t_r2222110020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110020 : nChk 8 14 kAi kCi kL t_r2222110020 768 784 15392 15408 = some 33082787735284869098373120 := by
  decide +kernel

def t_r2222110021 : NTree := NTree.ofString "10000"
theorem k_r2222110021 : nChk 8 14 kAi kCi kL t_r2222110021 784 800 15392 15408 = some 21565962359755473401413632 := by
  decide +kernel

def t_r2222110022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110022 : nChk 8 14 kAi kCi kL t_r2222110022 768 784 15408 15424 = some 36384964461206941691019264 := by
  decide +kernel

def t_r2222110023 : NTree := NTree.ofString "10000"
theorem k_r2222110023 : nChk 8 14 kAi kCi kL t_r2222110023 784 800 15408 15424 = some 23291782305389290822041600 := by
  decide +kernel

def t_r222211002 : NTree := .node t_r2222110020 t_r2222110021 t_r2222110022 t_r2222110023
theorem k_r222211002 : nChk 8 14 kAi kCi kL t_r222211002 768 800 15392 15424 = some 114325496861636575012847616 :=
  nChk_node rfl rfl k_r2222110020 k_r2222110021 k_r2222110022 k_r2222110023 rfl

def t_r222211003 : NTree := NTree.ofString "10000"
theorem k_r222211003 : nChk 8 14 kAi kCi kL t_r222211003 800 832 15392 15424 = some 0 := by
  decide +kernel

def t_r22221100 : NTree := .node t_r222211000 t_r222211001 t_r222211002 t_r222211003
theorem k_r22221100 : nChk 8 14 kAi kCi kL t_r22221100 768 832 15360 15424 = some 208127571082409553501880320 :=
  nChk_node rfl rfl k_r222211000 k_r222211001 k_r222211002 k_r222211003 rfl

def t_r22221101 : NTree := NTree.ofString "0"
theorem k_r22221101 : nChk 8 14 kAi kCi kL t_r22221101 832 896 15360 15424 = some 0 := by
  decide +kernel

def t_r2222110200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110200 : nChk 8 14 kAi kCi kL t_r2222110200 768 784 15424 15440 = some 40425988722088895129321472 := by
  decide +kernel

def t_r2222110201 : NTree := NTree.ofString "10000"
theorem k_r2222110201 : nChk 8 14 kAi kCi kL t_r2222110201 784 800 15424 15440 = some 24952087846811794352898048 := by
  decide +kernel

def t_r2222110202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110202 : nChk 8 14 kAi kCi kL t_r2222110202 768 784 15440 15456 = some 44559475999610824267137024 := by
  decide +kernel

def t_r2222110203 : NTree := NTree.ofString "10000"
theorem k_r2222110203 : nChk 8 14 kAi kCi kL t_r2222110203 784 800 15440 15456 = some 26546481766535849916235776 := by
  decide +kernel

def t_r222211020 : NTree := .node t_r2222110200 t_r2222110201 t_r2222110202 t_r2222110203
theorem k_r222211020 : nChk 8 14 kAi kCi kL t_r222211020 768 800 15424 15456 = some 136484034335047363665592320 :=
  nChk_node rfl rfl k_r2222110200 k_r2222110201 k_r2222110202 k_r2222110203 rfl

def t_r222211021 : NTree := NTree.ofString "10000"
theorem k_r222211021 : nChk 8 14 kAi kCi kL t_r222211021 800 832 15424 15456 = some 0 := by
  decide +kernel

def t_r2222110220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110220 : nChk 8 14 kAi kCi kL t_r2222110220 768 784 15456 15472 = some 48767627430786013631348736 := by
  decide +kernel

def t_r2222110221 : NTree := NTree.ofString "10000"
theorem k_r2222110221 : nChk 8 14 kAi kCi kL t_r2222110221 784 800 15456 15472 = some 28074572143307485222010880 := by
  decide +kernel

def t_r2222110222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222110222 : nChk 8 14 kAi kCi kL t_r2222110222 768 784 15472 15488 = some 53442818955256932404822016 := by
  decide +kernel

def t_r2222110223 : NTree := NTree.ofString "10000"
theorem k_r2222110223 : nChk 8 14 kAi kCi kL t_r2222110223 784 800 15472 15488 = some 29535538060986623176212480 := by
  decide +kernel

def t_r222211022 : NTree := .node t_r2222110220 t_r2222110221 t_r2222110222 t_r2222110223
theorem k_r222211022 : nChk 8 14 kAi kCi kL t_r222211022 768 800 15456 15488 = some 159820556590337054434394112 :=
  nChk_node rfl rfl k_r2222110220 k_r2222110221 k_r2222110222 k_r2222110223 rfl

def t_r222211023 : NTree := NTree.ofString "10000"
theorem k_r222211023 : nChk 8 14 kAi kCi kL t_r222211023 800 832 15456 15488 = some 0 := by
  decide +kernel

def t_r22221102 : NTree := .node t_r222211020 t_r222211021 t_r222211022 t_r222211023
theorem k_r22221102 : nChk 8 14 kAi kCi kL t_r22221102 768 832 15424 15488 = some 296304590925384418099986432 :=
  nChk_node rfl rfl k_r222211020 k_r222211021 k_r222211022 k_r222211023 rfl

def t_r22221103 : NTree := NTree.ofString "0"
theorem k_r22221103 : nChk 8 14 kAi kCi kL t_r22221103 832 896 15424 15488 = some 0 := by
  decide +kernel

def t_r2222110 : NTree := .node t_r22221100 t_r22221101 t_r22221102 t_r22221103
theorem k_r2222110 : nChk 8 14 kAi kCi kL t_r2222110 768 896 15360 15488 = some 504432162007793971601866752 :=
  nChk_node rfl rfl k_r22221100 k_r22221101 k_r22221102 k_r22221103 rfl

def t_r2222111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222111 : nChk 8 14 kAi kCi kL t_r2222111 896 1024 15360 15488 = some 0 := by
  decide +kernel

def t_r2222112000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112000 : nChk 8 14 kAi kCi kL t_r2222112000 768 784 15488 15504 = some 58002274247322309985566720 := by
  decide +kernel

def t_r2222112001 : NTree := NTree.ofString "10000"
theorem k_r2222112001 : nChk 8 14 kAi kCi kL t_r2222112001 784 800 15488 15504 = some 30928786341459143556071424 := by
  decide +kernel

def t_r2222112002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112002 : nChk 8 14 kAi kCi kL t_r2222112002 768 784 15504 15520 = some 62769737279614449969266688 := by
  decide +kernel

def t_r2222112003 : NTree := NTree.ofString "10000"
theorem k_r2222112003 : nChk 8 14 kAi kCi kL t_r2222112003 784 800 15504 15520 = some 32253792657642029378961408 := by
  decide +kernel

def t_r222211200 : NTree := .node t_r2222112000 t_r2222112001 t_r2222112002 t_r2222112003
theorem k_r222211200 : nChk 8 14 kAi kCi kL t_r222211200 768 800 15488 15520 = some 183954590526037932889866240 :=
  nChk_node rfl rfl k_r2222112000 k_r2222112001 k_r2222112002 k_r2222112003 rfl

def t_r222211201 : NTree := NTree.ofString "10000"
theorem k_r222211201 : nChk 8 14 kAi kCi kL t_r222211201 800 832 15488 15520 = some 0 := by
  decide +kernel

def t_r2222112020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112020 : nChk 8 14 kAi kCi kL t_r2222112020 768 784 15520 15536 = some 67881362155090311364214784 := by
  decide +kernel

def t_r2222112021 : NTree := NTree.ofString "10000"
theorem k_r2222112021 : nChk 8 14 kAi kCi kL t_r2222112021 784 800 15520 15536 = some 33509614280032482433695744 := by
  decide +kernel

def t_r2222112022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112022 : nChk 8 14 kAi kCi kL t_r2222112022 768 784 15536 15552 = some 72801752156769817165037568 := by
  decide +kernel

def t_r2222112023 : NTree := NTree.ofString "10000"
theorem k_r2222112023 : nChk 8 14 kAi kCi kL t_r2222112023 784 800 15536 15552 = some 34695610364417926408175616 := by
  decide +kernel

def t_r222211202 : NTree := .node t_r2222112020 t_r2222112021 t_r2222112022 t_r2222112023
theorem k_r222211202 : nChk 8 14 kAi kCi kL t_r222211202 768 800 15520 15552 = some 208888338956310537371123712 :=
  nChk_node rfl rfl k_r2222112020 k_r2222112021 k_r2222112022 k_r2222112023 rfl

def t_r222211203 : NTree := NTree.ofString "10000"
theorem k_r222211203 : nChk 8 14 kAi kCi kL t_r222211203 800 832 15520 15552 = some 734733239995099137441792 := by
  decide +kernel

def t_r22221120 : NTree := .node t_r222211200 t_r222211201 t_r222211202 t_r222211203
theorem k_r22221120 : nChk 8 14 kAi kCi kL t_r22221120 768 832 15488 15552 = some 393577662722343569398431744 :=
  nChk_node rfl rfl k_r222211200 k_r222211201 k_r222211202 k_r222211203 rfl

def t_r22221121 : NTree := NTree.ofString "0"
theorem k_r22221121 : nChk 8 14 kAi kCi kL t_r22221121 832 896 15488 15552 = some 0 := by
  decide +kernel

def t_r2222112200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112200 : nChk 8 14 kAi kCi kL t_r2222112200 768 784 15552 15568 = some 77529688130960440600559616 := by
  decide +kernel

def t_r2222112201 : NTree := NTree.ofString "10000"
theorem k_r2222112201 : nChk 8 14 kAi kCi kL t_r2222112201 784 800 15552 15568 = some 35811140066585784990302208 := by
  decide +kernel

def t_r2222112202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112202 : nChk 8 14 kAi kCi kL t_r2222112202 768 784 15568 15584 = some 83055440217638062899855360 := by
  decide +kernel

def t_r2222112203 : NTree := NTree.ofString "10000"
theorem k_r2222112203 : nChk 8 14 kAi kCi kL t_r2222112203 784 800 15568 15584 = some 36855138843670538851713024 := by
  decide +kernel

def t_r222211220 : NTree := .node t_r2222112200 t_r2222112201 t_r2222112202 t_r2222112203
theorem k_r222211220 : nChk 8 14 kAi kCi kL t_r222211220 768 800 15552 15584 = some 233251407258854827342430208 :=
  nChk_node rfl rfl k_r2222112200 k_r2222112201 k_r2222112202 k_r2222112203 rfl

def t_r222211221 : NTree := NTree.ofString "10000"
theorem k_r222211221 : nChk 8 14 kAi kCi kL t_r222211221 800 832 15552 15584 = some 3382379428915071191875584 := by
  decide +kernel

def t_r2222112220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112220 : nChk 8 14 kAi kCi kL t_r2222112220 768 784 15584 15600 = some 90363210384122648148836352 := by
  decide +kernel

def t_r2222112221 : NTree := NTree.ofString "10000"
theorem k_r2222112221 : nChk 8 14 kAi kCi kL t_r2222112221 784 800 15584 15600 = some 38188354321254195614711808 := by
  decide +kernel

def t_r2222112222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222112222 : nChk 8 14 kAi kCi kL t_r2222112222 768 784 15600 15616 = some 97674371902990031643475968 := by
  decide +kernel

def t_r2222112223 : NTree := NTree.ofString "10000"
theorem k_r2222112223 : nChk 8 14 kAi kCi kL t_r2222112223 784 800 15600 15616 = some 40065911346973230734770176 := by
  decide +kernel

def t_r222211222 : NTree := .node t_r2222112220 t_r2222112221 t_r2222112222 t_r2222112223
theorem k_r222211222 : nChk 8 14 kAi kCi kL t_r222211222 768 800 15584 15616 = some 266291847955340106141794304 :=
  nChk_node rfl rfl k_r2222112220 k_r2222112221 k_r2222112222 k_r2222112223 rfl

def t_r222211223 : NTree := NTree.ofString "10000"
theorem k_r222211223 : nChk 8 14 kAi kCi kL t_r222211223 800 832 15584 15616 = some 5010009157284383617449984 := by
  decide +kernel

def t_r22221122 : NTree := .node t_r222211220 t_r222211221 t_r222211222 t_r222211223
theorem k_r22221122 : nChk 8 14 kAi kCi kL t_r22221122 768 832 15552 15616 = some 507935643800394388293550080 :=
  nChk_node rfl rfl k_r222211220 k_r222211221 k_r222211222 k_r222211223 rfl

def t_r22221123 : NTree := NTree.ofString "0"
theorem k_r22221123 : nChk 8 14 kAi kCi kL t_r22221123 832 896 15552 15616 = some 0 := by
  decide +kernel

def t_r2222112 : NTree := .node t_r22221120 t_r22221121 t_r22221122 t_r22221123
theorem k_r2222112 : nChk 8 14 kAi kCi kL t_r2222112 768 896 15488 15616 = some 901513306522737957691981824 :=
  nChk_node rfl rfl k_r22221120 k_r22221121 k_r22221122 k_r22221123 rfl

def t_r2222113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2222113 : nChk 8 14 kAi kCi kL t_r2222113 896 1024 15488 15616 = some 0 := by
  decide +kernel

def t_r222211 : NTree := .node t_r2222110 t_r2222111 t_r2222112 t_r2222113
theorem k_r222211 : nChk 8 14 kAi kCi kL t_r222211 768 1024 15360 15616 = some 1405945468530531929293848576 :=
  nChk_node rfl rfl k_r2222110 k_r2222111 k_r2222112 k_r2222113 rfl

end ChargeKernel.Pt900
