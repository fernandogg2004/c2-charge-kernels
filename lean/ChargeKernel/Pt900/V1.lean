/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel check of the diamond tree. -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def u_r0 : NTree := NTree.ofString "0"
theorem w_r0 : nV1 10 12 kAi kCi 1003 1000 kL u_r0 0 512 0 2048 = true := by
  decide +kernel

def u_r10 : NTree := NTree.ofString "0"
theorem w_r10 : nV1 10 12 kAi kCi 1003 1000 kL u_r10 512 768 0 1024 = true := by
  decide +kernel

def u_r110 : NTree := NTree.ofString "0"
theorem w_r110 : nV1 10 12 kAi kCi 1003 1000 kL u_r110 768 896 0 512 = true := by
  decide +kernel

def u_r1110 : NTree := NTree.ofString "0"
theorem w_r1110 : nV1 10 12 kAi kCi 1003 1000 kL u_r1110 896 960 0 256 = true := by
  decide +kernel

def u_r1111 : NTree := NTree.ofString "101010101010000010000010100000100000101010000000100000101010000010000010100000100000101010100000100000101000001000001010100000100000101000000"
theorem w_r1111 : nV1 10 12 kAi kCi 1003 1000 kL u_r1111 960 1024 0 256 = true := by
  decide +kernel

def u_r1112 : NTree := NTree.ofString "0"
theorem w_r1112 : nV1 10 12 kAi kCi 1003 1000 kL u_r1112 896 960 256 512 = true := by
  decide +kernel

def u_r1113 : NTree := NTree.ofString "1010101000001000001010000010000010101000001000001010000010000"
theorem w_r1113 : nV1 10 12 kAi kCi 1003 1000 kL u_r1113 960 1024 256 512 = true := by
  decide +kernel

def u_r111 : NTree := .node u_r1110 u_r1111 u_r1112 u_r1113
theorem w_r111 : nV1 10 12 kAi kCi 1003 1000 kL u_r111 896 1024 0 512 = true :=
  nV1_node rfl rfl w_r1110 w_r1111 w_r1112 w_r1113

def u_r112 : NTree := NTree.ofString "0"
theorem w_r112 : nV1 10 12 kAi kCi 1003 1000 kL u_r112 768 896 512 1024 = true := by
  decide +kernel

def u_r1130 : NTree := NTree.ofString "0"
theorem w_r1130 : nV1 10 12 kAi kCi 1003 1000 kL u_r1130 896 960 512 768 = true := by
  decide +kernel

def u_r1131 : NTree := NTree.ofString "1010101010000010000010100000100000101010001000001010000010000010101000001000001010000010000010101010100000001000001010000010000010101000001000001010000010000"
theorem w_r1131 : nV1 10 12 kAi kCi 1003 1000 kL u_r1131 960 1024 512 768 = true := by
  decide +kernel

def u_r1132 : NTree := NTree.ofString "0"
theorem w_r1132 : nV1 10 12 kAi kCi 1003 1000 kL u_r1132 896 960 768 1024 = true := by
  decide +kernel

def u_r1133 : NTree := NTree.ofString "10101010000010000010100000100010000010101010000010000010100000100000101010000010000010101000001000001010000010000"
theorem w_r1133 : nV1 10 12 kAi kCi 1003 1000 kL u_r1133 960 1024 768 1024 = true := by
  decide +kernel

def u_r113 : NTree := .node u_r1130 u_r1131 u_r1132 u_r1133
theorem w_r113 : nV1 10 12 kAi kCi 1003 1000 kL u_r113 896 1024 512 1024 = true :=
  nV1_node rfl rfl w_r1130 w_r1131 w_r1132 w_r1133

def u_r11 : NTree := .node u_r110 u_r111 u_r112 u_r113
theorem w_r11 : nV1 10 12 kAi kCi 1003 1000 kL u_r11 768 1024 0 1024 = true :=
  nV1_node rfl rfl w_r110 w_r111 w_r112 w_r113

def u_r12 : NTree := NTree.ofString "0"
theorem w_r12 : nV1 10 12 kAi kCi 1003 1000 kL u_r12 512 768 1024 2048 = true := by
  decide +kernel

def u_r130 : NTree := NTree.ofString "0"
theorem w_r130 : nV1 10 12 kAi kCi 1003 1000 kL u_r130 768 896 1024 1536 = true := by
  decide +kernel

def u_r1310 : NTree := NTree.ofString "0"
theorem w_r1310 : nV1 10 12 kAi kCi 1003 1000 kL u_r1310 896 960 1024 1280 = true := by
  decide +kernel

def u_r1311 : NTree := NTree.ofString "101010101010000010000010100000100000101000001000001010100000100000101000001000001010101000001000001000001010000010000"
theorem w_r1311 : nV1 10 12 kAi kCi 1003 1000 kL u_r1311 960 1024 1024 1280 = true := by
  decide +kernel

def u_r1312 : NTree := NTree.ofString "0"
theorem w_r1312 : nV1 10 12 kAi kCi 1003 1000 kL u_r1312 896 960 1280 1536 = true := by
  decide +kernel

def u_r1313 : NTree := NTree.ofString "101010101000001000001010000010000010101000001000001010000010000010101010100000100000101000001000001010100000100000101000000010101000001000001010000010000"
theorem w_r1313 : nV1 10 12 kAi kCi 1003 1000 kL u_r1313 960 1024 1280 1536 = true := by
  decide +kernel

def u_r131 : NTree := .node u_r1310 u_r1311 u_r1312 u_r1313
theorem w_r131 : nV1 10 12 kAi kCi 1003 1000 kL u_r131 896 1024 1024 1536 = true :=
  nV1_node rfl rfl w_r1310 w_r1311 w_r1312 w_r1313

def u_r132 : NTree := NTree.ofString "0"
theorem w_r132 : nV1 10 12 kAi kCi 1003 1000 kL u_r132 768 896 1536 2048 = true := by
  decide +kernel

def u_r1330 : NTree := NTree.ofString "0"
theorem w_r1330 : nV1 10 12 kAi kCi 1003 1000 kL u_r1330 896 960 1536 1792 = true := by
  decide +kernel

def u_r1331 : NTree := NTree.ofString "1010101010000010000010100000100000101010000000100000101010001000001010000010000010101000001000001010000010000"
theorem w_r1331 : nV1 10 12 kAi kCi 1003 1000 kL u_r1331 960 1024 1536 1792 = true := by
  decide +kernel

def u_r1332 : NTree := NTree.ofString "0"
theorem w_r1332 : nV1 10 12 kAi kCi 1003 1000 kL u_r1332 896 960 1792 2048 = true := by
  decide +kernel

def u_r1333 : NTree := NTree.ofString "101010101000001000100000101010000010000010100000100000101010100000100000100000101000001000001010101000001000001010000010000010101000001000001010000010000"
theorem w_r1333 : nV1 10 12 kAi kCi 1003 1000 kL u_r1333 960 1024 1792 2048 = true := by
  decide +kernel

def u_r133 : NTree := .node u_r1330 u_r1331 u_r1332 u_r1333
theorem w_r133 : nV1 10 12 kAi kCi 1003 1000 kL u_r133 896 1024 1536 2048 = true :=
  nV1_node rfl rfl w_r1330 w_r1331 w_r1332 w_r1333

def u_r13 : NTree := .node u_r130 u_r131 u_r132 u_r133
theorem w_r13 : nV1 10 12 kAi kCi 1003 1000 kL u_r13 768 1024 1024 2048 = true :=
  nV1_node rfl rfl w_r130 w_r131 w_r132 w_r133

def u_r1 : NTree := .node u_r10 u_r11 u_r12 u_r13
theorem w_r1 : nV1 10 12 kAi kCi 1003 1000 kL u_r1 512 1024 0 2048 = true :=
  nV1_node rfl rfl w_r10 w_r11 w_r12 w_r13

def u_r2 : NTree := NTree.ofString "0"
theorem w_r2 : nV1 10 12 kAi kCi 1003 1000 kL u_r2 0 512 2048 4096 = true := by
  decide +kernel

def u_r30 : NTree := NTree.ofString "0"
theorem w_r30 : nV1 10 12 kAi kCi 1003 1000 kL u_r30 512 768 2048 3072 = true := by
  decide +kernel

def u_r310 : NTree := NTree.ofString "0"
theorem w_r310 : nV1 10 12 kAi kCi 1003 1000 kL u_r310 768 896 2048 2560 = true := by
  decide +kernel

def u_r3110 : NTree := NTree.ofString "0"
theorem w_r3110 : nV1 10 12 kAi kCi 1003 1000 kL u_r3110 896 960 2048 2304 = true := by
  decide +kernel

def u_r3111 : NTree := NTree.ofString "101010101000001000001010000010000010101000001000001010000010000010101010000010000010100000101000001000001010101000001000001010000010000010101000000010000"
theorem w_r3111 : nV1 10 12 kAi kCi 1003 1000 kL u_r3111 960 1024 2048 2304 = true := by
  decide +kernel

def u_r3112 : NTree := NTree.ofString "0"
theorem w_r3112 : nV1 10 12 kAi kCi 1003 1000 kL u_r3112 896 960 2304 2560 = true := by
  decide +kernel

def u_r3113 : NTree := NTree.ofString "1010101010000010000010100000100000101010000010000010100000001010100000100010000010101000001000001010000010000"
theorem w_r3113 : nV1 10 12 kAi kCi 1003 1000 kL u_r3113 960 1024 2304 2560 = true := by
  decide +kernel

def u_r311 : NTree := .node u_r3110 u_r3111 u_r3112 u_r3113
theorem w_r311 : nV1 10 12 kAi kCi 1003 1000 kL u_r311 896 1024 2048 2560 = true :=
  nV1_node rfl rfl w_r3110 w_r3111 w_r3112 w_r3113

def u_r312 : NTree := NTree.ofString "0"
theorem w_r312 : nV1 10 12 kAi kCi 1003 1000 kL u_r312 768 896 2560 3072 = true := by
  decide +kernel

def u_r3130 : NTree := NTree.ofString "0"
theorem w_r3130 : nV1 10 12 kAi kCi 1003 1000 kL u_r3130 896 960 2560 2816 = true := by
  decide +kernel

def u_r3131 : NTree := NTree.ofString "101010101000001000001010000010000010101000100000101000001000001010100000100000101000001000001010101000001000001010000010000010101000001000001010000010000"
theorem w_r3131 : nV1 10 12 kAi kCi 1003 1000 kL u_r3131 960 1024 2560 2816 = true := by
  decide +kernel

def u_r3132 : NTree := NTree.ofString "0"
theorem w_r3132 : nV1 10 12 kAi kCi 1003 1000 kL u_r3132 896 960 2816 3072 = true := by
  decide +kernel

def u_r3133 : NTree := NTree.ofString "101010100000100000101000001010000010000010101010000010000010100000100000101010000010000010101000001000001010000010000"
theorem w_r3133 : nV1 10 12 kAi kCi 1003 1000 kL u_r3133 960 1024 2816 3072 = true := by
  decide +kernel

def u_r313 : NTree := .node u_r3130 u_r3131 u_r3132 u_r3133
theorem w_r313 : nV1 10 12 kAi kCi 1003 1000 kL u_r313 896 1024 2560 3072 = true :=
  nV1_node rfl rfl w_r3130 w_r3131 w_r3132 w_r3133

def u_r31 : NTree := .node u_r310 u_r311 u_r312 u_r313
theorem w_r31 : nV1 10 12 kAi kCi 1003 1000 kL u_r31 768 1024 2048 3072 = true :=
  nV1_node rfl rfl w_r310 w_r311 w_r312 w_r313

def u_r32 : NTree := NTree.ofString "0"
theorem w_r32 : nV1 10 12 kAi kCi 1003 1000 kL u_r32 512 768 3072 4096 = true := by
  decide +kernel

def u_r330 : NTree := NTree.ofString "0"
theorem w_r330 : nV1 10 12 kAi kCi 1003 1000 kL u_r330 768 896 3072 3584 = true := by
  decide +kernel

def u_r3310 : NTree := NTree.ofString "0"
theorem w_r3310 : nV1 10 12 kAi kCi 1003 1000 kL u_r3310 896 960 3072 3328 = true := by
  decide +kernel

def u_r3311 : NTree := NTree.ofString "10101010101000001000001010000010000010100000100000101010000010000010100000100000101010100000001000001010000010000"
theorem w_r3311 : nV1 10 12 kAi kCi 1003 1000 kL u_r3311 960 1024 3072 3328 = true := by
  decide +kernel

def u_r3312 : NTree := NTree.ofString "0"
theorem w_r3312 : nV1 10 12 kAi kCi 1003 1000 kL u_r3312 896 960 3328 3584 = true := by
  decide +kernel

def u_r3313 : NTree := NTree.ofString "1010101010000010000010100000100000101010000010000010100000100010000010101010100000100000101000001000001010100000100000101000000010101000001000001010000010000"
theorem w_r3313 : nV1 10 12 kAi kCi 1003 1000 kL u_r3313 960 1024 3328 3584 = true := by
  decide +kernel

def u_r331 : NTree := .node u_r3310 u_r3311 u_r3312 u_r3313
theorem w_r331 : nV1 10 12 kAi kCi 1003 1000 kL u_r331 896 1024 3072 3584 = true :=
  nV1_node rfl rfl w_r3310 w_r3311 w_r3312 w_r3313

def u_r332 : NTree := NTree.ofString "0"
theorem w_r332 : nV1 10 12 kAi kCi 1003 1000 kL u_r332 768 896 3584 4096 = true := by
  decide +kernel

def u_r3330 : NTree := NTree.ofString "0"
theorem w_r3330 : nV1 10 12 kAi kCi 1003 1000 kL u_r3330 896 960 3584 3840 = true := by
  decide +kernel

def u_r3331 : NTree := NTree.ofString "1010101000001000001010000010000010101000001000001010000010000"
theorem w_r3331 : nV1 10 12 kAi kCi 1003 1000 kL u_r3331 960 1024 3584 3840 = true := by
  decide +kernel

def u_r3332 : NTree := NTree.ofString "0"
theorem w_r3332 : nV1 10 12 kAi kCi 1003 1000 kL u_r3332 896 960 3840 4096 = true := by
  decide +kernel

def u_r3333 : NTree := NTree.ofString "101010100010000010100000100000101010000010000010100000100000101010100000100000101000001000001010100000100010000010101000001000001010000010000"
theorem w_r3333 : nV1 10 12 kAi kCi 1003 1000 kL u_r3333 960 1024 3840 4096 = true := by
  decide +kernel

def u_r333 : NTree := .node u_r3330 u_r3331 u_r3332 u_r3333
theorem w_r333 : nV1 10 12 kAi kCi 1003 1000 kL u_r333 896 1024 3584 4096 = true :=
  nV1_node rfl rfl w_r3330 w_r3331 w_r3332 w_r3333

def u_r33 : NTree := .node u_r330 u_r331 u_r332 u_r333
theorem w_r33 : nV1 10 12 kAi kCi 1003 1000 kL u_r33 768 1024 3072 4096 = true :=
  nV1_node rfl rfl w_r330 w_r331 w_r332 w_r333

def u_r3 : NTree := .node u_r30 u_r31 u_r32 u_r33
theorem w_r3 : nV1 10 12 kAi kCi 1003 1000 kL u_r3 512 1024 2048 4096 = true :=
  nV1_node rfl rfl w_r30 w_r31 w_r32 w_r33

def u_r : NTree := .node u_r0 u_r1 u_r2 u_r3
theorem w_r : nV1 10 12 kAi kCi 1003 1000 kL u_r 0 1024 0 4096 = true :=
  nV1_node rfl rfl w_r0 w_r1 w_r2 w_r3

end ChargeKernel.Pt900
