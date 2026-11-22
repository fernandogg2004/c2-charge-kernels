/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `00012` (337 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r00012000 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00012000 : nChk 8 14 kAi kCi kL t_r00012000 1024 1088 512 576 = some 0 := by
  decide +kernel

def t_r00012001 : NTree := NTree.ofString "10000"
theorem k_r00012001 : nChk 8 14 kAi kCi kL t_r00012001 1088 1152 512 576 = some 0 := by
  decide +kernel

def t_r00012002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00012002 : nChk 8 14 kAi kCi kL t_r00012002 1024 1088 576 640 = some 0 := by
  decide +kernel

def t_r00012003 : NTree := NTree.ofString "10000"
theorem k_r00012003 : nChk 8 14 kAi kCi kL t_r00012003 1088 1152 576 640 = some 0 := by
  decide +kernel

def t_r0001200 : NTree := .node t_r00012000 t_r00012001 t_r00012002 t_r00012003
theorem k_r0001200 : nChk 8 14 kAi kCi kL t_r0001200 1024 1152 512 640 = some 0 :=
  nChk_node rfl rfl k_r00012000 k_r00012001 k_r00012002 k_r00012003 rfl

def t_r00012010 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00012010 : nChk 8 14 kAi kCi kL t_r00012010 1152 1216 512 576 = some 0 := by
  decide +kernel

def t_r00012011 : NTree := NTree.ofString "11000010000100000"
theorem k_r00012011 : nChk 8 14 kAi kCi kL t_r00012011 1216 1280 512 576 = some 0 := by
  decide +kernel

def t_r00012012 : NTree := NTree.ofString "1010000010000"
theorem k_r00012012 : nChk 8 14 kAi kCi kL t_r00012012 1152 1216 576 640 = some 0 := by
  decide +kernel

def t_r00012013 : NTree := NTree.ofString "1100000100000"
theorem k_r00012013 : nChk 8 14 kAi kCi kL t_r00012013 1216 1280 576 640 = some 0 := by
  decide +kernel

def t_r0001201 : NTree := .node t_r00012010 t_r00012011 t_r00012012 t_r00012013
theorem k_r0001201 : nChk 8 14 kAi kCi kL t_r0001201 1152 1280 512 640 = some 0 :=
  nChk_node rfl rfl k_r00012010 k_r00012011 k_r00012012 k_r00012013 rfl

def t_r00012020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00012020 : nChk 8 14 kAi kCi kL t_r00012020 1024 1088 640 704 = some 0 := by
  decide +kernel

def t_r00012021 : NTree := NTree.ofString "10000"
theorem k_r00012021 : nChk 8 14 kAi kCi kL t_r00012021 1088 1152 640 704 = some 0 := by
  decide +kernel

def t_r00012022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00012022 : nChk 8 14 kAi kCi kL t_r00012022 1024 1088 704 768 = some 0 := by
  decide +kernel

def t_r00012023 : NTree := NTree.ofString "10000"
theorem k_r00012023 : nChk 8 14 kAi kCi kL t_r00012023 1088 1152 704 768 = some 0 := by
  decide +kernel

def t_r0001202 : NTree := .node t_r00012020 t_r00012021 t_r00012022 t_r00012023
theorem k_r0001202 : nChk 8 14 kAi kCi kL t_r0001202 1024 1152 640 768 = some 0 :=
  nChk_node rfl rfl k_r00012020 k_r00012021 k_r00012022 k_r00012023 rfl

def t_r0001203 : NTree := NTree.ofString "11010000001100000001000010000"
theorem k_r0001203 : nChk 8 14 kAi kCi kL t_r0001203 1152 1280 640 768 = some 0 := by
  decide +kernel

def t_r000120 : NTree := .node t_r0001200 t_r0001201 t_r0001202 t_r0001203
theorem k_r000120 : nChk 8 14 kAi kCi kL t_r000120 1024 1280 512 768 = some 0 :=
  nChk_node rfl rfl k_r0001200 k_r0001201 k_r0001202 k_r0001203 rfl

def t_r00012100 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00012100 : nChk 8 14 kAi kCi kL t_r00012100 1280 1344 512 576 = some 0 := by
  decide +kernel

def t_r00012101 : NTree := NTree.ofString "10000"
theorem k_r00012101 : nChk 8 14 kAi kCi kL t_r00012101 1344 1408 512 576 = some 0 := by
  decide +kernel

def t_r00012102 : NTree := NTree.ofString "11000010000010000"
theorem k_r00012102 : nChk 8 14 kAi kCi kL t_r00012102 1280 1344 576 640 = some 7265397727383096580374528 := by
  decide +kernel

def t_r00012103 : NTree := NTree.ofString "10000"
theorem k_r00012103 : nChk 8 14 kAi kCi kL t_r00012103 1344 1408 576 640 = some 0 := by
  decide +kernel

def t_r0001210 : NTree := .node t_r00012100 t_r00012101 t_r00012102 t_r00012103
theorem k_r0001210 : nChk 8 14 kAi kCi kL t_r0001210 1280 1408 512 640 = some 7265397727383096580374528 :=
  nChk_node rfl rfl k_r00012100 k_r00012101 k_r00012102 k_r00012103 rfl

def t_r0001211 : NTree := NTree.ofString "1100000100000"
theorem k_r0001211 : nChk 8 14 kAi kCi kL t_r0001211 1408 1536 512 640 = some 0 := by
  decide +kernel

def t_r0001212 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001212 : nChk 8 14 kAi kCi kL t_r0001212 1280 1408 640 768 = some 0 := by
  decide +kernel

def t_r0001213 : NTree := NTree.ofString "110000000"
theorem k_r0001213 : nChk 8 14 kAi kCi kL t_r0001213 1408 1536 640 768 = some 0 := by
  decide +kernel

def t_r000121 : NTree := .node t_r0001210 t_r0001211 t_r0001212 t_r0001213
theorem k_r000121 : nChk 8 14 kAi kCi kL t_r000121 1280 1536 512 768 = some 7265397727383096580374528 :=
  nChk_node rfl rfl k_r0001210 k_r0001211 k_r0001212 k_r0001213 rfl

def t_r0001220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001220 : nChk 8 14 kAi kCi kL t_r0001220 1024 1152 768 896 = some 0 := by
  decide +kernel

def t_r0001221 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001221 : nChk 8 14 kAi kCi kL t_r0001221 1152 1280 768 896 = some 0 := by
  decide +kernel

def t_r0001222 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001222 : nChk 8 14 kAi kCi kL t_r0001222 1024 1152 896 1024 = some 0 := by
  decide +kernel

def t_r0001223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001223 : nChk 8 14 kAi kCi kL t_r0001223 1152 1280 896 1024 = some 0 := by
  decide +kernel

def t_r000122 : NTree := .node t_r0001220 t_r0001221 t_r0001222 t_r0001223
theorem k_r000122 : nChk 8 14 kAi kCi kL t_r000122 1024 1280 768 1024 = some 0 :=
  nChk_node rfl rfl k_r0001220 k_r0001221 k_r0001222 k_r0001223 rfl

def t_r0001230 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001230 : nChk 8 14 kAi kCi kL t_r0001230 1280 1408 768 896 = some 0 := by
  decide +kernel

def t_r0001231 : NTree := NTree.ofString "1100000100000"
theorem k_r0001231 : nChk 8 14 kAi kCi kL t_r0001231 1408 1536 768 896 = some 0 := by
  decide +kernel

def t_r0001232 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0001232 : nChk 8 14 kAi kCi kL t_r0001232 1280 1408 896 1024 = some 0 := by
  decide +kernel

def t_r0001233 : NTree := NTree.ofString "1100000100000"
theorem k_r0001233 : nChk 8 14 kAi kCi kL t_r0001233 1408 1536 896 1024 = some 0 := by
  decide +kernel

def t_r000123 : NTree := .node t_r0001230 t_r0001231 t_r0001232 t_r0001233
theorem k_r000123 : nChk 8 14 kAi kCi kL t_r000123 1280 1536 768 1024 = some 0 :=
  nChk_node rfl rfl k_r0001230 k_r0001231 k_r0001232 k_r0001233 rfl

def t_r00012 : NTree := .node t_r000120 t_r000121 t_r000122 t_r000123
theorem k_r00012 : nChk 8 14 kAi kCi kL t_r00012 1024 1536 512 1024 = some 7265397727383096580374528 :=
  nChk_node rfl rfl k_r000120 k_r000121 k_r000122 k_r000123 rfl

end ChargeKernel.Pt900
