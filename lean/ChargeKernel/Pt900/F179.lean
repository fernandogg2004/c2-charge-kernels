/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200033` (544 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200033000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033000 : nChk 8 14 kAi kCi kL t_r200033000 768 800 8960 8992 = some 27821546765730898834882560 := by
  decide +kernel

def t_r200033001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033001 : nChk 8 14 kAi kCi kL t_r200033001 800 832 8960 8992 = some 0 := by
  decide +kernel

def t_r200033002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033002 : nChk 8 14 kAi kCi kL t_r200033002 768 800 8992 9024 = some 31492927695140278656565248 := by
  decide +kernel

def t_r200033003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033003 : nChk 8 14 kAi kCi kL t_r200033003 800 832 8992 9024 = some 0 := by
  decide +kernel

def t_r20003300 : NTree := .node t_r200033000 t_r200033001 t_r200033002 t_r200033003
theorem k_r20003300 : nChk 8 14 kAi kCi kL t_r20003300 768 832 8960 9024 = some 59314474460871177491447808 :=
  nChk_node rfl rfl k_r200033000 k_r200033001 k_r200033002 k_r200033003 rfl

def t_r200033010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033010 : nChk 8 14 kAi kCi kL t_r200033010 832 864 8960 8992 = some 0 := by
  decide +kernel

def t_r200033011 : NTree := NTree.ofString "10000"
theorem k_r200033011 : nChk 8 14 kAi kCi kL t_r200033011 864 896 8960 8992 = some 0 := by
  decide +kernel

def t_r200033012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033012 : nChk 8 14 kAi kCi kL t_r200033012 832 864 8992 9024 = some 0 := by
  decide +kernel

def t_r200033013 : NTree := NTree.ofString "10000"
theorem k_r200033013 : nChk 8 14 kAi kCi kL t_r200033013 864 896 8992 9024 = some 2043679323590014562992128 := by
  decide +kernel

def t_r20003301 : NTree := .node t_r200033010 t_r200033011 t_r200033012 t_r200033013
theorem k_r20003301 : nChk 8 14 kAi kCi kL t_r20003301 832 896 8960 9024 = some 2043679323590014562992128 :=
  nChk_node rfl rfl k_r200033010 k_r200033011 k_r200033012 k_r200033013 rfl

def t_r200033020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033020 : nChk 8 14 kAi kCi kL t_r200033020 768 800 9024 9056 = some 35148191862779165326442496 := by
  decide +kernel

def t_r200033021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033021 : nChk 8 14 kAi kCi kL t_r200033021 800 832 9024 9056 = some 0 := by
  decide +kernel

def t_r200033022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033022 : nChk 8 14 kAi kCi kL t_r200033022 768 800 9056 9088 = some 41080126432613498276020224 := by
  decide +kernel

def t_r200033023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033023 : nChk 8 14 kAi kCi kL t_r200033023 800 832 9056 9088 = some 0 := by
  decide +kernel

def t_r20003302 : NTree := .node t_r200033020 t_r200033021 t_r200033022 t_r200033023
theorem k_r20003302 : nChk 8 14 kAi kCi kL t_r20003302 768 832 9024 9088 = some 76228318295392663602462720 :=
  nChk_node rfl rfl k_r200033020 k_r200033021 k_r200033022 k_r200033023 rfl

def t_r200033030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033030 : nChk 8 14 kAi kCi kL t_r200033030 832 864 9024 9056 = some 0 := by
  decide +kernel

def t_r200033031 : NTree := NTree.ofString "10000"
theorem k_r200033031 : nChk 8 14 kAi kCi kL t_r200033031 864 896 9024 9056 = some 7271230069044526467514368 := by
  decide +kernel

def t_r200033032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033032 : nChk 8 14 kAi kCi kL t_r200033032 832 864 9056 9088 = some 0 := by
  decide +kernel

def t_r200033033 : NTree := NTree.ofString "10000"
theorem k_r200033033 : nChk 8 14 kAi kCi kL t_r200033033 864 896 9056 9088 = some 11977683352846835675824128 := by
  decide +kernel

def t_r20003303 : NTree := .node t_r200033030 t_r200033031 t_r200033032 t_r200033033
theorem k_r20003303 : nChk 8 14 kAi kCi kL t_r20003303 832 896 9024 9088 = some 19248913421891362143338496 :=
  nChk_node rfl rfl k_r200033030 k_r200033031 k_r200033032 k_r200033033 rfl

def t_r2000330 : NTree := .node t_r20003300 t_r20003301 t_r20003302 t_r20003303
theorem k_r2000330 : nChk 8 14 kAi kCi kL t_r2000330 768 896 8960 9088 = some 156835385501745217800241152 :=
  nChk_node rfl rfl k_r20003300 k_r20003301 k_r20003302 k_r20003303 rfl

def t_r20003310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003310 : nChk 8 14 kAi kCi kL t_r20003310 896 960 8960 9024 = some 0 := by
  decide +kernel

def t_r20003311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003311 : nChk 8 14 kAi kCi kL t_r20003311 960 1024 8960 9024 = some 0 := by
  decide +kernel

def t_r20003312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003312 : nChk 8 14 kAi kCi kL t_r20003312 896 960 9024 9088 = some 0 := by
  decide +kernel

def t_r20003313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003313 : nChk 8 14 kAi kCi kL t_r20003313 960 1024 9024 9088 = some 0 := by
  decide +kernel

def t_r2000331 : NTree := .node t_r20003310 t_r20003311 t_r20003312 t_r20003313
theorem k_r2000331 : nChk 8 14 kAi kCi kL t_r2000331 896 1024 8960 9088 = some 0 :=
  nChk_node rfl rfl k_r20003310 k_r20003311 k_r20003312 k_r20003313 rfl

def t_r200033200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033200 : nChk 8 14 kAi kCi kL t_r200033200 768 800 9088 9120 = some 47041214280016478223728640 := by
  decide +kernel

def t_r200033201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033201 : nChk 8 14 kAi kCi kL t_r200033201 800 832 9088 9120 = some 0 := by
  decide +kernel

def t_r200033202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033202 : nChk 8 14 kAi kCi kL t_r200033202 768 800 9120 9152 = some 53220995700345470812422144 := by
  decide +kernel

def t_r200033203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033203 : nChk 8 14 kAi kCi kL t_r200033203 800 832 9120 9152 = some 0 := by
  decide +kernel

def t_r20003320 : NTree := .node t_r200033200 t_r200033201 t_r200033202 t_r200033203
theorem k_r20003320 : nChk 8 14 kAi kCi kL t_r20003320 768 832 9088 9152 = some 100262209980361949036150784 :=
  nChk_node rfl rfl k_r200033200 k_r200033201 k_r200033202 k_r200033203 rfl

def t_r200033210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033210 : nChk 8 14 kAi kCi kL t_r200033210 832 864 9088 9120 = some 0 := by
  decide +kernel

def t_r200033211 : NTree := NTree.ofString "10000"
theorem k_r200033211 : nChk 8 14 kAi kCi kL t_r200033211 864 896 9088 9120 = some 16162945788355069033316352 := by
  decide +kernel

def t_r200033212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033212 : nChk 8 14 kAi kCi kL t_r200033212 832 864 9120 9152 = some 0 := by
  decide +kernel

def t_r200033213 : NTree := NTree.ofString "10000"
theorem k_r200033213 : nChk 8 14 kAi kCi kL t_r200033213 864 896 9120 9152 = some 19827320882155314292457472 := by
  decide +kernel

def t_r20003321 : NTree := .node t_r200033210 t_r200033211 t_r200033212 t_r200033213
theorem k_r20003321 : nChk 8 14 kAi kCi kL t_r20003321 832 896 9088 9152 = some 35990266670510383325773824 :=
  nChk_node rfl rfl k_r200033210 k_r200033211 k_r200033212 k_r200033213 rfl

def t_r200033220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033220 : nChk 8 14 kAi kCi kL t_r200033220 768 800 9152 9184 = some 60429068729367634202591232 := by
  decide +kernel

def t_r200033221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033221 : nChk 8 14 kAi kCi kL t_r200033221 800 832 9152 9184 = some 0 := by
  decide +kernel

def t_r200033222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033222 : nChk 8 14 kAi kCi kL t_r200033222 768 800 9184 9216 = some 67068170780497067391320064 := by
  decide +kernel

def t_r200033223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033223 : nChk 8 14 kAi kCi kL t_r200033223 800 832 9184 9216 = some 0 := by
  decide +kernel

def t_r20003322 : NTree := .node t_r200033220 t_r200033221 t_r200033222 t_r200033223
theorem k_r20003322 : nChk 8 14 kAi kCi kL t_r20003322 768 832 9152 9216 = some 127497239509864701593911296 :=
  nChk_node rfl rfl k_r200033220 k_r200033221 k_r200033222 k_r200033223 rfl

def t_r200033230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033230 : nChk 8 14 kAi kCi kL t_r200033230 832 864 9152 9184 = some 0 := by
  decide +kernel

def t_r200033231 : NTree := NTree.ofString "10000"
theorem k_r200033231 : nChk 8 14 kAi kCi kL t_r200033231 864 896 9152 9184 = some 22968614048163552320028672 := by
  decide +kernel

def t_r200033232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200033232 : nChk 8 14 kAi kCi kL t_r200033232 832 864 9184 9216 = some 0 := by
  decide +kernel

def t_r200033233 : NTree := NTree.ofString "10000"
theorem k_r200033233 : nChk 8 14 kAi kCi kL t_r200033233 864 896 9184 9216 = some 25587245526268212311752704 := by
  decide +kernel

def t_r20003323 : NTree := .node t_r200033230 t_r200033231 t_r200033232 t_r200033233
theorem k_r20003323 : nChk 8 14 kAi kCi kL t_r20003323 832 896 9152 9216 = some 48555859574431764631781376 :=
  nChk_node rfl rfl k_r200033230 k_r200033231 k_r200033232 k_r200033233 rfl

def t_r2000332 : NTree := .node t_r20003320 t_r20003321 t_r20003322 t_r20003323
theorem k_r2000332 : nChk 8 14 kAi kCi kL t_r2000332 768 896 9088 9216 = some 312305575735168798587617280 :=
  nChk_node rfl rfl k_r20003320 k_r20003321 k_r20003322 k_r20003323 rfl

def t_r20003330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003330 : nChk 8 14 kAi kCi kL t_r20003330 896 960 9088 9152 = some 0 := by
  decide +kernel

def t_r20003331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003331 : nChk 8 14 kAi kCi kL t_r20003331 960 1024 9088 9152 = some 0 := by
  decide +kernel

def t_r20003332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003332 : nChk 8 14 kAi kCi kL t_r20003332 896 960 9152 9216 = some 0 := by
  decide +kernel

def t_r20003333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003333 : nChk 8 14 kAi kCi kL t_r20003333 960 1024 9152 9216 = some 0 := by
  decide +kernel

def t_r2000333 : NTree := .node t_r20003330 t_r20003331 t_r20003332 t_r20003333
theorem k_r2000333 : nChk 8 14 kAi kCi kL t_r2000333 896 1024 9088 9216 = some 0 :=
  nChk_node rfl rfl k_r20003330 k_r20003331 k_r20003332 k_r20003333 rfl

def t_r200033 : NTree := .node t_r2000330 t_r2000331 t_r2000332 t_r2000333
theorem k_r200033 : nChk 8 14 kAi kCi kL t_r200033 768 1024 8960 9216 = some 469140961236914016387858432 :=
  nChk_node rfl rfl k_r2000330 k_r2000331 k_r2000332 k_r2000333 rfl

end ChargeKernel.Pt900
