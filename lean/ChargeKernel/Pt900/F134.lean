/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022211` (544 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022211000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211000 : nChk 8 14 kAi kCi kL t_r022211000 768 800 7168 7200 = some 67068170780497067391320064 := by
  decide +kernel

def t_r022211001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211001 : nChk 8 14 kAi kCi kL t_r022211001 800 832 7168 7200 = some 0 := by
  decide +kernel

def t_r022211002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211002 : nChk 8 14 kAi kCi kL t_r022211002 768 800 7200 7232 = some 60429068729367634202591232 := by
  decide +kernel

def t_r022211003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211003 : nChk 8 14 kAi kCi kL t_r022211003 800 832 7200 7232 = some 0 := by
  decide +kernel

def t_r02221100 : NTree := .node t_r022211000 t_r022211001 t_r022211002 t_r022211003
theorem k_r02221100 : nChk 8 14 kAi kCi kL t_r02221100 768 832 7168 7232 = some 127497239509864701593911296 :=
  nChk_node rfl rfl k_r022211000 k_r022211001 k_r022211002 k_r022211003 rfl

def t_r022211010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211010 : nChk 8 14 kAi kCi kL t_r022211010 832 864 7168 7200 = some 0 := by
  decide +kernel

def t_r022211011 : NTree := NTree.ofString "10000"
theorem k_r022211011 : nChk 8 14 kAi kCi kL t_r022211011 864 896 7168 7200 = some 25587245526268212311752704 := by
  decide +kernel

def t_r022211012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211012 : nChk 8 14 kAi kCi kL t_r022211012 832 864 7200 7232 = some 0 := by
  decide +kernel

def t_r022211013 : NTree := NTree.ofString "10000"
theorem k_r022211013 : nChk 8 14 kAi kCi kL t_r022211013 864 896 7200 7232 = some 22968614048163552320028672 := by
  decide +kernel

def t_r02221101 : NTree := .node t_r022211010 t_r022211011 t_r022211012 t_r022211013
theorem k_r02221101 : nChk 8 14 kAi kCi kL t_r02221101 832 896 7168 7232 = some 48555859574431764631781376 :=
  nChk_node rfl rfl k_r022211010 k_r022211011 k_r022211012 k_r022211013 rfl

def t_r022211020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211020 : nChk 8 14 kAi kCi kL t_r022211020 768 800 7232 7264 = some 53220995700345470812422144 := by
  decide +kernel

def t_r022211021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211021 : nChk 8 14 kAi kCi kL t_r022211021 800 832 7232 7264 = some 0 := by
  decide +kernel

def t_r022211022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211022 : nChk 8 14 kAi kCi kL t_r022211022 768 800 7264 7296 = some 47041214280016478223728640 := by
  decide +kernel

def t_r022211023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211023 : nChk 8 14 kAi kCi kL t_r022211023 800 832 7264 7296 = some 0 := by
  decide +kernel

def t_r02221102 : NTree := .node t_r022211020 t_r022211021 t_r022211022 t_r022211023
theorem k_r02221102 : nChk 8 14 kAi kCi kL t_r02221102 768 832 7232 7296 = some 100262209980361949036150784 :=
  nChk_node rfl rfl k_r022211020 k_r022211021 k_r022211022 k_r022211023 rfl

def t_r022211030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211030 : nChk 8 14 kAi kCi kL t_r022211030 832 864 7232 7264 = some 0 := by
  decide +kernel

def t_r022211031 : NTree := NTree.ofString "10000"
theorem k_r022211031 : nChk 8 14 kAi kCi kL t_r022211031 864 896 7232 7264 = some 19827320882155314292457472 := by
  decide +kernel

def t_r022211032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211032 : nChk 8 14 kAi kCi kL t_r022211032 832 864 7264 7296 = some 0 := by
  decide +kernel

def t_r022211033 : NTree := NTree.ofString "10000"
theorem k_r022211033 : nChk 8 14 kAi kCi kL t_r022211033 864 896 7264 7296 = some 16162945788355069033316352 := by
  decide +kernel

def t_r02221103 : NTree := .node t_r022211030 t_r022211031 t_r022211032 t_r022211033
theorem k_r02221103 : nChk 8 14 kAi kCi kL t_r02221103 832 896 7232 7296 = some 35990266670510383325773824 :=
  nChk_node rfl rfl k_r022211030 k_r022211031 k_r022211032 k_r022211033 rfl

def t_r0222110 : NTree := .node t_r02221100 t_r02221101 t_r02221102 t_r02221103
theorem k_r0222110 : nChk 8 14 kAi kCi kL t_r0222110 768 896 7168 7296 = some 312305575735168798587617280 :=
  nChk_node rfl rfl k_r02221100 k_r02221101 k_r02221102 k_r02221103 rfl

def t_r02221110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221110 : nChk 8 14 kAi kCi kL t_r02221110 896 960 7168 7232 = some 0 := by
  decide +kernel

def t_r02221111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221111 : nChk 8 14 kAi kCi kL t_r02221111 960 1024 7168 7232 = some 0 := by
  decide +kernel

def t_r02221112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221112 : nChk 8 14 kAi kCi kL t_r02221112 896 960 7232 7296 = some 0 := by
  decide +kernel

def t_r02221113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221113 : nChk 8 14 kAi kCi kL t_r02221113 960 1024 7232 7296 = some 0 := by
  decide +kernel

def t_r0222111 : NTree := .node t_r02221110 t_r02221111 t_r02221112 t_r02221113
theorem k_r0222111 : nChk 8 14 kAi kCi kL t_r0222111 896 1024 7168 7296 = some 0 :=
  nChk_node rfl rfl k_r02221110 k_r02221111 k_r02221112 k_r02221113 rfl

def t_r022211200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211200 : nChk 8 14 kAi kCi kL t_r022211200 768 800 7296 7328 = some 41080126432613498276020224 := by
  decide +kernel

def t_r022211201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211201 : nChk 8 14 kAi kCi kL t_r022211201 800 832 7296 7328 = some 0 := by
  decide +kernel

def t_r022211202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211202 : nChk 8 14 kAi kCi kL t_r022211202 768 800 7328 7360 = some 35148191862779165326442496 := by
  decide +kernel

def t_r022211203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211203 : nChk 8 14 kAi kCi kL t_r022211203 800 832 7328 7360 = some 0 := by
  decide +kernel

def t_r02221120 : NTree := .node t_r022211200 t_r022211201 t_r022211202 t_r022211203
theorem k_r02221120 : nChk 8 14 kAi kCi kL t_r02221120 768 832 7296 7360 = some 76228318295392663602462720 :=
  nChk_node rfl rfl k_r022211200 k_r022211201 k_r022211202 k_r022211203 rfl

def t_r022211210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211210 : nChk 8 14 kAi kCi kL t_r022211210 832 864 7296 7328 = some 0 := by
  decide +kernel

def t_r022211211 : NTree := NTree.ofString "10000"
theorem k_r022211211 : nChk 8 14 kAi kCi kL t_r022211211 864 896 7296 7328 = some 11977683352846835675824128 := by
  decide +kernel

def t_r022211212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211212 : nChk 8 14 kAi kCi kL t_r022211212 832 864 7328 7360 = some 0 := by
  decide +kernel

def t_r022211213 : NTree := NTree.ofString "10000"
theorem k_r022211213 : nChk 8 14 kAi kCi kL t_r022211213 864 896 7328 7360 = some 7271230069044526467514368 := by
  decide +kernel

def t_r02221121 : NTree := .node t_r022211210 t_r022211211 t_r022211212 t_r022211213
theorem k_r02221121 : nChk 8 14 kAi kCi kL t_r02221121 832 896 7296 7360 = some 19248913421891362143338496 :=
  nChk_node rfl rfl k_r022211210 k_r022211211 k_r022211212 k_r022211213 rfl

def t_r022211220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211220 : nChk 8 14 kAi kCi kL t_r022211220 768 800 7360 7392 = some 31492927695140278656565248 := by
  decide +kernel

def t_r022211221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211221 : nChk 8 14 kAi kCi kL t_r022211221 800 832 7360 7392 = some 0 := by
  decide +kernel

def t_r022211222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211222 : nChk 8 14 kAi kCi kL t_r022211222 768 800 7392 7424 = some 27821546765730898834882560 := by
  decide +kernel

def t_r022211223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211223 : nChk 8 14 kAi kCi kL t_r022211223 800 832 7392 7424 = some 0 := by
  decide +kernel

def t_r02221122 : NTree := .node t_r022211220 t_r022211221 t_r022211222 t_r022211223
theorem k_r02221122 : nChk 8 14 kAi kCi kL t_r02221122 768 832 7360 7424 = some 59314474460871177491447808 :=
  nChk_node rfl rfl k_r022211220 k_r022211221 k_r022211222 k_r022211223 rfl

def t_r022211230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211230 : nChk 8 14 kAi kCi kL t_r022211230 832 864 7360 7392 = some 0 := by
  decide +kernel

def t_r022211231 : NTree := NTree.ofString "10000"
theorem k_r022211231 : nChk 8 14 kAi kCi kL t_r022211231 864 896 7360 7392 = some 2043679323590014562992128 := by
  decide +kernel

def t_r022211232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022211232 : nChk 8 14 kAi kCi kL t_r022211232 832 864 7392 7424 = some 0 := by
  decide +kernel

def t_r022211233 : NTree := NTree.ofString "10000"
theorem k_r022211233 : nChk 8 14 kAi kCi kL t_r022211233 864 896 7392 7424 = some 0 := by
  decide +kernel

def t_r02221123 : NTree := .node t_r022211230 t_r022211231 t_r022211232 t_r022211233
theorem k_r02221123 : nChk 8 14 kAi kCi kL t_r02221123 832 896 7360 7424 = some 2043679323590014562992128 :=
  nChk_node rfl rfl k_r022211230 k_r022211231 k_r022211232 k_r022211233 rfl

def t_r0222112 : NTree := .node t_r02221120 t_r02221121 t_r02221122 t_r02221123
theorem k_r0222112 : nChk 8 14 kAi kCi kL t_r0222112 768 896 7296 7424 = some 156835385501745217800241152 :=
  nChk_node rfl rfl k_r02221120 k_r02221121 k_r02221122 k_r02221123 rfl

def t_r02221130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221130 : nChk 8 14 kAi kCi kL t_r02221130 896 960 7296 7360 = some 0 := by
  decide +kernel

def t_r02221131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221131 : nChk 8 14 kAi kCi kL t_r02221131 960 1024 7296 7360 = some 0 := by
  decide +kernel

def t_r02221132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221132 : nChk 8 14 kAi kCi kL t_r02221132 896 960 7360 7424 = some 0 := by
  decide +kernel

def t_r02221133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221133 : nChk 8 14 kAi kCi kL t_r02221133 960 1024 7360 7424 = some 0 := by
  decide +kernel

def t_r0222113 : NTree := .node t_r02221130 t_r02221131 t_r02221132 t_r02221133
theorem k_r0222113 : nChk 8 14 kAi kCi kL t_r0222113 896 1024 7296 7424 = some 0 :=
  nChk_node rfl rfl k_r02221130 k_r02221131 k_r02221132 k_r02221133 rfl

def t_r022211 : NTree := .node t_r0222110 t_r0222111 t_r0222112 t_r0222113
theorem k_r022211 : nChk 8 14 kAi kCi kL t_r022211 768 1024 7168 7424 = some 469140961236914016387858432 :=
  nChk_node rfl rfl k_r0222110 k_r0222111 k_r0222112 k_r0222113 rfl

end ChargeKernel.Pt900
