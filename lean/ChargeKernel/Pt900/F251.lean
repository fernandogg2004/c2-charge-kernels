/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `2201` (463 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2201000 : NTree := NTree.ofString "111000001000001000011000000010000"
theorem k_r2201000 : nChk 8 14 kAi kCi kL t_r2201000 1024 1152 12288 12416 = some 14421221794968358424150016 := by
  decide +kernel

def t_r2201001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201001 : nChk 8 14 kAi kCi kL t_r2201001 1152 1280 12288 12416 = some 0 := by
  decide +kernel

def t_r2201002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201002 : nChk 8 14 kAi kCi kL t_r2201002 1024 1152 12416 12544 = some 0 := by
  decide +kernel

def t_r2201003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201003 : nChk 8 14 kAi kCi kL t_r2201003 1152 1280 12416 12544 = some 0 := by
  decide +kernel

def t_r220100 : NTree := .node t_r2201000 t_r2201001 t_r2201002 t_r2201003
theorem k_r220100 : nChk 8 14 kAi kCi kL t_r220100 1024 1280 12288 12544 = some 14421221794968358424150016 :=
  nChk_node rfl rfl k_r2201000 k_r2201001 k_r2201002 k_r2201003 rfl

def t_r220101 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r220101 : nChk 8 14 kAi kCi kL t_r220101 1280 1536 12288 12544 = some 0 := by
  decide +kernel

def t_r2201020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201020 : nChk 8 14 kAi kCi kL t_r2201020 1024 1152 12544 12672 = some 0 := by
  decide +kernel

def t_r2201021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201021 : nChk 8 14 kAi kCi kL t_r2201021 1152 1280 12544 12672 = some 0 := by
  decide +kernel

def t_r2201022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201022 : nChk 8 14 kAi kCi kL t_r2201022 1024 1152 12672 12800 = some 0 := by
  decide +kernel

def t_r2201023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201023 : nChk 8 14 kAi kCi kL t_r2201023 1152 1280 12672 12800 = some 0 := by
  decide +kernel

def t_r220102 : NTree := .node t_r2201020 t_r2201021 t_r2201022 t_r2201023
theorem k_r220102 : nChk 8 14 kAi kCi kL t_r220102 1024 1280 12544 12800 = some 0 :=
  nChk_node rfl rfl k_r2201020 k_r2201021 k_r2201022 k_r2201023 rfl

def t_r220103 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r220103 : nChk 8 14 kAi kCi kL t_r220103 1280 1536 12544 12800 = some 0 := by
  decide +kernel

def t_r22010 : NTree := .node t_r220100 t_r220101 t_r220102 t_r220103
theorem k_r22010 : nChk 8 14 kAi kCi kL t_r22010 1024 1536 12288 12800 = some 14421221794968358424150016 :=
  nChk_node rfl rfl k_r220100 k_r220101 k_r220102 k_r220103 rfl

def t_r220110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220110 : nChk 8 14 kAi kCi kL t_r220110 1536 1792 12288 12544 = some 0 := by
  decide +kernel

def t_r220111 : NTree := NTree.ofString "10000"
theorem k_r220111 : nChk 8 14 kAi kCi kL t_r220111 1792 2048 12288 12544 = some 0 := by
  decide +kernel

def t_r220112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220112 : nChk 8 14 kAi kCi kL t_r220112 1536 1792 12544 12800 = some 0 := by
  decide +kernel

def t_r220113 : NTree := NTree.ofString "10000"
theorem k_r220113 : nChk 8 14 kAi kCi kL t_r220113 1792 2048 12544 12800 = some 0 := by
  decide +kernel

def t_r22011 : NTree := .node t_r220110 t_r220111 t_r220112 t_r220113
theorem k_r22011 : nChk 8 14 kAi kCi kL t_r22011 1536 2048 12288 12800 = some 0 :=
  nChk_node rfl rfl k_r220110 k_r220111 k_r220112 k_r220113 rfl

def t_r2201200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201200 : nChk 8 14 kAi kCi kL t_r2201200 1024 1152 12800 12928 = some 0 := by
  decide +kernel

def t_r2201201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201201 : nChk 8 14 kAi kCi kL t_r2201201 1152 1280 12800 12928 = some 0 := by
  decide +kernel

def t_r2201202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201202 : nChk 8 14 kAi kCi kL t_r2201202 1024 1152 12928 13056 = some 0 := by
  decide +kernel

def t_r2201203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201203 : nChk 8 14 kAi kCi kL t_r2201203 1152 1280 12928 13056 = some 0 := by
  decide +kernel

def t_r220120 : NTree := .node t_r2201200 t_r2201201 t_r2201202 t_r2201203
theorem k_r220120 : nChk 8 14 kAi kCi kL t_r220120 1024 1280 12800 13056 = some 0 :=
  nChk_node rfl rfl k_r2201200 k_r2201201 k_r2201202 k_r2201203 rfl

def t_r220121 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r220121 : nChk 8 14 kAi kCi kL t_r220121 1280 1536 12800 13056 = some 0 := by
  decide +kernel

def t_r2201220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201220 : nChk 8 14 kAi kCi kL t_r2201220 1024 1152 13056 13184 = some 0 := by
  decide +kernel

def t_r2201221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201221 : nChk 8 14 kAi kCi kL t_r2201221 1152 1280 13056 13184 = some 0 := by
  decide +kernel

def t_r2201222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201222 : nChk 8 14 kAi kCi kL t_r2201222 1024 1152 13184 13312 = some 0 := by
  decide +kernel

def t_r2201223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201223 : nChk 8 14 kAi kCi kL t_r2201223 1152 1280 13184 13312 = some 0 := by
  decide +kernel

def t_r220122 : NTree := .node t_r2201220 t_r2201221 t_r2201222 t_r2201223
theorem k_r220122 : nChk 8 14 kAi kCi kL t_r220122 1024 1280 13056 13312 = some 0 :=
  nChk_node rfl rfl k_r2201220 k_r2201221 k_r2201222 k_r2201223 rfl

def t_r2201230 : NTree := NTree.ofString "1100000100000"
theorem k_r2201230 : nChk 8 14 kAi kCi kL t_r2201230 1280 1408 13056 13184 = some 0 := by
  decide +kernel

def t_r2201231 : NTree := NTree.ofString "10000"
theorem k_r2201231 : nChk 8 14 kAi kCi kL t_r2201231 1408 1536 13056 13184 = some 0 := by
  decide +kernel

def t_r2201232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2201232 : nChk 8 14 kAi kCi kL t_r2201232 1280 1408 13184 13312 = some 0 := by
  decide +kernel

def t_r2201233 : NTree := NTree.ofString "10000"
theorem k_r2201233 : nChk 8 14 kAi kCi kL t_r2201233 1408 1536 13184 13312 = some 0 := by
  decide +kernel

def t_r220123 : NTree := .node t_r2201230 t_r2201231 t_r2201232 t_r2201233
theorem k_r220123 : nChk 8 14 kAi kCi kL t_r220123 1280 1536 13056 13312 = some 0 :=
  nChk_node rfl rfl k_r2201230 k_r2201231 k_r2201232 k_r2201233 rfl

def t_r22012 : NTree := .node t_r220120 t_r220121 t_r220122 t_r220123
theorem k_r22012 : nChk 8 14 kAi kCi kL t_r22012 1024 1536 12800 13312 = some 0 :=
  nChk_node rfl rfl k_r220120 k_r220121 k_r220122 k_r220123 rfl

def t_r220130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220130 : nChk 8 14 kAi kCi kL t_r220130 1536 1792 12800 13056 = some 0 := by
  decide +kernel

def t_r220131 : NTree := NTree.ofString "10000"
theorem k_r220131 : nChk 8 14 kAi kCi kL t_r220131 1792 2048 12800 13056 = some 0 := by
  decide +kernel

def t_r220132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r220132 : nChk 8 14 kAi kCi kL t_r220132 1536 1792 13056 13312 = some 0 := by
  decide +kernel

def t_r220133 : NTree := NTree.ofString "10000"
theorem k_r220133 : nChk 8 14 kAi kCi kL t_r220133 1792 2048 13056 13312 = some 0 := by
  decide +kernel

def t_r22013 : NTree := .node t_r220130 t_r220131 t_r220132 t_r220133
theorem k_r22013 : nChk 8 14 kAi kCi kL t_r22013 1536 2048 12800 13312 = some 0 :=
  nChk_node rfl rfl k_r220130 k_r220131 k_r220132 k_r220133 rfl

def t_r2201 : NTree := .node t_r22010 t_r22011 t_r22012 t_r22013
theorem k_r2201 : nChk 8 14 kAi kCi kL t_r2201 1024 2048 12288 13312 = some 14421221794968358424150016 :=
  nChk_node rfl rfl k_r22010 k_r22011 k_r22012 k_r22013 rfl

end ChargeKernel.Pt900
