/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `000033` (388 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0000330000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330000 : nChk 8 14 kAi kCi kL t_r0000330000 768 784 768 784 = some 97674371902990031643475968 := by
  decide +kernel

def t_r0000330001 : NTree := NTree.ofString "10000"
theorem k_r0000330001 : nChk 8 14 kAi kCi kL t_r0000330001 784 800 768 784 = some 40065911346973230734770176 := by
  decide +kernel

def t_r0000330002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330002 : nChk 8 14 kAi kCi kL t_r0000330002 768 784 784 800 = some 90363210384122648148836352 := by
  decide +kernel

def t_r0000330003 : NTree := NTree.ofString "10000"
theorem k_r0000330003 : nChk 8 14 kAi kCi kL t_r0000330003 784 800 784 800 = some 38188354321254195614711808 := by
  decide +kernel

def t_r000033000 : NTree := .node t_r0000330000 t_r0000330001 t_r0000330002 t_r0000330003
theorem k_r000033000 : nChk 8 14 kAi kCi kL t_r000033000 768 800 768 800 = some 266291847955340106141794304 :=
  nChk_node rfl rfl k_r0000330000 k_r0000330001 k_r0000330002 k_r0000330003 rfl

def t_r000033001 : NTree := NTree.ofString "10000"
theorem k_r000033001 : nChk 8 14 kAi kCi kL t_r000033001 800 832 768 800 = some 5010009157284383617449984 := by
  decide +kernel

def t_r0000330020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330020 : nChk 8 14 kAi kCi kL t_r0000330020 768 784 800 816 = some 83055440217638062899855360 := by
  decide +kernel

def t_r0000330021 : NTree := NTree.ofString "10000"
theorem k_r0000330021 : nChk 8 14 kAi kCi kL t_r0000330021 784 800 800 816 = some 36855138843670538851713024 := by
  decide +kernel

def t_r0000330022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330022 : nChk 8 14 kAi kCi kL t_r0000330022 768 784 816 832 = some 77529688130960440600559616 := by
  decide +kernel

def t_r0000330023 : NTree := NTree.ofString "10000"
theorem k_r0000330023 : nChk 8 14 kAi kCi kL t_r0000330023 784 800 816 832 = some 35811140066585784990302208 := by
  decide +kernel

def t_r000033002 : NTree := .node t_r0000330020 t_r0000330021 t_r0000330022 t_r0000330023
theorem k_r000033002 : nChk 8 14 kAi kCi kL t_r000033002 768 800 800 832 = some 233251407258854827342430208 :=
  nChk_node rfl rfl k_r0000330020 k_r0000330021 k_r0000330022 k_r0000330023 rfl

def t_r000033003 : NTree := NTree.ofString "10000"
theorem k_r000033003 : nChk 8 14 kAi kCi kL t_r000033003 800 832 800 832 = some 3382379428915071191875584 := by
  decide +kernel

def t_r00003300 : NTree := .node t_r000033000 t_r000033001 t_r000033002 t_r000033003
theorem k_r00003300 : nChk 8 14 kAi kCi kL t_r00003300 768 832 768 832 = some 507935643800394388293550080 :=
  nChk_node rfl rfl k_r000033000 k_r000033001 k_r000033002 k_r000033003 rfl

def t_r00003301 : NTree := NTree.ofString "0"
theorem k_r00003301 : nChk 8 14 kAi kCi kL t_r00003301 832 896 768 832 = some 0 := by
  decide +kernel

def t_r0000330200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330200 : nChk 8 14 kAi kCi kL t_r0000330200 768 784 832 848 = some 72801752156769817165037568 := by
  decide +kernel

def t_r0000330201 : NTree := NTree.ofString "10000"
theorem k_r0000330201 : nChk 8 14 kAi kCi kL t_r0000330201 784 800 832 848 = some 34695610364417926408175616 := by
  decide +kernel

def t_r0000330202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330202 : nChk 8 14 kAi kCi kL t_r0000330202 768 784 848 864 = some 67881362155090311364214784 := by
  decide +kernel

def t_r0000330203 : NTree := NTree.ofString "10000"
theorem k_r0000330203 : nChk 8 14 kAi kCi kL t_r0000330203 784 800 848 864 = some 33509614280032482433695744 := by
  decide +kernel

def t_r000033020 : NTree := .node t_r0000330200 t_r0000330201 t_r0000330202 t_r0000330203
theorem k_r000033020 : nChk 8 14 kAi kCi kL t_r000033020 768 800 832 864 = some 208888338956310537371123712 :=
  nChk_node rfl rfl k_r0000330200 k_r0000330201 k_r0000330202 k_r0000330203 rfl

def t_r000033021 : NTree := NTree.ofString "10000"
theorem k_r000033021 : nChk 8 14 kAi kCi kL t_r000033021 800 832 832 864 = some 734733239995099137441792 := by
  decide +kernel

def t_r0000330220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330220 : nChk 8 14 kAi kCi kL t_r0000330220 768 784 864 880 = some 62769737279614449969266688 := by
  decide +kernel

def t_r0000330221 : NTree := NTree.ofString "10000"
theorem k_r0000330221 : nChk 8 14 kAi kCi kL t_r0000330221 784 800 864 880 = some 32253792657642029378961408 := by
  decide +kernel

def t_r0000330222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000330222 : nChk 8 14 kAi kCi kL t_r0000330222 768 784 880 896 = some 58002274247322309985566720 := by
  decide +kernel

def t_r0000330223 : NTree := NTree.ofString "10000"
theorem k_r0000330223 : nChk 8 14 kAi kCi kL t_r0000330223 784 800 880 896 = some 30928786341459143556071424 := by
  decide +kernel

def t_r000033022 : NTree := .node t_r0000330220 t_r0000330221 t_r0000330222 t_r0000330223
theorem k_r000033022 : nChk 8 14 kAi kCi kL t_r000033022 768 800 864 896 = some 183954590526037932889866240 :=
  nChk_node rfl rfl k_r0000330220 k_r0000330221 k_r0000330222 k_r0000330223 rfl

def t_r000033023 : NTree := NTree.ofString "10000"
theorem k_r000033023 : nChk 8 14 kAi kCi kL t_r000033023 800 832 864 896 = some 0 := by
  decide +kernel

def t_r00003302 : NTree := .node t_r000033020 t_r000033021 t_r000033022 t_r000033023
theorem k_r00003302 : nChk 8 14 kAi kCi kL t_r00003302 768 832 832 896 = some 393577662722343569398431744 :=
  nChk_node rfl rfl k_r000033020 k_r000033021 k_r000033022 k_r000033023 rfl

def t_r00003303 : NTree := NTree.ofString "0"
theorem k_r00003303 : nChk 8 14 kAi kCi kL t_r00003303 832 896 832 896 = some 0 := by
  decide +kernel

def t_r0000330 : NTree := .node t_r00003300 t_r00003301 t_r00003302 t_r00003303
theorem k_r0000330 : nChk 8 14 kAi kCi kL t_r0000330 768 896 768 896 = some 901513306522737957691981824 :=
  nChk_node rfl rfl k_r00003300 k_r00003301 k_r00003302 k_r00003303 rfl

def t_r0000331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000331 : nChk 8 14 kAi kCi kL t_r0000331 896 1024 768 896 = some 0 := by
  decide +kernel

def t_r0000332000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332000 : nChk 8 14 kAi kCi kL t_r0000332000 768 784 896 912 = some 53442818955256932404822016 := by
  decide +kernel

def t_r0000332001 : NTree := NTree.ofString "10000"
theorem k_r0000332001 : nChk 8 14 kAi kCi kL t_r0000332001 784 800 896 912 = some 29535538060986623176212480 := by
  decide +kernel

def t_r0000332002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332002 : nChk 8 14 kAi kCi kL t_r0000332002 768 784 912 928 = some 48767627430786013631348736 := by
  decide +kernel

def t_r0000332003 : NTree := NTree.ofString "10000"
theorem k_r0000332003 : nChk 8 14 kAi kCi kL t_r0000332003 784 800 912 928 = some 28074572143307485222010880 := by
  decide +kernel

def t_r000033200 : NTree := .node t_r0000332000 t_r0000332001 t_r0000332002 t_r0000332003
theorem k_r000033200 : nChk 8 14 kAi kCi kL t_r000033200 768 800 896 928 = some 159820556590337054434394112 :=
  nChk_node rfl rfl k_r0000332000 k_r0000332001 k_r0000332002 k_r0000332003 rfl

def t_r000033201 : NTree := NTree.ofString "10000"
theorem k_r000033201 : nChk 8 14 kAi kCi kL t_r000033201 800 832 896 928 = some 0 := by
  decide +kernel

def t_r0000332020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332020 : nChk 8 14 kAi kCi kL t_r0000332020 768 784 928 944 = some 44559475999610824267137024 := by
  decide +kernel

def t_r0000332021 : NTree := NTree.ofString "10000"
theorem k_r0000332021 : nChk 8 14 kAi kCi kL t_r0000332021 784 800 928 944 = some 26546481766535849916235776 := by
  decide +kernel

def t_r0000332022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332022 : nChk 8 14 kAi kCi kL t_r0000332022 768 784 944 960 = some 40425988722088895129321472 := by
  decide +kernel

def t_r0000332023 : NTree := NTree.ofString "10000"
theorem k_r0000332023 : nChk 8 14 kAi kCi kL t_r0000332023 784 800 944 960 = some 24952087846811794352898048 := by
  decide +kernel

def t_r000033202 : NTree := .node t_r0000332020 t_r0000332021 t_r0000332022 t_r0000332023
theorem k_r000033202 : nChk 8 14 kAi kCi kL t_r000033202 768 800 928 960 = some 136484034335047363665592320 :=
  nChk_node rfl rfl k_r0000332020 k_r0000332021 k_r0000332022 k_r0000332023 rfl

def t_r000033203 : NTree := NTree.ofString "10000"
theorem k_r000033203 : nChk 8 14 kAi kCi kL t_r000033203 800 832 928 960 = some 0 := by
  decide +kernel

def t_r00003320 : NTree := .node t_r000033200 t_r000033201 t_r000033202 t_r000033203
theorem k_r00003320 : nChk 8 14 kAi kCi kL t_r00003320 768 832 896 960 = some 296304590925384418099986432 :=
  nChk_node rfl rfl k_r000033200 k_r000033201 k_r000033202 k_r000033203 rfl

def t_r00003321 : NTree := NTree.ofString "0"
theorem k_r00003321 : nChk 8 14 kAi kCi kL t_r00003321 832 896 896 960 = some 0 := by
  decide +kernel

def t_r0000332200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332200 : nChk 8 14 kAi kCi kL t_r0000332200 768 784 960 976 = some 36384964461206941691019264 := by
  decide +kernel

def t_r0000332201 : NTree := NTree.ofString "10000"
theorem k_r0000332201 : nChk 8 14 kAi kCi kL t_r0000332201 784 800 960 976 = some 23291782305389290822041600 := by
  decide +kernel

def t_r0000332202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332202 : nChk 8 14 kAi kCi kL t_r0000332202 768 784 976 992 = some 33082787735284869098373120 := by
  decide +kernel

def t_r0000332203 : NTree := NTree.ofString "10000"
theorem k_r0000332203 : nChk 8 14 kAi kCi kL t_r0000332203 784 800 976 992 = some 21565962359755473401413632 := by
  decide +kernel

def t_r000033220 : NTree := .node t_r0000332200 t_r0000332201 t_r0000332202 t_r0000332203
theorem k_r000033220 : nChk 8 14 kAi kCi kL t_r000033220 768 800 960 992 = some 114325496861636575012847616 :=
  nChk_node rfl rfl k_r0000332200 k_r0000332201 k_r0000332202 k_r0000332203 rfl

def t_r000033221 : NTree := NTree.ofString "10000"
theorem k_r000033221 : nChk 8 14 kAi kCi kL t_r000033221 800 832 960 992 = some 0 := by
  decide +kernel

def t_r0000332220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332220 : nChk 8 14 kAi kCi kL t_r0000332220 768 784 992 1008 = some 29759710370945723082473472 := by
  decide +kernel

def t_r0000332221 : NTree := NTree.ofString "10000"
theorem k_r0000332221 : nChk 8 14 kAi kCi kL t_r0000332221 784 800 992 1008 = some 19775385371252477732585472 := by
  decide +kernel

def t_r0000332222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000332222 : nChk 8 14 kAi kCi kL t_r0000332222 768 784 1008 1024 = some 26346566994839472294592512 := by
  decide +kernel

def t_r0000332223 : NTree := NTree.ofString "10000"
theorem k_r0000332223 : nChk 8 14 kAi kCi kL t_r0000332223 784 800 1008 1024 = some 17920411483735305379381248 := by
  decide +kernel

def t_r000033222 : NTree := .node t_r0000332220 t_r0000332221 t_r0000332222 t_r0000332223
theorem k_r000033222 : nChk 8 14 kAi kCi kL t_r000033222 768 800 992 1024 = some 93802074220772978489032704 :=
  nChk_node rfl rfl k_r0000332220 k_r0000332221 k_r0000332222 k_r0000332223 rfl

def t_r000033223 : NTree := NTree.ofString "10000"
theorem k_r000033223 : nChk 8 14 kAi kCi kL t_r000033223 800 832 992 1024 = some 0 := by
  decide +kernel

def t_r00003322 : NTree := .node t_r000033220 t_r000033221 t_r000033222 t_r000033223
theorem k_r00003322 : nChk 8 14 kAi kCi kL t_r00003322 768 832 960 1024 = some 208127571082409553501880320 :=
  nChk_node rfl rfl k_r000033220 k_r000033221 k_r000033222 k_r000033223 rfl

def t_r00003323 : NTree := NTree.ofString "0"
theorem k_r00003323 : nChk 8 14 kAi kCi kL t_r00003323 832 896 960 1024 = some 0 := by
  decide +kernel

def t_r0000332 : NTree := .node t_r00003320 t_r00003321 t_r00003322 t_r00003323
theorem k_r0000332 : nChk 8 14 kAi kCi kL t_r0000332 768 896 896 1024 = some 504432162007793971601866752 :=
  nChk_node rfl rfl k_r00003320 k_r00003321 k_r00003322 k_r00003323 rfl

def t_r0000333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0000333 : nChk 8 14 kAi kCi kL t_r0000333 896 1024 896 1024 = some 0 := by
  decide +kernel

def t_r000033 : NTree := .node t_r0000330 t_r0000331 t_r0000332 t_r0000333
theorem k_r000033 : nChk 8 14 kAi kCi kL t_r000033 768 1024 768 1024 = some 1405945468530531929293848576 :=
  nChk_node rfl rfl k_r0000330 k_r0000331 k_r0000332 k_r0000333 rfl

end ChargeKernel.Pt900
