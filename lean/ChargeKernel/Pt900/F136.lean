/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022213` (520 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022213000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213000 : nChk 8 14 kAi kCi kL t_r022213000 768 800 7424 7456 = some 25664971368811547263500288 := by
  decide +kernel

def t_r022213001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213001 : nChk 8 14 kAi kCi kL t_r022213001 800 832 7424 7456 = some 0 := by
  decide +kernel

def t_r022213002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213002 : nChk 8 14 kAi kCi kL t_r022213002 768 800 7456 7488 = some 24119722817891585652424704 := by
  decide +kernel

def t_r022213003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213003 : nChk 8 14 kAi kCi kL t_r022213003 800 832 7456 7488 = some 0 := by
  decide +kernel

def t_r02221300 : NTree := .node t_r022213000 t_r022213001 t_r022213002 t_r022213003
theorem k_r02221300 : nChk 8 14 kAi kCi kL t_r02221300 768 832 7424 7488 = some 49784694186703132915924992 :=
  nChk_node rfl rfl k_r022213000 k_r022213001 k_r022213002 k_r022213003 rfl

def t_r022213010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213010 : nChk 8 14 kAi kCi kL t_r022213010 832 864 7424 7456 = some 0 := by
  decide +kernel

def t_r022213011 : NTree := NTree.ofString "10000"
theorem k_r022213011 : nChk 8 14 kAi kCi kL t_r022213011 864 896 7424 7456 = some 0 := by
  decide +kernel

def t_r022213012 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213012 : nChk 8 14 kAi kCi kL t_r022213012 832 864 7456 7488 = some 0 := by
  decide +kernel

def t_r022213013 : NTree := NTree.ofString "10000"
theorem k_r022213013 : nChk 8 14 kAi kCi kL t_r022213013 864 896 7456 7488 = some 0 := by
  decide +kernel

def t_r02221301 : NTree := .node t_r022213010 t_r022213011 t_r022213012 t_r022213013
theorem k_r02221301 : nChk 8 14 kAi kCi kL t_r02221301 832 896 7424 7488 = some 0 :=
  nChk_node rfl rfl k_r022213010 k_r022213011 k_r022213012 k_r022213013 rfl

def t_r022213020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213020 : nChk 8 14 kAi kCi kL t_r022213020 768 800 7488 7520 = some 21985272759264775382237184 := by
  decide +kernel

def t_r022213021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213021 : nChk 8 14 kAi kCi kL t_r022213021 800 832 7488 7520 = some 0 := by
  decide +kernel

def t_r022213022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213022 : nChk 8 14 kAi kCi kL t_r022213022 768 800 7520 7552 = some 21421056447671442327207936 := by
  decide +kernel

def t_r022213023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213023 : nChk 8 14 kAi kCi kL t_r022213023 800 832 7520 7552 = some 0 := by
  decide +kernel

def t_r02221302 : NTree := .node t_r022213020 t_r022213021 t_r022213022 t_r022213023
theorem k_r02221302 : nChk 8 14 kAi kCi kL t_r02221302 768 832 7488 7552 = some 43406329206936217709445120 :=
  nChk_node rfl rfl k_r022213020 k_r022213021 k_r022213022 k_r022213023 rfl

def t_r022213030 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213030 : nChk 8 14 kAi kCi kL t_r022213030 832 864 7488 7520 = some 0 := by
  decide +kernel

def t_r022213031 : NTree := NTree.ofString "10000"
theorem k_r022213031 : nChk 8 14 kAi kCi kL t_r022213031 864 896 7488 7520 = some 0 := by
  decide +kernel

def t_r022213032 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213032 : nChk 8 14 kAi kCi kL t_r022213032 832 864 7520 7552 = some 0 := by
  decide +kernel

def t_r022213033 : NTree := NTree.ofString "10000"
theorem k_r022213033 : nChk 8 14 kAi kCi kL t_r022213033 864 896 7520 7552 = some 0 := by
  decide +kernel

def t_r02221303 : NTree := .node t_r022213030 t_r022213031 t_r022213032 t_r022213033
theorem k_r02221303 : nChk 8 14 kAi kCi kL t_r02221303 832 896 7488 7552 = some 0 :=
  nChk_node rfl rfl k_r022213030 k_r022213031 k_r022213032 k_r022213033 rfl

def t_r0222130 : NTree := .node t_r02221300 t_r02221301 t_r02221302 t_r02221303
theorem k_r0222130 : nChk 8 14 kAi kCi kL t_r0222130 768 896 7424 7552 = some 93191023393639350625370112 :=
  nChk_node rfl rfl k_r02221300 k_r02221301 k_r02221302 k_r02221303 rfl

def t_r02221310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221310 : nChk 8 14 kAi kCi kL t_r02221310 896 960 7424 7488 = some 0 := by
  decide +kernel

def t_r02221311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221311 : nChk 8 14 kAi kCi kL t_r02221311 960 1024 7424 7488 = some 0 := by
  decide +kernel

def t_r02221312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221312 : nChk 8 14 kAi kCi kL t_r02221312 896 960 7488 7552 = some 0 := by
  decide +kernel

def t_r02221313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221313 : nChk 8 14 kAi kCi kL t_r02221313 960 1024 7488 7552 = some 0 := by
  decide +kernel

def t_r0222131 : NTree := .node t_r02221310 t_r02221311 t_r02221312 t_r02221313
theorem k_r0222131 : nChk 8 14 kAi kCi kL t_r0222131 896 1024 7424 7552 = some 0 :=
  nChk_node rfl rfl k_r02221310 k_r02221311 k_r02221312 k_r02221313 rfl

def t_r022213200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213200 : nChk 8 14 kAi kCi kL t_r022213200 768 800 7552 7584 = some 21034010592497359977971712 := by
  decide +kernel

def t_r022213201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213201 : nChk 8 14 kAi kCi kL t_r022213201 800 832 7552 7584 = some 0 := by
  decide +kernel

def t_r022213202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213202 : nChk 8 14 kAi kCi kL t_r022213202 768 800 7584 7616 = some 19890254291434580660453376 := by
  decide +kernel

def t_r022213203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213203 : nChk 8 14 kAi kCi kL t_r022213203 800 832 7584 7616 = some 0 := by
  decide +kernel

def t_r02221320 : NTree := .node t_r022213200 t_r022213201 t_r022213202 t_r022213203
theorem k_r02221320 : nChk 8 14 kAi kCi kL t_r02221320 768 832 7552 7616 = some 40924264883931940638425088 :=
  nChk_node rfl rfl k_r022213200 k_r022213201 k_r022213202 k_r022213203 rfl

def t_r02221321 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02221321 : nChk 8 14 kAi kCi kL t_r02221321 832 896 7552 7616 = some 88032530610683757283246080 := by
  decide +kernel

def t_r022213220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213220 : nChk 8 14 kAi kCi kL t_r022213220 768 800 7616 7648 = some 18292110800761565988519936 := by
  decide +kernel

def t_r022213221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213221 : nChk 8 14 kAi kCi kL t_r022213221 800 832 7616 7648 = some 0 := by
  decide +kernel

def t_r022213222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213222 : nChk 8 14 kAi kCi kL t_r022213222 768 800 7648 7680 = some 16913329073084077663322112 := by
  decide +kernel

def t_r022213223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022213223 : nChk 8 14 kAi kCi kL t_r022213223 800 832 7648 7680 = some 0 := by
  decide +kernel

def t_r02221322 : NTree := .node t_r022213220 t_r022213221 t_r022213222 t_r022213223
theorem k_r02221322 : nChk 8 14 kAi kCi kL t_r02221322 768 832 7616 7680 = some 35205439873845643651842048 :=
  nChk_node rfl rfl k_r022213220 k_r022213221 k_r022213222 k_r022213223 rfl

def t_r02221323 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02221323 : nChk 8 14 kAi kCi kL t_r02221323 832 896 7616 7680 = some 83089431685264796257615872 := by
  decide +kernel

def t_r0222132 : NTree := .node t_r02221320 t_r02221321 t_r02221322 t_r02221323
theorem k_r0222132 : nChk 8 14 kAi kCi kL t_r0222132 768 896 7552 7680 = some 247251667053726137831129088 :=
  nChk_node rfl rfl k_r02221320 k_r02221321 k_r02221322 k_r02221323 rfl

def t_r02221330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221330 : nChk 8 14 kAi kCi kL t_r02221330 896 960 7552 7616 = some 0 := by
  decide +kernel

def t_r02221331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221331 : nChk 8 14 kAi kCi kL t_r02221331 960 1024 7552 7616 = some 0 := by
  decide +kernel

def t_r02221332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221332 : nChk 8 14 kAi kCi kL t_r02221332 896 960 7616 7680 = some 0 := by
  decide +kernel

def t_r02221333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02221333 : nChk 8 14 kAi kCi kL t_r02221333 960 1024 7616 7680 = some 0 := by
  decide +kernel

def t_r0222133 : NTree := .node t_r02221330 t_r02221331 t_r02221332 t_r02221333
theorem k_r0222133 : nChk 8 14 kAi kCi kL t_r0222133 896 1024 7552 7680 = some 0 :=
  nChk_node rfl rfl k_r02221330 k_r02221331 k_r02221332 k_r02221333 rfl

def t_r022213 : NTree := .node t_r0222130 t_r0222131 t_r0222132 t_r0222133
theorem k_r022213 : nChk 8 14 kAi kCi kL t_r022213 768 1024 7424 7680 = some 340442690447365488456499200 :=
  nChk_node rfl rfl k_r0222130 k_r0222131 k_r0222132 k_r0222133 rfl

end ChargeKernel.Pt900
