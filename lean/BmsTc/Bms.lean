/-
Bashicu Matrix System, version BM4, ported from yaBMS `c/bms.c`.

A matrix `S = S_0 S_1 ⋯ S_{X-1}` is a list of columns; column `S_x` is a list
of rows `S_x0, S_x1, …`.  Expansion with bracket `[b]`:

    t      = (index of the first zero row of S_{X-1}) − 1
    r      = P_t(X−1)                                   (bad root)
    Δ_y    = S_{X-1,y} − S_{r,y}                        (y < t)
    A_xy   = 1 if x = r, else A_{P_y(x) y} if P_y(x) ≥ r, else 0
    B_xy^(a) = S_xy + a Δ_y A_xy                        (r ≤ x < X−1, y < t)
    S[b]   = S_0 ⋯ S_{X-2} B^(1) B^(2) ⋯ B^(b)

with the UBI parent `P_y(x)` = first column `p` in the row-(y−1) ancestor chain
of `x` with `S_py < S_xy` (row 0: nearest `p < x` with `S_p0 < S_x0`).
Note `[b]` appends `b` copies after the untouched prefix, so `S[0]` = drop the
last column, and yaBMS `[n]` has `n+1` copies of the bad part in total.
-/

namespace Bms

/-- A Bashicu matrix: list of columns, each a list of row entries. -/
abbrev Matrix := List (List Nat)

/-! ### Parsing and printing -/

private def parseNat (cs : List Char) : Option (Nat × List Char) :=
  let ds := cs.takeWhile Char.isDigit
  if ds.isEmpty then none
  else some (ds.foldl (fun n c => n * 10 + (c.toNat - '0'.toNat)) 0, cs.drop ds.length)

private partial def parseCols (cs : List Char) (acc : Matrix) : Option (Matrix × List Char) :=
  match cs with
  | [] => some (acc.reverse, [])
  | ' ' :: rest | '\t' :: rest | '\n' :: rest => parseCols rest acc
  | '[' :: _ => some (acc.reverse, cs)
  | '(' :: rest =>
    let rec entries (cs : List Char) (col : List Nat) : Option (List Nat × List Char) :=
      match cs with
      | ' ' :: rest => entries rest col
      | ')' :: rest => some (col.reverse, rest)
      | _ =>
        match parseNat cs with
        | none => none
        | some (n, rest) =>
          match rest with
          | ',' :: rest' => entries rest' (n :: col)
          | _ => entries rest (n :: col)
    match entries rest [] with
    | none => none
    | some (col, rest') => parseCols rest' (col :: acc)
  | _ => none

private partial def parseBrackets (cs : List Char) (acc : List Nat) : Option (List Nat) :=
  match cs with
  | [] => some acc.reverse
  | ' ' :: rest | '\t' :: rest | '\n' :: rest => parseBrackets rest acc
  | '[' :: rest =>
    match parseNat rest with
    | none => none
    | some (n, rest') =>
      match rest' with
      | ']' :: rest'' => parseBrackets rest'' (n :: acc)
      | _ => none
  | _ => none

/-- Parse `"(0,0,0)(1,1,1)[2][1]"` into the matrix and its bracket list. -/
def parse (s : String) : Option (Matrix × List Nat) := do
  let (m, rest) ← parseCols s.toList []
  let bs ← parseBrackets rest []
  pure (m, bs)

/-- Parse ignoring brackets; `[]` on failure (for tests). -/
def parse! (s : String) : Matrix :=
  match parse s with
  | some (m, _) => m
  | none => []

/-- `"(0,0,0)(1,1,1)"`; the empty matrix prints as `""`. -/
def toString (m : Matrix) : String :=
  String.join (m.map fun c => "(" ++ ",".intercalate (c.map Nat.repr) ++ ")")

instance : ToString Matrix := ⟨toString⟩

/-! ### Internals on arrays -/

/-- Entry `S_xy`, `0` outside the matrix. -/
@[inline] private def ent (a : Array (Array Nat)) (x : Int) (y : Nat) : Nat :=
  if x < 0 then 0 else (a.getD x.toNat #[]).getD y 0

/-- Parent index matrix, `-1` for "no parent" (as bms.c). -/
private def parentIdxA (a : Array (Array Nat)) : Array (Array Int) := Id.run do
  let xs := a.size
  let ys := if xs = 0 then 0 else a[0]!.size
  let mut pim : Array (Array Int) := Array.replicate xs (Array.replicate ys (-1))
  for x in [0:xs] do
    let mut row : Array Int := Array.replicate ys (-1)
    -- row 0: nearest column to the left with a strictly smaller entry
    let c0 := ent a x 0
    let mut px : Int := (x : Int) - 1
    while px ≥ 0 && !(ent a px 0 < c0) do
      px := px - 1
    row := row.set! 0 px
    -- rows y ≥ 1: walk the row-(y-1) ancestor chain
    for y in [1:ys] do
      let c := ent a x y
      if c = 0 then
        row := row.set! y (-1)
      else
        let mut p : Int := row[y-1]!
        while p ≠ -1 && !(ent a p y < c) do
          p := (pim[p.toNat]!)[y-1]!
        row := row.set! y p
    pim := pim.set! x row
  return pim

private def expandA (a : Array (Array Nat)) (b : Nat) : Array (Array Nat) := Id.run do
  let xs := a.size
  if xs = 0 then return #[]
  let ys := a[0]!.size
  let last := a[xs-1]!
  -- t+1 = index of the first zero row of the last column (bms.c `lnz = y-1`)
  let mut y := 0
  while y < ys && last[y]! ≠ 0 do
    y := y + 1
  if y = 0 || b = 0 then return a.pop
  let lnz := y - 1
  let pim := parentIdxA a
  let r := ((pim[xs-1]!)[lnz]!).toNat
  let bpxs := xs - r - 1
  let delta : Array Nat := (Array.range lnz).map fun yy => last[yy]! - (a[r]!)[yy]!
  let nzs := lnz + 1
  let mut am : Array (Array Nat) := Array.replicate bpxs (Array.replicate nzs 0)
  am := am.set! 0 (Array.replicate nzs 1)
  for x in [1:bpxs] do
    let mut row : Array Nat := Array.replicate nzs 0
    for yy in [0:nzs] do
      let p : Int := (pim[r + x]!)[yy]!
      row := row.set! yy (if p < r then 0 else (am[(p - r).toNat]!)[yy]!)
    am := am.set! x row
  let mut out := a.pop
  for k in [1:b+1] do
    for x in [0:bpxs] do
      let mut col := a[r + x]!
      for yy in [0:lnz] do
        col := col.set! yy (col[yy]! + k * delta[yy]! * (am[x]!)[yy]!)
      out := out.push col
  return out

private def toA (m : Matrix) : Array (Array Nat) := (m.map List.toArray).toArray
private def ofA (a : Array (Array Nat)) : Matrix := (a.map Array.toList).toList

/-! ### Public API -/

/-- Parent index matrix `P_y(x)` (`-1` = no parent), one list per column. -/
def parentIdx (m : Matrix) : List (List Int) :=
  ((parentIdxA (toA m)).map Array.toList).toList

/-- `S[b]`: BM4 expansion with bracket `[b]` (`b` copies appended). -/
def expand (m : Matrix) (b : Nat) : Matrix := ofA (expandA (toA m) b)

/-- Apply brackets left to right: `S[b₁][b₂]⋯`. -/
def expandAll (m : Matrix) (bs : List Nat) : Matrix := bs.foldl expand m

/-- Lexicographic order on the column-major entry list, then column count.
Matrices with different row counts are padded with zero rows. -/
def compare (a b : Matrix) : Ordering :=
  let ra := (a.headD []).length
  let rb := (b.headD []).length
  let ys := max ra rb
  let pad (m : Matrix) : List Nat := m.flatMap fun c => c ++ List.replicate (ys - c.length) 0
  let rec lex : List Nat → List Nat → Ordering
    | x :: xs, y :: ys => if x > y then .gt else if x < y then .lt else lex xs ys
    | _, _ => .eq
  match lex (pad a) (pad b) with
  | .eq => Ord.compare a.length b.length
  | o => o

/-- Standard-form test, as bms.c `isstd`: start from the least diagonal-shaped
matrix `s ≥ m` and expand `s` downward while `s > m`; `m` is standard iff the
descent hits `m` exactly.  `fuel` bounds the number of descent steps. -/
def isStandard (m : Matrix) (fuel : Nat := 10000) : Bool := Id.run do
  let a := toA m
  let xs := a.size
  if xs = 0 then return true
  let ys := a[0]!.size
  -- initial diagonal prefix
  let mut s : Array (Array Nat) := #[]
  let mut done := false
  let mut illegal := false
  for x in [0:xs] do
    if done || illegal then break
    let mut col : Array Nat := #[]
    for y in [0:ys] do
      if done || illegal then break
      let v := (a[x]!)[y]!
      if v > x then
        illegal := true
      else if v < x then
        col := (col.push (v + 1)) ++ Array.replicate (ys - y - 1) 0
        done := true
      else
        col := col.push x
    if !illegal then s := s.push col
  if illegal then return false
  let mut f := fuel
  while f > 0 do
    f := f - 1
    match compare (ofA s) m with
    | .eq => return true
    | .lt => return false
    | .gt =>
      let oldxsm1 := s.size - 1
      let bplen := (expandA s 1).size - oldxsm1
      let n := if bplen ≠ 0 then (xs - oldxsm1) / bplen + 1 else 0
      let mut s2 := (expandA s n).extract 0 xs
      let mut cut := s2.size
      let mut found := false
      for x in [0:s2.size] do
        if !found then
          let exceeds := (List.range ys).any fun y => (s2[x]!)[y]! > (a[x]!)[y]!
          if exceeds then
            cut := x + 1
            found := true
      s := s2.extract 0 cut
  return false

end Bms
