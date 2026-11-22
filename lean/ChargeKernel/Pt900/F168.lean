/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `200013` (496 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r200013000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013000 : nChk 8 14 kAi kCi kL t_r200013000 768 800 8448 8480 = some 0 := by
  decide +kernel

def t_r200013001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013001 : nChk 8 14 kAi kCi kL t_r200013001 800 832 8448 8480 = some 0 := by
  decide +kernel

def t_r200013002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013002 : nChk 8 14 kAi kCi kL t_r200013002 768 800 8480 8512 = some 0 := by
  decide +kernel

def t_r200013003 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013003 : nChk 8 14 kAi kCi kL t_r200013003 800 832 8480 8512 = some 0 := by
  decide +kernel

def t_r20001300 : NTree := .node t_r200013000 t_r200013001 t_r200013002 t_r200013003
theorem k_r20001300 : nChk 8 14 kAi kCi kL t_r20001300 768 832 8448 8512 = some 0 :=
  nChk_node rfl rfl k_r200013000 k_r200013001 k_r200013002 k_r200013003 rfl

def t_r20001301 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001301 : nChk 8 14 kAi kCi kL t_r20001301 832 896 8448 8512 = some 69900593627304550220169216 := by
  decide +kernel

def t_r200013020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013020 : nChk 8 14 kAi kCi kL t_r200013020 768 800 8512 8544 = some 1189237379080458048897024 := by
  decide +kernel

def t_r200013021 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013021 : nChk 8 14 kAi kCi kL t_r200013021 800 832 8512 8544 = some 0 := by
  decide +kernel

def t_r200013022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013022 : nChk 8 14 kAi kCi kL t_r200013022 768 800 8544 8576 = some 4670314382779655286423552 := by
  decide +kernel

def t_r200013023 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013023 : nChk 8 14 kAi kCi kL t_r200013023 800 832 8544 8576 = some 0 := by
  decide +kernel

def t_r20001302 : NTree := .node t_r200013020 t_r200013021 t_r200013022 t_r200013023
theorem k_r20001302 : nChk 8 14 kAi kCi kL t_r20001302 768 832 8512 8576 = some 5859551761860113335320576 :=
  nChk_node rfl rfl k_r200013020 k_r200013021 k_r200013022 k_r200013023 rfl

def t_r20001303 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001303 : nChk 8 14 kAi kCi kL t_r20001303 832 896 8512 8576 = some 68467669859093994415325184 := by
  decide +kernel

def t_r2000130 : NTree := .node t_r20001300 t_r20001301 t_r20001302 t_r20001303
theorem k_r2000130 : nChk 8 14 kAi kCi kL t_r2000130 768 896 8448 8576 = some 144227815248258657970814976 :=
  nChk_node rfl rfl k_r20001300 k_r20001301 k_r20001302 k_r20001303 rfl

def t_r20001310 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001310 : nChk 8 14 kAi kCi kL t_r20001310 896 960 8448 8512 = some 0 := by
  decide +kernel

def t_r20001311 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001311 : nChk 8 14 kAi kCi kL t_r20001311 960 1024 8448 8512 = some 0 := by
  decide +kernel

def t_r20001312 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001312 : nChk 8 14 kAi kCi kL t_r20001312 896 960 8512 8576 = some 0 := by
  decide +kernel

def t_r20001313 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001313 : nChk 8 14 kAi kCi kL t_r20001313 960 1024 8512 8576 = some 0 := by
  decide +kernel

def t_r2000131 : NTree := .node t_r20001310 t_r20001311 t_r20001312 t_r20001313
theorem k_r2000131 : nChk 8 14 kAi kCi kL t_r2000131 896 1024 8448 8576 = some 0 :=
  nChk_node rfl rfl k_r20001310 k_r20001311 k_r20001312 k_r20001313 rfl

def t_r200013200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013200 : nChk 8 14 kAi kCi kL t_r200013200 768 800 8576 8608 = some 7856360502832217293062144 := by
  decide +kernel

def t_r200013201 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013201 : nChk 8 14 kAi kCi kL t_r200013201 800 832 8576 8608 = some 0 := by
  decide +kernel

def t_r200013202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013202 : nChk 8 14 kAi kCi kL t_r200013202 768 800 8608 8640 = some 10673228474973116222668800 := by
  decide +kernel

def t_r200013203 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013203 : nChk 8 14 kAi kCi kL t_r200013203 800 832 8608 8640 = some 0 := by
  decide +kernel

def t_r20001320 : NTree := .node t_r200013200 t_r200013201 t_r200013202 t_r200013203
theorem k_r20001320 : nChk 8 14 kAi kCi kL t_r20001320 768 832 8576 8640 = some 18529588977805333515730944 :=
  nChk_node rfl rfl k_r200013200 k_r200013201 k_r200013202 k_r200013203 rfl

def t_r20001321 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001321 : nChk 8 14 kAi kCi kL t_r20001321 832 896 8576 8640 = some 71686099958943893919105024 := by
  decide +kernel

def t_r200013220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013220 : nChk 8 14 kAi kCi kL t_r200013220 768 800 8640 8672 = some 13121675768630878773706752 := by
  decide +kernel

def t_r200013221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013221 : nChk 8 14 kAi kCi kL t_r200013221 800 832 8640 8672 = some 0 := by
  decide +kernel

def t_r200013222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013222 : nChk 8 14 kAi kCi kL t_r200013222 768 800 8672 8704 = some 15201666066778109830496256 := by
  decide +kernel

def t_r200013223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r200013223 : nChk 8 14 kAi kCi kL t_r200013223 800 832 8672 8704 = some 0 := by
  decide +kernel

def t_r20001322 : NTree := .node t_r200013220 t_r200013221 t_r200013222 t_r200013223
theorem k_r20001322 : nChk 8 14 kAi kCi kL t_r20001322 768 832 8640 8704 = some 28323341835408988604203008 :=
  nChk_node rfl rfl k_r200013220 k_r200013221 k_r200013222 k_r200013223 rfl

def t_r20001323 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r20001323 : nChk 8 14 kAi kCi kL t_r20001323 832 896 8640 8704 = some 79291888104844560986800128 := by
  decide +kernel

def t_r2000132 : NTree := .node t_r20001320 t_r20001321 t_r20001322 t_r20001323
theorem k_r2000132 : nChk 8 14 kAi kCi kL t_r2000132 768 896 8576 8704 = some 197830918877002777025839104 :=
  nChk_node rfl rfl k_r20001320 k_r20001321 k_r20001322 k_r20001323 rfl

def t_r20001330 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001330 : nChk 8 14 kAi kCi kL t_r20001330 896 960 8576 8640 = some 0 := by
  decide +kernel

def t_r20001331 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001331 : nChk 8 14 kAi kCi kL t_r20001331 960 1024 8576 8640 = some 0 := by
  decide +kernel

def t_r20001332 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001332 : nChk 8 14 kAi kCi kL t_r20001332 896 960 8640 8704 = some 0 := by
  decide +kernel

def t_r20001333 : NTree := NTree.ofString "110000100001000010000"
theorem k_r20001333 : nChk 8 14 kAi kCi kL t_r20001333 960 1024 8640 8704 = some 0 := by
  decide +kernel

def t_r2000133 : NTree := .node t_r20001330 t_r20001331 t_r20001332 t_r20001333
theorem k_r2000133 : nChk 8 14 kAi kCi kL t_r2000133 896 1024 8576 8704 = some 0 :=
  nChk_node rfl rfl k_r20001330 k_r20001331 k_r20001332 k_r20001333 rfl

def t_r200013 : NTree := .node t_r2000130 t_r2000131 t_r2000132 t_r2000133
theorem k_r200013 : nChk 8 14 kAi kCi kL t_r200013 768 1024 8448 8704 = some 342058734125261434996654080 :=
  nChk_node rfl rfl k_r2000130 k_r2000131 k_r2000132 k_r2000133 rfl

end ChargeKernel.Pt900
