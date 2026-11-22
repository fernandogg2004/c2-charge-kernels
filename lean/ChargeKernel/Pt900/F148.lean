/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `022231` (496 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r022231000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231000 : nChk 8 14 kAi kCi kL t_r022231000 768 800 7680 7712 = some 15201666066778109830496256 := by
  decide +kernel

def t_r022231001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231001 : nChk 8 14 kAi kCi kL t_r022231001 800 832 7680 7712 = some 0 := by
  decide +kernel

def t_r022231002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231002 : nChk 8 14 kAi kCi kL t_r022231002 768 800 7712 7744 = some 13121675768630878773706752 := by
  decide +kernel

def t_r022231003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231003 : nChk 8 14 kAi kCi kL t_r022231003 800 832 7712 7744 = some 0 := by
  decide +kernel

def t_r02223100 : NTree := .node t_r022231000 t_r022231001 t_r022231002 t_r022231003
theorem k_r02223100 : nChk 8 14 kAi kCi kL t_r02223100 768 832 7680 7744 = some 28323341835408988604203008 :=
  nChk_node rfl rfl k_r022231000 k_r022231001 k_r022231002 k_r022231003 rfl

def t_r02223101 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223101 : nChk 8 14 kAi kCi kL t_r02223101 832 896 7680 7744 = some 79291888104844560986800128 := by
  decide +kernel

def t_r022231020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231020 : nChk 8 14 kAi kCi kL t_r022231020 768 800 7744 7776 = some 10673228474973116222668800 := by
  decide +kernel

def t_r022231021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231021 : nChk 8 14 kAi kCi kL t_r022231021 800 832 7744 7776 = some 0 := by
  decide +kernel

def t_r022231022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231022 : nChk 8 14 kAi kCi kL t_r022231022 768 800 7776 7808 = some 7856360502832217293062144 := by
  decide +kernel

def t_r022231023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231023 : nChk 8 14 kAi kCi kL t_r022231023 800 832 7776 7808 = some 0 := by
  decide +kernel

def t_r02223102 : NTree := .node t_r022231020 t_r022231021 t_r022231022 t_r022231023
theorem k_r02223102 : nChk 8 14 kAi kCi kL t_r02223102 768 832 7744 7808 = some 18529588977805333515730944 :=
  nChk_node rfl rfl k_r022231020 k_r022231021 k_r022231022 k_r022231023 rfl

def t_r02223103 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223103 : nChk 8 14 kAi kCi kL t_r02223103 832 896 7744 7808 = some 71686099958943893919105024 := by
  decide +kernel

def t_r0222310 : NTree := .node t_r02223100 t_r02223101 t_r02223102 t_r02223103
theorem k_r0222310 : nChk 8 14 kAi kCi kL t_r0222310 768 896 7680 7808 = some 197830918877002777025839104 :=
  nChk_node rfl rfl k_r02223100 k_r02223101 k_r02223102 k_r02223103 rfl

def t_r02223110 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223110 : nChk 8 14 kAi kCi kL t_r02223110 896 960 7680 7744 = some 0 := by
  decide +kernel

def t_r02223111 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223111 : nChk 8 14 kAi kCi kL t_r02223111 960 1024 7680 7744 = some 0 := by
  decide +kernel

def t_r02223112 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223112 : nChk 8 14 kAi kCi kL t_r02223112 896 960 7744 7808 = some 0 := by
  decide +kernel

def t_r02223113 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223113 : nChk 8 14 kAi kCi kL t_r02223113 960 1024 7744 7808 = some 0 := by
  decide +kernel

def t_r0222311 : NTree := .node t_r02223110 t_r02223111 t_r02223112 t_r02223113
theorem k_r0222311 : nChk 8 14 kAi kCi kL t_r0222311 896 1024 7680 7808 = some 0 :=
  nChk_node rfl rfl k_r02223110 k_r02223111 k_r02223112 k_r02223113 rfl

def t_r022231200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231200 : nChk 8 14 kAi kCi kL t_r022231200 768 800 7808 7840 = some 4670314382779655286423552 := by
  decide +kernel

def t_r022231201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231201 : nChk 8 14 kAi kCi kL t_r022231201 800 832 7808 7840 = some 0 := by
  decide +kernel

def t_r022231202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231202 : nChk 8 14 kAi kCi kL t_r022231202 768 800 7840 7872 = some 1189237379080458048897024 := by
  decide +kernel

def t_r022231203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231203 : nChk 8 14 kAi kCi kL t_r022231203 800 832 7840 7872 = some 0 := by
  decide +kernel

def t_r02223120 : NTree := .node t_r022231200 t_r022231201 t_r022231202 t_r022231203
theorem k_r02223120 : nChk 8 14 kAi kCi kL t_r02223120 768 832 7808 7872 = some 5859551761860113335320576 :=
  nChk_node rfl rfl k_r022231200 k_r022231201 k_r022231202 k_r022231203 rfl

def t_r02223121 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223121 : nChk 8 14 kAi kCi kL t_r02223121 832 896 7808 7872 = some 68467669859093994415325184 := by
  decide +kernel

def t_r022231220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231220 : nChk 8 14 kAi kCi kL t_r022231220 768 800 7872 7904 = some 0 := by
  decide +kernel

def t_r022231221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231221 : nChk 8 14 kAi kCi kL t_r022231221 800 832 7872 7904 = some 0 := by
  decide +kernel

def t_r022231222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231222 : nChk 8 14 kAi kCi kL t_r022231222 768 800 7904 7936 = some 0 := by
  decide +kernel

def t_r022231223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r022231223 : nChk 8 14 kAi kCi kL t_r022231223 800 832 7904 7936 = some 0 := by
  decide +kernel

def t_r02223122 : NTree := .node t_r022231220 t_r022231221 t_r022231222 t_r022231223
theorem k_r02223122 : nChk 8 14 kAi kCi kL t_r02223122 768 832 7872 7936 = some 0 :=
  nChk_node rfl rfl k_r022231220 k_r022231221 k_r022231222 k_r022231223 rfl

def t_r02223123 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r02223123 : nChk 8 14 kAi kCi kL t_r02223123 832 896 7872 7936 = some 69900593627304550220169216 := by
  decide +kernel

def t_r0222312 : NTree := .node t_r02223120 t_r02223121 t_r02223122 t_r02223123
theorem k_r0222312 : nChk 8 14 kAi kCi kL t_r0222312 768 896 7808 7936 = some 144227815248258657970814976 :=
  nChk_node rfl rfl k_r02223120 k_r02223121 k_r02223122 k_r02223123 rfl

def t_r02223130 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223130 : nChk 8 14 kAi kCi kL t_r02223130 896 960 7808 7872 = some 0 := by
  decide +kernel

def t_r02223131 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223131 : nChk 8 14 kAi kCi kL t_r02223131 960 1024 7808 7872 = some 0 := by
  decide +kernel

def t_r02223132 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223132 : nChk 8 14 kAi kCi kL t_r02223132 896 960 7872 7936 = some 0 := by
  decide +kernel

def t_r02223133 : NTree := NTree.ofString "110000100001000010000"
theorem k_r02223133 : nChk 8 14 kAi kCi kL t_r02223133 960 1024 7872 7936 = some 0 := by
  decide +kernel

def t_r0222313 : NTree := .node t_r02223130 t_r02223131 t_r02223132 t_r02223133
theorem k_r0222313 : nChk 8 14 kAi kCi kL t_r0222313 896 1024 7808 7936 = some 0 :=
  nChk_node rfl rfl k_r02223130 k_r02223131 k_r02223132 k_r02223133 rfl

def t_r022231 : NTree := .node t_r0222310 t_r0222311 t_r0222312 t_r0222313
theorem k_r022231 : nChk 8 14 kAi kCi kL t_r022231 768 1024 7680 7936 = some 342058734125261434996654080 :=
  nChk_node rfl rfl k_r0222310 k_r0222311 k_r0222312 k_r0222313 rfl

end ChargeKernel.Pt900
