# BMS vs Taranovsky's C

[English](README-en.md) | [Japanese](README.md)

Bashicu Matrix System (BMS, BM4) と Taranovsky's ordinal notation C（main system, 結合系）の
翻訳関数と対応表。

- 変換器（ブラウザ）: https://koteitan.github.io/bms-vs-taranovskys-c/
- 対応表: [sheet/README.md](sheet/README.md)

## 構成

- `index.html`, `main.js`, `style.css`, `bms2tc.js` — ブラウザ版変換器（`bms2tc.js` は Lean と同一規則の JS 版）
- `lean/` — Lean 4（Mathlib なし）
  - `BmsTc/TC.lean` — Taranovsky's C の項、比較、標準形判定、基本列（expand）
  - `BmsTc/Bms.lean` — BM4 の展開・比較・標準形判定（yaBMS `bms.c` の移植）
  - `BmsTc/Buchholz.lean` — PSS → Buchholz 順序数表記（naruyoko 氏 common.js `Trans` の移植）
  - `BmsTc/Translate.lean` — BMS → Taranovsky's C
  - `Main.lean` — CLI `bms2tc`
  - `tests/` — `#guard` による照合テスト（`tools/gen_*_tests.py` が生成）
- `cli/bms2tc` — CLI ラッパ
- `sheet/` — 対応表（`README.md` / `README-en.md`、全行は `table.tsv`）
- `tools/` — 検証・生成スクリプト
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
  Ω̂_1 = Ω_1, Ω̂_{ν+1} = C(Ω_2, Ω̂_ν) を D_ν の基点にとる。
- 3 行以上: 未対応。

対応範囲は (0,0,0)(1,1,1) 未満。

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
- `tools/make_sheet.py`: 対応表の生成。

## 状態

`sheet/README.md` の集計を参照。2 行の 8 行（例 (0,0)(1,1)(2,2)(3,3)(3,3): Ω_2 相当の項が
2 個以上重なるもの）は機械検査に落ちており、規則が未整備。3 行以上は未翻訳。
