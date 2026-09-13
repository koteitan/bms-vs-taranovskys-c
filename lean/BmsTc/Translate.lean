import BmsTc.TC
import BmsTc.Bms
import BmsTc.Buchholz

/-!
BMS → Taranovsky's C の翻訳。

- 1 行 (PrSS): 森として読む。`C(a,b) = b + ω^a` の 0 番目の系。
- 2 行 (PSS): PSS → Buchholz 項 (`Buchholz.transPS`) → TC 項 (`iota`)。
- 3 行以上: 未対応 (`none`)。

Buchholz 項 → TC 項の規則 (tools/pss_tc.py と同一; 機械検査済みの範囲は sheet/ を参照):

  Ω̂_1 = Ω_1,  Ω̂_{ν+1} = C(Ω_2, Ω̂_ν)
  ι(0) = 0
  ι((p_1,…,p_m)) = C(exp(p_m), … C(exp(p_2), ι(p_1)))
  chain((q_1,…,q_j), t) = C(exp(q_j), … C(exp(q_1), t))
  exp(D_0 a) = ι(a)                       (a < Ω_1)
  exp(D_ν a) = Ω̂_ν                        (ν ≥ 1, a = 0)
             = chain(a, Ω̂_ν)              (ν ≥ 1, 0 < a < Ω_{ν+1})
  exp(D_ν a) = chain(β, ι(D_ν a_high))    (a = a_high ++ β, a_high ≠ 0 ≠ β)
             = ι(D_ν a)                   (a = a_high ≠ 0: ε 数)
  ι(D_ν a), a = a_high ++ β (a_high: 添字 > ν の項, β: 添字 ≤ ν の項):
    a_high = 0, ν = 0:            C(ι(a), 0)
    a_high = 0, ν ≥ 1:            a = 0 → Ω̂_ν, else C(chain(a, Ω̂_ν), Ω̂_ν)
      ただし ν ≥ 2 で a の最後の項を高さ ν のままたどって ψ_ν(0) に行き着くときは、
      その ψ_ν(0) の指数 Ω̂_ν を E = Cn(chain(a, Ω̂_ν), Ω̂_{ν-1}) に置き換える      (N2)
    a_high ≠ 0, β ≠ 0:            P = ι(D_ν a_high);  C(chain(β, P), P)
    a_high = a' ++ [D_{ν+1} b]:   Cn(deg, ι(D_ν a') or base_ν),
                                  deg = chain(b, Ω̂_{ν+1}) (b < Ω_{ν+2}) / ι(b) (else)
    a_high = a' ++ [D_μ b], μ ≥ ν+2, ν = 0, a' ≠ 0:                            (R2n)
      E = ψ̂_{μ-1}(a) として
        b = 0                  → C(Cn(E, ι(a')), 0)
        それ以外               → C(C(ex, ι(a')), 0)、ex = log ψ_μ(b) の中で「段 ≥ μ の項だけを通る
                                 右端の道」の先にある素の Ω_μ の指数を E に置き換えたもの
                                 （expRP。log / ι / chain の計算の形をなぞる。道がなければ C(ι(a), 0)）(R2g)
    a_high = a' ++ [D_1 b], ν = 0, b が添字 ≥ 2 を含み最後の項 q が段 m ≥ 2:              (R1d)
      上の deg = ι(b) を、E = ψ̂_{m-1}(b) で q について R2g と同じ置き換えをしたものにする
    その他:                        C(ι(a), base_ν)
  base_0 = 0, base_ν = Ω̂_ν.  Cn(x, b) は b = C(c,d), x > c の間 b := d と縮める。
-/

namespace Translate

open TC

/-! ### PrSS -/

/-- 1 行 BMS（原始数列）を森として読む:
  f([t_1,…,t_k]) = C(g(t_k), … C(g(t_1), 0)),  g(t) = f(children(t) − 1)。 -/
partial def prss (xs : List Nat) : T :=
  match xs with
  | [] => .zero
  | _ =>
    let rec split : List Nat → List (List Nat)
      | [] => []
      | y :: ys =>
        let (body, rest) := ys.span (fun z => z > y)
        (y :: body) :: split rest
    (split xs).foldl (fun acc t =>
      let children := (t.drop 1).map (· - 1)
      .C (prss children) acc) .zero

/-! ### Buchholz 項 → TC 項 -/

open Buchholz in
/-- 和の項リスト。 -/
def termsOf : BT → List BT
  | .zero => []
  | .sum ts => ts
  | t => [t]

open Buchholz in
def mkSum : List BT → BT
  | [] => .zero
  | [t] => t
  | ts => .sum ts

open Buchholz in
def nuOf : BT → Int
  | .D nu _ => nu
  | _ => 0

/-- Ω̂_ν: Ω̂_1 = Ω_1, Ω̂_{ν+1} = C(Ω_2, Ω̂_ν)。 -/
def omegaHat (nu : Nat) : T :=
  let rec go : Nat → T
    | 0 => .W 1
    | k + 1 => .C (.W 2) (go k)
  go (nu - 1)

def baseOf (nu : Nat) : T := if nu == 0 then .zero else omegaHat nu

/-- 第 2 引数の最小化: b = C(c,d) で x > c なら b := d。 -/
partial def Cn (x b : T) : T :=
  match b with
  | .C c d => if cmp x c == .gt then Cn x d else .C x b
  | _ => .C x b

open Buchholz in
/-- 添字 > ν の項 (high) と ≤ ν の項 (low) に分ける。 -/
def splitHigh (a : BT) (nu : Nat) : BT × BT :=
  let ts := termsOf a
  (mkSum (ts.filter fun q => nuOf q > nu), mkSum (ts.filter fun q => nuOf q ≤ nu))

open Buchholz in
/-- 和 x + y（x の末尾の y の先頭より小さい項を吸収）。 -/
def addBT (x y : BT) : BT :=
  let ys := termsOf y
  match ys with
  | [] => x
  | y0 :: _ =>
    let xs := (termsOf x).reverse.dropWhile (fun p => lessThan p y0) |>.reverse
    mkSum (xs ++ ys)

open Buchholz in
mutual
  /-- log_ω ι(p) の TC 項。 -/
  partial def expT (p : BT) : T :=
    match p with
    | .D nuI a =>
      let nu := nuI.toNat
      let (high, low) := splitHigh a nu
      if high == .zero then
        if nu == 0 then iota a
        else if a == .zero then omegaHat nu
        else chain a (omegaHat nu)
      else if low != .zero then chain low (iota (.D nuI high))
      else iota p
    | t => iota t

  partial def chain (a : BT) (t : T) : T :=
    (termsOf a).foldl (fun acc q => .C (expT q) acc) t

  /-- N2: `chain(a, Ω̂_ν)` の最後の項を高さ ν のままたどった先の ψ_ν(0) の指数 Ω̂_ν を
  `e` に置き換える。途中で高さ ν でない項や高さ > ν の項に当たれば `none`。 -/
  partial def chainRP (a : BT) (nu : Nat) (e : T) : Option T :=
    let ts := termsOf a
    match ts.getLast? with
    | some (.D muI b) =>
      if muI != (nu : Int) then none
      else
        let init := chain (mkSum ts.dropLast) (omegaHat nu)
        if b == .zero then some (.C e init)
        else
          let (h, _) := splitHigh b nu
          if h != .zero then none
          else (chainRP b nu e).map fun e' => .C e' init
    | _ => none

  /-- R2g: 段 μ の素の Ω_μ への右端の道をたどり、その指数を `e` にした log p。
  道は段 ≥ μ の項だけを通り、`expT` / `iota` / `chain` の計算の形をなぞる。 -/
  partial def expRP (p : BT) (mu : Nat) (e : T) : Option T :=
    match p with
    | .D nuI a =>
      if nuI < (mu : Int) then none
      else if a == .zero then (if nuI == (mu : Int) then some e else none)
      else
        let nu := nuI.toNat
        let (h, l) := splitHigh a nu
        if h == .zero then
          if nu == 0 then none else chainRP2 a mu e (omegaHat nu)
        else if l != .zero then chainRP2 l mu e (iota (.D nuI h))
        else iotaRP p mu e
    | _ => none

  /-- chain(a, base) の最後の項について `expRP`。 -/
  partial def chainRP2 (a : BT) (mu : Nat) (e base : T) : Option T :=
    let ts := termsOf a
    match ts.getLast? with
    | none => none
    | some last => (expRP last mu e).map fun r => .C r (chain (mkSum ts.dropLast) base)

  /-- ι(x)（和も可）の形をなぞって置き換える。 -/
  partial def iotaRPsum (x : BT) (mu : Nat) (e : T) : Option T :=
    match termsOf x with
    | [] => none
    | [p] => iotaRP p mu e
    | ts => (expRP ts.getLast! mu e).map fun r => .C r (iota (mkSum ts.dropLast))

  /-- ι(p)（主項）の形をなぞって置き換える。N2 の形と R2 の形はなぞらない。 -/
  partial def iotaRP (p : BT) (mu : Nat) (e : T) : Option T :=
    match p with
    | .D nuI a =>
      if nuI < (mu : Int) || a == .zero then none
      else
        let nu := nuI.toNat
        let (high, low) := splitHigh a nu
        if high == .zero then
          if nu == 0 then none
          else if nu ≥ 2 && ((termsOf a).getLast?.map nuOf) == some (nu : Int) then none
          else (chainRP2 a mu e (omegaHat nu)).map fun r => .C r (omegaHat nu)
        else if low != .zero then
          let pt := iota (.D nuI high)
          (chainRP2 low mu e pt).map fun r => .C r pt
        else
          let hs := termsOf high
          let aprime := mkSum hs.dropLast
          match hs.getLast? with
          | some (.D lastI c) =>
            if lastI == nuI + 1 then
              let (bh, _) := splitHigh c lastI.toNat
              let r := if bh == .zero then chainRP2 c mu e (omegaHat lastI.toNat) else iotaRPsum c mu e
              r.map fun r => Cn r (if aprime != .zero then iota (.D nuI aprime) else baseOf nu)
            else if nu == 0 then none
            else (iotaRPsum a mu e).map fun r => .C r (baseOf nu)
          | _ => none
    | _ => none

  /-- `chainRP` の基点を指定できる版: chain(a, base) の最後の段 ν の項をたどった先の
  ψ_ν(0) の指数を `e` に置き換える（途中の ψ_ν(c) の中では基点 Ω̂_ν）。 -/
  partial def chainRPBase (a : BT) (nu : Nat) (e base : T) : Option T :=
    let ts := termsOf a
    match ts.getLast? with
    | some (.D muI b) =>
      if muI != (nu : Int) then none
      else
        let init := chain (mkSum ts.dropLast) base
        if b == .zero then some (.C e init)
        else
          let (h, _) := splitHigh b nu
          if h != .zero then none
          else (chainRP b nu e).map fun e' => .C e' init
    | _ => none

  partial def iota (t : BT) : T :=
    match t with
    | .zero => .zero
    | .sum ts =>
      match ts with
      | [] => .zero
      | p :: rest => rest.foldl (fun acc q => .C (expT q) acc) (iota p)
    | .D nuI a =>
      let nu := nuI.toNat
      let (high, low) := splitHigh a nu
      if high == .zero then
        if nu == 0 then .C (iota a) .zero
        else if a == .zero then omegaHat nu
        else
          let n2 := if nu ≥ 2 then chainRP a nu (Cn (chain a (omegaHat nu)) (omegaHat (nu - 1))) else none
          match n2 with
          | some lc => .C lc (omegaHat nu)
          | none => .C (chain a (omegaHat nu)) (omegaHat nu)
      else if low != .zero then
        let P := iota (.D nuI high)
        .C (chain low P) P
      else
        let hs := termsOf high
        let aprime := mkSum (hs.dropLast)
        match hs.getLast? with
        | none => .zero
        | some last =>
          match last with
          | .D muI b =>
            let mu := muI.toNat
            if mu == nu + 1 then
              let (bh, _) := splitHigh b (nu + 1)
              let degree0 := if bh == .zero then chain b (omegaHat (nu + 1)) else iota b
              -- R1d: ψ_0(α' + ψ_1(b)) で b が段 m ≥ 2 の項で終わるとき、ι(b) の中で R2g と同じ置き換え
              let bts := termsOf b
              let degree : T :=
                match bts.getLast? with
                | some (.D m2I c2) =>
                  if nu == 0 && bh != .zero && bts.length ≥ 2 && m2I ≥ 2 then
                    let binit := mkSum bts.dropLast
                    let e2 := iota (.D (m2I - 1) b)
                    if c2 == .zero then Cn e2 (iota binit)
                    else match expRP (.D m2I c2) m2I.toNat e2 with
                      | some r => .C r (iota binit)
                      | none => degree0
                  else degree0
                | _ => degree0
              let base := if aprime != .zero then iota (.D nuI aprime) else baseOf nu
              Cn degree base
            else if nu == 0 && aprime != .zero then
              -- R2n: ψ_0(α' + ψ_μ(b)), μ ≥ 2。E = ψ̂_{μ-1}(a)
              let en := iota (.D ((mu : Int) - 1) a)
              if b == .zero then .C (Cn en (iota aprime)) .zero
              else
                match expRP (.D muI b) mu en with
                | some e => .C (.C e (iota aprime)) .zero
                | none => .C (iota a) .zero
            else
              .C (iota a) (baseOf nu)
          | _ => .zero
end

/-! ### 入口 -/

/-- 末尾の全零行を落とす。 -/
def stripZeroRows (m : Bms.Matrix) : Bms.Matrix :=
  let rows := (m.head?.map (·.length)).getD 0
  let lastNonzero := (List.range rows).foldl (fun acc r =>
    if m.any (fun c => c.getD r 0 != 0) then r + 1 else acc) 0
  let keep := max 1 lastNonzero
  m.map (·.take keep)

/-- BMS → Taranovsky's C。3 行以上は `none`。 -/
def bms2tc (m : Bms.Matrix) : Option T :=
  match m with
  | [] => some .zero
  | _ =>
    let m := stripZeroRows m
    let rows := (m.head!).length
    if rows == 1 then some (prss (m.map (·.head!)))
    else if rows == 2 then
      let cols : List (Nat × Nat) := m.map fun c => (c.getD 0 0, c.getD 1 0)
      some (iota (Buchholz.transPS cols))
    else none

end Translate
