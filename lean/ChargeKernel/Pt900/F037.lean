/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `001` (313 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r00100000 : NTree := NTree.ofString "11100001000010000100001000011000000010000"
theorem k_r00100000 : nChk 8 14 kAi kCi kL t_r00100000 2048 2112 0 64 = some 60192795823670542077001728 := by
  decide +kernel

def t_r00100001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00100001 : nChk 8 14 kAi kCi kL t_r00100001 2112 2176 0 64 = some 0 := by
  decide +kernel

def t_r00100002 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00100002 : nChk 8 14 kAi kCi kL t_r00100002 2048 2112 64 128 = some 8164897861905321736273920 := by
  decide +kernel

def t_r00100003 : NTree := NTree.ofString "110000000"
theorem k_r00100003 : nChk 8 14 kAi kCi kL t_r00100003 2112 2176 64 128 = some 18684972244206464406650880 := by
  decide +kernel

def t_r0010000 : NTree := .node t_r00100000 t_r00100001 t_r00100002 t_r00100003
theorem k_r0010000 : nChk 8 14 kAi kCi kL t_r0010000 2048 2176 0 128 = some 87042665929782328219926528 :=
  nChk_node rfl rfl k_r00100000 k_r00100001 k_r00100002 k_r00100003 rfl

def t_r0010001 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0010001 : nChk 8 14 kAi kCi kL t_r0010001 2176 2304 0 128 = some 0 := by
  decide +kernel

def t_r0010002 : NTree := NTree.ofString "1110000100001000001000011000000010000"
theorem k_r0010002 : nChk 8 14 kAi kCi kL t_r0010002 2048 2176 128 256 = some 7297495062071351200186368 := by
  decide +kernel

def t_r0010003 : NTree := NTree.ofString "1100000100000"
theorem k_r0010003 : nChk 8 14 kAi kCi kL t_r0010003 2176 2304 128 256 = some 0 := by
  decide +kernel

def t_r001000 : NTree := .node t_r0010000 t_r0010001 t_r0010002 t_r0010003
theorem k_r001000 : nChk 8 14 kAi kCi kL t_r001000 2048 2304 0 256 = some 94340160991853679420112896 :=
  nChk_node rfl rfl k_r0010000 k_r0010001 k_r0010002 k_r0010003 rfl

def t_r001001 : NTree := NTree.ofString "11000010000100000"
theorem k_r001001 : nChk 8 14 kAi kCi kL t_r001001 2304 2560 0 256 = some 0 := by
  decide +kernel

def t_r0010020 : NTree := NTree.ofString "110000100001000010000"
theorem k_r0010020 : nChk 8 14 kAi kCi kL t_r0010020 2048 2176 256 384 = some 0 := by
  decide +kernel

def t_r0010021 : NTree := NTree.ofString "10000"
theorem k_r0010021 : nChk 8 14 kAi kCi kL t_r0010021 2176 2304 256 384 = some 0 := by
  decide +kernel

def t_r0010022 : NTree := NTree.ofString "1100000100000"
theorem k_r0010022 : nChk 8 14 kAi kCi kL t_r0010022 2048 2176 384 512 = some 14194050141700625295998976 := by
  decide +kernel

def t_r0010023 : NTree := NTree.ofString "10000"
theorem k_r0010023 : nChk 8 14 kAi kCi kL t_r0010023 2176 2304 384 512 = some 0 := by
  decide +kernel

def t_r001002 : NTree := .node t_r0010020 t_r0010021 t_r0010022 t_r0010023
theorem k_r001002 : nChk 8 14 kAi kCi kL t_r001002 2048 2304 256 512 = some 14194050141700625295998976 :=
  nChk_node rfl rfl k_r0010020 k_r0010021 k_r0010022 k_r0010023 rfl

def t_r001003 : NTree := NTree.ofString "1100000100000"
theorem k_r001003 : nChk 8 14 kAi kCi kL t_r001003 2304 2560 256 512 = some 0 := by
  decide +kernel

def t_r00100 : NTree := .node t_r001000 t_r001001 t_r001002 t_r001003
theorem k_r00100 : nChk 8 14 kAi kCi kL t_r00100 2048 2560 0 512 = some 108534211133554304716111872 :=
  nChk_node rfl rfl k_r001000 k_r001001 k_r001002 k_r001003 rfl

def t_r00101 : NTree := NTree.ofString "1100000100000"
theorem k_r00101 : nChk 8 14 kAi kCi kL t_r00101 2560 3072 0 512 = some 0 := by
  decide +kernel

def t_r001020 : NTree := NTree.ofString "1110000000100001000010000"
theorem k_r001020 : nChk 8 14 kAi kCi kL t_r001020 2048 2304 512 768 = some 0 := by
  decide +kernel

def t_r001021 : NTree := NTree.ofString "110000000"
theorem k_r001021 : nChk 8 14 kAi kCi kL t_r001021 2304 2560 512 768 = some 0 := by
  decide +kernel

def t_r001022 : NTree := NTree.ofString "110000100001000010000"
theorem k_r001022 : nChk 8 14 kAi kCi kL t_r001022 2048 2304 768 1024 = some 0 := by
  decide +kernel

def t_r001023 : NTree := NTree.ofString "10000"
theorem k_r001023 : nChk 8 14 kAi kCi kL t_r001023 2304 2560 768 1024 = some 0 := by
  decide +kernel

def t_r00102 : NTree := .node t_r001020 t_r001021 t_r001022 t_r001023
theorem k_r00102 : nChk 8 14 kAi kCi kL t_r00102 2048 2560 512 1024 = some 0 :=
  nChk_node rfl rfl k_r001020 k_r001021 k_r001022 k_r001023 rfl

def t_r00103 : NTree := NTree.ofString "1100000100000"
theorem k_r00103 : nChk 8 14 kAi kCi kL t_r00103 2560 3072 512 1024 = some 0 := by
  decide +kernel

def t_r0010 : NTree := .node t_r00100 t_r00101 t_r00102 t_r00103
theorem k_r0010 : nChk 8 14 kAi kCi kL t_r0010 2048 3072 0 1024 = some 108534211133554304716111872 :=
  nChk_node rfl rfl k_r00100 k_r00101 k_r00102 k_r00103 rfl

def t_r0011 : NTree := NTree.ofString "1100000100000"
theorem k_r0011 : nChk 8 14 kAi kCi kL t_r0011 3072 4096 0 1024 = some 0 := by
  decide +kernel

def t_r00120 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r00120 : nChk 8 14 kAi kCi kL t_r00120 2048 2560 1024 1536 = some 0 := by
  decide +kernel

def t_r00121 : NTree := NTree.ofString "10000"
theorem k_r00121 : nChk 8 14 kAi kCi kL t_r00121 2560 3072 1024 1536 = some 0 := by
  decide +kernel

def t_r00122 : NTree := NTree.ofString "110000100001000010000"
theorem k_r00122 : nChk 8 14 kAi kCi kL t_r00122 2048 2560 1536 2048 = some 0 := by
  decide +kernel

def t_r00123 : NTree := NTree.ofString "10000"
theorem k_r00123 : nChk 8 14 kAi kCi kL t_r00123 2560 3072 1536 2048 = some 0 := by
  decide +kernel

def t_r0012 : NTree := .node t_r00120 t_r00121 t_r00122 t_r00123
theorem k_r0012 : nChk 8 14 kAi kCi kL t_r0012 2048 3072 1024 2048 = some 0 :=
  nChk_node rfl rfl k_r00120 k_r00121 k_r00122 k_r00123 rfl

def t_r0013 : NTree := NTree.ofString "10000"
theorem k_r0013 : nChk 8 14 kAi kCi kL t_r0013 3072 4096 1024 2048 = some 0 := by
  decide +kernel

def t_r001 : NTree := .node t_r0010 t_r0011 t_r0012 t_r0013
theorem k_r001 : nChk 8 14 kAi kCi kL t_r001 2048 4096 0 2048 = some 108534211133554304716111872 :=
  nChk_node rfl rfl k_r0010 k_r0011 k_r0012 k_r0013 rfl

end ChargeKernel.Pt900
