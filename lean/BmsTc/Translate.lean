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
    a_high ≠ 0, β ≠ 0:            P = ι(D_ν a_high);  C(chain(β, P), P)
    a_high = a' ++ [D_{ν+1} b]:   Cn(deg, ι(D_ν a') or base_ν),
                                  deg = chain(b, Ω̂_{ν+1}) (b < Ω_{ν+2}) / ι(b) (else)
    a_high = a' ++ [D_μ b], μ ≥ ν+2, ν = 0, a' ≠ 0:  C(C(ι(D_1 a), ι(a')), 0)     (R2)
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
        else .C (chain a (omegaHat nu)) (omegaHat nu)
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
              let degree := if bh == .zero then chain b (omegaHat (nu + 1)) else iota b
              let base := if aprime != .zero then iota (.D nuI aprime) else baseOf nu
              Cn degree base
            else if nu == 0 && aprime != .zero then
              -- R2: ψ_0(α'+q) = C(val(α') + ψ̂_1(α), 0)
              .C (.C (iota (.D 1 a)) (iota aprime)) .zero
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
