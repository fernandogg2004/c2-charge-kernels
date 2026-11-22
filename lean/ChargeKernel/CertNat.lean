/-
Copyright (c) 2026 Fernando. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Fernando
-/
module


/-!
# A natural-number version of the certificate checker (definitions)

The rational checker of `CertTree` / `CertSound` / `CertSym` is exact but slow in the kernel, because
every rational operation normalises by a gcd. For certificates whose data are dyadic, every quantity
the checker computes is an integer multiple of a fixed power of two (or of `6 · 2^X` for the final
integrals). This file re-implements the checker on such scaled integers, with the charge loops on
`Nat` only (the kernel evaluates `Nat` arithmetic on literals with GMP). `CertNatSound` proves that it
computes *exactly* the same values as the rational checker, so nothing about the analysis changes.

Scales (quadrant `σu = σv = 1`):
* cell coordinates `r = Rn / 2^er`, `s = Sn / 2^es`, with `er + es = 22`;
* charge positions `p = (P - off) / 2^22`, `q = (Q - off) / 2^22` with `off = 2^32`, strengths
  `b = B / 2^52`;
* box coordinates `u = U / 2^22` with the same offset; distances are scaled by `2^22`;
* rounded reciprocals (`floorK`, `ceilK`) and the sums `smin`, `smax` are scaled by `2^30`;
* `a = Ai / 2^30`, `c = Ci / 2^30`;
* leaf integrals are scaled by `6 · 2^X` with `X = 2 es + 3 er + 53`.
-/

@[expose] public section

noncomputable section

namespace CenteredMaximal.General

/-- A quadtree (the same shape as `QTree`; this file avoids importing Mathlib). -/
inductive NTree where
  | leaf : NTree
  | node : NTree → NTree → NTree → NTree → NTree

/-- Parse one preorder-encoded tree (`'1'` = split, `'0'` = leaf). -/
def NTree.parse : Nat → List Char → Option (NTree × List Char)
  | 0, _ => none
  | _ + 1, '0' :: r => some (.leaf, r)
  | n + 1, '1' :: r =>
      match NTree.parse n r with
      | none => none
      | some (t1, r) =>
        match NTree.parse n r with
        | none => none
        | some (t2, r) =>
          match NTree.parse n r with
          | none => none
          | some (t3, r) =>
            match NTree.parse n r with
            | none => none
            | some (t4, r) => some (.node t1 t2 t3 t4, r)
  | _ + 1, _ => none

/-- The tree encoded by a preorder bitstring (a single leaf if the string is malformed). -/
def NTree.ofString (s : String) : NTree :=
  match NTree.parse 64 s.toList with
  | some (t, _) => t
  | none => .leaf

/-- A list of encoded charges `(P, Q, B)`. -/
inductive NCL where
  | nil : NCL
  | cons (P Q B : Nat) (t : NCL) : NCL

/-- The position offset `2^32`. -/
def nOff : Nat := 4294967296

/-- `|x - y|` on naturals. -/
def nd (x y : Nat) : Nat := x - y + (y - x)

/-- Result of the first charge pass: `smin`, `smax` (scaled by `2^30`) and `allPos`. -/
structure NP1 where
  smin : Nat
  smax : Nat
  pos : Bool

/-- First pass over the charges, for the box `[U0, U1] × [V0, V1]` (offset coordinates). -/
def pass1 (U0 U1 V0 V1 : Nat) (l : NCL) : Nat → Nat → Bool → NP1 :=
  NCL.rec (motive := fun _ => Nat → Nat → Bool → NP1) (fun a b c => ⟨a, b, c⟩)
    (fun P Q B _ ih smin smax pos =>
      ih (smin + B / (Nat.max (nd U0 P) (nd U1 P) + Nat.max (nd V0 Q) (nd V1 Q)))
        (smax + (B + ((U0 - P) + (P - U1) + (V0 - Q) + (Q - V1)) - 1) /
          ((U0 - P) + (P - U1) + (V0 - Q) + (Q - V1)))
        (pos && Nat.blt 0 ((U0 - P) + (P - U1) + (V0 - Q) + (Q - V1)))) l

/-- Result of the tangent pass. -/
structure NP2 where
  ok : Bool
  sal : Nat
  xp : Nat
  xn : Nat
  y1p : Nat
  y1n : Nat
  y2p : Nat
  y2n : Nat

/-- One charge of the tangent pass: `(α, β)` scaled by `2^30`. -/
def tanT0 (U0 U1 V0 V1 P Q : Nat) : Nat := nd (U0 + U1) (2 * P) + nd (V0 + V1) (2 * Q)

/-- Second (tangent) pass over the charges. -/
def pass2 (U0 U1 V0 V1 : Nat) (l : NCL) :
    Bool → Nat → Nat → Nat → Nat → Nat → Nat → Nat → NP2 :=
  NCL.rec (motive := fun _ => Bool → Nat → Nat → Nat → Nat → Nat → Nat → Nat → NP2)
    (fun ok sal xp xn y1p y1n y2p y2n => ⟨ok, sal, xp, xn, y1p, y1n, y2p, y2n⟩)
    (fun P Q B _ ih ok sal xp xn y1p y1n y2p y2n =>
      let T := tanT0 U0 U1 V0 V1 P Q
      let al := 4 * B / T
      let be := (B * 16777216 + T * T - 1) / (T * T)
      let g1 := Nat.ble P U0
      let g2 := Nat.ble Q V0
      ih (ok && ((g1 || Nat.ble U1 P) && (g2 || Nat.ble V1 Q))
            && Nat.ble (al * al * 4194304) (4 * B * be))
        (sal + al)
        (xp + (if g1 then be * P else be * nOff) + (if g2 then be * Q else be * nOff))
        (xn + (if g1 then be * nOff else be * P) + (if g2 then be * nOff else be * Q))
        (if g1 then y1p + be else y1p) (if g1 then y1n else y1n + be)
        (if g2 then y2p + be else y2p) (if g2 then y2n else y2n + be)) l

/-- The certified value of a leaf, scaled by `6 · 2^X`, `X = 2 es + 3 er + 53`. -/
def nLeaf (er es Ai Ci : Nat) (l : NCL) (R0 R1 S0 S1 : Nat) : Int :=
  let U0 := R0 * S0 + nOff
  let U1 := R1 * S1 + nOff
  let V0 := R0 * (2 ^ es - S1) + nOff
  let V1 := R1 * (2 ^ es - S0) + nOff
  let X := 2 * es + 3 * er + 53
  let p1 := pass1 U0 U1 V0 V1 l 0 0 true
  let K := Ci + p1.smin
  let A := Ai * 2 ^ er
  let dR := R1 - R0
  let dS := S1 - S0
  let j1 : Int :=
    if Nat.ble A (R0 * K) then 0
    else if Nat.ble (R1 * K) A then
      ((dS * (Ai * dR * 2 ^ (er + 1) - K * (R1 * R1 - R0 * R0)) * 6 * 2 ^ (X - es - 2 * er - 31) :
        Nat) : Int)
    else ((dS * (A - R0 * K) * dR * 6 * 2 ^ (X - es - 2 * er - 31) : Nat) : Int)
  if p1.pos && Nat.ble (R1 * (Ci + p1.smax)) A then
    let p2 := pass2 U0 U1 V0 V1 l true 0 0 0 0 0 0 0
    if p2.ok then
      let e1 : Int := -((Ci * 4194304 + p2.sal * 4194304 : Nat) + ((p2.xp : Int) - p2.xn))
      let e2 : Int := (p2.y2p : Int) - p2.y2n
      let e3 : Int := ((p2.y1p : Int) - p2.y1n) - e2
      let dR2 : Int := (R1 * R1 - R0 * R0 : Nat)
      let dR3 : Int := (R1 * R1 * R1 - R0 * R0 * R0 : Nat)
      let dS2 : Int := (S1 * S1 - S0 * S0 : Nat)
      let j2 : Int :=
        ((6 * dS * Ai * dR * 2 ^ (X - es - 30 - er) : Nat) : Int)
          + 3 * (dS : Int) * e1 * dR2 * ((2 ^ (X - es - 2 * er - 52) : Nat) : Int)
          + 2 * (dS : Int) * e2 * dR3 * ((2 ^ (X - es - 3 * er - 30) : Nat) : Int)
          + e3 * dR3 * dS2 * ((2 ^ (X - 2 * es - 3 * er - 30) : Nat) : Int)
      min j1 j2
    else j1
  else j1

/-- Evaluate a quadtree on integer cells: the sum of the leaf values, provided every leaf is
nonnegative and every split is exact. -/
def nChk (er es Ai Ci : Nat) (l : NCL) : NTree → Nat → Nat → Nat → Nat → Option Int
  | .leaf, R0, R1, S0, S1 =>
      let v := nLeaf er es Ai Ci l R0 R1 S0 S1
      if 0 ≤ v then some v else none
  | .node t1 t2 t3 t4, R0, R1, S0, S1 =>
      if (R0 + R1) % 2 = 0 ∧ (S0 + S1) % 2 = 0 then
        match nChk er es Ai Ci l t1 R0 ((R0 + R1) / 2) S0 ((S0 + S1) / 2),
          nChk er es Ai Ci l t2 ((R0 + R1) / 2) R1 S0 ((S0 + S1) / 2),
          nChk er es Ai Ci l t3 R0 ((R0 + R1) / 2) ((S0 + S1) / 2) S1,
          nChk er es Ai Ci l t4 ((R0 + R1) / 2) R1 ((S0 + S1) / 2) S1 with
        | some x1, some x2, some x3, some x4 => some (x1 + x2 + x3 + x4)
        | _, _, _, _ => none
      else none

/-- A subtree check with an (integer, scaled) upper bound. -/
def nBnd (er es Ai Ci : Nat) (l : NCL) (t : NTree) (R0 R1 S0 S1 : Nat) (q : Int) : Bool :=
  match nChk er es Ai Ci l t R0 R1 S0 S1 with
  | some v => decide (v ≤ q)
  | none => false

/-- The diamond-check leaf: `allPos`, `0 < r₁` and `r₁ (c + m + smax) ≤ a`, with `m = mN / mD`. -/
def nV1Leaf (er es Ai Ci mN mD : Nat) (l : NCL) (R0 R1 S0 S1 : Nat) : Bool :=
  let p1 := pass1 (R0 * S0 + nOff) (R1 * S1 + nOff) (R0 * (2 ^ es - S1) + nOff)
    (R1 * (2 ^ es - S0) + nOff) l 0 0 true
  p1.pos && Nat.blt 0 R1 && Nat.ble (R1 * (mD * (Ci + p1.smax) + mN * 1073741824)) (Ai * mD * 2 ^ er)

def nV1 (er es Ai Ci mN mD : Nat) (l : NCL) : NTree → Nat → Nat → Nat → Nat → Bool
  | .leaf, R0, R1, S0, S1 => nV1Leaf er es Ai Ci mN mD l R0 R1 S0 S1
  | .node t1 t2 t3 t4, R0, R1, S0, S1 =>
      decide ((R0 + R1) % 2 = 0 ∧ (S0 + S1) % 2 = 0)
        && nV1 er es Ai Ci mN mD l t1 R0 ((R0 + R1) / 2) S0 ((S0 + S1) / 2)
        && nV1 er es Ai Ci mN mD l t2 ((R0 + R1) / 2) R1 S0 ((S0 + S1) / 2)
        && nV1 er es Ai Ci mN mD l t3 R0 ((R0 + R1) / 2) ((S0 + S1) / 2) S1
        && nV1 er es Ai Ci mN mD l t4 ((R0 + R1) / 2) R1 ((S0 + S1) / 2) S1

/-! ### Assembling subtree checks -/

theorem nChk_node {er es Ai Ci : Nat} {l : NCL} {t1 t2 t3 t4 : NTree} {R0 R1 S0 S1 : Nat}
    {x1 x2 x3 x4 v : Int} (hR : (R0 + R1) % 2 = 0) (hS : (S0 + S1) % 2 = 0)
    (h1 : nChk er es Ai Ci l t1 R0 ((R0 + R1) / 2) S0 ((S0 + S1) / 2) = some x1)
    (h2 : nChk er es Ai Ci l t2 ((R0 + R1) / 2) R1 S0 ((S0 + S1) / 2) = some x2)
    (h3 : nChk er es Ai Ci l t3 R0 ((R0 + R1) / 2) ((S0 + S1) / 2) S1 = some x3)
    (h4 : nChk er es Ai Ci l t4 ((R0 + R1) / 2) R1 ((S0 + S1) / 2) S1 = some x4)
    (hv : x1 + x2 + x3 + x4 = v) :
    nChk er es Ai Ci l (.node t1 t2 t3 t4) R0 R1 S0 S1 = some v := by
  subst hv
  simp only [nChk, hR, hS, and_self, ite_true, h1, h2, h3, h4]

theorem nV1_node {er es Ai Ci mN mD : Nat} {l : NCL} {t1 t2 t3 t4 : NTree} {R0 R1 S0 S1 : Nat}
    (hR : (R0 + R1) % 2 = 0) (hS : (S0 + S1) % 2 = 0)
    (h1 : nV1 er es Ai Ci mN mD l t1 R0 ((R0 + R1) / 2) S0 ((S0 + S1) / 2) = true)
    (h2 : nV1 er es Ai Ci mN mD l t2 ((R0 + R1) / 2) R1 S0 ((S0 + S1) / 2) = true)
    (h3 : nV1 er es Ai Ci mN mD l t3 R0 ((R0 + R1) / 2) ((S0 + S1) / 2) S1 = true)
    (h4 : nV1 er es Ai Ci mN mD l t4 ((R0 + R1) / 2) R1 ((S0 + S1) / 2) S1 = true) :
    nV1 er es Ai Ci mN mD l (.node t1 t2 t3 t4) R0 R1 S0 S1 = true := by
  simp only [nV1, hR, hS, h1, h2, h3, h4, and_self, decide_true, Bool.and_self]

end CenteredMaximal.General
