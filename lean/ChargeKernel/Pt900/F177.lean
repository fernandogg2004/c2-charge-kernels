/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200031` (520 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200031000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031000 : nChk 8 14 kAi kCi kL t_r200031000 768 800 8704 8736 = some 16913329073084077663322112 := by
  decide +kernel

def t_r200031001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031001 : nChk 8 14 kAi kCi kL t_r200031001 800 832 8704 8736 = some 0 := by
  decide +kernel

def t_r200031002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031002 : nChk 8 14 kAi kCi kL t_r200031002 768 800 8736 8768 = some 18292110800761565988519936 := by
  decide +kernel

def t_r200031003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031003 : nChk 8 14 kAi kCi kL t_r200031003 800 832 8736 8768 = some 0 := by
  decide +kernel

def t_r20003100 : NTree := .node t_r200031000 t_r200031001 t_r200031002 t_r200031003
theorem k_r20003100 : nChk 8 14 kAi kCi kL t_r20003100 768 832 8704 8768 = some 35205439873845643651842048 :=
  nChk_node rfl rfl k_r200031000 k_r200031001 k_r200031002 k_r200031003 rfl

def t_r20003101 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20003101 : nChk 8 14 kAi kCi kL t_r20003101 832 896 8704 8768 = some 83089431685264796257615872 := by
  decide +kernel

def t_r200031020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031020 : nChk 8 14 kAi kCi kL t_r200031020 768 800 8768 8800 = some 19890254291434580660453376 := by
  decide +kernel

def t_r200031021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031021 : nChk 8 14 kAi kCi kL t_r200031021 800 832 8768 8800 = some 0 := by
  decide +kernel

def t_r200031022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031022 : nChk 8 14 kAi kCi kL t_r200031022 768 800 8800 8832 = some 21034010592497359977971712 := by
  decide +kernel

def t_r200031023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031023 : nChk 8 14 kAi kCi kL t_r200031023 800 832 8800 8832 = some 0 := by
  decide +kernel

def t_r20003102 : NTree := .node t_r200031020 t_r200031021 t_r200031022 t_r200031023
theorem k_r20003102 : nChk 8 14 kAi kCi kL t_r20003102 768 832 8768 8832 = some 40924264883931940638425088 :=
  nChk_node rfl rfl k_r200031020 k_r200031021 k_r200031022 k_r200031023 rfl

def t_r20003103 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20003103 : nChk 8 14 kAi kCi kL t_r20003103 832 896 8768 8832 = some 88032530610683757283246080 := by
  decide +kernel

def t_r2000310 : NTree := .node t_r20003100 t_r20003101 t_r20003102 t_r20003103
theorem k_r2000310 : nChk 8 14 kAi kCi kL t_r2000310 768 896 8704 8832 = some 247251667053726137831129088 :=
  nChk_node rfl rfl k_r20003100 k_r20003101 k_r20003102 k_r20003103 rfl

def t_r20003110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003110 : nChk 8 14 kAi kCi kL t_r20003110 896 960 8704 8768 = some 0 := by
  decide +kernel

def t_r20003111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003111 : nChk 8 14 kAi kCi kL t_r20003111 960 1024 8704 8768 = some 0 := by
  decide +kernel

def t_r20003112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003112 : nChk 8 14 kAi kCi kL t_r20003112 896 960 8768 8832 = some 0 := by
  decide +kernel

def t_r20003113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003113 : nChk 8 14 kAi kCi kL t_r20003113 960 1024 8768 8832 = some 0 := by
  decide +kernel

def t_r2000311 : NTree := .node t_r20003110 t_r20003111 t_r20003112 t_r20003113
theorem k_r2000311 : nChk 8 14 kAi kCi kL t_r2000311 896 1024 8704 8832 = some 0 :=
  nChk_node rfl rfl k_r20003110 k_r20003111 k_r20003112 k_r20003113 rfl

def t_r200031200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031200 : nChk 8 14 kAi kCi kL t_r200031200 768 800 8832 8864 = some 21421056447671442327207936 := by
  decide +kernel

def t_r200031201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031201 : nChk 8 14 kAi kCi kL t_r200031201 800 832 8832 8864 = some 0 := by
  decide +kernel

def t_r200031202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031202 : nChk 8 14 kAi kCi kL t_r200031202 768 800 8864 8896 = some 21985272759264775382237184 := by
  decide +kernel

def t_r200031203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031203 : nChk 8 14 kAi kCi kL t_r200031203 800 832 8864 8896 = some 0 := by
  decide +kernel

def t_r20003120 : NTree := .node t_r200031200 t_r200031201 t_r200031202 t_r200031203
theorem k_r20003120 : nChk 8 14 kAi kCi kL t_r20003120 768 832 8832 8896 = some 43406329206936217709445120 :=
  nChk_node rfl rfl k_r200031200 k_r200031201 k_r200031202 k_r200031203 rfl

def t_r200031210 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031210 : nChk 8 14 kAi kCi kL t_r200031210 832 864 8832 8864 = some 0 := by
  decide +kernel

def t_r200031211 : NTree := NTree.ofString "10000"
theorem k_r200031211 : nChk 8 14 kAi kCi kL t_r200031211 864 896 8832 8864 = some 0 := by
  decide +kernel

def t_r200031212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031212 : nChk 8 14 kAi kCi kL t_r200031212 832 864 8864 8896 = some 0 := by
  decide +kernel

def t_r200031213 : NTree := NTree.ofString "10000"
theorem k_r200031213 : nChk 8 14 kAi kCi kL t_r200031213 864 896 8864 8896 = some 0 := by
  decide +kernel

def t_r20003121 : NTree := .node t_r200031210 t_r200031211 t_r200031212 t_r200031213
theorem k_r20003121 : nChk 8 14 kAi kCi kL t_r20003121 832 896 8832 8896 = some 0 :=
  nChk_node rfl rfl k_r200031210 k_r200031211 k_r200031212 k_r200031213 rfl

def t_r200031220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031220 : nChk 8 14 kAi kCi kL t_r200031220 768 800 8896 8928 = some 24119722817891585652424704 := by
  decide +kernel

def t_r200031221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031221 : nChk 8 14 kAi kCi kL t_r200031221 800 832 8896 8928 = some 0 := by
  decide +kernel

def t_r200031222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031222 : nChk 8 14 kAi kCi kL t_r200031222 768 800 8928 8960 = some 25664971368811547263500288 := by
  decide +kernel

def t_r200031223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031223 : nChk 8 14 kAi kCi kL t_r200031223 800 832 8928 8960 = some 0 := by
  decide +kernel

def t_r20003122 : NTree := .node t_r200031220 t_r200031221 t_r200031222 t_r200031223
theorem k_r20003122 : nChk 8 14 kAi kCi kL t_r20003122 768 832 8896 8960 = some 49784694186703132915924992 :=
  nChk_node rfl rfl k_r200031220 k_r200031221 k_r200031222 k_r200031223 rfl

def t_r200031230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031230 : nChk 8 14 kAi kCi kL t_r200031230 832 864 8896 8928 = some 0 := by
  decide +kernel

def t_r200031231 : NTree := NTree.ofString "10000"
theorem k_r200031231 : nChk 8 14 kAi kCi kL t_r200031231 864 896 8896 8928 = some 0 := by
  decide +kernel

def t_r200031232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200031232 : nChk 8 14 kAi kCi kL t_r200031232 832 864 8928 8960 = some 0 := by
  decide +kernel

def t_r200031233 : NTree := NTree.ofString "10000"
theorem k_r200031233 : nChk 8 14 kAi kCi kL t_r200031233 864 896 8928 8960 = some 0 := by
  decide +kernel

def t_r20003123 : NTree := .node t_r200031230 t_r200031231 t_r200031232 t_r200031233
theorem k_r20003123 : nChk 8 14 kAi kCi kL t_r20003123 832 896 8896 8960 = some 0 :=
  nChk_node rfl rfl k_r200031230 k_r200031231 k_r200031232 k_r200031233 rfl

def t_r2000312 : NTree := .node t_r20003120 t_r20003121 t_r20003122 t_r20003123
theorem k_r2000312 : nChk 8 14 kAi kCi kL t_r2000312 768 896 8832 8960 = some 93191023393639350625370112 :=
  nChk_node rfl rfl k_r20003120 k_r20003121 k_r20003122 k_r20003123 rfl

def t_r20003130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003130 : nChk 8 14 kAi kCi kL t_r20003130 896 960 8832 8896 = some 0 := by
  decide +kernel

def t_r20003131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003131 : nChk 8 14 kAi kCi kL t_r20003131 960 1024 8832 8896 = some 0 := by
  decide +kernel

def t_r20003132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003132 : nChk 8 14 kAi kCi kL t_r20003132 896 960 8896 8960 = some 0 := by
  decide +kernel

def t_r20003133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20003133 : nChk 8 14 kAi kCi kL t_r20003133 960 1024 8896 8960 = some 0 := by
  decide +kernel

def t_r2000313 : NTree := .node t_r20003130 t_r20003131 t_r20003132 t_r20003133
theorem k_r2000313 : nChk 8 14 kAi kCi kL t_r2000313 896 1024 8832 8960 = some 0 :=
  nChk_node rfl rfl k_r20003130 k_r20003131 k_r20003132 k_r20003133 rfl

def t_r200031 : NTree := .node t_r2000310 t_r2000311 t_r2000312 t_r2000313
theorem k_r200031 : nChk 8 14 kAi kCi kL t_r200031 768 1024 8704 8960 = some 340442690447365488456499200 :=
  nChk_node rfl rfl k_r2000310 k_r2000311 k_r2000312 k_r2000313 rfl

end ChargeKernel.Pt900
