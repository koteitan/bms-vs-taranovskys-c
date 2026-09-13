/-
Taranovsky's ordinal notation C (main system, §5 of "Ordinal Notation",
2025-03-08 版) の項・比較・標準形判定・基本列。

  項:        0 | W_n (n ≥ 1) | C(a,b)
  post:   post(0) = 0, post(W_n) = W_n, post(C(a,b)) = post(b) post(a) C
  比較:      post 文字列の辞書式順序、C < 0 < W_n（短い方が小さい）
  n 番目の系: 定数は 0 と W_n のみ。W_i (i < n) は C^(n-i)(W_n, 0)。
  標準形 (n 番目の系):
    0, W_n は標準。
    C(a,b) が標準 ⇔ a, b が標準
                  ∧ (b = 0 ∨ b = W_n ∨ b = C(c,d) で a ≤ c)
                  ∧ a は C(a,b) 未満から n-built from below。
  n-built from below: OrdinalArithmetic.py (Taranovsky, 2016-08-31) の
    IsBuiltFromBelow をそのまま移植（引数 d = 経路上の最大値）。
  結合系:    W_i = C(W_{i+1}, 0) と書かず W_i と書く。判定・比較は
             n = max{i | W_i が現れる} の系に写してから行う。
  基本列 (Hyp cos):
    α[k] = max{β < α | β 標準, L(β) ≤ L(α) + k}   (L = C の個数)
  これは α の post 文字列に対する辞書式の「長さ制限つき前者」探索で求める。
  枝刈り: 標準な項の post の任意の非空接頭辞を（残りを C で閉じて）項に
  すると標準である（Taranovsky のページの定理）。
-/

namespace TC

/-- 項。`W n` は Ω_n (n ≥ 1)。 -/
inductive T where
  | zero
  | W (n : Nat)
  | C (a b : T)
deriving BEq, Repr, Inhabited, DecidableEq, Hashable

/-- post 記号。順序は c < z < w. -/
inductive Sym where
  | c
  | z
  | w (n : Nat)
deriving BEq, Repr, DecidableEq, Inhabited

def Sym.cmp : Sym → Sym → Ordering
  | .c, .c => .eq
  | .c, _ => .lt
  | .z, .c => .gt
  | .z, .z => .eq
  | .z, .w _ => .lt
  | .w i, .w j => compare i j
  | .w _, _ => .gt

/-- post 文字列（累積引数版）。 -/
def postAcc : T → List Sym → List Sym
  | .zero, acc => .z :: acc
  | .W n, acc => .w n :: acc
  | .C a b, acc => postAcc b (postAcc a (.c :: acc))

def post (t : T) : List Sym := postAcc t []

/-- 辞書式比較。接頭辞は小さい。 -/
def lexCmp : List Sym → List Sym → Ordering
  | [], [] => .eq
  | [], _ => .lt
  | _, [] => .gt
  | x :: xs, y :: ys =>
    match Sym.cmp x y with
    | .eq => lexCmp xs ys
    | o => o

/-- 同じ n 番目の系の項どうしの比較。 -/
def cmpN (a b : T) : Ordering := lexCmp (post a) (post b)

/-- C の個数 L. -/
def L : T → Nat
  | .C a b => L a + L b + 1
  | _ => 0

/-- 葉の個数 = L + 1. -/
def leaves : T → Nat
  | .C a b => leaves a + leaves b
  | _ => 1

/-- 現れる W の最大添字（無ければ 0）。 -/
def maxOmega : T → Nat
  | .zero => 0
  | .W n => n
  | .C a b => max (maxOmega a) (maxOmega b)

/-- W_i (i < n) を C^(n-i)(W_n, 0) に書き換えて n 番目の系の項にする。 -/
def toN (n : Nat) : T → T
  | .zero => .zero
  | .W i =>
    if n ≤ i then .W i
    else
      let rec go : Nat → T → T
        | 0, t => t
        | k + 1, t => go k (.C t .zero)
      go (n - i) (.W n)
  | .C a b => .C (toN n a) (toN n b)

/-- 結合系の書き方に戻す: C(W_{i+1}, 0) → W_i (i ≥ 1)。 -/
def toCombined : T → T
  | .C a b =>
    let a' := toCombined a
    let b' := toCombined b
    match a', b' with
    | .W (i + 1), .zero => if 1 ≤ i then .W i else .C a' b'
    | _, _ => .C a' b'
  | t => t

/-- 結合系の項の比較。 -/
def cmp (a b : T) : Ordering :=
  let n := max 1 (max (maxOmega a) (maxOmega b))
  cmpN (toN n a) (toN n b)

instance : LT T := ⟨fun a b => cmp a b = .lt⟩
instance : LE T := ⟨fun a b => cmp a b ≠ .gt⟩
instance (a b : T) : Decidable (a < b) := inferInstanceAs (Decidable (cmp a b = .lt))
instance (a b : T) : Decidable (a ≤ b) := inferInstanceAs (Decidable (cmp a b ≠ .gt))

/-- `a` が `b` 未満から n-built from below か（n 番目の系の項、
OrdinalArithmetic.py の IsBuiltFromBelow の移植）。`d` は経路上の最大値。 -/
def isBFB (a b : T) (n : Nat) (d : T) : Bool :=
  if cmpN a b == .lt then true
  else
    match a with
    | .zero => true
    | .W _ => 1 ≤ n || cmpN a d == .lt
    | .C a1 a2 =>
      if cmpN a d == .lt then isBFB a1 b n d && isBFB a2 b n d
      else if n == 0 then false
      else isBFB a1 b (n - 1) a && isBFB a2 b (n - 1) a

/-- n 番目の系での標準形判定。 -/
def isStandardN (t : T) (n : Nat) : Bool :=
  match t with
  | .zero => true
  | .W i => i == n
  | .C a b =>
    isStandardN a n && isStandardN b n &&
    (match b with
     | .C c _ => cmpN a c != .gt
     | _ => true) &&
    isBFB a (.C a b) n .zero

/-- 結合系の書き方の規則: C(W_{i+1}, 0) (i ≥ 1) は現れてはならない。 -/
def wellWritten : T → Bool
  | .C (.W (i + 1)) .zero => i == 0
  | .C a b => wellWritten a && wellWritten b
  | _ => true

/-- 結合系での標準形判定。 -/
def isStandard (t : T) : Bool :=
  let n := max 1 (maxOmega t)
  wellWritten t && isStandardN (toN n t) n

/-! ### 文字列化・構文解析 -/

def T.toString : T → String
  | .zero => "0"
  | .W 1 => "W"
  | .W n => s!"W_{n}"
  | .C a b => s!"C({T.toString a},{T.toString b})"

instance : ToString T := ⟨T.toString⟩

/-- post 文字列（比較用の表示）。 -/
def postString (t : T) : String :=
  String.join ((post t).map fun
    | .c => "C"
    | .z => "0"
    | .w 1 => "W"
    | .w n => s!"W{n}")

private def isDigit (c : Char) : Bool := '0' ≤ c && c ≤ '9'

/-- `C(C(W_2,0),0)`, `Ω_2`, `W2`, `W` (= W_1), `0` を受け付ける。 -/
partial def parse (s : String) : Option T :=
  let cs := s.toList.filter (fun c => c != ' ' && c != '\t' && c != '\n')
  let rec num : List Char → Nat → Nat × List Char
    | c :: rest, acc => if isDigit c then num rest (acc * 10 + (c.toNat - '0'.toNat)) else (acc, c :: rest)
    | [], acc => (acc, [])
  let rec term : List Char → Option (T × List Char)
    | '0' :: rest => some (.zero, rest)
    | 'C' :: '(' :: rest => do
      let (a, r1) ← term rest
      match r1 with
      | ',' :: r2 =>
        let (b, r3) ← term r2
        match r3 with
        | ')' :: r4 => some (.C a b, r4)
        | _ => none
      | _ => none
    | c :: rest =>
      if c == 'W' || c == 'Ω' then
        let rest := match rest with | '_' :: r => r | r => r
        match rest with
        | d :: _ =>
          if isDigit d then
            let (n, r) := num rest 0
            if n == 0 then none else some (.W n, r)
          else some (.W 1, rest)
        | [] => some (.W 1, [])
      else none
    | [] => none
  match term cs with
  | some (t, []) => some t
  | _ => none

def parse! (s : String) : T :=
  match parse s with
  | some t => t
  | none => panic! s!"TC.parse!: cannot parse {s}"

/-! ### 基本列（長さ制限つき辞書式前者探索） -/

/-- スタック（先頭が top）を C で閉じて 1 つの項にする:
`[t_j, …, t_1] ↦ C(…C(C(t_j,t_{j-1}),t_{j-2})…,t_1)`。 -/
def pad : List T → T
  | [] => .zero
  | [t] => t
  | t :: u :: rest => pad (.C t u :: rest)
termination_by l => l.length

/-- 探索状態: スタックと葉の個数。 -/
structure St where
  stack : List T
  leaves : Nat
deriving Inhabited

/-- 葉を積む（標準形の枝刈りつき）。 -/
private def pushLeaf (n maxLeaves fuel : Nat) (st : St) (leaf : T) : Option St :=
  if st.leaves < maxLeaves && st.stack.length + 1 ≤ fuel then
    let stack' := leaf :: st.stack
    if isStandardN (pad stack') n then some ⟨stack', st.leaves + 1⟩ else none
  else none

private def pushC (st : St) : Option St :=
  match st.stack with
  | t :: u :: rest => some ⟨.C t u :: rest, st.leaves⟩
  | _ => none

/-- 辞書式最大の標準な補完。`fuel` = 残り記号数の上限。 -/
def completeMax (n maxLeaves : Nat) : Nat → St → Option T
  | 0, st => match st.stack with | [t] => some t | _ => none
  | fuel + 1, st =>
    (pushLeaf n maxLeaves (fuel + 1) st (.W n) >>= completeMax n maxLeaves fuel) <|>
    (pushLeaf n maxLeaves (fuel + 1) st .zero >>= completeMax n maxLeaves fuel) <|>
    (pushC st >>= completeMax n maxLeaves fuel) <|>
    (match st.stack with | [t] => some t | _ => none)

/-- 辞書式最小の標準な補完。 -/
def completeMin (n maxLeaves : Nat) : Nat → St → Option T
  | 0, st => match st.stack with | [t] => some t | _ => none
  | fuel + 1, st =>
    (match st.stack with | [t] => some t | _ => none) <|>
    (pushC st >>= completeMin n maxLeaves fuel) <|>
    (pushLeaf n maxLeaves (fuel + 1) st .zero >>= completeMin n maxLeaves fuel) <|>
    (pushLeaf n maxLeaves (fuel + 1) st (.W n) >>= completeMin n maxLeaves fuel)

/-- post 列を左から読んだ各位置での状態（位置 0 .. len）。 -/
private def prefixStates (syms : List Sym) : Array St := Id.run do
  let mut arr : Array St := #[⟨[], 0⟩]
  let mut st : St := ⟨[], 0⟩
  for s in syms do
    st := match s with
      | .z => ⟨.zero :: st.stack, st.leaves + 1⟩
      | .w n => ⟨.W n :: st.stack, st.leaves + 1⟩
      | .c => match st.stack with
        | t :: u :: rest => ⟨.C t u :: rest, st.leaves⟩
        | _ => st
    arr := arr.push st
  return arr

/-- n 番目の系で、`α` 未満で C の個数が `m` 以下の標準な項の最大値。 -/
def maxBelowN (n : Nat) (α : T) (m : Nat) : Option T := Id.run do
  let syms := (post α).toArray
  let len := syms.size
  let maxLeaves := m + 1
  let maxLen := 2 * maxLeaves - 1
  let states := prefixStates syms.toList
  -- 位置 p を長い方から: 接頭辞 syms[0..p) の後に syms[p] より小さい記号を置く。
  for i in [0:len] do
    let p := len - 1 - i
    let st := states[p]!
    if p + 1 > maxLen then continue
    let fuel := maxLen - p
    -- 候補記号（降順）
    let cands : List Sym := match syms[p]! with
      | .w _ => [.z, .c]
      | .z => [.c]
      | .c => []
    for s in cands do
      let st' : Option St := match s with
        | .z => pushLeaf n maxLeaves fuel st .zero
        | .w k => pushLeaf n maxLeaves fuel st (.W k)
        | .c => pushC st
      match st' >>= completeMax n maxLeaves (fuel - 1) with
      | some t => return some t
      | none => pure ()
    -- 接頭辞そのものが項（深さ 1）ならそれも候補
    if p ≥ 1 then
      match st.stack with
      | [t] => if st.leaves ≤ maxLeaves then return some t
      | _ => pure ()
  return none

/-- n 番目の系で、`β` より大きく C の個数が `m` 以下の標準な項の最小値。 -/
def minAboveN (n : Nat) (β : T) (m : Nat) : Option T := Id.run do
  let syms := (post β).toArray
  let len := syms.size
  let maxLeaves := m + 1
  let maxLen := 2 * maxLeaves - 1
  let states := prefixStates syms.toList
  -- 位置 len: β を接頭辞として延長する（β より大きい）。
  if len < maxLen then
    let st := states[len]!
    let fuel := maxLen - len
    for leaf in [T.zero, T.W n] do
      match pushLeaf n maxLeaves fuel st leaf >>= completeMin n maxLeaves (fuel - 1) with
      | some t => return some t
      | none => pure ()
  for i in [0:len] do
    let p := len - 1 - i
    let st := states[p]!
    if p + 1 > maxLen then continue
    let fuel := maxLen - p
    let cands : List Sym := match syms[p]! with
      | .c => [.z, .w n]
      | .z => [.w n]
      | .w _ => []
    for s in cands do
      let st' : Option St := match s with
        | .z => pushLeaf n maxLeaves fuel st .zero
        | .w k => pushLeaf n maxLeaves fuel st (.W k)
        | .c => pushC st
      match st' >>= completeMin n maxLeaves (fuel - 1) with
      | some t => return some t
      | none => pure ()
  return none

/-- α を扱う系の番号: 現れる W の最大添字（α 自身が W_i なら i+1、最低 1）。 -/
def systemOf (α : T) : Nat :=
  match α with
  | .W i => i + 1
  | _ => max 1 (maxOmega α)

/-- 結合系の項 `α` に対する `max{β < α | β 標準, L(β) ≤ m}`（`systemOf α` の系で数える）。 -/
def maxBelow (α : T) (m : Nat) : Option T :=
  let n := systemOf α
  (maxBelowN n (toN n α) m).map toCombined

/-- 結合系の項 `β` に対する `min{γ > β | γ 標準, L(γ) ≤ m}`。 -/
def minAbove (β : T) (m : Nat) : Option T :=
  let n := systemOf β
  (minAboveN n (toN n β) m).map toCombined

/-- 後続順序数か: α = C(0, b)。 -/
def isSucc : T → Bool
  | .C .zero _ => true
  | _ => false

/-- 前者（α = C(0,b) のとき b）。 -/
def pred : T → Option T
  | .C .zero b => some b
  | _ => none

/-- 基本列 α[k] = max{β < α | β 標準, L(β) ≤ L(α)+k}（L は `systemOf α` の系で数える）。 -/
def expand (α : T) (k : Nat) : Option T :=
  let n := systemOf α
  let α' := toN n α
  (maxBelowN n α' (L α' + k)).map toCombined

/-- `β` が `α` の基本列の要素か: β < α かつ β = max{γ < α | L(γ) ≤ L(β)}。 -/
def isFSElem (α β : T) : Bool :=
  let n := systemOf α
  let α' := toN n α
  let β' := toN n β
  cmpN β' α' == .lt && (maxBelowN n α' (L β')).map toCombined == some (toCombined β')

/-- `β` の（Hyp cos 流の）上限候補: `min{γ > β | γ 標準, L(γ) ≤ L(β)}`。
β が α の基本列の要素なら α に等しい。 -/
def supCandidate (β : T) : Option T :=
  let n := systemOf β
  let β' := toN n β
  (minAboveN n β' (L β')).map toCombined

/-- 2 つの post 列の共通接頭辞の長さ。 -/
def lcpLen : List Sym → List Sym → Nat
  | x :: xs, y :: ys => if Sym.cmp x y == .eq then lcpLen xs ys + 1 else 0
  | _, _ => 0

/-- n 番目の系で、post 列 `syms` のある位置 p < `lim` において `syms[p]` より大きい記号に
分かれる標準項（C の個数 ≤ m）の最小値。p が大きいほど項は小さいので p は大きい方から探す。 -/
def minDeviateAboveN (n : Nat) (syms : Array Sym) (lim m : Nat) : Option T := Id.run do
  let maxLeaves := m + 1
  let maxLen := 2 * maxLeaves - 1
  let states := prefixStates syms.toList
  for i in [0:lim] do
    let p := lim - 1 - i
    let st := states[p]!
    if p + 1 > maxLen then continue
    let fuel := maxLen - p
    let cands : List Sym := match syms[p]! with
      | .c => [.z, .w n]
      | .z => [.w n]
      | .w _ => []
    for s in cands do
      let st' : Option St := match s with
        | .z => pushLeaf n maxLeaves fuel st .zero
        | .w k => pushLeaf n maxLeaves fuel st (.W k)
        | .c => pushC st
      match st' >>= completeMin n maxLeaves (fuel - 1) with
      | some t => return some t
      | none => pure ()
  return none

/-- 増加列 `ts`（結合系の項）の上限: 各項の post 列の共通接頭辞 s について、
s のある位置で s より大きい記号に分かれる標準項の最小値。
`ts` が上限 σ に収束する列の十分先の項なら、共通接頭辞は σ の直前まで伸びるので σ を返す。
C の個数は `ts` の最大値 + `extra` まで探す。 -/
def supSeqIn (n : Nat) (ts : List T) (extra : Nat := 0) : Option T :=
  match ts with
  | [] => none
  | _ :: _ =>
    let ps := ts.map fun t => post (toN n t)
    let p0 := ps.head!
    let lim := ps.foldl (fun acc p => min acc (lcpLen p0 p)) p0.length
    let m := ts.foldl (fun acc t => max acc (L (toN n t))) 0
    (minDeviateAboveN n p0.toArray lim (m + extra)).map toCombined

def supSeq (ts : List T) (extra : Nat := 0) : Option T :=
  supSeqIn (ts.foldl (fun acc t => max acc (systemOf t)) 1) ts extra

/-- `supSeqIn` を系 n, n+1, n+2 の順に試す（n = 列の項の系の最大）。
上限が系からはみ出すと、その系での最小の上界は素の `W_k` になるので、そのときは次の系で探し直す。
例: (0,0)(1,1)(2,1)(3,1)… の像は第 1 系の項で、第 1 系での最小の上界は W だが、上限は C(C(W_2,W),0)。 -/
def supSeqAuto (ts : List T) : Option T := Id.run do
  let n0 := ts.foldl (fun acc t => max acc (systemOf t)) 1
  for d in [0:3] do
    match supSeqIn (n0 + d) ts with
    | some (.W _) => pure ()
    | some t => return some t
    | none => pure ()
  return none

end TC
