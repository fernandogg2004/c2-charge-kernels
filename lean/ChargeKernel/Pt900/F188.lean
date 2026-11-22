/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200213` (592 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200213000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213000 : nChk 8 14 kAi kCi kL t_r200213000 768 800 9472 9504 = some 138945913152974796915474432 := by
  decide +kernel

def t_r200213001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213001 : nChk 8 14 kAi kCi kL t_r200213001 800 832 9472 9504 = some 0 := by
  decide +kernel

def t_r200213002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213002 : nChk 8 14 kAi kCi kL t_r200213002 768 800 9504 9536 = some 146835095925920087402348544 := by
  decide +kernel

def t_r200213003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213003 : nChk 8 14 kAi kCi kL t_r200213003 800 832 9504 9536 = some 636476009168138869407744 := by
  decide +kernel

def t_r20021300 : NTree := .node t_r200213000 t_r200213001 t_r200213002 t_r200213003
theorem k_r20021300 : nChk 8 14 kAi kCi kL t_r20021300 768 832 9472 9536 = some 286417485088063023187230720 :=
  nChk_node rfl rfl k_r200213000 k_r200213001 k_r200213002 k_r200213003 rfl

def t_r200213010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213010 : nChk 8 14 kAi kCi kL t_r200213010 832 864 9472 9504 = some 0 := by
  decide +kernel

def t_r200213011 : NTree := NTree.ofString "1100000100000"
theorem k_r200213011 : nChk 8 14 kAi kCi kL t_r200213011 864 896 9472 9504 = some 0 := by
  decide +kernel

def t_r200213012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213012 : nChk 8 14 kAi kCi kL t_r200213012 832 864 9504 9536 = some 0 := by
  decide +kernel

def t_r200213013 : NTree := NTree.ofString "1100000100000"
theorem k_r200213013 : nChk 8 14 kAi kCi kL t_r200213013 864 896 9504 9536 = some 0 := by
  decide +kernel

def t_r20021301 : NTree := .node t_r200213010 t_r200213011 t_r200213012 t_r200213013
theorem k_r20021301 : nChk 8 14 kAi kCi kL t_r20021301 832 896 9472 9536 = some 0 :=
  nChk_node rfl rfl k_r200213010 k_r200213011 k_r200213012 k_r200213013 rfl

def t_r200213020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213020 : nChk 8 14 kAi kCi kL t_r200213020 768 800 9536 9568 = some 155368863943565755602173952 := by
  decide +kernel

def t_r200213021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213021 : nChk 8 14 kAi kCi kL t_r200213021 800 832 9536 9568 = some 2463612895186955054088192 := by
  decide +kernel

def t_r200213022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213022 : nChk 8 14 kAi kCi kL t_r200213022 768 800 9568 9600 = some 162669493294804974553792512 := by
  decide +kernel

def t_r200213023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213023 : nChk 8 14 kAi kCi kL t_r200213023 800 832 9568 9600 = some 3981189060182140143009792 := by
  decide +kernel

def t_r20021302 : NTree := .node t_r200213020 t_r200213021 t_r200213022 t_r200213023
theorem k_r20021302 : nChk 8 14 kAi kCi kL t_r20021302 768 832 9536 9600 = some 324483159193739825353064448 :=
  nChk_node rfl rfl k_r200213020 k_r200213021 k_r200213022 k_r200213023 rfl

def t_r200213030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213030 : nChk 8 14 kAi kCi kL t_r200213030 832 864 9536 9568 = some 0 := by
  decide +kernel

def t_r200213031 : NTree := NTree.ofString "1100000100000"
theorem k_r200213031 : nChk 8 14 kAi kCi kL t_r200213031 864 896 9536 9568 = some 0 := by
  decide +kernel

def t_r200213032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213032 : nChk 8 14 kAi kCi kL t_r200213032 832 864 9568 9600 = some 0 := by
  decide +kernel

def t_r200213033 : NTree := NTree.ofString "1100000100000"
theorem k_r200213033 : nChk 8 14 kAi kCi kL t_r200213033 864 896 9568 9600 = some 807996357581281607811072 := by
  decide +kernel

def t_r20021303 : NTree := .node t_r200213030 t_r200213031 t_r200213032 t_r200213033
theorem k_r20021303 : nChk 8 14 kAi kCi kL t_r20021303 832 896 9536 9600 = some 807996357581281607811072 :=
  nChk_node rfl rfl k_r200213030 k_r200213031 k_r200213032 k_r200213033 rfl

def t_r2002130 : NTree := .node t_r20021300 t_r20021301 t_r20021302 t_r20021303
theorem k_r2002130 : nChk 8 14 kAi kCi kL t_r2002130 768 896 9472 9600 = some 611708640639384130148106240 :=
  nChk_node rfl rfl k_r20021300 k_r20021301 k_r20021302 k_r20021303 rfl

def t_r20021310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021310 : nChk 8 14 kAi kCi kL t_r20021310 896 960 9472 9536 = some 0 := by
  decide +kernel

def t_r20021311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021311 : nChk 8 14 kAi kCi kL t_r20021311 960 1024 9472 9536 = some 0 := by
  decide +kernel

def t_r20021312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021312 : nChk 8 14 kAi kCi kL t_r20021312 896 960 9536 9600 = some 0 := by
  decide +kernel

def t_r20021313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021313 : nChk 8 14 kAi kCi kL t_r20021313 960 1024 9536 9600 = some 0 := by
  decide +kernel

def t_r2002131 : NTree := .node t_r20021310 t_r20021311 t_r20021312 t_r20021313
theorem k_r2002131 : nChk 8 14 kAi kCi kL t_r2002131 896 1024 9472 9600 = some 0 :=
  nChk_node rfl rfl k_r20021310 k_r20021311 k_r20021312 k_r20021313 rfl

def t_r200213200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213200 : nChk 8 14 kAi kCi kL t_r200213200 768 800 9600 9632 = some 170963321900196118740860928 := by
  decide +kernel

def t_r200213201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213201 : nChk 8 14 kAi kCi kL t_r200213201 800 832 9600 9632 = some 5138545709702021583470592 := by
  decide +kernel

def t_r200213202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213202 : nChk 8 14 kAi kCi kL t_r200213202 768 800 9632 9664 = some 178893567287579073274970112 := by
  decide +kernel

def t_r200213203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213203 : nChk 8 14 kAi kCi kL t_r200213203 800 832 9632 9664 = some 6124952923126322788564992 := by
  decide +kernel

def t_r20021320 : NTree := .node t_r200213200 t_r200213201 t_r200213202 t_r200213203
theorem k_r20021320 : nChk 8 14 kAi kCi kL t_r20021320 768 832 9600 9664 = some 361120387820603536387866624 :=
  nChk_node rfl rfl k_r200213200 k_r200213201 k_r200213202 k_r200213203 rfl

def t_r200213210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213210 : nChk 8 14 kAi kCi kL t_r200213210 832 864 9600 9632 = some 0 := by
  decide +kernel

def t_r200213211 : NTree := NTree.ofString "1100000100000"
theorem k_r200213211 : nChk 8 14 kAi kCi kL t_r200213211 864 896 9600 9632 = some 5170859000999607873306624 := by
  decide +kernel

def t_r200213212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213212 : nChk 8 14 kAi kCi kL t_r200213212 832 864 9632 9664 = some 0 := by
  decide +kernel

def t_r200213213 : NTree := NTree.ofString "1100000100000"
theorem k_r200213213 : nChk 8 14 kAi kCi kL t_r200213213 864 896 9632 9664 = some 9429274738320709898993664 := by
  decide +kernel

def t_r20021321 : NTree := .node t_r200213210 t_r200213211 t_r200213212 t_r200213213
theorem k_r20021321 : nChk 8 14 kAi kCi kL t_r20021321 832 896 9600 9664 = some 14600133739320317772300288 :=
  nChk_node rfl rfl k_r200213210 k_r200213211 k_r200213212 k_r200213213 rfl

def t_r200213220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213220 : nChk 8 14 kAi kCi kL t_r200213220 768 800 9664 9696 = some 187253745318595641370214400 := by
  decide +kernel

def t_r200213221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213221 : nChk 8 14 kAi kCi kL t_r200213221 800 832 9664 9696 = some 8838629304515732220936192 := by
  decide +kernel

def t_r200213222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213222 : nChk 8 14 kAi kCi kL t_r200213222 768 800 9696 9728 = some 195654333662679845170053120 := by
  decide +kernel

def t_r200213223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213223 : nChk 8 14 kAi kCi kL t_r200213223 800 832 9696 9728 = some 12089351889032939562860544 := by
  decide +kernel

def t_r20021322 : NTree := .node t_r200213220 t_r200213221 t_r200213222 t_r200213223
theorem k_r20021322 : nChk 8 14 kAi kCi kL t_r20021322 768 832 9664 9728 = some 403836060174824158324064256 :=
  nChk_node rfl rfl k_r200213220 k_r200213221 k_r200213222 k_r200213223 rfl

def t_r200213230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213230 : nChk 8 14 kAi kCi kL t_r200213230 832 864 9664 9696 = some 0 := by
  decide +kernel

def t_r200213231 : NTree := NTree.ofString "1100000100000"
theorem k_r200213231 : nChk 8 14 kAi kCi kL t_r200213231 864 896 9664 9696 = some 13286300853812938149986304 := by
  decide +kernel

def t_r200213232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200213232 : nChk 8 14 kAi kCi kL t_r200213232 832 864 9696 9728 = some 0 := by
  decide +kernel

def t_r200213233 : NTree := NTree.ofString "1100000100000"
theorem k_r200213233 : nChk 8 14 kAi kCi kL t_r200213233 864 896 9696 9728 = some 18272425512747134022057984 := by
  decide +kernel

def t_r20021323 : NTree := .node t_r200213230 t_r200213231 t_r200213232 t_r200213233
theorem k_r20021323 : nChk 8 14 kAi kCi kL t_r20021323 832 896 9664 9728 = some 31558726366560072172044288 :=
  nChk_node rfl rfl k_r200213230 k_r200213231 k_r200213232 k_r200213233 rfl

def t_r2002132 : NTree := .node t_r20021320 t_r20021321 t_r20021322 t_r20021323
theorem k_r2002132 : nChk 8 14 kAi kCi kL t_r2002132 768 896 9600 9728 = some 811115308101308084656275456 :=
  nChk_node rfl rfl k_r20021320 k_r20021321 k_r20021322 k_r20021323 rfl

def t_r20021330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021330 : nChk 8 14 kAi kCi kL t_r20021330 896 960 9600 9664 = some 0 := by
  decide +kernel

def t_r20021331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021331 : nChk 8 14 kAi kCi kL t_r20021331 960 1024 9600 9664 = some 0 := by
  decide +kernel

def t_r20021332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021332 : nChk 8 14 kAi kCi kL t_r20021332 896 960 9664 9728 = some 0 := by
  decide +kernel

def t_r20021333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021333 : nChk 8 14 kAi kCi kL t_r20021333 960 1024 9664 9728 = some 0 := by
  decide +kernel

def t_r2002133 : NTree := .node t_r20021330 t_r20021331 t_r20021332 t_r20021333
theorem k_r2002133 : nChk 8 14 kAi kCi kL t_r2002133 896 1024 9600 9728 = some 0 :=
  nChk_node rfl rfl k_r20021330 k_r20021331 k_r20021332 k_r20021333 rfl

def t_r200213 : NTree := .node t_r2002130 t_r2002131 t_r2002132 t_r2002133
theorem k_r200213 : nChk 8 14 kAi kCi kL t_r200213 768 1024 9472 9728 = some 1422823948740692214804381696 :=
  nChk_node rfl rfl k_r2002130 k_r2002131 k_r2002132 k_r2002133 rfl

end ChargeKernel.Pt900
