/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `223` (313 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r22300 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22300 : nChk 8 14 kAi kCi kL t_r22300 2048 2560 14336 14848 = some 0 := by
  decide +kernel

def t_r22301 : NTree := NTree.ofString "10000"
theorem k_r22301 : nChk 8 14 kAi kCi kL t_r22301 2560 3072 14336 14848 = some 0 := by
  decide +kernel

def t_r22302 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r22302 : nChk 8 14 kAi kCi kL t_r22302 2048 2560 14848 15360 = some 0 := by
  decide +kernel

def t_r22303 : NTree := NTree.ofString "10000"
theorem k_r22303 : nChk 8 14 kAi kCi kL t_r22303 2560 3072 14848 15360 = some 0 := by
  decide +kernel

def t_r2230 : NTree := .node t_r22300 t_r22301 t_r22302 t_r22303
theorem k_r2230 : nChk 8 14 kAi kCi kL t_r2230 2048 3072 14336 15360 = some 0 :=
  nChk_node rfl rfl k_r22300 k_r22301 k_r22302 k_r22303 rfl

def t_r2231 : NTree := NTree.ofString "10000"
theorem k_r2231 : nChk 8 14 kAi kCi kL t_r2231 3072 4096 14336 15360 = some 0 := by
  decide +kernel

def t_r223200 : NTree := NTree.ofString "110000100001000010000"
theorem k_r223200 : nChk 8 14 kAi kCi kL t_r223200 2048 2304 15360 15616 = some 0 := by
  decide +kernel

def t_r223201 : NTree := NTree.ofString "10000"
theorem k_r223201 : nChk 8 14 kAi kCi kL t_r223201 2304 2560 15360 15616 = some 0 := by
  decide +kernel

def t_r223202 : NTree := NTree.ofString "1100001000010010000010000"
theorem k_r223202 : nChk 8 14 kAi kCi kL t_r223202 2048 2304 15616 15872 = some 0 := by
  decide +kernel

def t_r223203 : NTree := NTree.ofString "100100000"
theorem k_r223203 : nChk 8 14 kAi kCi kL t_r223203 2304 2560 15616 15872 = some 0 := by
  decide +kernel

def t_r22320 : NTree := .node t_r223200 t_r223201 t_r223202 t_r223203
theorem k_r22320 : nChk 8 14 kAi kCi kL t_r22320 2048 2560 15360 15872 = some 0 :=
  nChk_node rfl rfl k_r223200 k_r223201 k_r223202 k_r223203 rfl

def t_r22321 : NTree := NTree.ofString "1100000100000"
theorem k_r22321 : nChk 8 14 kAi kCi kL t_r22321 2560 3072 15360 15872 = some 0 := by
  decide +kernel

def t_r2232200 : NTree := NTree.ofString "1100000100000"
theorem k_r2232200 : nChk 8 14 kAi kCi kL t_r2232200 2048 2176 15872 16000 = some 14194050141700625295998976 := by
  decide +kernel

def t_r2232201 : NTree := NTree.ofString "10000"
theorem k_r2232201 : nChk 8 14 kAi kCi kL t_r2232201 2176 2304 15872 16000 = some 0 := by
  decide +kernel

def t_r2232202 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2232202 : nChk 8 14 kAi kCi kL t_r2232202 2048 2176 16000 16128 = some 0 := by
  decide +kernel

def t_r2232203 : NTree := NTree.ofString "10000"
theorem k_r2232203 : nChk 8 14 kAi kCi kL t_r2232203 2176 2304 16000 16128 = some 0 := by
  decide +kernel

def t_r223220 : NTree := .node t_r2232200 t_r2232201 t_r2232202 t_r2232203
theorem k_r223220 : nChk 8 14 kAi kCi kL t_r223220 2048 2304 15872 16128 = some 14194050141700625295998976 :=
  nChk_node rfl rfl k_r2232200 k_r2232201 k_r2232202 k_r2232203 rfl

def t_r223221 : NTree := NTree.ofString "1100000100000"
theorem k_r223221 : nChk 8 14 kAi kCi kL t_r223221 2304 2560 15872 16128 = some 0 := by
  decide +kernel

def t_r2232220 : NTree := NTree.ofString "1100100000100001100000100001000010000"
theorem k_r2232220 : nChk 8 14 kAi kCi kL t_r2232220 2048 2176 16128 16256 = some 7297495062071351200186368 := by
  decide +kernel

def t_r2232221 : NTree := NTree.ofString "1100000100000"
theorem k_r2232221 : nChk 8 14 kAi kCi kL t_r2232221 2176 2304 16128 16256 = some 0 := by
  decide +kernel

def t_r22322220 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22322220 : nChk 8 14 kAi kCi kL t_r22322220 2048 2112 16256 16320 = some 8164897861905321736273920 := by
  decide +kernel

def t_r22322221 : NTree := NTree.ofString "100100000"
theorem k_r22322221 : nChk 8 14 kAi kCi kL t_r22322221 2112 2176 16256 16320 = some 18684972244206464406650880 := by
  decide +kernel

def t_r22322222 : NTree := NTree.ofString "11001000001000011000010000100001000010000"
theorem k_r22322222 : nChk 8 14 kAi kCi kL t_r22322222 2048 2112 16320 16384 = some 60192795823670542077001728 := by
  decide +kernel

def t_r22322223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r22322223 : nChk 8 14 kAi kCi kL t_r22322223 2112 2176 16320 16384 = some 0 := by
  decide +kernel

def t_r2232222 : NTree := .node t_r22322220 t_r22322221 t_r22322222 t_r22322223
theorem k_r2232222 : nChk 8 14 kAi kCi kL t_r2232222 2048 2176 16256 16384 = some 87042665929782328219926528 :=
  nChk_node rfl rfl k_r22322220 k_r22322221 k_r22322222 k_r22322223 rfl

def t_r2232223 : NTree := NTree.ofString "110000100001000010000"
theorem k_r2232223 : nChk 8 14 kAi kCi kL t_r2232223 2176 2304 16256 16384 = some 0 := by
  decide +kernel

def t_r223222 : NTree := .node t_r2232220 t_r2232221 t_r2232222 t_r2232223
theorem k_r223222 : nChk 8 14 kAi kCi kL t_r223222 2048 2304 16128 16384 = some 94340160991853679420112896 :=
  nChk_node rfl rfl k_r2232220 k_r2232221 k_r2232222 k_r2232223 rfl

def t_r223223 : NTree := NTree.ofString "11000001000010000"
theorem k_r223223 : nChk 8 14 kAi kCi kL t_r223223 2304 2560 16128 16384 = some 0 := by
  decide +kernel

def t_r22322 : NTree := .node t_r223220 t_r223221 t_r223222 t_r223223
theorem k_r22322 : nChk 8 14 kAi kCi kL t_r22322 2048 2560 15872 16384 = some 108534211133554304716111872 :=
  nChk_node rfl rfl k_r223220 k_r223221 k_r223222 k_r223223 rfl

def t_r22323 : NTree := NTree.ofString "1100000100000"
theorem k_r22323 : nChk 8 14 kAi kCi kL t_r22323 2560 3072 15872 16384 = some 0 := by
  decide +kernel

def t_r2232 : NTree := .node t_r22320 t_r22321 t_r22322 t_r22323
theorem k_r2232 : nChk 8 14 kAi kCi kL t_r2232 2048 3072 15360 16384 = some 108534211133554304716111872 :=
  nChk_node rfl rfl k_r22320 k_r22321 k_r22322 k_r22323 rfl

def t_r2233 : NTree := NTree.ofString "1100000100000"
theorem k_r2233 : nChk 8 14 kAi kCi kL t_r2233 3072 4096 15360 16384 = some 0 := by
  decide +kernel

def t_r223 : NTree := .node t_r2230 t_r2231 t_r2232 t_r2233
theorem k_r223 : nChk 8 14 kAi kCi kL t_r223 2048 4096 14336 16384 = some 108534211133554304716111872 :=
  nChk_node rfl rfl k_r2230 k_r2231 k_r2232 k_r2233 rfl

end ChargeKernel.Pt900
