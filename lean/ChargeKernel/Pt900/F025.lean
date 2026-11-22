/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `000211` (274 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r0002110000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0002110000 : nChk 8 14 kAi kCi kL t_r0002110000 768 784 1024 1040 = some 22843671618198335328878592 := by
  decide +kernel

def t_r0002110001 : NTree := NTree.ofString "10000"
theorem k_r0002110001 : nChk 8 14 kAi kCi kL t_r0002110001 784 800 1024 1040 = some 16001464395856899358064640 := by
  decide +kernel

def t_r0002110002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0002110002 : nChk 8 14 kAi kCi kL t_r0002110002 768 784 1040 1056 = some 19272911755477531119058944 := by
  decide +kernel

def t_r0002110003 : NTree := NTree.ofString "10000"
theorem k_r0002110003 : nChk 8 14 kAi kCi kL t_r0002110003 784 800 1040 1056 = some 14019026064834982349635584 := by
  decide +kernel

def t_r000211000 : NTree := .node t_r0002110000 t_r0002110001 t_r0002110002 t_r0002110003
theorem k_r000211000 : nChk 8 14 kAi kCi kL t_r000211000 768 800 1024 1056 = some 72137073834367748155637760 :=
  nChk_node rfl rfl k_r0002110000 k_r0002110001 k_r0002110002 k_r0002110003 rfl

def t_r000211001 : NTree := NTree.ofString "10000"
theorem k_r000211001 : nChk 8 14 kAi kCi kL t_r000211001 800 832 1024 1056 = some 0 := by
  decide +kernel

def t_r000211002 : NTree := NTree.ofString "11100001000010000010000110000010000010000"
theorem k_r000211002 : nChk 8 14 kAi kCi kL t_r000211002 768 800 1056 1088 = some 122780296624206105934823424 := by
  decide +kernel

def t_r000211003 : NTree := NTree.ofString "10000"
theorem k_r000211003 : nChk 8 14 kAi kCi kL t_r000211003 800 832 1056 1088 = some 0 := by
  decide +kernel

def t_r00021100 : NTree := .node t_r000211000 t_r000211001 t_r000211002 t_r000211003
theorem k_r00021100 : nChk 8 14 kAi kCi kL t_r00021100 768 832 1024 1088 = some 194917370458573854090461184 :=
  nChk_node rfl rfl k_r000211000 k_r000211001 k_r000211002 k_r000211003 rfl

def t_r00021101 : NTree := NTree.ofString "0"
theorem k_r00021101 : nChk 8 14 kAi kCi kL t_r00021101 832 896 1024 1088 = some 0 := by
  decide +kernel

def t_r000211020 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r000211020 : nChk 8 14 kAi kCi kL t_r000211020 768 800 1088 1120 = some 118729424781119945101541376 := by
  decide +kernel

def t_r000211021 : NTree := NTree.ofString "10000"
theorem k_r000211021 : nChk 8 14 kAi kCi kL t_r000211021 800 832 1088 1120 = some 0 := by
  decide +kernel

def t_r000211022 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r000211022 : nChk 8 14 kAi kCi kL t_r000211022 768 800 1120 1152 = some 89439547915182023506919424 := by
  decide +kernel

def t_r000211023 : NTree := NTree.ofString "10000"
theorem k_r000211023 : nChk 8 14 kAi kCi kL t_r000211023 800 832 1120 1152 = some 0 := by
  decide +kernel

def t_r00021102 : NTree := .node t_r000211020 t_r000211021 t_r000211022 t_r000211023
theorem k_r00021102 : nChk 8 14 kAi kCi kL t_r00021102 768 832 1088 1152 = some 208168972696301968608460800 :=
  nChk_node rfl rfl k_r000211020 k_r000211021 k_r000211022 k_r000211023 rfl

def t_r00021103 : NTree := NTree.ofString "0"
theorem k_r00021103 : nChk 8 14 kAi kCi kL t_r00021103 832 896 1088 1152 = some 0 := by
  decide +kernel

def t_r0002110 : NTree := .node t_r00021100 t_r00021101 t_r00021102 t_r00021103
theorem k_r0002110 : nChk 8 14 kAi kCi kL t_r0002110 768 896 1024 1152 = some 403086343154875822698921984 :=
  nChk_node rfl rfl k_r00021100 k_r00021101 k_r00021102 k_r00021103 rfl

def t_r0002111 : NTree := NTree.ofString "1010000010000"
theorem k_r0002111 : nChk 8 14 kAi kCi kL t_r0002111 896 1024 1024 1152 = some 0 := by
  decide +kernel

def t_r000211200 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r000211200 : nChk 8 14 kAi kCi kL t_r000211200 768 800 1152 1184 = some 68627363286511300984700928 := by
  decide +kernel

def t_r000211201 : NTree := NTree.ofString "10000"
theorem k_r000211201 : nChk 8 14 kAi kCi kL t_r000211201 800 832 1152 1184 = some 0 := by
  decide +kernel

def t_r000211202 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r000211202 : nChk 8 14 kAi kCi kL t_r000211202 768 800 1184 1216 = some 54240099857712414745165824 := by
  decide +kernel

def t_r000211203 : NTree := NTree.ofString "10000"
theorem k_r000211203 : nChk 8 14 kAi kCi kL t_r000211203 800 832 1184 1216 = some 0 := by
  decide +kernel

def t_r00021120 : NTree := .node t_r000211200 t_r000211201 t_r000211202 t_r000211203
theorem k_r00021120 : nChk 8 14 kAi kCi kL t_r00021120 768 832 1152 1216 = some 122867463144223715729866752 :=
  nChk_node rfl rfl k_r000211200 k_r000211201 k_r000211202 k_r000211203 rfl

def t_r00021121 : NTree := NTree.ofString "0"
theorem k_r00021121 : nChk 8 14 kAi kCi kL t_r00021121 832 896 1152 1216 = some 0 := by
  decide +kernel

def t_r000211220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000211220 : nChk 8 14 kAi kCi kL t_r000211220 768 800 1216 1248 = some 133208503984982960048701440 := by
  decide +kernel

def t_r000211221 : NTree := NTree.ofString "10000"
theorem k_r000211221 : nChk 8 14 kAi kCi kL t_r000211221 800 832 1216 1248 = some 0 := by
  decide +kernel

def t_r000211222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r000211222 : nChk 8 14 kAi kCi kL t_r000211222 768 800 1248 1280 = some 108515596927632051019972608 := by
  decide +kernel

def t_r000211223 : NTree := NTree.ofString "10000"
theorem k_r000211223 : nChk 8 14 kAi kCi kL t_r000211223 800 832 1248 1280 = some 0 := by
  decide +kernel

def t_r00021122 : NTree := .node t_r000211220 t_r000211221 t_r000211222 t_r000211223
theorem k_r00021122 : nChk 8 14 kAi kCi kL t_r00021122 768 832 1216 1280 = some 241724100912615011068674048 :=
  nChk_node rfl rfl k_r000211220 k_r000211221 k_r000211222 k_r000211223 rfl

def t_r00021123 : NTree := NTree.ofString "10000"
theorem k_r00021123 : nChk 8 14 kAi kCi kL t_r00021123 832 896 1216 1280 = some 0 := by
  decide +kernel

def t_r0002112 : NTree := .node t_r00021120 t_r00021121 t_r00021122 t_r00021123
theorem k_r0002112 : nChk 8 14 kAi kCi kL t_r0002112 768 896 1152 1280 = some 364591564056838726798540800 :=
  nChk_node rfl rfl k_r00021120 k_r00021121 k_r00021122 k_r00021123 rfl

def t_r0002113 : NTree := NTree.ofString "1010000010000"
theorem k_r0002113 : nChk 8 14 kAi kCi kL t_r0002113 896 1024 1152 1280 = some 0 := by
  decide +kernel

def t_r000211 : NTree := .node t_r0002110 t_r0002111 t_r0002112 t_r0002113
theorem k_r000211 : nChk 8 14 kAi kCi kL t_r000211 768 1024 1024 1280 = some 767677907211714549497462784 :=
  nChk_node rfl rfl k_r0002110 k_r0002111 k_r0002112 k_r0002113 rfl

end ChargeKernel.Pt900
