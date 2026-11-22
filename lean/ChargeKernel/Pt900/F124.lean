/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022033` (544 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022033000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033000 : nChk 8 14 kAi kCi kL t_r022033000 768 800 6912 6944 = some 130894793943824987238432768 := by
  decide +kernel

def t_r022033001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033001 : nChk 8 14 kAi kCi kL t_r022033001 800 832 6912 6944 = some 0 := by
  decide +kernel

def t_r022033002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033002 : nChk 8 14 kAi kCi kL t_r022033002 768 800 6944 6976 = some 121458796015807756549226496 := by
  decide +kernel

def t_r022033003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033003 : nChk 8 14 kAi kCi kL t_r022033003 800 832 6944 6976 = some 0 := by
  decide +kernel

def t_r02203300 : NTree := .node t_r022033000 t_r022033001 t_r022033002 t_r022033003
theorem k_r02203300 : nChk 8 14 kAi kCi kL t_r02203300 768 832 6912 6976 = some 252353589959632743787659264 :=
  nChk_node rfl rfl k_r022033000 k_r022033001 k_r022033002 k_r022033003 rfl

def t_r022033010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033010 : nChk 8 14 kAi kCi kL t_r022033010 832 864 6912 6944 = some 0 := by
  decide +kernel

def t_r022033011 : NTree := NTree.ofString "10000"
theorem k_r022033011 : nChk 8 14 kAi kCi kL t_r022033011 864 896 6912 6944 = some 44938265135372070643826688 := by
  decide +kernel

def t_r022033012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033012 : nChk 8 14 kAi kCi kL t_r022033012 832 864 6944 6976 = some 0 := by
  decide +kernel

def t_r022033013 : NTree := NTree.ofString "10000"
theorem k_r022033013 : nChk 8 14 kAi kCi kL t_r022033013 864 896 6944 6976 = some 37125001703073185745862656 := by
  decide +kernel

def t_r02203301 : NTree := .node t_r022033010 t_r022033011 t_r022033012 t_r022033013
theorem k_r02203301 : nChk 8 14 kAi kCi kL t_r02203301 832 896 6912 6976 = some 82063266838445256389689344 :=
  nChk_node rfl rfl k_r022033010 k_r022033011 k_r022033012 k_r022033013 rfl

def t_r022033020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033020 : nChk 8 14 kAi kCi kL t_r022033020 768 800 6976 7008 = some 112374804172452611821142016 := by
  decide +kernel

def t_r022033021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033021 : nChk 8 14 kAi kCi kL t_r022033021 800 832 6976 7008 = some 0 := by
  decide +kernel

def t_r022033022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033022 : nChk 8 14 kAi kCi kL t_r022033022 768 800 7008 7040 = some 103163515797801229319405568 := by
  decide +kernel

def t_r022033023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033023 : nChk 8 14 kAi kCi kL t_r022033023 800 832 7008 7040 = some 0 := by
  decide +kernel

def t_r02203302 : NTree := .node t_r022033020 t_r022033021 t_r022033022 t_r022033023
theorem k_r02203302 : nChk 8 14 kAi kCi kL t_r02203302 768 832 6976 7040 = some 215538319970253841140547584 :=
  nChk_node rfl rfl k_r022033020 k_r022033021 k_r022033022 k_r022033023 rfl

def t_r022033030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033030 : nChk 8 14 kAi kCi kL t_r022033030 832 864 6976 7008 = some 0 := by
  decide +kernel

def t_r022033031 : NTree := NTree.ofString "10000"
theorem k_r022033031 : nChk 8 14 kAi kCi kL t_r022033031 864 896 6976 7008 = some 31799791876879822413103104 := by
  decide +kernel

def t_r022033032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033032 : nChk 8 14 kAi kCi kL t_r022033032 832 864 7008 7040 = some 0 := by
  decide +kernel

def t_r022033033 : NTree := NTree.ofString "10000"
theorem k_r022033033 : nChk 8 14 kAi kCi kL t_r022033033 864 896 7008 7040 = some 30761612579175962668695552 := by
  decide +kernel

def t_r02203303 : NTree := .node t_r022033030 t_r022033031 t_r022033032 t_r022033033
theorem k_r02203303 : nChk 8 14 kAi kCi kL t_r02203303 832 896 6976 7040 = some 62561404456055785081798656 :=
  nChk_node rfl rfl k_r022033030 k_r022033031 k_r022033032 k_r022033033 rfl

def t_r0220330 : NTree := .node t_r02203300 t_r02203301 t_r02203302 t_r02203303
theorem k_r0220330 : nChk 8 14 kAi kCi kL t_r0220330 768 896 6912 7040 = some 612516581224387626399694848 :=
  nChk_node rfl rfl k_r02203300 k_r02203301 k_r02203302 k_r02203303 rfl

def t_r02203310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203310 : nChk 8 14 kAi kCi kL t_r02203310 896 960 6912 6976 = some 0 := by
  decide +kernel

def t_r02203311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203311 : nChk 8 14 kAi kCi kL t_r02203311 960 1024 6912 6976 = some 0 := by
  decide +kernel

def t_r02203312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203312 : nChk 8 14 kAi kCi kL t_r02203312 896 960 6976 7040 = some 0 := by
  decide +kernel

def t_r02203313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203313 : nChk 8 14 kAi kCi kL t_r02203313 960 1024 6976 7040 = some 0 := by
  decide +kernel

def t_r0220331 : NTree := .node t_r02203310 t_r02203311 t_r02203312 t_r02203313
theorem k_r0220331 : nChk 8 14 kAi kCi kL t_r0220331 896 1024 6912 7040 = some 0 :=
  nChk_node rfl rfl k_r02203310 k_r02203311 k_r02203312 k_r02203313 rfl

def t_r022033200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033200 : nChk 8 14 kAi kCi kL t_r022033200 768 800 7040 7072 = some 94076777587335720024932352 := by
  decide +kernel

def t_r022033201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033201 : nChk 8 14 kAi kCi kL t_r022033201 800 832 7040 7072 = some 0 := by
  decide +kernel

def t_r022033202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033202 : nChk 8 14 kAi kCi kL t_r022033202 768 800 7072 7104 = some 88069410822219474898255872 := by
  decide +kernel

def t_r022033203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033203 : nChk 8 14 kAi kCi kL t_r022033203 800 832 7072 7104 = some 0 := by
  decide +kernel

def t_r02203320 : NTree := .node t_r022033200 t_r022033201 t_r022033202 t_r022033203
theorem k_r02203320 : nChk 8 14 kAi kCi kL t_r02203320 768 832 7040 7104 = some 182146188409555194923188224 :=
  nChk_node rfl rfl k_r022033200 k_r022033201 k_r022033202 k_r022033203 rfl

def t_r022033210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033210 : nChk 8 14 kAi kCi kL t_r022033210 832 864 7040 7072 = some 0 := by
  decide +kernel

def t_r022033211 : NTree := NTree.ofString "10000"
theorem k_r022033211 : nChk 8 14 kAi kCi kL t_r022033211 864 896 7040 7072 = some 30789978771644933379981312 := by
  decide +kernel

def t_r022033212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033212 : nChk 8 14 kAi kCi kL t_r022033212 832 864 7072 7104 = some 0 := by
  decide +kernel

def t_r022033213 : NTree := NTree.ofString "10000"
theorem k_r022033213 : nChk 8 14 kAi kCi kL t_r022033213 864 896 7072 7104 = some 30284173372599459750346752 := by
  decide +kernel

def t_r02203321 : NTree := .node t_r022033210 t_r022033211 t_r022033212 t_r022033213
theorem k_r02203321 : nChk 8 14 kAi kCi kL t_r02203321 832 896 7040 7104 = some 61074152144244393130328064 :=
  nChk_node rfl rfl k_r022033210 k_r022033211 k_r022033212 k_r022033213 rfl

def t_r022033220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033220 : nChk 8 14 kAi kCi kL t_r022033220 768 800 7104 7136 = some 82125105981101462784049152 := by
  decide +kernel

def t_r022033221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033221 : nChk 8 14 kAi kCi kL t_r022033221 800 832 7104 7136 = some 0 := by
  decide +kernel

def t_r022033222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033222 : nChk 8 14 kAi kCi kL t_r022033222 768 800 7136 7168 = some 75024416133075975159152640 := by
  decide +kernel

def t_r022033223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033223 : nChk 8 14 kAi kCi kL t_r022033223 800 832 7136 7168 = some 0 := by
  decide +kernel

def t_r02203322 : NTree := .node t_r022033220 t_r022033221 t_r022033222 t_r022033223
theorem k_r02203322 : nChk 8 14 kAi kCi kL t_r02203322 768 832 7104 7168 = some 157149522114177437943201792 :=
  nChk_node rfl rfl k_r022033220 k_r022033221 k_r022033222 k_r022033223 rfl

def t_r022033230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033230 : nChk 8 14 kAi kCi kL t_r022033230 832 864 7104 7136 = some 0 := by
  decide +kernel

def t_r022033231 : NTree := NTree.ofString "10000"
theorem k_r022033231 : nChk 8 14 kAi kCi kL t_r022033231 864 896 7104 7136 = some 29246787861351521820082176 := by
  decide +kernel

def t_r022033232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022033232 : nChk 8 14 kAi kCi kL t_r022033232 832 864 7136 7168 = some 0 := by
  decide +kernel

def t_r022033233 : NTree := NTree.ofString "10000"
theorem k_r022033233 : nChk 8 14 kAi kCi kL t_r022033233 864 896 7136 7168 = some 27680600490496845938688000 := by
  decide +kernel

def t_r02203323 : NTree := .node t_r022033230 t_r022033231 t_r022033232 t_r022033233
theorem k_r02203323 : nChk 8 14 kAi kCi kL t_r02203323 832 896 7104 7168 = some 56927388351848367758770176 :=
  nChk_node rfl rfl k_r022033230 k_r022033231 k_r022033232 k_r022033233 rfl

def t_r0220332 : NTree := .node t_r02203320 t_r02203321 t_r02203322 t_r02203323
theorem k_r0220332 : nChk 8 14 kAi kCi kL t_r0220332 768 896 7040 7168 = some 457297251019825393755488256 :=
  nChk_node rfl rfl k_r02203320 k_r02203321 k_r02203322 k_r02203323 rfl

def t_r02203330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203330 : nChk 8 14 kAi kCi kL t_r02203330 896 960 7040 7104 = some 0 := by
  decide +kernel

def t_r02203331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203331 : nChk 8 14 kAi kCi kL t_r02203331 960 1024 7040 7104 = some 0 := by
  decide +kernel

def t_r02203332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203332 : nChk 8 14 kAi kCi kL t_r02203332 896 960 7104 7168 = some 0 := by
  decide +kernel

def t_r02203333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02203333 : nChk 8 14 kAi kCi kL t_r02203333 960 1024 7104 7168 = some 0 := by
  decide +kernel

def t_r0220333 : NTree := .node t_r02203330 t_r02203331 t_r02203332 t_r02203333
theorem k_r0220333 : nChk 8 14 kAi kCi kL t_r0220333 896 1024 7040 7168 = some 0 :=
  nChk_node rfl rfl k_r02203330 k_r02203331 k_r02203332 k_r02203333 rfl

def t_r022033 : NTree := .node t_r0220330 t_r0220331 t_r0220332 t_r0220333
theorem k_r022033 : nChk 8 14 kAi kCi kL t_r022033 768 1024 6912 7168 = some 1069813832244213020155183104 :=
  nChk_node rfl rfl k_r0220330 k_r0220331 k_r0220332 k_r0220333 rfl

end ChargeKernel.Pt900
