/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200211` (544 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200211000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211000 : nChk 8 14 kAi kCi kL t_r200211000 768 800 9216 9248 = some 75024416133075975159152640 := by
  decide +kernel

def t_r200211001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211001 : nChk 8 14 kAi kCi kL t_r200211001 800 832 9216 9248 = some 0 := by
  decide +kernel

def t_r200211002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211002 : nChk 8 14 kAi kCi kL t_r200211002 768 800 9248 9280 = some 82125105981101462784049152 := by
  decide +kernel

def t_r200211003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211003 : nChk 8 14 kAi kCi kL t_r200211003 800 832 9248 9280 = some 0 := by
  decide +kernel

def t_r20021100 : NTree := .node t_r200211000 t_r200211001 t_r200211002 t_r200211003
theorem k_r20021100 : nChk 8 14 kAi kCi kL t_r20021100 768 832 9216 9280 = some 157149522114177437943201792 :=
  nChk_node rfl rfl k_r200211000 k_r200211001 k_r200211002 k_r200211003 rfl

def t_r200211010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211010 : nChk 8 14 kAi kCi kL t_r200211010 832 864 9216 9248 = some 0 := by
  decide +kernel

def t_r200211011 : NTree := NTree.ofString "10000"
theorem k_r200211011 : nChk 8 14 kAi kCi kL t_r200211011 864 896 9216 9248 = some 27680600490496845938688000 := by
  decide +kernel

def t_r200211012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211012 : nChk 8 14 kAi kCi kL t_r200211012 832 864 9248 9280 = some 0 := by
  decide +kernel

def t_r200211013 : NTree := NTree.ofString "10000"
theorem k_r200211013 : nChk 8 14 kAi kCi kL t_r200211013 864 896 9248 9280 = some 29246787861351521820082176 := by
  decide +kernel

def t_r20021101 : NTree := .node t_r200211010 t_r200211011 t_r200211012 t_r200211013
theorem k_r20021101 : nChk 8 14 kAi kCi kL t_r20021101 832 896 9216 9280 = some 56927388351848367758770176 :=
  nChk_node rfl rfl k_r200211010 k_r200211011 k_r200211012 k_r200211013 rfl

def t_r200211020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211020 : nChk 8 14 kAi kCi kL t_r200211020 768 800 9280 9312 = some 88069410822219474898255872 := by
  decide +kernel

def t_r200211021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211021 : nChk 8 14 kAi kCi kL t_r200211021 800 832 9280 9312 = some 0 := by
  decide +kernel

def t_r200211022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211022 : nChk 8 14 kAi kCi kL t_r200211022 768 800 9312 9344 = some 94076777587335720024932352 := by
  decide +kernel

def t_r200211023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211023 : nChk 8 14 kAi kCi kL t_r200211023 800 832 9312 9344 = some 0 := by
  decide +kernel

def t_r20021102 : NTree := .node t_r200211020 t_r200211021 t_r200211022 t_r200211023
theorem k_r20021102 : nChk 8 14 kAi kCi kL t_r20021102 768 832 9280 9344 = some 182146188409555194923188224 :=
  nChk_node rfl rfl k_r200211020 k_r200211021 k_r200211022 k_r200211023 rfl

def t_r200211030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211030 : nChk 8 14 kAi kCi kL t_r200211030 832 864 9280 9312 = some 0 := by
  decide +kernel

def t_r200211031 : NTree := NTree.ofString "10000"
theorem k_r200211031 : nChk 8 14 kAi kCi kL t_r200211031 864 896 9280 9312 = some 30284173372599459750346752 := by
  decide +kernel

def t_r200211032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211032 : nChk 8 14 kAi kCi kL t_r200211032 832 864 9312 9344 = some 0 := by
  decide +kernel

def t_r200211033 : NTree := NTree.ofString "10000"
theorem k_r200211033 : nChk 8 14 kAi kCi kL t_r200211033 864 896 9312 9344 = some 30789978771644933379981312 := by
  decide +kernel

def t_r20021103 : NTree := .node t_r200211030 t_r200211031 t_r200211032 t_r200211033
theorem k_r20021103 : nChk 8 14 kAi kCi kL t_r20021103 832 896 9280 9344 = some 61074152144244393130328064 :=
  nChk_node rfl rfl k_r200211030 k_r200211031 k_r200211032 k_r200211033 rfl

def t_r2002110 : NTree := .node t_r20021100 t_r20021101 t_r20021102 t_r20021103
theorem k_r2002110 : nChk 8 14 kAi kCi kL t_r2002110 768 896 9216 9344 = some 457297251019825393755488256 :=
  nChk_node rfl rfl k_r20021100 k_r20021101 k_r20021102 k_r20021103 rfl

def t_r20021110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021110 : nChk 8 14 kAi kCi kL t_r20021110 896 960 9216 9280 = some 0 := by
  decide +kernel

def t_r20021111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021111 : nChk 8 14 kAi kCi kL t_r20021111 960 1024 9216 9280 = some 0 := by
  decide +kernel

def t_r20021112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021112 : nChk 8 14 kAi kCi kL t_r20021112 896 960 9280 9344 = some 0 := by
  decide +kernel

def t_r20021113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021113 : nChk 8 14 kAi kCi kL t_r20021113 960 1024 9280 9344 = some 0 := by
  decide +kernel

def t_r2002111 : NTree := .node t_r20021110 t_r20021111 t_r20021112 t_r20021113
theorem k_r2002111 : nChk 8 14 kAi kCi kL t_r2002111 896 1024 9216 9344 = some 0 :=
  nChk_node rfl rfl k_r20021110 k_r20021111 k_r20021112 k_r20021113 rfl

def t_r200211200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211200 : nChk 8 14 kAi kCi kL t_r200211200 768 800 9344 9376 = some 103163515797801229319405568 := by
  decide +kernel

def t_r200211201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211201 : nChk 8 14 kAi kCi kL t_r200211201 800 832 9344 9376 = some 0 := by
  decide +kernel

def t_r200211202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211202 : nChk 8 14 kAi kCi kL t_r200211202 768 800 9376 9408 = some 112374804172452611821142016 := by
  decide +kernel

def t_r200211203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211203 : nChk 8 14 kAi kCi kL t_r200211203 800 832 9376 9408 = some 0 := by
  decide +kernel

def t_r20021120 : NTree := .node t_r200211200 t_r200211201 t_r200211202 t_r200211203
theorem k_r20021120 : nChk 8 14 kAi kCi kL t_r20021120 768 832 9344 9408 = some 215538319970253841140547584 :=
  nChk_node rfl rfl k_r200211200 k_r200211201 k_r200211202 k_r200211203 rfl

def t_r200211210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211210 : nChk 8 14 kAi kCi kL t_r200211210 832 864 9344 9376 = some 0 := by
  decide +kernel

def t_r200211211 : NTree := NTree.ofString "10000"
theorem k_r200211211 : nChk 8 14 kAi kCi kL t_r200211211 864 896 9344 9376 = some 30761612579175962668695552 := by
  decide +kernel

def t_r200211212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211212 : nChk 8 14 kAi kCi kL t_r200211212 832 864 9376 9408 = some 0 := by
  decide +kernel

def t_r200211213 : NTree := NTree.ofString "10000"
theorem k_r200211213 : nChk 8 14 kAi kCi kL t_r200211213 864 896 9376 9408 = some 31799791876879822413103104 := by
  decide +kernel

def t_r20021121 : NTree := .node t_r200211210 t_r200211211 t_r200211212 t_r200211213
theorem k_r20021121 : nChk 8 14 kAi kCi kL t_r20021121 832 896 9344 9408 = some 62561404456055785081798656 :=
  nChk_node rfl rfl k_r200211210 k_r200211211 k_r200211212 k_r200211213 rfl

def t_r200211220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211220 : nChk 8 14 kAi kCi kL t_r200211220 768 800 9408 9440 = some 121458796015807756549226496 := by
  decide +kernel

def t_r200211221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211221 : nChk 8 14 kAi kCi kL t_r200211221 800 832 9408 9440 = some 0 := by
  decide +kernel

def t_r200211222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211222 : nChk 8 14 kAi kCi kL t_r200211222 768 800 9440 9472 = some 130894793943824987238432768 := by
  decide +kernel

def t_r200211223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211223 : nChk 8 14 kAi kCi kL t_r200211223 800 832 9440 9472 = some 0 := by
  decide +kernel

def t_r20021122 : NTree := .node t_r200211220 t_r200211221 t_r200211222 t_r200211223
theorem k_r20021122 : nChk 8 14 kAi kCi kL t_r20021122 768 832 9408 9472 = some 252353589959632743787659264 :=
  nChk_node rfl rfl k_r200211220 k_r200211221 k_r200211222 k_r200211223 rfl

def t_r200211230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211230 : nChk 8 14 kAi kCi kL t_r200211230 832 864 9408 9440 = some 0 := by
  decide +kernel

def t_r200211231 : NTree := NTree.ofString "10000"
theorem k_r200211231 : nChk 8 14 kAi kCi kL t_r200211231 864 896 9408 9440 = some 37125001703073185745862656 := by
  decide +kernel

def t_r200211232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200211232 : nChk 8 14 kAi kCi kL t_r200211232 832 864 9440 9472 = some 0 := by
  decide +kernel

def t_r200211233 : NTree := NTree.ofString "10000"
theorem k_r200211233 : nChk 8 14 kAi kCi kL t_r200211233 864 896 9440 9472 = some 44938265135372070643826688 := by
  decide +kernel

def t_r20021123 : NTree := .node t_r200211230 t_r200211231 t_r200211232 t_r200211233
theorem k_r20021123 : nChk 8 14 kAi kCi kL t_r20021123 832 896 9408 9472 = some 82063266838445256389689344 :=
  nChk_node rfl rfl k_r200211230 k_r200211231 k_r200211232 k_r200211233 rfl

def t_r2002112 : NTree := .node t_r20021120 t_r20021121 t_r20021122 t_r20021123
theorem k_r2002112 : nChk 8 14 kAi kCi kL t_r2002112 768 896 9344 9472 = some 612516581224387626399694848 :=
  nChk_node rfl rfl k_r20021120 k_r20021121 k_r20021122 k_r20021123 rfl

def t_r20021130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021130 : nChk 8 14 kAi kCi kL t_r20021130 896 960 9344 9408 = some 0 := by
  decide +kernel

def t_r20021131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021131 : nChk 8 14 kAi kCi kL t_r20021131 960 1024 9344 9408 = some 0 := by
  decide +kernel

def t_r20021132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021132 : nChk 8 14 kAi kCi kL t_r20021132 896 960 9408 9472 = some 0 := by
  decide +kernel

def t_r20021133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20021133 : nChk 8 14 kAi kCi kL t_r20021133 960 1024 9408 9472 = some 0 := by
  decide +kernel

def t_r2002113 : NTree := .node t_r20021130 t_r20021131 t_r20021132 t_r20021133
theorem k_r2002113 : nChk 8 14 kAi kCi kL t_r2002113 896 1024 9344 9472 = some 0 :=
  nChk_node rfl rfl k_r20021130 k_r20021131 k_r20021132 k_r20021133 rfl

def t_r200211 : NTree := .node t_r2002110 t_r2002111 t_r2002112 t_r2002113
theorem k_r200211 : nChk 8 14 kAi kCi kL t_r200211 768 1024 9216 9472 = some 1069813832244213020155183104 :=
  nChk_node rfl rfl k_r2002110 k_r2002111 k_r2002112 k_r2002113 rfl

end ChargeKernel.Pt900
