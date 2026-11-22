/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022031` (592 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022031000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031000 : nChk 8 14 kAi kCi kL t_r022031000 768 800 6656 6688 = some 195654333662679845170053120 := by
  decide +kernel

def t_r022031001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031001 : nChk 8 14 kAi kCi kL t_r022031001 800 832 6656 6688 = some 12089351889032939562860544 := by
  decide +kernel

def t_r022031002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031002 : nChk 8 14 kAi kCi kL t_r022031002 768 800 6688 6720 = some 187253745318595641370214400 := by
  decide +kernel

def t_r022031003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031003 : nChk 8 14 kAi kCi kL t_r022031003 800 832 6688 6720 = some 8838629304515732220936192 := by
  decide +kernel

def t_r02203100 : NTree := .node t_r022031000 t_r022031001 t_r022031002 t_r022031003
theorem k_r02203100 : nChk 8 14 kAi kCi kL t_r02203100 768 832 6656 6720 = some 403836060174824158324064256 :=
  nChk_node rfl rfl k_r022031000 k_r022031001 k_r022031002 k_r022031003 rfl

def t_r022031010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031010 : nChk 8 14 kAi kCi kL t_r022031010 832 864 6656 6688 = some 0 := by
  decide +kernel

def t_r022031011 : NTree := NTree.ofString "1100000100000"
theorem k_r022031011 : nChk 8 14 kAi kCi kL t_r022031011 864 896 6656 6688 = some 18272425512747134022057984 := by
  decide +kernel

def t_r022031012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031012 : nChk 8 14 kAi kCi kL t_r022031012 832 864 6688 6720 = some 0 := by
  decide +kernel

def t_r022031013 : NTree := NTree.ofString "1100000100000"
theorem k_r022031013 : nChk 8 14 kAi kCi kL t_r022031013 864 896 6688 6720 = some 13286300853812938149986304 := by
  decide +kernel

def t_r02203101 : NTree := .node t_r022031010 t_r022031011 t_r022031012 t_r022031013
theorem k_r02203101 : nChk 8 14 kAi kCi kL t_r02203101 832 896 6656 6720 = some 31558726366560072172044288 :=
  nChk_node rfl rfl k_r022031010 k_r022031011 k_r022031012 k_r022031013 rfl

def t_r022031020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031020 : nChk 8 14 kAi kCi kL t_r022031020 768 800 6720 6752 = some 178893567287579073274970112 := by
  decide +kernel

def t_r022031021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031021 : nChk 8 14 kAi kCi kL t_r022031021 800 832 6720 6752 = some 6124952923126322788564992 := by
  decide +kernel

def t_r022031022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031022 : nChk 8 14 kAi kCi kL t_r022031022 768 800 6752 6784 = some 170963321900196118740860928 := by
  decide +kernel

def t_r022031023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031023 : nChk 8 14 kAi kCi kL t_r022031023 800 832 6752 6784 = some 5138545709702021583470592 := by
  decide +kernel

def t_r02203102 : NTree := .node t_r022031020 t_r022031021 t_r022031022 t_r022031023
theorem k_r02203102 : nChk 8 14 kAi kCi kL t_r02203102 768 832 6720 6784 = some 361120387820603536387866624 :=
  nChk_node rfl rfl k_r022031020 k_r022031021 k_r022031022 k_r022031023 rfl

def t_r022031030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031030 : nChk 8 14 kAi kCi kL t_r022031030 832 864 6720 6752 = some 0 := by
  decide +kernel

def t_r022031031 : NTree := NTree.ofString "1100000100000"
theorem k_r022031031 : nChk 8 14 kAi kCi kL t_r022031031 864 896 6720 6752 = some 9429274738320709898993664 := by
  decide +kernel

def t_r022031032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031032 : nChk 8 14 kAi kCi kL t_r022031032 832 864 6752 6784 = some 0 := by
  decide +kernel

def t_r022031033 : NTree := NTree.ofString "1100000100000"
theorem k_r022031033 : nChk 8 14 kAi kCi kL t_r022031033 864 896 6752 6784 = some 5170859000999607873306624 := by
  decide +kernel

def t_r02203103 : NTree := .node t_r022031030 t_r022031031 t_r022031032 t_r022031033
theorem k_r02203103 : nChk 8 14 kAi kCi kL t_r02203103 832 896 6720 6784 = some 14600133739320317772300288 :=
  nChk_node rfl rfl k_r022031030 k_r022031031 k_r022031032 k_r022031033 rfl

def t_r0220310 : NTree := .node t_r02203100 t_r02203101 t_r02203102 t_r02203103
theorem k_r0220310 : nChk 8 14 kAi kCi kL t_r0220310 768 896 6656 6784 = some 811115308101308084656275456 :=
  nChk_node rfl rfl k_r02203100 k_r02203101 k_r02203102 k_r02203103 rfl

def t_r02203110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203110 : nChk 8 14 kAi kCi kL t_r02203110 896 960 6656 6720 = some 0 := by
  decide +kernel

def t_r02203111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203111 : nChk 8 14 kAi kCi kL t_r02203111 960 1024 6656 6720 = some 0 := by
  decide +kernel

def t_r02203112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203112 : nChk 8 14 kAi kCi kL t_r02203112 896 960 6720 6784 = some 0 := by
  decide +kernel

def t_r02203113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203113 : nChk 8 14 kAi kCi kL t_r02203113 960 1024 6720 6784 = some 0 := by
  decide +kernel

def t_r0220311 : NTree := .node t_r02203110 t_r02203111 t_r02203112 t_r02203113
theorem k_r0220311 : nChk 8 14 kAi kCi kL t_r0220311 896 1024 6656 6784 = some 0 :=
  nChk_node rfl rfl k_r02203110 k_r02203111 k_r02203112 k_r02203113 rfl

def t_r022031200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031200 : nChk 8 14 kAi kCi kL t_r022031200 768 800 6784 6816 = some 162669493294804974553792512 := by
  decide +kernel

def t_r022031201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031201 : nChk 8 14 kAi kCi kL t_r022031201 800 832 6784 6816 = some 3981189060182140143009792 := by
  decide +kernel

def t_r022031202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031202 : nChk 8 14 kAi kCi kL t_r022031202 768 800 6816 6848 = some 155368863943565755602173952 := by
  decide +kernel

def t_r022031203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031203 : nChk 8 14 kAi kCi kL t_r022031203 800 832 6816 6848 = some 2463612895186955054088192 := by
  decide +kernel

def t_r02203120 : NTree := .node t_r022031200 t_r022031201 t_r022031202 t_r022031203
theorem k_r02203120 : nChk 8 14 kAi kCi kL t_r02203120 768 832 6784 6848 = some 324483159193739825353064448 :=
  nChk_node rfl rfl k_r022031200 k_r022031201 k_r022031202 k_r022031203 rfl

def t_r022031210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031210 : nChk 8 14 kAi kCi kL t_r022031210 832 864 6784 6816 = some 0 := by
  decide +kernel

def t_r022031211 : NTree := NTree.ofString "1100000100000"
theorem k_r022031211 : nChk 8 14 kAi kCi kL t_r022031211 864 896 6784 6816 = some 807996357581281607811072 := by
  decide +kernel

def t_r022031212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031212 : nChk 8 14 kAi kCi kL t_r022031212 832 864 6816 6848 = some 0 := by
  decide +kernel

def t_r022031213 : NTree := NTree.ofString "1100000100000"
theorem k_r022031213 : nChk 8 14 kAi kCi kL t_r022031213 864 896 6816 6848 = some 0 := by
  decide +kernel

def t_r02203121 : NTree := .node t_r022031210 t_r022031211 t_r022031212 t_r022031213
theorem k_r02203121 : nChk 8 14 kAi kCi kL t_r02203121 832 896 6784 6848 = some 807996357581281607811072 :=
  nChk_node rfl rfl k_r022031210 k_r022031211 k_r022031212 k_r022031213 rfl

def t_r022031220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031220 : nChk 8 14 kAi kCi kL t_r022031220 768 800 6848 6880 = some 146835095925920087402348544 := by
  decide +kernel

def t_r022031221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031221 : nChk 8 14 kAi kCi kL t_r022031221 800 832 6848 6880 = some 636476009168138869407744 := by
  decide +kernel

def t_r022031222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031222 : nChk 8 14 kAi kCi kL t_r022031222 768 800 6880 6912 = some 138945913152974796915474432 := by
  decide +kernel

def t_r022031223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031223 : nChk 8 14 kAi kCi kL t_r022031223 800 832 6880 6912 = some 0 := by
  decide +kernel

def t_r02203122 : NTree := .node t_r022031220 t_r022031221 t_r022031222 t_r022031223
theorem k_r02203122 : nChk 8 14 kAi kCi kL t_r02203122 768 832 6848 6912 = some 286417485088063023187230720 :=
  nChk_node rfl rfl k_r022031220 k_r022031221 k_r022031222 k_r022031223 rfl

def t_r022031230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031230 : nChk 8 14 kAi kCi kL t_r022031230 832 864 6848 6880 = some 0 := by
  decide +kernel

def t_r022031231 : NTree := NTree.ofString "1100000100000"
theorem k_r022031231 : nChk 8 14 kAi kCi kL t_r022031231 864 896 6848 6880 = some 0 := by
  decide +kernel

def t_r022031232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022031232 : nChk 8 14 kAi kCi kL t_r022031232 832 864 6880 6912 = some 0 := by
  decide +kernel

def t_r022031233 : NTree := NTree.ofString "1100000100000"
theorem k_r022031233 : nChk 8 14 kAi kCi kL t_r022031233 864 896 6880 6912 = some 0 := by
  decide +kernel

def t_r02203123 : NTree := .node t_r022031230 t_r022031231 t_r022031232 t_r022031233
theorem k_r02203123 : nChk 8 14 kAi kCi kL t_r02203123 832 896 6848 6912 = some 0 :=
  nChk_node rfl rfl k_r022031230 k_r022031231 k_r022031232 k_r022031233 rfl

def t_r0220312 : NTree := .node t_r02203120 t_r02203121 t_r02203122 t_r02203123
theorem k_r0220312 : nChk 8 14 kAi kCi kL t_r0220312 768 896 6784 6912 = some 611708640639384130148106240 :=
  nChk_node rfl rfl k_r02203120 k_r02203121 k_r02203122 k_r02203123 rfl

def t_r02203130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203130 : nChk 8 14 kAi kCi kL t_r02203130 896 960 6784 6848 = some 0 := by
  decide +kernel

def t_r02203131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203131 : nChk 8 14 kAi kCi kL t_r02203131 960 1024 6784 6848 = some 0 := by
  decide +kernel

def t_r02203132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203132 : nChk 8 14 kAi kCi kL t_r02203132 896 960 6848 6912 = some 0 := by
  decide +kernel

def t_r02203133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203133 : nChk 8 14 kAi kCi kL t_r02203133 960 1024 6848 6912 = some 0 := by
  decide +kernel

def t_r0220313 : NTree := .node t_r02203130 t_r02203131 t_r02203132 t_r02203133
theorem k_r0220313 : nChk 8 14 kAi kCi kL t_r0220313 896 1024 6784 6912 = some 0 :=
  nChk_node rfl rfl k_r02203130 k_r02203131 k_r02203132 k_r02203133 rfl

def t_r022031 : NTree := .node t_r0220310 t_r0220311 t_r0220312 t_r0220313
theorem k_r022031 : nChk 8 14 kAi kCi kL t_r022031 768 1024 6656 6912 = some 1422823948740692214804381696 :=
  nChk_node rfl rfl k_r0220310 k_r0220311 k_r0220312 k_r0220313 rfl

end ChargeKernel.Pt900
