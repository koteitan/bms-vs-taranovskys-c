import BmsTc

/-!
`bms2tc` CLI.

    bms2tc "<bms>"                     BMS → Taranovsky's C
    bms2tc tc-std "<tc>"               標準形判定 (1/0)
    bms2tc tc-cmp "<tc>" "<tc>"        比較 (-1/0/1)
    bms2tc tc-post "<tc>"              postfix 文字列
    bms2tc tc-expand "<tc>" k          基本列 α[k]
    bms2tc tc-fs "<tc>" k0 k1          α[k] を k = k0..k1 について列挙
    bms2tc tc-sup "<tc>"               min{γ > β | L(γ) ≤ L(β)}
    bms2tc tc-isfs "<α>" "<β>"         β が α の基本列の要素か
    bms2tc bms-expand "<bms>[n]..."    BMS 展開
    bms2tc bms-std "<bms>"             BMS 標準形判定
    bms2tc bms-cmp "<bms>" "<bms>"     BMS 比較
-/

open TC

def die (msg : String) : IO UInt32 := do
  IO.eprintln msg
  return 1

def parseTC (s : String) : IO T := do
  match TC.parse s with
  | some t => pure t
  | none => throw (IO.userError s!"cannot parse TC term: {s}")

def ordStr : Ordering → String
  | .lt => "-1"
  | .eq => "0"
  | .gt => "1"

def optStr : Option T → String
  | some t => toString t
  | none => "(none)"

def main (args : List String) : IO UInt32 := do
  match args with
  | ["tc-std", s] =>
    let t ← parseTC s
    IO.println (if isStandard t then "1" else "0")
    return 0
  | ["tc-cmp", a, b] =>
    let ta ← parseTC a
    let tb ← parseTC b
    IO.println (ordStr (cmp ta tb))
    return 0
  | ["tc-post", s] =>
    let t ← parseTC s
    IO.println (postString t)
    return 0
  | ["tc-expand", s, k] =>
    let t ← parseTC s
    match k.toNat? with
    | some k => IO.println (optStr (expand t k)); return 0
    | none => die "k must be a number"
  | ["tc-fs", s, k0, k1] =>
    let t ← parseTC s
    match k0.toNat?, k1.toNat? with
    | some k0, some k1 =>
      for k in [k0:k1+1] do
        IO.println s!"[{k}] {optStr (expand t k)}"
      return 0
    | _, _ => die "k0 k1 must be numbers"
  | ["tc-sup", s] =>
    let t ← parseTC s
    IO.println (optStr (supCandidate t))
    return 0
  | ["tc-isfs", a, b] =>
    let ta ← parseTC a
    let tb ← parseTC b
    IO.println (if isFSElem ta tb then "1" else "0")
    return 0
  | ["bms-expand", s] =>
    match Bms.parse s with
    | some (m, bs) => IO.println (Bms.toString (Bms.expandAll m bs)); return 0
    | none => die s!"cannot parse BMS: {s}"
  | ["bms-std", s] =>
    match Bms.parse s with
    | some (m, _) => IO.println (if Bms.isStandard m then "1" else "0"); return 0
    | none => die s!"cannot parse BMS: {s}"
  | ["bms-cmp", a, b] =>
    match Bms.parse a, Bms.parse b with
    | some (ma, _), some (mb, _) => IO.println (ordStr (Bms.compare ma mb)); return 0
    | _, _ => die "cannot parse BMS"
  | ["batch"] =>
    -- 標準入力の各行: "std <t>" | "cmp <a> <b>" | "isfs <a> <b>" | "expand <t> <k>" | "sup <t>"
    --   | "bexp <bms>[n]" | "bstd <bms>" | "bcmp <a> <b>" | "tr <bms>"
    let stdin ← IO.getStdin
    let stdout ← IO.getStdout
    repeat
      let line ← stdin.getLine
      if line.isEmpty then break
      let ws := (line.trimRight.splitOn " ").filter (· ≠ "")
      let out : String := match ws with
        | ["std", t] => match TC.parse t with
          | some t => if isStandard t then "1" else "0"
          | none => "ERR"
        | ["cmp", a, b] => match TC.parse a, TC.parse b with
          | some a, some b => ordStr (cmp a b)
          | _, _ => "ERR"
        | ["isfs", a, b] => match TC.parse a, TC.parse b with
          | some a, some b => if isFSElem a b then "1" else "0"
          | _, _ => "ERR"
        | ["expand", t, k] => match TC.parse t, k.toNat? with
          | some t, some k => optStr (expand t k)
          | _, _ => "ERR"
        | ["sup", t] => match TC.parse t with
          | some t => optStr (supCandidate t)
          | none => "ERR"
        | ["bexp", m] => match Bms.parse m with
          | some (m, bs) => Bms.toString (Bms.expandAll m bs)
          | none => "ERR"
        | ["bstd", m] => match Bms.parse m with
          | some (m, _) => if Bms.isStandard m then "1" else "0"
          | none => "ERR"
        | ["bcmp", a, b] => match Bms.parse a, Bms.parse b with
          | some (a, _), some (b, _) => ordStr (Bms.compare a b)
          | _, _ => "ERR"
        | ["tr", m] => match Bms.parse m with
          | some (m, _) => match Translate.bms2tc m with
            | some t => toString t
            | none => "(none)"
          | none => "ERR"
        | _ => "ERR"
      stdout.putStrLn out
      stdout.flush
    return 0
  | [s] =>
    match Bms.parse s with
    | some (m, _) =>
      match Translate.bms2tc m with
      | some t => IO.println (toString t); return 0
      | none => die s!"not translated: {s}"
    | none => die s!"cannot parse BMS: {s}"
  | _ =>
    IO.println "usage: bms2tc \"<bms>\" | tc-std | tc-cmp | tc-post | tc-expand | tc-fs | tc-sup | tc-isfs | bms-expand | bms-std | bms-cmp"
    return 2
