# BMS vs Taranovsky's C

[English](README-en.md) | [Japanese](README.md)

Bashicu Matrix System (BMS, BM4) と Taranovsky's ordinal notation C（main system, 結合系）の
翻訳関数と対応表。

- 変換器（ブラウザ）: https://koteitan.github.io/bms-vs-taranovskys-c/
- 対応表: [sheet/README.md](sheet/README.md)

## 構成

- `index.html`, `main.js`, `style.css`, `bms2tc.js` — ブラウザ版変換器（`bms2tc.js` は Lean と同一規則の JS 版）
- `ebpsi.js` — 拡張 Buchholz ψ（添字も項）: 正規形、順序、基本列、+ × ^、原表の UNOCF 表記のパーサ
- `ebp2tc.js` — 拡張 Buchholz ψ → C（`bms2tc.js` の ι を超限の添字に広げたもの）
- `lean/` — Lean 4（Mathlib なし）
  - `BmsTc/TC.lean` — Taranovsky's C の項、比較、標準形判定、基本列（expand）
  - `BmsTc/Bms.lean` — BM4 の展開・比較・標準形判定（yaBMS `bms.c` の移植）
  - `BmsTc/Buchholz.lean` — PSS → Buchholz 順序数表記（naruyoko 氏 common.js `Trans` の移植）
  - `BmsTc/Translate.lean` — BMS → Taranovsky's C
  - `Main.lean` — CLI `bms2tc`
  - `tests/` — `#guard` による照合テスト（`tools/gen_*_tests.py` が生成）
- `cli/bms2tc` — CLI ラッパ
- `sheet/` — 対応表（`README.md` / `README-en.md`、全行は `table.tsv`）
- `tools/` — 検証・生成スクリプト（表記と変換の図は [tools/README.md](tools/README.md)）
- `refs/` — 収集した資料の索引（`refs/README.md`。資料本体は git 管理外）

## 定義

### Taranovsky's C（main system）

項: `0`, `Ω_n` (n ≥ 1), `C(a,b)`。postfix 文字列（`post(C(a,b)) = post(b) post(a) C`）の
辞書式順序で比較、`C < 0 < Ω_n`。n 番目の系の標準形は

    C(a,b) が標準 ⇔ a, b が標準
                  ∧ (b = 0 ∨ b = Ω_n ∨ b = C(c,d) で a ≤ c)
                  ∧ a は C(a,b) 未満から n-built from below

で、n-built from below は Taranovsky 自身の `OrdinalArithmetic.py` の
`IsBuiltFromBelow` をそのまま移植した。結合系では `Ω_i = C(Ω_{i+1},0)` と書かず `Ω_i` と書く。

### 基本列（expand）

Taranovsky は基本列を定義していない。Hyp cos の定義

    α[k] = max{ β < α | β は標準, L(β) ≤ L(α) + k }   (L = C の個数)

を採用した。`L` は α が属する系 n = max{i | Ω_i が現れる} で数える。
実装は postfix 文字列上の「長さ制限つき辞書式前者」の探索で、
標準な項の postfix の接頭辞を C で閉じた項は標準である（Taranovsky のページの定理）
ことを枝刈りに使う。

### BMS

BM4。`M[n]` は yaBMS の規約（bad part を n 個追加。`M[0]` は最終列の削除）。

### 翻訳

- 1 行（原始数列）: 森として読み、`C(a,b) = b + ω^a` の 0 番目の系に写す。
- 2 行（ペア数列）: P進大好きbot 氏の写像で Buchholz の表記 (0, D_ν, +) に写し、
  それを `Translate.lean` 冒頭の規則 ι で C の項にする。
  Ω̂_1 = Ω_1, Ω̂_{ν+1} = C(Ω_2, Ω̂_ν) を D_ν の基点にとる。ν ≥ 2 で引数の最後の項が同じ段 ν のときは
  規則 N2 で指数を ψ̂_{ν-1}(Ω_ν + a) に置き換える。ψ_0(α' + ψ_μ(b))（μ ≥ 2）の最後の項は、
  log ψ_μ(b) の中で段 ≥ μ の項だけを通る右端の道をたどり、行き着いた素の Ω_μ の指数を E = ψ̂_{μ-1}(a) に
  置き換える（R2n/R2g。b = 0 なら指数そのものが E）。道がなく b の最後の項が段 m ≥ μ+2 なら、ι(b) の中で
  E = ψ̂_{m-1}(b) の置き換えをする（R2x）。ψ_0(α' + ψ_1(b)) でも同じ置き換えを ι(b) の中で行う（R1d）。
  和や鎖を組むときは第 2 引数の最小化 Cn を使う（R2k, CnAll。論文の定義で値は変わらない）。
- 3 行（原表 BM4-Analysis の ψ(I) までの行）: 行列から直接ではなく、原表の UNOCF 列の順序数表記を
  拡張 Buchholz ψ の項として読み、`ebp2tc.js` で C に写す。超限の添字は
  Ω̂_{γ+ω^e} = C(Ω_2 + e, Ω̂_γ)（Ω_2 + e は Ω_2 を基点とする e の和の鎖）とした。
  Ω_ω → C(C(0,Ω_2),0)、Ω_{ω^2} → C(C(0,C(0,Ω_2)),0)、Ω_Ω → C(C(Ω_1,Ω_2),0)、ψ(I) → C(C(C(Ω_2,Ω_2),0),0)
  で、有志の解析と上限探索の目印に一致する。
- 4 行以上: 未対応。

対応範囲は 1 行・2 行と、原表にある 3 行の行（ψ(I) まで）。

## 使い方

    lean/.lake/build/bin/bms2tc "(0,0)(1,1)"          # BMS → C
    bms2tc tc-expand "C(Ω_1,0)" 3                     # 基本列 α[3]
    bms2tc tc-fs "C(C(Ω_2,Ω_1),0)" 0 5                # α[0..5]
    bms2tc tc-std "<tc>"                              # 標準形判定
    bms2tc tc-cmp "<tc>" "<tc>"                       # 比較
    bms2tc bms-expand "(0,0,0)(1,1,1)[2]"             # BMS 展開
    bms2tc batch  < commands.txt                      # 一括

ビルド: `leanman build -C lean`（または `env --chdir=lean lake build`）。

ブラウザ版は `index.html` を開くだけ（ビルド不要）。`?bms=` に入力が反映される。

## 検証

- `tools/gen_tc_tests.py` → `lean/tests/TCTest.lean`: Taranovsky の Python と標準形判定 3000 件・
  比較 900 件を照合、基本列は葉 6 個以下の項を全列挙して定義どおり計算した値と 846 件照合。
- `tools/gen_bms_tests.py` → `lean/tests/BmsTest.lean`: yaBMS `bms` と 654 件照合。
- `tools/gen_buchholz_tests.py` → `lean/tests/BuchholzTestInline.lean`: 参照実装（naruyoko 氏の JS）と照合。
- `tools/gen_translate_tests.py` → `lean/tests/TranslateTest.lean`: Python 版規則 (`tools/pss_tc.py`) と 441 件照合。
- `tools/check_js.js`: `bms2tc.js` と Lean CLI を 705 件照合（0 不一致）。
- `tools/pss_tc.py`: 翻訳の機械検査。f(M) が標準、順序保存、
  f(M[n]) < f(M) (n ≤ 12) かつ f(M)[k] ≤ f(M[12]) (k ≤ 6)。結果は `sheet/verify_bad.json`。
- `tools/rule_lab.js`: 2 行の規則の実験台。各極限 M で f(M) と上限探索 `supseq(f(M[4]), f(M[5]), f(M[6]))`
  （C の中での増加列の厳密な上限）を比べる。
- `tools/ebp_lab.js`: 拡張 Buchholz ψ → C の検査。ψ 側の基本列 α[n] について ι(α) = supseq ι(α[4..6])、
  ι(α[n]) < ι(α)、標準形、原表の隣の行との順序。結果は `sheet/tss_bad.json`。
- `tools/aaa_cmp.js`: 有志（AAA 氏）の拡張 Buchholz ψ と C の対応表との照合（65 項中 59 項一致、
  不一致 6 項はすべて ψ_0(ψ_2(x)) 型で、本リポジトリの値は上限探索と整合する）。
- `tools/make_sheet.py`: 対応表の生成。

正しさの基準: すべての極限 α で f(α) = sup f(α[n]) なら f は初期切片への順序同型で、一意に決まる。
上の検査はこの性質を有限個の α で確かめるもので、証明ではない。

## 状態

`sheet/README.md` の集計を参照。

- 2 行: 規則 N2・R2n・R2g・R1d・R2x・R2k・CnAll で、`tools/rule_lab.js` の極限 313 個（原表と展開サンプル）の
  313 個すべてが検査（上限一致・近似列より上・標準形）を通過。
- 3 行: 原表 4503 行のうち 4490 行が `tools/ebp_lab.js` の検査で指摘なし。
  指摘ありは原表の表記の順序が BMS の並びと逆の行（48 行）、表記が標準形でない行、添字の中の崩壊 Ω_{ψ_1(Ω_{Ω_2})} の型など。
- 未解決: 添字 μ の基本列が非可算の Ω_{κ+1}（κ ≥ 1、例 Ω_{Ω_2}）になる項より上の 214 行は、検査を通るが近似列に
  非標準形を含み、上限の照合が弱い。行 2574 ψ_0(Ω_{Ω_2}+Ω_{ψ_1(Ω_{Ω_2})}) の近似列は標準形で、その上限が今の
  ψ_0(Ω_{Ω_2}·2) の像 C(C(Q,Q),0)（Q = C(C(C(Ω_2,Ω),Ω_2),0)）と一致するため、この範囲の像はずれている可能性が高い。
- ψ(I) = (0,0,0)(1,1,1)(2,1,1)(3,1,0)(2,0,0) ↦ C(C(C(Ω_2,Ω_2),0),0)。
  `tools/psi_i_sup.js` で、ψ_0(Ω_{Ω_{…Ω}}) の像の上限がこの項に一致することを確かめた。
