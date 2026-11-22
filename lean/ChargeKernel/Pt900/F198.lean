/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module

public import ChargeKernel.Pt900.Data

/-! Generated: kernel checks of the subtree `201` (64 leaves). -/

@[expose] public section

namespace ChargeKernel.Pt900
open CenteredMaximal.General

set_option maxRecDepth 100000

def t_r2010 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2010 : nChk 8 14 kAi kCi kL t_r2010 2048 3072 8192 9216 = some 0 := by
  decide +kernel

def t_r2011 : NTree := NTree.ofString "10000"
theorem k_r2011 : nChk 8 14 kAi kCi kL t_r2011 3072 4096 8192 9216 = some 0 := by
  decide +kernel

def t_r2012 : NTree := NTree.ofString "1110000010000010000110000010000010000"
theorem k_r2012 : nChk 8 14 kAi kCi kL t_r2012 2048 3072 9216 10240 = some 0 := by
  decide +kernel

def t_r2013 : NTree := NTree.ofString "10000"
theorem k_r2013 : nChk 8 14 kAi kCi kL t_r2013 3072 4096 9216 10240 = some 0 := by
  decide +kernel

def t_r201 : NTree := .node t_r2010 t_r2011 t_r2012 t_r2013
theorem k_r201 : nChk 8 14 kAi kCi kL t_r201 2048 4096 8192 10240 = some 0 :=
  nChk_node rfl rfl k_r2010 k_r2011 k_r2012 k_r2013 rfl

end ChargeKernel.Pt900
