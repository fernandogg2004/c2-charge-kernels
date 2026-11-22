/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `222033` (274 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r222033000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222033000 : nChk 8 14 kAi kCi kL t_r222033000 768 800 15104 15136 = some 108515596927632051019972608 := by
  decide +kernel

def t_r222033001 : NTree := NTree.ofString "10000"
theorem k_r222033001 : nChk 8 14 kAi kCi kL t_r222033001 800 832 15104 15136 = some 0 := by
  decide +kernel

def t_r222033002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r222033002 : nChk 8 14 kAi kCi kL t_r222033002 768 800 15136 15168 = some 133208503984982960048701440 := by
  decide +kernel

def t_r222033003 : NTree := NTree.ofString "10000"
theorem k_r222033003 : nChk 8 14 kAi kCi kL t_r222033003 800 832 15136 15168 = some 0 := by
  decide +kernel

def t_r22203300 : NTree := .node t_r222033000 t_r222033001 t_r222033002 t_r222033003
theorem k_r22203300 : nChk 8 14 kAi kCi kL t_r22203300 768 832 15104 15168 = some 241724100912615011068674048 :=
  nChk_node rfl rfl k_r222033000 k_r222033001 k_r222033002 k_r222033003 rfl

def t_r22203301 : NTree := NTree.ofString "10000"
theorem k_r22203301 : nChk 8 14 kAi kCi kL t_r22203301 832 896 15104 15168 = some 0 := by
  decide +kernel

def t_r222033020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r222033020 : nChk 8 14 kAi kCi kL t_r222033020 768 800 15168 15200 = some 54240099857712414745165824 := by
  decide +kernel

def t_r222033021 : NTree := NTree.ofString "10000"
theorem k_r222033021 : nChk 8 14 kAi kCi kL t_r222033021 800 832 15168 15200 = some 0 := by
  decide +kernel

def t_r222033022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r222033022 : nChk 8 14 kAi kCi kL t_r222033022 768 800 15200 15232 = some 68627363286511300984700928 := by
  decide +kernel

def t_r222033023 : NTree := NTree.ofString "10000"
theorem k_r222033023 : nChk 8 14 kAi kCi kL t_r222033023 800 832 15200 15232 = some 0 := by
  decide +kernel

def t_r22203302 : NTree := .node t_r222033020 t_r222033021 t_r222033022 t_r222033023
theorem k_r22203302 : nChk 8 14 kAi kCi kL t_r22203302 768 832 15168 15232 = some 122867463144223715729866752 :=
  nChk_node rfl rfl k_r222033020 k_r222033021 k_r222033022 k_r222033023 rfl

def t_r22203303 : NTree := NTree.ofString "0"
theorem k_r22203303 : nChk 8 14 kAi kCi kL t_r22203303 832 896 15168 15232 = some 0 := by
  decide +kernel

def t_r2220330 : NTree := .node t_r22203300 t_r22203301 t_r22203302 t_r22203303
theorem k_r2220330 : nChk 8 14 kAi kCi kL t_r2220330 768 896 15104 15232 = some 364591564056838726798540800 :=
  nChk_node rfl rfl k_r22203300 k_r22203301 k_r22203302 k_r22203303 rfl

def t_r2220331 : NTree := NTree.ofString "1010000010000"
theorem k_r2220331 : nChk 8 14 kAi kCi kL t_r2220331 896 1024 15104 15232 = some 0 := by
  decide +kernel

def t_r222033200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r222033200 : nChk 8 14 kAi kCi kL t_r222033200 768 800 15232 15264 = some 89439547915182023506919424 := by
  decide +kernel

def t_r222033201 : NTree := NTree.ofString "10000"
theorem k_r222033201 : nChk 8 14 kAi kCi kL t_r222033201 800 832 15232 15264 = some 0 := by
  decide +kernel

def t_r222033202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r222033202 : nChk 8 14 kAi kCi kL t_r222033202 768 800 15264 15296 = some 118729424781119945101541376 := by
  decide +kernel

def t_r222033203 : NTree := NTree.ofString "10000"
theorem k_r222033203 : nChk 8 14 kAi kCi kL t_r222033203 800 832 15264 15296 = some 0 := by
  decide +kernel

def t_r22203320 : NTree := .node t_r222033200 t_r222033201 t_r222033202 t_r222033203
theorem k_r22203320 : nChk 8 14 kAi kCi kL t_r22203320 768 832 15232 15296 = some 208168972696301968608460800 :=
  nChk_node rfl rfl k_r222033200 k_r222033201 k_r222033202 k_r222033203 rfl

def t_r22203321 : NTree := NTree.ofString "0"
theorem k_r22203321 : nChk 8 14 kAi kCi kL t_r22203321 832 896 15232 15296 = some 0 := by
  decide +kernel

def t_r222033220 : NTree := NTree.ofString "11100000100000100001100000100001000010000"
theorem k_r222033220 : nChk 8 14 kAi kCi kL t_r222033220 768 800 15296 15328 = some 122780296624206105934823424 := by
  decide +kernel

def t_r222033221 : NTree := NTree.ofString "10000"
theorem k_r222033221 : nChk 8 14 kAi kCi kL t_r222033221 800 832 15296 15328 = some 0 := by
  decide +kernel

def t_r2220332220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2220332220 : nChk 8 14 kAi kCi kL t_r2220332220 768 784 15328 15344 = some 19272911755477531119058944 := by
  decide +kernel

def t_r2220332221 : NTree := NTree.ofString "10000"
theorem k_r2220332221 : nChk 8 14 kAi kCi kL t_r2220332221 784 800 15328 15344 = some 14019026064834982349635584 := by
  decide +kernel

def t_r2220332222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2220332222 : nChk 8 14 kAi kCi kL t_r2220332222 768 784 15344 15360 = some 22843671618198335328878592 := by
  decide +kernel

def t_r2220332223 : NTree := NTree.ofString "10000"
theorem k_r2220332223 : nChk 8 14 kAi kCi kL t_r2220332223 784 800 15344 15360 = some 16001464395856899358064640 := by
  decide +kernel

def t_r222033222 : NTree := .node t_r2220332220 t_r2220332221 t_r2220332222 t_r2220332223
theorem k_r222033222 : nChk 8 14 kAi kCi kL t_r222033222 768 800 15328 15360 = some 72137073834367748155637760 :=
  nChk_node rfl rfl k_r2220332220 k_r2220332221 k_r2220332222 k_r2220332223 rfl

def t_r222033223 : NTree := NTree.ofString "10000"
theorem k_r222033223 : nChk 8 14 kAi kCi kL t_r222033223 800 832 15328 15360 = some 0 := by
  decide +kernel

def t_r22203322 : NTree := .node t_r222033220 t_r222033221 t_r222033222 t_r222033223
theorem k_r22203322 : nChk 8 14 kAi kCi kL t_r22203322 768 832 15296 15360 = some 194917370458573854090461184 :=
  nChk_node rfl rfl k_r222033220 k_r222033221 k_r222033222 k_r222033223 rfl

def t_r22203323 : NTree := NTree.ofString "0"
theorem k_r22203323 : nChk 8 14 kAi kCi kL t_r22203323 832 896 15296 15360 = some 0 := by
  decide +kernel

def t_r2220332 : NTree := .node t_r22203320 t_r22203321 t_r22203322 t_r22203323
theorem k_r2220332 : nChk 8 14 kAi kCi kL t_r2220332 768 896 15232 15360 = some 403086343154875822698921984 :=
  nChk_node rfl rfl k_r22203320 k_r22203321 k_r22203322 k_r22203323 rfl

def t_r2220333 : NTree := NTree.ofString "1010000010000"
theorem k_r2220333 : nChk 8 14 kAi kCi kL t_r2220333 896 1024 15232 15360 = some 0 := by
  decide +kernel

def t_r222033 : NTree := .node t_r2220330 t_r2220331 t_r2220332 t_r2220333
theorem k_r222033 : nChk 8 14 kAi kCi kL t_r222033 768 1024 15104 15360 = some 767677907211714549497462784 :=
  nChk_node rfl rfl k_r2220330 k_r2220331 k_r2220332 k_r2220333 rfl

end ChargeKernel.Pt900
