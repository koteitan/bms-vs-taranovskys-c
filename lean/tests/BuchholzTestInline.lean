import Std.Data.HashMap
/-
Pair Sequence System (2 行 BMS) → Buchholz の順序数表記 (0, D_ν, +) の翻訳。
naruyoko 氏 common.js の `Trans`（P進大好きbot 氏のペア数列停止性証明の変換写像）の移植。

  項:  0 | D_ν a | (t_1, …, t_m)   (和は JS の配列そのまま。正規化しない)
  文字列化: `D_0 (D_2 0,D_1 D_2 0)`

対応は関数名を JS と揃えた。ペア列は (行 0, 行 1) の列の配列で、値は JS の
number に合わせて Int（Red の途中で負のオフセットが現れる）。
-/

namespace Buchholz

/-- ペア列: 列 (行 0 の値, 行 1 の値) の配列。 -/
abbrev PS := Array (Int × Int)

/-- Buchholz 項。`sum` は JS の配列に対応し、要素数の制約は付けない。 -/
inductive BT where
  | zero
  | D (nu : Int) (a : BT)
  | sum (ts : List BT)
deriving BEq, Repr, Inhabited

def BT.one : BT := .D 0 .zero

partial def BT.toString : BT → String
  | .zero => "0"
  | .D nu a => s!"D_{nu} {a.toString}"
  | .sum ts => "(" ++ String.intercalate "," (ts.map BT.toString) ++ ")"

instance : ToString BT := ⟨BT.toString⟩

/-! ### ペア列の操作 (common.js 60–436 行) -/

def pget (M : PS) (i : Nat) (j : Int) : Int :=
  if j < 0 || j ≥ M.size then 0
  else
    let c := M[j.toNat]!
    if i == 0 then c.1 else c.2

def sizeI (M : PS) : Int := M.size

/-- `findParent(M,i,j,k)`: 行 i での j の親（添字 ≥ k に限る）。無ければ -1。 -/
partial def findParent (M : PS) (i : Nat) (j : Int) (k : Int := 0) : Int :=
  if j < 0 || j ≥ sizeI M then -1
  else if i == 0 then
    let rec loop0 (j0 : Int) : Int :=
      if j0 < k then -1
      else if pget M 0 j0 < pget M 0 j then j0
      else loop0 (j0 - 1)
    loop0 (j - 1)
  else if i == 1 then
    let rec loop1 (j0 : Int) : Int :=
      if j0 < k then -1
      else if pget M 1 j0 < pget M 1 j then j0
      else loop1 (findParent M 0 j0 k)
    loop1 (findParent M 0 j k)
  else -1

def isParent (M : PS) (i : Nat) (j k : Int) : Bool :=
  k ≥ 0 && k < sizeI M && k == findParent M i j k

partial def findAncestors (M : PS) (i : Nat) (j : Int) (k : Int := 0) : List Int :=
  if j < k || j ≥ sizeI M then []
  else
    let rec loop (j0 : Int) (acc : List Int) : List Int :=
      let j0' := findParent M i j0
      if j0' ≥ k then loop j0' (acc ++ [j0']) else acc
    loop j [j]

partial def isAncestor (M : PS) (i : Nat) (j k : Int) : Bool :=
  if k < 0 || k ≥ sizeI M then false
  else
    let rec loop (j0 : Int) : Bool :=
      if k == j0 then true
      else
        let j0' := findParent M i j0 k
        if j0' == -1 then false else loop j0'
    loop j

def pred (M : PS) : PS := if M.size == 1 then M else M.pop

def derp (M : PS) : PS := M.extract 1 M.size

def incrFirst (M : PS) (i : Int := 1) : PS := M.map fun c => (c.1 + i, c.2)

def isZeroPair (M : PS) : Bool := M.size == 1 && pget M 1 0 == 0

def isPrincipalPair (M : PS) : Bool := !isZeroPair M && isAncestor M 0 (sizeI M - 1) 0

def slice (M : PS) (j0 j1 : Int) : PS :=
  -- JS の M.slice(j0, j1)（負の添字は使わない前提）
  let a := (max j0 0).toNat
  let b := (max j1 0).toNat
  M.extract a b

partial def ppair (M : PS) : List PS :=
  let rec loop (j1 : Int) (r : List PS) : List PS :=
    if j1 < 0 then r
    else
      let ans := findAncestors M 0 j1
      let j0 := ans.getLast!
      loop (j0 - 1) (slice M j0 (j1 + 1) :: r)
  loop (sizeI M - 1) []

def isUnadmitted (M : PS) (j : Int) : Bool :=
  j > sizeI M || (isParent M 1 j (j - 1) && isParent M 1 (j + 1) j)

def isAdmitted (M : PS) (j : Int) : Bool := !isUnadmitted M j

partial def adm (M : PS) (j : Int) : Int :=
  if j < 0 then -1   -- JS では例外
  else if isAdmitted M j then j else adm M (j - 1)

def idxSum (Q : List PS) : List Int :=
  let (r, _) := Q.foldl (fun (acc, j) q => let j' := j + sizeI q; (acc ++ [j'], j')) ([0], (0 : Int))
  r

partial def trMax (M : PS) : Int :=
  let rec loop (j : Int) : Int :=
    if j ≥ sizeI M then sizeI M - 1
    else if !isParent M 1 (j + 1) j then j
    else loop (j + 1)
  loop 0

def br (M : PS) : List PS := ppair (slice M (trMax M + 1) (sizeI M))

def firstNodes (M : PS) : List Int :=
  let d := trMax M + 1
  (idxSum (br M)).map (· + d)

def joints (M : PS) : List Int :=
  (firstNodes M).dropLast.map fun e => findParent M 0 e

def jjSeq (j0 j1 : Int) : PS :=
  if j1 < j0 then #[]
  else ((List.range (j1 - j0 + 1).toNat).map fun (t : Nat) => (j0 + Int.ofNat t, j0 + Int.ofNat t)).toArray

def equalPair (M N : PS) : Bool := M == N

/-- `Red(M)`: 簡約形。 -/
partial def red (M : PS) : PS :=
  if isZeroPair M then #[(0, 0)]
  else if isPrincipalPair M then
    let j1 := sizeI M - 1
    if pget M 0 0 == 0 && pget M 1 0 == 0 then
      let j1p := trMax M
      if j1p == j1 then jjSeq 0 j1
      else
        let brs := br M
        let fn := firstNodes M
        let jn := joints M
        let r0 := jjSeq 0 j1p
        (List.range brs.length).foldl (fun r J =>
          let bJ := brs[J]!
          let nJ := if pget bJ 1 0 == 0 then -1 else findParent M 1 fn[J]!
          let NJ : PS := #[(jn[J]! + 1, nJ + 1)] ++ derp bJ
          r ++ incrFirst (red NJ) (jn[J]! - nJ)) r0
    else
      let M10 := pget M 1 0
      if M10 == 0 then red (incrFirst M (-(pget M 0 0)))
      else
        let N := red (jjSeq 0 (M10 - 1) ++ incrFirst M M10)
        let j1' := sizeI N - 1
        if M10 ≤ j1' && isPrincipalPair (slice N M10 (sizeI N)) then
          incrFirst (slice N M10 (sizeI N)) (-(pget N 0 M10) + pget N 1 M10)
        else M
  else
    (ppair M).foldl (fun acc e => acc ++ red e) #[]

def isReduced (M : PS) : Bool := equalPair (red M) M

/-! ### Buchholz 項の操作 (common.js 640–937 行) -/

def isArr : BT → Bool
  | .sum _ => true
  | _ => false

def isObj : BT → Bool
  | .D _ _ => true
  | _ => false

partial def lessThan (a b : BT) : Bool :=
  if a == b then false
  else
    match a, b with
    | .sum as, .sum bs =>
      let rec loop : List BT → List BT → Bool
        | x :: xs, y :: ys => if lessThan x y then true else if lessThan y x then false else loop xs ys
        | _, _ => as.length < bs.length
      loop as bs
    | .sum as, .D _ _ => lessThan as.head! b
    | .sum _, .zero => false
    | .D _ _, .sum bs => !lessThan bs.head! a
    | .D s1 i1, .D s2 i2 => s1 < s2 || (s1 == s2 && lessThan i1 i2)
    | .D _ _, .zero => false
    | .zero, _ => true

def plus (a b : BT) : BT :=
  match a, b with
  | .sum as, .sum bs => .sum (as ++ bs)
  | .sum as, .D _ _ => .sum (as ++ [b])
  | .sum _, .zero => a
  | .D _ _, .sum bs => .sum (a :: bs)
  | .D _ _, .D _ _ => .sum [a, b]
  | .D _ _, .zero => a
  | .zero, _ => b

def pbuchholz : BT → List BT
  | .sum ts => ts
  | .D n a => [.D n a]
  | .zero => []

partial def replaceMark (t c cc : BT) : Option BT :=
  match t with
  | .sum ts =>
    match ts.getLast? with
    | none => none
    | some l =>
      match replaceMark l c cc with
      | some tt => some (.sum (ts.dropLast ++ [tt]))
      | none => none
  | .D s inner =>
    if t == c then some cc
    else
      match replaceMark inner c cc with
      | some tt => some (.D s tt)
      | none => none
  | .zero => none

def nextMarked : BT → Option BT
  | .sum ts => ts.getLast?
  | .D _ inner => some inner
  | .zero => none

partial def isMarked (t : Option BT) (c : BT) : Bool :=
  match t with
  | none => false
  | some t => if t == c then true else isMarked (nextMarked t) c

/-! ### Trans / TransType / Mark (common.js 991–1135 行), メモ化つき -/

structure Memo where
  tyM : Std.HashMap String Int := {}
  trM : Std.HashMap String BT := {}
  mkM : Std.HashMap String BT := {}

abbrev TM := StateM Memo

def keyOf (M : PS) : String :=
  String.intercalate ";" (M.toList.map fun c => s!"{c.1},{c.2}")

private def dOf (M : PS) (j : Int) : BT := .D (pget M 1 j) .zero

mutual

partial def transType (M : PS) : TM Int := do
  let k := keyOf M
  match (← get).tyM.get? k with
  | some r => return r
  | none =>
    let r ← transTypeInternal M
    modify fun s => { s with tyM := s.tyM.insert k r }
    return r

partial def transTypeInternal (M : PS) : TM Int := do
  let j1 := sizeI M - 1
  if isReduced M then
    if j1 == 0 then return -1
    else if isPrincipalPair M then
      let t1 ← trans (pred M)
      if t1 == .zero then return 0
      else
        let j0 := findParent M 0 j1
        if pget M 1 j1 == 0 then return (if isAdmitted M j0 then 1 else 2)
        else if pget M 1 j0 ≥ pget M 1 j1 then return (if isAdmitted M j0 then 3 else 4)
        else return (if j0 + 1 < j1 then 5 else 6)
    else return -2
  else return -3

/-- `Trans` の共通部分: c1, c2 を計算する。 -/
partial def c1c2 (M : PS) (ty : Int) : TM (BT × BT) := do
  let j1 := sizeI M - 1
  let j0 := findParent M 0 j1
  let jn1 := adm M j0
  let c1 ← mark (pred M) jn1
  let (v, t2) := match c1 with
    | .D v t2 => (v, t2)
    | _ => ((0 : Int), BT.zero)   -- JS では例外
  let Pt2 := pbuchholz t2
  let J1 : Int := Pt2.length - 1
  let c2 :=
    if ty == 1 || ty == 3 || ty == 5 then
      .D v (plus t2 (dOf M j1))
    else if ty == 2 || ty == 4 then
      if t2 == .zero then .D v (.D (pget M 1 j0) (dOf M j1))
      else
        let last := Pt2.getLast!
        let (t3, t4) :=
          match last with
          | .D s inner =>
            if s == pget M 1 j0 then
              ((if J1 == 1 then Pt2.head! else .sum Pt2.dropLast), inner)
            else (t2, t2)
          | _ => (t2, t2)
        .D v (plus t3 (.D (pget M 1 j0) (plus t4 (dOf M j1))))
    else .D v (dOf M j1)
  return (c1, c2)

partial def trans (M : PS) : TM BT := do
  let k := keyOf M
  match (← get).trM.get? k with
  | some r => return r
  | none =>
    let r ← transInternal M
    modify fun s => { s with trM := s.trM.insert k r }
    return r

partial def transInternal (M : PS) : TM BT := do
  let j1 := sizeI M - 1
  let ty ← transType M
  if ty == -3 then trans (red M)
  else if ty == -2 then
    let parts := ppair M
    let mut acc : BT := .zero
    let mut i := 0
    for e in parts do
      if i == 0 then acc ← trans e
      else
        let te ← (if equalPair e #[(0, 0)] then pure BT.one else trans e)
        acc := plus acc te
      i := i + 1
    return acc
  else if ty == -1 then
    return (if pget M 0 0 == 0 && pget M 1 0 == 0 then .zero else .D (pget M 1 0) .zero)
  else if ty == 0 then
    return .D 0 (dOf M j1)
  else
    let t1 ← trans (pred M)
    let (c1, c2) ← c1c2 M ty
    return (replaceMark t1 c1 c2).getD .zero

partial def mark (M : PS) (m : Int) : TM BT := do
  let k := keyOf M ++ "#" ++ toString m
  match (← get).mkM.get? k with
  | some r => return r
  | none =>
    let r ← markInternal M m
    modify fun s => { s with mkM := s.mkM.insert k r }
    return r

partial def markInternal (M : PS) (m : Int) : TM BT := do
  let j1 := sizeI M - 1
  let ty ← transType M
  if ty == -3 then mark (red M) m
  else if ty == -2 then
    let PM := ppair M
    let last := PM.getLast!
    let j0 := j1 - sizeI last + 1
    if equalPair last #[(0, 0)] then return BT.one else mark last (m - j0)
  else if ty == -1 then
    return (if pget M 0 0 == 0 && pget M 1 0 == 0 then .zero else .D (pget M 1 0) .zero)
  else if ty == 0 then
    return (if m == 0 then .D 0 (dOf M j1) else dOf M j1)
  else
    let (c1, c2) ← c1c2 M ty
    if m < j1 then
      let c0 ← mark (pred M) m
      if isMarked (some c0) c1 then return (replaceMark c0 c1 c2).getD .zero
      else return dOf M j1
    else return dOf M j1

end

/-- ペア列 `[(x,y), …]` を Buchholz 項に翻訳する。 -/
def transPS (M : List (Nat × Nat)) : BT :=
  let ps : PS := M.toArray.map fun c => ((c.1 : Int), (c.2 : Int))
  (trans ps).run' {}

/-! ### 文字列入口 -/

private def parseNat (cs : List Char) : Option (Nat × List Char) :=
  let ds := cs.takeWhile Char.isDigit
  if ds.isEmpty then none
  else some (ds.foldl (fun n c => n * 10 + (c.toNat - '0'.toNat)) 0, cs.drop ds.length)

/-- `"(0,0)(1,1)(2,2)"` を読む（空白は無視）。 -/
partial def parsePS (s : String) : Option (List (Nat × Nat)) :=
  let rec go (cs : List Char) (acc : List (Nat × Nat)) : Option (List (Nat × Nat)) :=
    match cs with
    | [] => some acc.reverse
    | ' ' :: rest => go rest acc
    | '(' :: rest => do
      let (a, r1) ← parseNat rest
      match r1 with
      | ',' :: r2 => do
        let (b, r3) ← parseNat r2
        match r3 with
        | ')' :: r4 => go r4 ((a, b) :: acc)
        | _ => none
      | _ => none
    | _ => none
  go s.toList []

/-- 文字列のペア列を翻訳し、文字列で返す。 -/
def transStr (s : String) : Option String := do
  let M ← parsePS s
  if M.isEmpty then none else some (toString (transPS M))

end Buchholz


-- generated by tools/gen_buchholz_tests.py; reference: naruyoko common.js Trans (raw output)

#guard Buchholz.transStr "(0,0)(1,1)" == some "D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)" == some "(D_0 D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,0)" == some "(D_0 D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,0)(2,0)" == some "(D_0 D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,1)" == some "(D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,1)(0,0)(1,1)" == some "(D_0 D_1 0,D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)" == some "D_0 (D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,1)" == some "(D_0 (D_1 0,D_0 0),D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,1)(1,0)" == some "(D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(1,0)" == some "D_0 (D_1 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,0)" == some "D_0 (D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,0)(3,0)" == some "D_0 (D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)" == some "D_0 (D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)(2,0)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)(2,1)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,1)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(2,0)(3,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(4,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(4,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)" == some "D_0 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(0,0)" == some "(D_0 (D_1 0,D_1 0),D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(0,0)(1,1)(1,1)" == some "(D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)" == some "D_0 (D_1 0,D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)(2,0)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)(2,0)(3,1)(3,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,1)" == some "D_0 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,1)(1,1)" == some "D_0 (D_1 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)" == some "D_0 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(0,0)" == some "(D_0 D_1 D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(0,0)(1,1)(2,0)" == some "(D_0 D_1 D_0 0,D_0 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)" == some "D_0 (D_1 D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)" == some "D_0 (D_1 D_0 0,D_0 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)(2,0)" == some "D_0 (D_1 D_0 0,D_0 (D_1 D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)(2,0)(3,1)(4,0)" == some "D_0 (D_1 D_0 0,D_0 (D_1 D_0 0,D_0 D_1 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)" == some "D_0 (D_1 D_0 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)(1,1)" == some "D_0 (D_1 D_0 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)(2,0)" == some "D_0 (D_1 D_0 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(2,0)" == some "D_0 D_1 (D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,0)" == some "D_0 D_1 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)" == some "D_0 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,1)" == some "D_0 (D_1 D_0 D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,1)(2,0)(3,1)" == some "D_0 (D_1 D_0 D_1 0,D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(2,0)" == some "D_0 D_1 (D_0 D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(2,0)(3,1)" == some "D_0 D_1 (D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,0)" == some "D_0 D_1 D_0 (D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,0)(4,1)" == some "D_0 D_1 D_0 (D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,1)" == some "D_0 D_1 D_0 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(4,0)" == some "D_0 D_1 D_0 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 D_1 D_0 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)" == some "D_0 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(0,0)" == some "(D_0 D_1 D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(0,0)(1,1)(2,1)" == some "(D_0 D_1 D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)" == some "D_0 (D_1 D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)" == some "D_0 (D_1 D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)(2,0)" == some "D_0 (D_1 D_1 0,D_0 (D_1 D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)(2,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 0,D_0 (D_1 D_1 0,D_0 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)" == some "D_0 (D_1 D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(1,1)" == some "D_0 (D_1 D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)" == some "D_0 (D_1 D_1 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(2,0)" == some "D_0 (D_1 D_1 0,D_1 (D_0 D_1 D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(2,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 0,D_1 (D_0 D_1 D_1 0,D_0 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,0)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,0)(4,1)(5,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_0 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,1)" == some "D_0 (D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,1)(1,1)(2,1)" == some "D_0 (D_1 D_1 0,D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)" == some "D_0 D_1 (D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(2,0)" == some "D_0 D_1 (D_1 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,0)" == some "D_0 D_1 (D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(3,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,0)" == some "D_0 D_1 (D_1 0,D_0 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(3,1)(4,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 D_1 0,D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,1)(6,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)" == some "D_0 D_1 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,1)(2,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,1)(4,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,1)(2,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)" == some "D_0 D_1 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)(2,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)(3,0)" == some "D_0 (D_1 D_1 D_0 0,D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,0)" == some "D_0 D_1 (D_1 D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,0)(3,1)(4,1)(5,0)" == some "D_0 D_1 (D_1 D_0 0,D_0 D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,1)" == some "D_0 D_1 (D_1 D_0 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,1)(3,0)" == some "D_0 D_1 (D_1 D_0 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(3,0)" == some "D_0 D_1 D_1 (D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,0)" == some "D_0 D_1 D_1 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)" == some "D_0 D_1 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,1)" == some "D_0 D_1 D_1 D_0 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,1)(6,0)" == some "D_0 D_1 D_1 D_0 D_1 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)" == some "D_0 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,1)(2,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 (D_1 D_0 D_1 D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,0)" == some "D_0 D_1 (D_1 D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,0)(3,1)(4,1)(5,1)" == some "D_0 D_1 (D_1 D_1 0,D_0 D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(2,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(3,0)" == some "D_0 D_1 (D_1 D_1 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(3,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,0)" == some "D_0 D_1 D_1 (D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,1)" == some "D_0 D_1 D_1 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,1)(3,1)" == some "D_0 D_1 D_1 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)" == some "D_0 D_1 D_1 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,0)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,1)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,1)(4,0)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(4,0)" == some "D_0 D_1 D_1 D_1 (D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(5,0)" == some "D_0 D_1 D_1 D_1 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(5,1)" == some "D_0 D_1 D_1 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)" == some "D_0 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(4,0)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(4,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,0)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,0)(5,1)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,1)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,0)" == some "D_0 D_1 D_1 D_1 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,0)(6,1)" == some "D_0 D_1 D_1 D_1 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,1)" == some "D_0 D_1 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,1)(6,1)" == some "D_0 D_1 D_1 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)" == some "D_0 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,0)" == some "D_0 (D_2 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)" == some "D_0 (D_2 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(1,1)" == some "D_0 (D_2 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,0)" == some "D_0 (D_2 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)" == some "D_0 (D_2 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)(3,0)" == some "D_0 (D_2 0,D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)(3,1)" == some "D_0 (D_2 0,D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,2)" == some "D_0 (D_2 0,D_1 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,2)(1,1)(2,2)" == some "D_0 (D_2 0,D_1 D_2 0,D_1 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,0)" == some "D_0 (D_2 0,D_1 (D_2 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(2,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,0)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,1)(3,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_1 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,0)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,1)(4,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_1 D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,2)" == some "D_0 (D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,2)(2,2)" == some "D_0 (D_2 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,0)" == some "D_0 D_2 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)" == some "D_0 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)" == some "D_0 (D_2 D_1 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(3,0)" == some "D_0 (D_2 D_1 0,D_2 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(3,1)" == some "D_0 (D_2 D_1 0,D_2 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(3,0)" == some "D_0 D_2 (D_1 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(3,1)" == some "D_0 D_2 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,0)" == some "D_0 D_2 D_1 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,1)" == some "D_0 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,1)(5,1)" == some "D_0 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)" == some "D_0 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)" == some "D_0 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)" == some "D_0 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,2)" == some "D_0 (D_2 D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,2)(3,2)" == some "D_0 (D_2 D_2 0,D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,0)" == some "D_0 D_2 (D_2 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,1)" == some "D_0 D_2 (D_2 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,2)" == some "D_0 D_2 (D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,0)" == some "D_0 D_2 D_2 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,1)" == some "D_0 D_2 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,1)(5,2)" == some "D_0 D_2 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)" == some "D_0 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(2,2)(3,2)(4,2)" == some "D_0 (D_2 D_2 D_2 0,D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,0)" == some "D_0 D_2 (D_2 D_2 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,1)" == some "D_0 D_2 (D_2 D_2 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,0)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,1)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,0)" == some "D_0 D_2 D_2 (D_2 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,1)" == some "D_0 D_2 D_2 (D_2 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,2)" == some "D_0 D_2 D_2 (D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,2)(4,2)" == some "D_0 D_2 D_2 (D_2 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,0)" == some "D_0 D_2 D_2 D_2 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,1)" == some "D_0 D_2 D_2 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,2)" == some "D_0 D_2 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,2)(6,2)" == some "D_0 D_2 D_2 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)" == some "D_0 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)" == some "D_0 (D_3 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,2)" == some "D_0 (D_3 0,D_1 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,2)(3,3)" == some "D_0 (D_3 0,D_1 D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,0)" == some "D_0 (D_3 0,D_1 (D_3 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,1)" == some "D_0 (D_3 0,D_1 (D_3 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,2)" == some "D_0 (D_3 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,2)(3,3)" == some "D_0 (D_3 0,D_2 D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,0)" == some "D_0 (D_3 0,D_2 (D_3 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,1)" == some "D_0 (D_3 0,D_2 (D_3 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,2)" == some "D_0 (D_3 0,D_2 (D_3 0,D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,3)" == some "D_0 (D_3 0,D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,0)" == some "D_0 D_3 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,1)" == some "D_0 D_3 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,2)" == some "D_0 D_3 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)" == some "D_0 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(4,3)" == some "D_0 D_3 (D_3 0,D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,0)" == some "D_0 D_3 D_3 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,3)" == some "D_0 D_3 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,3)(6,3)" == some "D_0 D_3 D_3 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)" == some "D_0 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(4,4)" == some "D_0 (D_4 0,D_4 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,4)" == some "D_0 D_4 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,4)(6,4)" == some "D_0 D_4 D_4 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,5)" == some "D_0 D_5 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,5)(6,6)" == some "D_0 D_6 0"
#guard Buchholz.transStr "(0,0)(1,0)" == some "D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,0)(2,0)" == some "D_0 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(0,0)" == some "(D_0 D_1 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(0,0)(0,0)" == some "(D_0 D_1 0,D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,0)(1,0)" == some "(D_0 D_1 0,D_0 (D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,0)(1,0)(1,0)" == some "(D_0 D_1 0,D_0 (D_0 0,D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,1)(0,0)(1,0)" == some "(D_0 D_1 0,D_0 D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(0,0)(1,1)(0,0)(1,0)(2,0)" == some "(D_0 D_1 0,D_0 D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,0)" == some "(D_0 (D_1 0,D_0 0),D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,0)(2,0)" == some "(D_0 (D_1 0,D_0 0),D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,1)(0,0)(1,1)" == some "(D_0 (D_1 0,D_0 0),D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,1)(0,0)(1,1)(0,0)(1,1)" == some "(D_0 (D_1 0,D_0 0),D_0 D_1 0,D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(0,0)(1,1)(1,0)(0,0)(1,1)(1,0)" == some "(D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(1,0)(1,0)" == some "D_0 (D_1 0,D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,0)(2,0)" == some "D_0 (D_1 0,D_0 (D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,0)(2,0)(2,0)" == some "D_0 (D_1 0,D_0 (D_0 0,D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(0,0)(1,1)(1,0)(2,1)" == some "(D_0 (D_1 0,D_0 D_1 0),D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(0,0)(1,1)(1,0)(2,1)(0,0)(1,1)(1,0)(2,1)" == some "(D_0 (D_1 0,D_0 D_1 0),D_0 (D_1 0,D_0 D_1 0),D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)(1,0)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)(1,0)(1,0)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)(2,0)(3,0)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(1,0)(2,1)(1,0)(2,1)" == some "D_0 (D_1 0,D_0 D_1 0,D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(0,0)(1,1)(1,0)(2,1)(2,0)" == some "(D_0 (D_1 0,D_0 (D_1 0,D_0 0)),D_0 (D_1 0,D_0 (D_1 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(0,0)(1,1)(1,0)(2,1)(2,0)(0,0)(1,1)(1,0)(2,1)(2,0)" == some "(D_0 (D_1 0,D_0 (D_1 0,D_0 0)),D_0 (D_1 0,D_0 (D_1 0,D_0 0)),D_0 (D_1 0,D_0 (D_1 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,0)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,1)(1,0)(2,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,1)(1,0)(2,1)(1,0)(2,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 D_1 0,D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(1,0)(2,1)(2,0)(1,0)(2,1)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(2,0)(2,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 0,D_0 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,0)(4,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_0 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(1,0)(2,1)(2,0)(3,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0),D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(1,0)(2,1)(2,0)(3,1)(1,0)(2,1)(2,0)(3,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0),D_0 (D_1 0,D_0 D_1 0),D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(2,0)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0,D_0 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(2,0)(3,0)(4,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0,D_0 D_0 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(2,0)(3,1)(2,0)(3,1)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0,D_0 D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(2,0)(3,1)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(2,0)(3,1)(3,0)(2,0)(3,1)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0),D_0 (D_1 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(3,0)(3,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 0,D_0 0,D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(4,0)(5,0)" == some "D_0 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 D_0 D_0 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(0,0)(1,1)(1,0)(2,1)" == some "(D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(0,0)(1,1)(1,0)(2,1)(2,0)(3,1)" == some "(D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(0,0)(1,1)(1,1)(0,0)(1,1)(1,1)" == some "(D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,0)(3,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,0)(3,1)(3,0)(4,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)(1,0)(2,1)(2,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)(1,0)(2,1)(2,1)(1,0)(2,1)(2,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_1 0),D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)(2,0)(3,1)(3,0)(4,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_0 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,0)(2,1)(2,1)(2,0)(3,1)(3,0)(4,1)(4,0)(5,1)" == some "D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,1)(1,0)(2,1)(2,1)(2,1)" == some "D_0 (D_1 0,D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(1,1)(1,1)(1,0)(2,1)(2,1)(2,1)(2,0)(3,1)(3,1)(3,1)" == some "D_0 (D_1 0,D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_1 0,D_0 (D_1 0,D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(0,0)(1,1)(1,1)" == some "(D_0 D_1 D_0 0,D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(0,0)(1,1)(1,1)(1,1)" == some "(D_0 D_1 D_0 0,D_0 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(0,0)(1,1)(2,0)(0,0)(1,1)(2,0)" == some "(D_0 D_1 D_0 0,D_0 D_1 D_0 0,D_0 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(2,1)" == some "D_0 (D_1 D_0 0,D_0 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(2,1)(2,1)" == some "D_0 (D_1 D_0 0,D_0 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)(1,0)(2,1)(3,0)" == some "D_0 (D_1 D_0 0,D_0 D_1 D_0 0,D_0 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)(1,0)(2,1)(3,0)(1,0)(2,1)(3,0)" == some "D_0 (D_1 D_0 0,D_0 D_1 D_0 0,D_0 D_1 D_0 0,D_0 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)(2,0)(3,1)(3,1)" == some "D_0 (D_1 D_0 0,D_0 (D_1 D_0 0,D_0 (D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,0)(2,1)(3,0)(2,0)(3,1)(3,1)(3,1)" == some "D_0 (D_1 D_0 0,D_0 (D_1 D_0 0,D_0 (D_1 0,D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)(1,0)(2,1)(3,0)(2,1)" == some "D_0 (D_1 D_0 0,D_1 0,D_0 (D_1 D_0 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)(1,0)(2,1)(3,0)(2,1)(2,0)(3,1)(4,0)(3,1)" == some "D_0 (D_1 D_0 0,D_1 0,D_0 (D_1 D_0 0,D_1 0,D_0 (D_1 D_0 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)(1,1)(1,1)" == some "D_0 (D_1 D_0 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(1,1)(2,0)(1,1)(2,0)" == some "D_0 (D_1 D_0 0,D_1 D_0 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(2,0)(2,0)" == some "D_0 D_1 (D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,0)(4,0)" == some "D_0 D_1 D_0 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,0)(2,1)(3,0)(4,1)" == some "D_0 (D_1 D_0 D_1 0,D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,0)(2,1)(3,0)(4,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 (D_1 D_0 D_1 0,D_0 (D_1 D_0 D_1 0,D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,1)(2,0)(3,0)" == some "D_0 (D_1 D_0 D_1 0,D_1 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,1)(2,0)(3,0)(4,0)" == some "D_0 (D_1 D_0 D_1 0,D_1 D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(1,1)(2,0)(3,1)(1,1)(2,0)(3,1)" == some "D_0 (D_1 D_0 D_1 0,D_1 D_0 D_1 0,D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(2,0)(3,0)" == some "D_0 D_1 (D_0 D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(2,0)(3,0)(4,0)" == some "D_0 D_1 (D_0 D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(2,0)(3,1)(2,0)(3,1)" == some "D_0 D_1 (D_0 D_1 0,D_0 D_1 0,D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,0)(4,0)" == some "D_0 D_1 D_0 (D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,0)(4,0)(5,0)" == some "D_0 D_1 D_0 (D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,0)(4,1)(4,0)(5,1)" == some "D_0 D_1 D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(3,1)(3,1)" == some "D_0 D_1 D_0 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(4,0)(5,0)" == some "D_0 D_1 D_0 D_1 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,0)(3,1)(4,0)(5,0)(6,0)" == some "D_0 D_1 D_0 D_1 D_0 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(0,0)(1,1)(2,0)(3,1)" == some "(D_0 D_1 D_1 0,D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(0,0)(1,1)(2,0)(3,1)(4,0)(5,1)" == some "(D_0 D_1 D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(0,0)(1,1)(2,1)(0,0)(1,1)(2,1)" == some "(D_0 D_1 D_1 0,D_0 D_1 D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,0)(4,1)" == some "D_0 (D_1 D_1 0,D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,0)(4,1)(5,0)(6,1)" == some "D_0 (D_1 D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)(1,0)(2,1)(3,1)" == some "D_0 (D_1 D_1 0,D_0 D_1 D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)(1,0)(2,1)(3,1)(1,0)(2,1)(3,1)" == some "D_0 (D_1 D_1 0,D_0 D_1 D_1 0,D_0 D_1 D_1 0,D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 (D_1 D_1 0,D_0 (D_1 D_1 0,D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,0)(2,1)(3,1)(2,0)(3,1)(4,0)(5,1)(6,0)(7,1)" == some "D_0 (D_1 D_1 0,D_0 (D_1 D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(1,0)(2,1)(3,1)(2,1)" == some "D_0 (D_1 D_1 0,D_1 0,D_0 (D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(1,0)(2,1)(3,1)(2,1)(2,0)(3,1)(4,1)(3,1)" == some "D_0 (D_1 D_1 0,D_1 0,D_0 (D_1 D_1 0,D_1 0,D_0 (D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(1,1)(1,1)" == some "D_0 (D_1 D_1 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,0)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,0)(4,0)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,0)(5,1)(6,0)(7,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_1 D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(1,1)(2,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_1 D_1 0,D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(1,1)(2,0)(3,1)(4,1)(1,1)(2,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 D_1 D_1 0,D_1 D_0 D_1 D_1 0,D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 (D_1 D_1 0,D_1 (D_0 D_1 D_1 0,D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(2,0)(3,1)(4,0)(5,1)(6,0)(7,1)" == some "D_0 (D_1 D_1 0,D_1 (D_0 D_1 D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(2,0)(3,1)(4,1)(2,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 0,D_1 (D_0 D_1 D_1 0,D_0 D_1 D_1 0,D_0 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,0)(4,1)(5,0)(6,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,0)(4,1)(5,0)(6,1)(7,0)(8,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,0)(4,1)(5,1)(4,0)(5,1)(6,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_0 (D_1 D_1 0,D_0 D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,1)(4,0)(5,1)(6,1)(5,1)" == some "D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,1)(4,1)(3,1)" == some "D_0 (D_1 D_1 0,D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(1,1)(2,1)(1,1)(2,0)(3,1)(4,1)(3,1)(4,1)(3,1)(4,0)(5,1)(6,1)(5,1)(6,1)(5,1)" == some "D_0 (D_1 D_1 0,D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(1,1)(2,1)(2,0)" == some "D_0 (D_1 (D_1 0,D_0 0),D_1 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(1,1)(2,1)(2,0)(1,1)(2,1)(2,0)" == some "D_0 (D_1 (D_1 0,D_0 0),D_1 (D_1 0,D_0 0),D_1 (D_1 0,D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(2,0)(2,0)" == some "D_0 D_1 (D_1 0,D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,0)(4,0)" == some "D_0 D_1 (D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(3,0)(4,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 0,D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(3,0)(4,1)(4,0)(5,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 0,D_0 (D_1 0,D_0 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(3,1)(3,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,0)(5,0)" == some "D_0 D_1 (D_1 0,D_0 D_1 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,0)(5,0)(6,0)" == some "D_0 D_1 (D_1 0,D_0 D_1 D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,0)(5,1)(6,0)(7,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(3,1)(4,0)(5,1)(6,1)(5,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(3,1)(4,0)(5,1)(6,1)(5,1)(6,0)(7,1)(8,1)(7,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 D_0 (D_1 D_1 0,D_1 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(3,1)(4,1)(3,1)(4,1)" == some "D_0 D_1 (D_1 0,D_0 (D_1 D_1 0,D_1 D_1 0,D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,0)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,0)(6,0)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_0 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,1)(6,0)(7,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,1)(6,0)(7,1)(8,0)(9,1)" == some "D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,0)(2,1)(3,1)(3,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_0 D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,0)(2,1)(3,1)(3,1)(2,0)(3,1)(4,1)(4,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_0 (D_1 (D_1 0,D_1 0),D_0 D_1 (D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,0)(3,1)(4,1)(4,1)(3,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 D_0 (D_1 (D_1 0,D_1 0),D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,0)(3,1)(4,1)(4,1)(3,1)(4,0)(5,1)(6,1)(6,1)(5,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 D_0 (D_1 (D_1 0,D_1 0),D_1 D_0 (D_1 (D_1 0,D_1 0),D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,1)(2,0)(3,1)(4,1)(4,1)(3,1)(4,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 (D_1 0,D_0 (D_1 (D_1 0,D_1 0),D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,1)(2,0)(3,1)(4,1)(4,1)(3,1)(4,1)(4,0)(5,1)(6,1)(6,1)(5,1)(6,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 (D_1 0,D_0 (D_1 (D_1 0,D_1 0),D_1 (D_1 0,D_0 (D_1 (D_1 0,D_1 0),D_1 D_1 0)))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(1,1)(2,1)(2,1)(1,1)(2,1)(2,1)" == some "D_0 (D_1 (D_1 0,D_1 0),D_1 (D_1 0,D_1 0),D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,0)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,0)(4,0)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,0)(5,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,0)(5,1)(6,0)(7,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 D_0 D_1 D_0 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,1)(6,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 (D_1 0,D_0 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,1)(4,0)(5,1)(6,1)(6,0)(7,1)(8,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 (D_1 0,D_0 D_1 (D_1 0,D_0 D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,0)(3,1)(4,1)(4,1)(4,0)(5,1)(6,1)(6,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_0 D_1 (D_1 0,D_1 0,D_0 D_1 (D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,1)(2,0)(3,1)(4,1)(4,1)(4,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_1 0,D_0 D_1 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(2,1)(2,1)(2,0)(3,1)(4,1)(4,1)(4,1)(4,0)(5,1)(6,1)(6,1)(6,1)" == some "D_0 D_1 (D_1 0,D_1 0,D_1 0,D_0 D_1 (D_1 0,D_1 0,D_1 0,D_0 D_1 (D_1 0,D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,0)(2,1)(3,1)(4,0)" == some "D_0 (D_1 D_1 D_0 0,D_0 D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,0)(2,1)(3,1)(4,0)(2,0)(3,1)(4,1)(5,0)" == some "D_0 (D_1 D_1 D_0 0,D_0 (D_1 D_1 D_0 0,D_0 D_1 D_1 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,0)(3,1)(4,1)(5,0)(3,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 D_0 (D_1 D_1 D_0 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,0)(3,1)(4,1)(5,0)(3,1)(4,0)(5,1)(6,1)(7,0)(5,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 D_0 (D_1 D_1 D_0 0,D_1 D_0 (D_1 D_1 D_0 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)(2,0)(3,1)(4,1)(5,0)(3,1)(4,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 (D_1 0,D_0 (D_1 D_1 D_0 0,D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)(2,0)(3,1)(4,1)(5,0)(3,1)(4,1)(4,0)(5,1)(6,1)(7,0)(5,1)(6,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 (D_1 0,D_0 (D_1 D_1 D_0 0,D_1 (D_1 0,D_0 (D_1 D_1 D_0 0,D_1 D_1 0)))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)(2,1)(2,1)" == some "D_0 (D_1 D_1 D_0 0,D_1 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(1,1)(2,1)(3,0)(1,1)(2,1)(3,0)" == some "D_0 (D_1 D_1 D_0 0,D_1 D_1 D_0 0,D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,0)(3,1)(4,1)(4,1)" == some "D_0 D_1 (D_1 D_0 0,D_0 D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,0)(3,1)(4,1)(4,1)(4,1)" == some "D_0 D_1 (D_1 D_0 0,D_0 D_1 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,0)(3,1)(4,1)(5,0)(4,0)(5,1)(6,1)(7,0)" == some "D_0 D_1 (D_1 D_0 0,D_0 D_1 (D_1 D_0 0,D_0 D_1 D_1 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,1)(2,1)" == some "D_0 D_1 (D_1 D_0 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,1)(2,1)(2,1)" == some "D_0 D_1 (D_1 D_0 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(2,1)(3,0)(2,1)(3,0)" == some "D_0 D_1 (D_1 D_0 0,D_1 D_0 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(3,0)(3,0)" == some "D_0 D_1 D_1 (D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,0)(5,0)" == some "D_0 D_1 D_1 D_0 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,0)(6,1)" == some "D_0 D_1 D_1 D_0 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,0)(6,1)(7,0)(8,1)" == some "D_0 D_1 D_1 D_0 D_1 D_0 D_1 D_0 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,1)(5,1)" == some "D_0 D_1 D_1 D_0 D_1 (D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,1)(5,1)(5,1)" == some "D_0 D_1 D_1 D_0 D_1 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,0)(4,1)(5,1)(6,0)(7,1)(8,1)" == some "D_0 D_1 D_1 D_0 D_1 D_1 D_0 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,0)(2,1)(3,1)(4,1)" == some "D_0 (D_1 D_1 D_1 0,D_0 D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,0)(2,1)(3,1)(4,1)(2,0)(3,1)(4,1)(5,1)" == some "D_0 (D_1 D_1 D_1 0,D_0 (D_1 D_1 D_1 0,D_0 D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,0)(3,1)(4,1)(5,1)(3,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_0 (D_1 D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,0)(3,1)(4,1)(5,1)(3,1)(4,0)(5,1)(6,1)(7,1)(5,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_0 (D_1 D_1 D_1 0,D_1 D_0 (D_1 D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(2,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(2,1)(2,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,0)(7,1)(8,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 D_1 D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,0)(7,1)(8,1)(9,0)(10,1)(11,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 D_1 D_1 D_0 D_1 D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,1)(2,0)(3,1)(4,1)(5,1)(3,1)(4,1)(5,0)(6,1)(7,1)(8,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 (D_1 D_0 D_1 D_1 D_1 0,D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 D_1 D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,1)(2,0)(3,1)(4,1)(5,1)(3,1)(4,1)(5,0)(6,1)(7,1)(8,1)(4,0)(5,1)(6,1)(7,1)(5,1)(6,1)(7,0)(8,1)(9,1)(10,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 (D_1 D_0 D_1 D_1 D_1 0,D_0 (D_1 D_1 D_1 0,D_1 (D_1 D_0 D_1 D_1 D_1 0,D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 D_1 D_1 D_1 0)))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,1)(4,1)(5,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 (D_1 D_1 D_1 0,D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,0)(4,1)(5,1)(6,1)(4,1)(5,1)(6,0)(7,1)(8,1)(9,1)(7,1)(8,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 (D_1 D_1 D_1 0,D_1 D_1 D_0 (D_1 D_1 D_1 0,D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(1,1)(2,1)(3,1)(1,1)(2,1)(3,1)" == some "D_0 (D_1 D_1 D_1 0,D_1 D_1 D_1 0,D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,0)(3,1)(4,1)(5,0)(6,1)(7,1)" == some "D_0 D_1 (D_1 D_1 0,D_0 D_1 D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,0)(3,1)(4,1)(5,0)(6,1)(7,1)(8,0)(9,1)(10,1)" == some "D_0 D_1 (D_1 D_1 0,D_0 D_1 D_1 D_0 D_1 D_1 D_0 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,0)(3,1)(4,1)(5,1)(4,0)(5,1)(6,1)(7,1)" == some "D_0 D_1 (D_1 D_1 0,D_0 D_1 (D_1 D_1 0,D_0 D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(2,0)(3,1)(4,1)(5,1)(4,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 0,D_0 D_1 (D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(2,0)(3,1)(4,1)(5,1)(4,1)(4,0)(5,1)(6,1)(7,1)(6,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 0,D_0 D_1 (D_1 D_1 0,D_1 0,D_0 D_1 (D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(2,1)(2,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(3,0)(4,1)(5,1)(6,1)(5,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 D_0 D_1 (D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(3,0)(4,1)(5,1)(6,1)(5,1)(6,0)(7,1)(8,1)(9,1)(8,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 D_0 D_1 (D_1 D_1 0,D_1 D_0 D_1 (D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(2,1)(3,1)(2,1)(3,1)" == some "D_0 D_1 (D_1 D_1 0,D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,0)(4,1)(5,1)(6,1)" == some "D_0 D_1 D_1 (D_1 0,D_0 D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,0)(4,1)(5,1)(6,1)(6,0)(7,1)(8,1)(9,1)" == some "D_0 D_1 D_1 (D_1 0,D_0 D_1 D_1 (D_1 0,D_0 D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,1)(3,0)(4,1)(5,1)(6,1)(6,1)" == some "D_0 D_1 D_1 (D_1 0,D_1 0,D_0 D_1 D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(3,1)(3,0)(4,1)(5,1)(6,1)(6,1)(6,0)(7,1)(8,1)(9,1)(9,1)" == some "D_0 D_1 D_1 (D_1 0,D_1 0,D_0 D_1 D_1 (D_1 0,D_1 0,D_0 D_1 D_1 (D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(2,1)(3,1)(4,0)" == some "D_0 D_1 (D_1 D_1 D_0 0,D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(2,1)(3,1)(4,0)(2,1)(3,1)(4,0)" == some "D_0 D_1 (D_1 D_1 D_0 0,D_1 D_1 D_0 0,D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,0)(4,1)(5,1)(6,1)(7,0)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_0 D_1 D_1 D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,0)(4,1)(5,1)(6,1)(7,0)(6,0)(7,1)(8,1)(9,1)(10,0)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_0 D_1 D_1 (D_1 D_0 0,D_0 D_1 D_1 D_1 D_0 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,1)(3,1)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,1)(3,1)(3,1)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(3,1)(4,0)(3,1)(4,0)" == some "D_0 D_1 D_1 (D_1 D_0 0,D_1 D_0 0,D_1 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(4,0)(4,0)" == some "D_0 D_1 D_1 D_1 (D_0 0,D_0 0,D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(5,0)(6,0)" == some "D_0 D_1 D_1 D_1 D_0 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(5,1)(6,1)(7,1)" == some "D_0 D_1 D_1 D_1 D_0 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,0)(5,1)(6,1)(7,1)(8,0)(9,1)(10,1)(11,1)" == some "D_0 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_0 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,0)(4,1)(5,1)(6,1)(7,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_0 D_1 D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,0)(4,1)(5,1)(6,1)(7,1)(6,0)(7,1)(8,1)(9,1)(10,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_0 D_1 D_1 (D_1 D_1 0,D_0 D_1 D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(3,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(3,1)(3,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(4,0)(5,1)(6,1)(7,1)(8,1)(7,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 D_0 D_1 D_1 (D_1 D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(4,0)(5,1)(6,1)(7,1)(8,1)(7,1)(8,0)(9,1)(10,1)(11,1)(12,1)(11,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 D_0 D_1 D_1 (D_1 D_1 0,D_1 D_0 D_1 D_1 (D_1 D_1 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(3,1)(4,1)(3,1)(4,1)" == some "D_0 D_1 D_1 (D_1 D_1 0,D_1 D_1 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,0)(5,0)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,0)(5,0)(6,0)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_0 D_0 D_0 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,0)(5,1)(6,1)(7,1)(8,1)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_0 D_1 D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,0)(5,1)(6,1)(7,1)(8,1)(8,0)(9,1)(10,1)(11,1)(12,1)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_0 D_1 D_1 D_1 (D_1 0,D_0 D_1 D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(4,1)(4,1)" == some "D_0 D_1 D_1 D_1 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,0)(6,0)" == some "D_0 D_1 D_1 D_1 D_1 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,0)(6,0)(7,0)" == some "D_0 D_1 D_1 D_1 D_1 D_0 D_0 D_0 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,0)(6,1)(7,1)(8,1)(9,1)" == some "D_0 D_1 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,0)(6,1)(7,1)(8,1)(9,1)(10,0)(11,1)(12,1)(13,1)(14,1)" == some "D_0 D_1 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,1)(6,0)(7,1)(8,1)(9,1)(10,1)(11,1)" == some "D_0 D_1 D_1 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,1)(4,1)(5,1)(6,0)(7,1)(8,1)(9,1)(10,1)(11,1)(12,0)(13,1)(14,1)(15,1)(16,1)(17,1)" == some "D_0 D_1 D_1 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_1 D_1 D_0 D_1 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(0,0)(1,1)(2,2)" == some "(D_0 D_2 0,D_0 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(0,0)(1,1)(2,2)(0,0)(1,1)(2,2)" == some "(D_0 D_2 0,D_0 D_2 0,D_0 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,0)(2,1)(3,2)" == some "D_0 (D_2 0,D_0 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,0)(2,1)(3,2)(2,0)(3,1)(4,2)" == some "D_0 (D_2 0,D_0 (D_2 0,D_0 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(1,0)(2,1)(3,2)(2,1)" == some "D_0 (D_2 0,D_1 0,D_0 (D_2 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(1,0)(2,1)(3,2)(2,1)(2,0)(3,1)(4,2)(3,1)" == some "D_0 (D_2 0,D_1 0,D_0 (D_2 0,D_1 0,D_0 (D_2 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(1,1)(1,1)" == some "D_0 (D_2 0,D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,0)(3,1)(4,2)(3,1)" == some "D_0 (D_2 0,D_1 D_0 (D_2 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,0)(3,1)(4,2)(3,1)(4,0)(5,1)(6,2)(5,1)" == some "D_0 (D_2 0,D_1 D_0 (D_2 0,D_1 D_0 (D_2 0,D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)(2,1)" == some "D_0 (D_2 0,D_1 (D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)(2,1)(2,1)" == some "D_0 (D_2 0,D_1 (D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)(3,0)(4,1)(5,2)(4,1)(5,1)" == some "D_0 (D_2 0,D_1 D_1 D_0 (D_2 0,D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,1)(3,0)(4,1)(5,2)(4,1)(5,1)(6,0)(7,1)(8,2)(7,1)(8,1)" == some "D_0 (D_2 0,D_1 D_1 D_0 (D_2 0,D_1 D_1 D_0 (D_2 0,D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,2)(1,1)(2,1)" == some "D_0 (D_2 0,D_1 D_2 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(1,1)(2,2)(1,1)(2,1)(3,1)" == some "D_0 (D_2 0,D_1 D_2 0,D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,0)(3,1)(4,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_0 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,0)(3,1)(4,2)(4,0)(5,1)(6,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_0 D_2 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(2,0)(3,1)(4,2)(4,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 0,D_0 (D_2 0,D_1 (D_2 0,D_1 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(2,0)(3,1)(4,2)(4,1)(4,0)(5,1)(6,2)(6,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 0,D_0 (D_2 0,D_1 (D_2 0,D_1 0,D_0 (D_2 0,D_1 (D_2 0,D_1 0))))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(2,1)(2,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 0,D_1 0,D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,0)(4,1)(5,2)(5,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_0 (D_2 0,D_1 (D_2 0,D_1 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,0)(4,1)(5,2)(5,1)(6,0)(7,1)(8,2)(8,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_0 (D_2 0,D_1 (D_2 0,D_1 D_0 (D_2 0,D_1 (D_2 0,D_1 0))))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,1)(4,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,0)(3,1)(4,2)(4,1)(5,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,0)(3,1)(4,2)(4,1)(5,2)(4,0)(5,1)(6,2)(6,1)(7,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0))))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,1)(3,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,1)(3,1)(4,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_1 D_1 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(2,1)(3,2)(2,1)(3,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0,D_1 D_2 0,D_1 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,0)(4,1)(5,2)(5,1)(6,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0)))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,0)(4,1)(5,2)(5,1)(6,2)(6,0)(7,1)(8,2)(8,1)(9,2)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_0 (D_2 0,D_1 (D_2 0,D_1 D_2 0))))))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,1)(4,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,1)(3,2)(3,1)(4,1)(5,1)" == some "D_0 (D_2 0,D_1 (D_2 0,D_1 (D_2 0,D_1 D_1 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,2)(2,1)(3,2)(3,2)" == some "D_0 (D_2 0,D_2 0,D_1 (D_2 0,D_2 0,D_1 (D_2 0,D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(2,2)(2,1)(3,2)(3,2)(3,1)(4,2)(4,2)" == some "D_0 (D_2 0,D_2 0,D_1 (D_2 0,D_2 0,D_1 (D_2 0,D_2 0,D_1 (D_2 0,D_2 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,0)(4,1)(5,2)" == some "D_0 D_2 D_0 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,0)(4,1)(5,2)(6,0)(7,1)(8,2)" == some "D_0 D_2 D_0 D_2 D_0 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,1)(3,2)(4,1)" == some "D_0 (D_2 D_1 0,D_1 (D_2 D_1 0,D_1 D_2 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,1)(3,2)(4,1)(3,1)(4,2)(5,1)" == some "D_0 (D_2 D_1 0,D_1 (D_2 D_1 0,D_1 (D_2 D_1 0,D_1 D_2 D_1 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(2,2)" == some "D_0 (D_2 D_1 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(2,2)(2,2)" == some "D_0 (D_2 D_1 0,D_2 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(3,0)(4,1)(5,2)(6,1)(5,2)" == some "D_0 (D_2 D_1 0,D_2 D_0 (D_2 D_1 0,D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(3,0)(4,1)(5,2)(6,1)(5,2)(6,0)(7,1)(8,2)(9,1)(8,2)" == some "D_0 (D_2 D_1 0,D_2 D_0 (D_2 D_1 0,D_2 D_0 (D_2 D_1 0,D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(2,2)(3,1)(2,2)(3,1)" == some "D_0 (D_2 D_1 0,D_2 D_1 0,D_2 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(3,0)(4,1)(5,2)(6,1)" == some "D_0 D_2 (D_1 0,D_0 D_2 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(3,0)(4,1)(5,2)(6,1)(6,0)(7,1)(8,2)(9,1)" == some "D_0 D_2 (D_1 0,D_0 D_2 (D_1 0,D_0 D_2 D_1 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(3,1)(3,1)" == some "D_0 D_2 (D_1 0,D_1 0,D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,0)(5,1)(6,2)(7,1)" == some "D_0 D_2 D_1 D_0 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,0)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)" == some "D_0 D_2 D_1 D_0 D_2 D_1 D_0 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,1)(5,0)(6,1)(7,2)(8,1)(9,1)" == some "D_0 D_2 D_1 D_1 D_0 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,1)(5,0)(6,1)(7,2)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,1)" == some "D_0 D_2 D_1 D_1 D_0 D_2 D_1 D_1 D_0 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,0)(6,1)(7,2)(8,1)(9,2)" == some "D_0 D_2 D_1 D_2 D_0 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,0)(6,1)(7,2)(8,1)(9,2)(10,0)(11,1)(12,2)(13,1)(14,2)" == some "D_0 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_0 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,1)" == some "D_0 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,1)(7,1)" == some "D_0 D_2 D_1 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,1)(3,2)(4,2)" == some "D_0 (D_2 D_2 0,D_1 (D_2 D_2 0,D_1 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,1)(3,2)(4,2)(3,1)(4,2)(5,2)" == some "D_0 (D_2 D_2 0,D_1 (D_2 D_2 0,D_1 (D_2 D_2 0,D_1 D_2 D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,2)(3,1)(4,2)(5,2)(4,2)" == some "D_0 (D_2 D_2 0,D_2 D_1 (D_2 D_2 0,D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,2)(3,1)(4,2)(5,2)(4,2)(5,1)(6,2)(7,2)(6,2)" == some "D_0 (D_2 D_2 0,D_2 D_1 (D_2 D_2 0,D_2 D_1 (D_2 D_2 0,D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(2,2)(3,2)(2,2)(3,2)" == some "D_0 (D_2 D_2 0,D_2 D_2 0,D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,0)(4,1)(5,2)(6,2)" == some "D_0 D_2 (D_2 0,D_0 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,0)(4,1)(5,2)(6,2)(6,0)(7,1)(8,2)(9,2)" == some "D_0 D_2 (D_2 0,D_0 D_2 (D_2 0,D_0 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,1)(4,2)(5,2)" == some "D_0 D_2 (D_2 0,D_1 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,1)(4,2)(5,2)(5,1)(6,2)(7,2)" == some "D_0 D_2 (D_2 0,D_1 D_2 (D_2 0,D_1 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(3,2)(3,2)" == some "D_0 D_2 (D_2 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,0)(5,1)(6,2)(7,2)" == some "D_0 D_2 D_2 D_0 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,0)(5,1)(6,2)(7,2)(8,0)(9,1)(10,2)(11,2)" == some "D_0 D_2 D_2 D_0 D_2 D_2 D_0 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,1)(5,1)" == some "D_0 D_2 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,1)(5,1)(6,1)" == some "D_0 D_2 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,1)(5,2)(6,2)" == some "D_0 D_2 D_2 D_1 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,1)(5,2)(6,2)(7,1)(8,2)(9,2)" == some "D_0 D_2 D_2 D_1 D_2 D_2 D_1 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(2,2)(3,2)(4,1)(5,2)(6,2)(7,2)(5,2)(6,2)" == some "D_0 (D_2 D_2 D_2 0,D_2 D_2 D_1 (D_2 D_2 D_2 0,D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(2,2)(3,2)(4,1)(5,2)(6,2)(7,2)(5,2)(6,2)(7,1)(8,2)(9,2)(10,2)(8,2)(9,2)" == some "D_0 (D_2 D_2 D_2 0,D_2 D_2 D_1 (D_2 D_2 D_2 0,D_2 D_2 D_1 (D_2 D_2 D_2 0,D_2 D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(2,2)(3,2)(4,2)(2,2)(3,2)(4,2)" == some "D_0 (D_2 D_2 D_2 0,D_2 D_2 D_2 0,D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,0)(4,1)(5,2)(6,2)(7,2)" == some "D_0 D_2 (D_2 D_2 0,D_0 D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,0)(4,1)(5,2)(6,2)(7,2)(6,0)(7,1)(8,2)(9,2)(10,2)" == some "D_0 D_2 (D_2 D_2 0,D_0 D_2 (D_2 D_2 0,D_0 D_2 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,1)(4,2)(5,2)(6,2)" == some "D_0 D_2 (D_2 D_2 0,D_1 D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,1)(4,2)(5,2)(6,2)(5,1)(6,2)(7,2)(8,2)" == some "D_0 D_2 (D_2 D_2 0,D_1 D_2 (D_2 D_2 0,D_1 D_2 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(3,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(3,2)(3,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 0,D_2 0,D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,0)(5,1)(6,2)(7,2)(8,2)(7,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_0 D_2 (D_2 D_2 0,D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,0)(5,1)(6,2)(7,2)(8,2)(7,2)(8,0)(9,1)(10,2)(11,2)(12,2)(11,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_0 D_2 (D_2 D_2 0,D_2 D_0 D_2 (D_2 D_2 0,D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,1)(5,2)(6,2)(7,2)(6,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_1 D_2 (D_2 D_2 0,D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,1)(5,2)(6,2)(7,2)(6,2)(7,1)(8,2)(9,2)(10,2)(9,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_1 D_2 (D_2 D_2 0,D_2 D_1 D_2 (D_2 D_2 0,D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(3,2)(4,2)(3,2)(4,2)" == some "D_0 D_2 (D_2 D_2 0,D_2 D_2 0,D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,0)(5,1)(6,2)(7,2)(8,2)" == some "D_0 D_2 D_2 (D_2 0,D_0 D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,0)(5,1)(6,2)(7,2)(8,2)(8,0)(9,1)(10,2)(11,2)(12,2)" == some "D_0 D_2 D_2 (D_2 0,D_0 D_2 D_2 (D_2 0,D_0 D_2 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,1)(5,2)(6,2)(7,2)" == some "D_0 D_2 D_2 (D_2 0,D_1 D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,1)(5,2)(6,2)(7,2)(7,1)(8,2)(9,2)(10,2)" == some "D_0 D_2 D_2 (D_2 0,D_1 D_2 D_2 (D_2 0,D_1 D_2 D_2 D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,2)(4,1)(5,2)(6,2)(7,2)(7,2)" == some "D_0 D_2 D_2 (D_2 0,D_2 0,D_1 D_2 D_2 (D_2 0,D_2 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(4,2)(4,1)(5,2)(6,2)(7,2)(7,2)(7,1)(8,2)(9,2)(10,2)(10,2)" == some "D_0 D_2 D_2 (D_2 0,D_2 0,D_1 D_2 D_2 (D_2 0,D_2 0,D_1 D_2 D_2 (D_2 0,D_2 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,0)(6,1)(7,2)(8,2)(9,2)" == some "D_0 D_2 D_2 D_2 D_0 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,0)(6,1)(7,2)(8,2)(9,2)(10,0)(11,1)(12,2)(13,2)(14,2)" == some "D_0 D_2 D_2 D_2 D_0 D_2 D_2 D_2 D_0 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,1)(6,2)(7,2)(8,2)" == some "D_0 D_2 D_2 D_2 D_1 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,1)(6,2)(7,2)(8,2)(9,1)(10,2)(11,2)(12,2)" == some "D_0 D_2 D_2 D_2 D_1 D_2 D_2 D_2 D_1 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,2)(6,1)(7,2)(8,2)(9,2)(10,2)" == some "D_0 D_2 D_2 D_2 D_2 D_1 D_2 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,2)(4,2)(5,2)(6,1)(7,2)(8,2)(9,2)(10,2)(11,1)(12,2)(13,2)(14,2)(15,2)" == some "D_0 D_2 D_2 D_2 D_2 D_1 D_2 D_2 D_2 D_2 D_1 D_2 D_2 D_2 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,0)(2,1)(3,2)(4,3)" == some "D_0 (D_3 0,D_0 D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,0)(2,1)(3,2)(4,3)(2,0)(3,1)(4,2)(5,3)" == some "D_0 (D_3 0,D_0 (D_3 0,D_0 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,1)" == some "D_0 (D_3 0,D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,1)(3,1)" == some "D_0 (D_3 0,D_1 D_1 D_1 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,2)(3,2)" == some "D_0 (D_3 0,D_1 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,2)(3,2)(4,2)" == some "D_0 (D_3 0,D_1 D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(1,1)(2,2)(3,3)(1,1)(2,2)(3,3)" == some "D_0 (D_3 0,D_1 D_3 0,D_1 D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,0)(3,1)(4,2)(5,3)" == some "D_0 (D_3 0,D_1 (D_3 0,D_0 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,0)(3,1)(4,2)(5,3)(4,0)(5,1)(6,2)(7,3)" == some "D_0 (D_3 0,D_1 (D_3 0,D_0 (D_3 0,D_1 (D_3 0,D_0 D_3 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,1)(3,2)(4,3)" == some "D_0 (D_3 0,D_1 (D_3 0,D_1 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,1)(3,2)(4,3)(3,1)(4,2)(5,3)" == some "D_0 (D_3 0,D_1 (D_3 0,D_1 (D_3 0,D_1 D_3 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,2)(3,2)" == some "D_0 (D_3 0,D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,2)(3,2)(4,2)" == some "D_0 (D_3 0,D_2 D_2 D_2 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(2,2)(3,3)(2,2)(3,3)" == some "D_0 (D_3 0,D_2 D_3 0,D_2 D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,0)(4,1)(5,2)(6,3)" == some "D_0 (D_3 0,D_2 (D_3 0,D_0 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,0)(4,1)(5,2)(6,3)(6,0)(7,1)(8,2)(9,3)" == some "D_0 (D_3 0,D_2 (D_3 0,D_0 (D_3 0,D_2 (D_3 0,D_0 D_3 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,1)(4,2)(5,3)" == some "D_0 (D_3 0,D_2 (D_3 0,D_1 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,1)(4,2)(5,3)(5,1)(6,2)(7,3)" == some "D_0 (D_3 0,D_2 (D_3 0,D_1 (D_3 0,D_2 (D_3 0,D_1 D_3 0))))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,2)(4,3)" == some "D_0 (D_3 0,D_2 (D_3 0,D_2 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,2)(4,3)(4,2)(5,3)" == some "D_0 (D_3 0,D_2 (D_3 0,D_2 (D_3 0,D_2 D_3 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(3,3)(3,3)" == some "D_0 (D_3 0,D_3 0,D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,0)(5,1)(6,2)(7,3)" == some "D_0 D_3 D_0 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,0)(5,1)(6,2)(7,3)(8,0)(9,1)(10,2)(11,3)" == some "D_0 D_3 D_0 D_3 D_0 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,1)(5,2)(6,3)" == some "D_0 D_3 D_1 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,1)(5,2)(6,3)(7,1)(8,2)(9,3)" == some "D_0 D_3 D_1 D_3 D_1 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,2)(5,3)" == some "D_0 D_3 D_2 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,2)(5,3)(6,2)(7,3)" == some "D_0 D_3 D_2 D_3 D_2 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(4,2)(5,3)(6,3)" == some "D_0 D_3 (D_3 0,D_2 D_3 D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(4,2)(5,3)(6,3)(6,2)(7,3)(8,3)" == some "D_0 D_3 (D_3 0,D_2 D_3 (D_3 0,D_2 D_3 D_3 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(4,3)(4,3)" == some "D_0 D_3 (D_3 0,D_3 0,D_3 0)"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,2)(6,3)(7,3)" == some "D_0 D_3 D_3 D_2 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,2)(6,3)(7,3)(8,2)(9,3)(10,3)" == some "D_0 D_3 D_3 D_2 D_3 D_3 D_2 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,3)(6,2)(7,3)(8,3)(9,3)" == some "D_0 D_3 D_3 D_3 D_2 D_3 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,3)(5,3)(6,2)(7,3)(8,3)(9,3)(10,2)(11,3)(12,3)(13,3)" == some "D_0 D_3 D_3 D_3 D_2 D_3 D_3 D_3 D_2 D_3 D_3 D_3 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(4,3)(5,4)" == some "D_0 (D_4 0,D_3 (D_4 0,D_3 D_4 0))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(4,3)(5,4)(5,3)(6,4)" == some "D_0 (D_4 0,D_3 (D_4 0,D_3 (D_4 0,D_3 D_4 0)))"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,3)(6,4)" == some "D_0 D_4 D_3 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,3)(6,4)(7,3)(8,4)" == some "D_0 D_4 D_3 D_4 D_3 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,4)(6,3)(7,4)(8,4)" == some "D_0 D_4 D_4 D_3 D_4 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,4)(6,3)(7,4)(8,4)(9,3)(10,4)(11,4)" == some "D_0 D_4 D_4 D_3 D_4 D_4 D_3 D_4 D_4 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,5)(6,5)" == some "D_0 D_5 D_5 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,3)(4,4)(5,5)(6,5)(7,5)" == some "D_0 D_5 D_5 D_5 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,1)(3,2)" == some "D_0 D_1 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,1)(24,0)(25,1)(26,2)(27,1)(28,2)(29,1)(30,2)(31,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,1)(27,0)(28,1)(29,2)(30,1)(31,2)(32,1)(33,2)(34,1)(35,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,1)(30,0)(31,1)(32,2)(33,1)(34,2)(35,1)(36,2)(37,1)(38,1)(39,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,0)(16,1)(17,2)(18,1)(19,2)(20,1)(21,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,0)(16,1)(17,2)(18,1)(19,2)(20,1)(21,2)(22,0)(23,1)(24,2)(25,1)(26,2)(27,1)(28,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,0)(16,1)(17,2)(18,1)(19,2)(20,1)(21,2)(22,0)(23,1)(24,2)(25,1)(26,2)(27,1)(28,2)(29,0)(30,1)(31,2)(32,1)(33,2)(34,1)(35,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,0)(24,1)(25,2)(26,1)(27,2)(28,1)(29,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,0)(24,1)(25,2)(26,1)(27,2)(28,1)(29,2)(30,0)(31,1)(32,2)(33,1)(34,2)(35,1)(36,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,0)(24,1)(25,2)(26,1)(27,2)(28,1)(29,2)(30,0)(31,1)(32,2)(33,1)(34,2)(35,1)(36,2)(37,0)(38,1)(39,2)(40,1)(41,2)(42,1)(43,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,1)(24,0)(25,1)(26,2)(27,1)(28,2)(29,1)(30,2)(31,0)(32,1)(33,2)(34,1)(35,2)(36,1)(37,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,1)(24,0)(25,1)(26,2)(27,1)(28,2)(29,1)(30,2)(31,0)(32,1)(33,2)(34,1)(35,2)(36,1)(37,2)(38,0)(39,1)(40,2)(41,1)(42,2)(43,1)(44,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,0)(9,1)(10,2)(11,1)(12,2)(13,1)(14,2)(15,1)(16,0)(17,1)(18,2)(19,1)(20,2)(21,1)(22,2)(23,1)(24,0)(25,1)(26,2)(27,1)(28,2)(29,1)(30,2)(31,0)(32,1)(33,2)(34,1)(35,2)(36,1)(37,2)(38,0)(39,1)(40,2)(41,1)(42,2)(43,1)(44,2)(45,0)(46,1)(47,2)(48,1)(49,2)(50,1)(51,2)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 D_0 D_2 D_1 D_2 D_1 D_2 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,0)(18,1)(19,2)(20,1)(21,2)(22,1)(23,2)(24,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,0)(18,1)(19,2)(20,1)(21,2)(22,1)(23,2)(24,1)(25,0)(26,1)(27,2)(28,1)(29,2)(30,1)(31,2)(32,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,0)(18,1)(19,2)(20,1)(21,2)(22,1)(23,2)(24,1)(25,0)(26,1)(27,2)(28,1)(29,2)(30,1)(31,2)(32,1)(33,0)(34,1)(35,2)(36,1)(37,2)(38,1)(39,2)(40,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,0)(27,1)(28,2)(29,1)(30,2)(31,1)(32,2)(33,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,0)(27,1)(28,2)(29,1)(30,2)(31,1)(32,2)(33,1)(34,0)(35,1)(36,2)(37,1)(38,2)(39,1)(40,2)(41,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,0)(27,1)(28,2)(29,1)(30,2)(31,1)(32,2)(33,1)(34,0)(35,1)(36,2)(37,1)(38,2)(39,1)(40,2)(41,1)(42,0)(43,1)(44,2)(45,1)(46,2)(47,1)(48,2)(49,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,1)(27,0)(28,1)(29,2)(30,1)(31,2)(32,1)(33,2)(34,1)(35,0)(36,1)(37,2)(38,1)(39,2)(40,1)(41,2)(42,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,1)(27,0)(28,1)(29,2)(30,1)(31,2)(32,1)(33,2)(34,1)(35,0)(36,1)(37,2)(38,1)(39,2)(40,1)(41,2)(42,1)(43,0)(44,1)(45,2)(46,1)(47,2)(48,1)(49,2)(50,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,0)(10,1)(11,2)(12,1)(13,2)(14,1)(15,2)(16,1)(17,1)(18,0)(19,1)(20,2)(21,1)(22,2)(23,1)(24,2)(25,1)(26,1)(27,0)(28,1)(29,2)(30,1)(31,2)(32,1)(33,2)(34,1)(35,0)(36,1)(37,2)(38,1)(39,2)(40,1)(41,2)(42,1)(43,0)(44,1)(45,2)(46,1)(47,2)(48,1)(49,2)(50,1)(51,0)(52,1)(53,2)(54,1)(55,2)(56,1)(57,2)(58,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,0)(20,1)(21,2)(22,1)(23,2)(24,1)(25,2)(26,1)(27,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,0)(20,1)(21,2)(22,1)(23,2)(24,1)(25,2)(26,1)(27,1)(28,0)(29,1)(30,2)(31,1)(32,2)(33,1)(34,2)(35,1)(36,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,0)(20,1)(21,2)(22,1)(23,2)(24,1)(25,2)(26,1)(27,1)(28,0)(29,1)(30,2)(31,1)(32,2)(33,1)(34,2)(35,1)(36,1)(37,0)(38,1)(39,2)(40,1)(41,2)(42,1)(43,2)(44,1)(45,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,0)(30,1)(31,2)(32,1)(33,2)(34,1)(35,2)(36,1)(37,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,0)(30,1)(31,2)(32,1)(33,2)(34,1)(35,2)(36,1)(37,1)(38,0)(39,1)(40,2)(41,1)(42,2)(43,1)(44,2)(45,1)(46,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,0)(30,1)(31,2)(32,1)(33,2)(34,1)(35,2)(36,1)(37,1)(38,0)(39,1)(40,2)(41,1)(42,2)(43,1)(44,2)(45,1)(46,1)(47,0)(48,1)(49,2)(50,1)(51,2)(52,1)(53,2)(54,1)(55,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,1)(30,0)(31,1)(32,2)(33,1)(34,2)(35,1)(36,2)(37,1)(38,1)(39,0)(40,1)(41,2)(42,1)(43,2)(44,1)(45,2)(46,1)(47,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,1)(30,0)(31,1)(32,2)(33,1)(34,2)(35,1)(36,2)(37,1)(38,1)(39,0)(40,1)(41,2)(42,1)(43,2)(44,1)(45,2)(46,1)(47,1)(48,0)(49,1)(50,2)(51,1)(52,2)(53,1)(54,2)(55,1)(56,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
#guard Buchholz.transStr "(0,0)(1,1)(2,2)(3,1)(4,2)(5,1)(6,2)(7,1)(8,1)(9,1)(10,0)(11,1)(12,2)(13,1)(14,2)(15,1)(16,2)(17,1)(18,1)(19,1)(20,0)(21,1)(22,2)(23,1)(24,2)(25,1)(26,2)(27,1)(28,1)(29,1)(30,0)(31,1)(32,2)(33,1)(34,2)(35,1)(36,2)(37,1)(38,1)(39,0)(40,1)(41,2)(42,1)(43,2)(44,1)(45,2)(46,1)(47,1)(48,0)(49,1)(50,2)(51,1)(52,2)(53,1)(54,2)(55,1)(56,1)(57,0)(58,1)(59,2)(60,1)(61,2)(62,1)(63,2)(64,1)(65,1)" == some "D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 D_0 D_2 D_1 D_2 D_1 D_2 D_1 D_1 0"
