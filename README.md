# BMS vs Taranovsky's C

[English](README-en.md) | [Japanese](README.md)

Bashicu Matrix System (BMS, BM4) を Taranovsky's ordinal notation C（main system, 結合系）に写す
翻訳関数と対応表。

- 変換器（ブラウザ）: https://koteitan.github.io/bms-vs-taranovskys-c/
- 対応表: [sheet/README.md](sheet/README.md)

## 目的

BMS の行列を入力にとって C の項を返す、**全域の翻訳関数**を**行列から直接**作る。

- 翻訳は入力の行列だけから計算する。対応表を引かない。
- 原表（BM4-Analysis シート）は**抜き取りの見本**。検査の入力の一部と、比べる値に使うだけ。
- 原表の UNOCF 表記、拡張 Buchholz ψ などの順序数崩壊関数（OCF）は**参考**。翻訳の途中に通さない。
  中間の表記は BMS や C より弱く、行数が増えると先に表しきれなくなるため。
- 正しさは BMS と C の側だけで確かめる（下の「正しさの基準」）。

## 作業の決まり

文脈を失ったときは、ここから再開する。

1. 3 行以上の翻訳は行列から直接作る。UNOCF 表記や拡張 Buchholz ψ を経由する実装に戻らない。
2. 原表経由の実装（`ebpsi.js`, `ebp2tc.js`, `ebp_sigma.js`, `tools/tss_sheet.js`, `tools/ebp_lab.js`,
   `tools/sigma_lab.js`, `tools/ebp_std_rule.js`, `tools/psi_i_sup.js`）は**参考実装**。
   直接の翻訳の値と比べるのには使うが、直したり広げたりしない。
3. 検査の入力は BMS から作る。標準な行列を展開 M[n] でたどって集め、原表にない行列も含める。
4. 直接の翻訳と参考の値（原表経由の値、有志の表）が食い違ったら、BMS と C の側の検査で決める。

道具と作業の手順は [tools/README.md](tools/README.md)。

## 翻訳の現状

| 行数 | 方法 | 入力 | 全域か |
|---|---|---|---|
| 1 行 | 行列から直接（`prss`） | 任意の行列 | ✅ |
| 2 行 | 行列 → Buchholz ψ → C（`transPS` と ι） | 任意の行列 | ✅ Buchholz ψ は 2 行の範囲をすべて表せる |
| 3 行 | 行列から直接 | — | ❌ **未実装（今の作業）** |
| 3 行・参考 | 原表の UNOCF 表記 → 拡張 Buchholz ψ → C | 原表にある行だけ | ❌ |
| 4 行以上 | — | — | ❌ 未対応 |

## 構成

- `direct.js` — 行列から直接の翻訳（作業中。和の分解と 1 行の木の規則。検査は `tools/direct_lab.js`）
- `index.html`, `main.js`, `style.css`, `bms2tc.js` — ブラウザ版変換器（`bms2tc.js` は Lean と同一規則の JS 版。
  3 行は原表経由の値の表 `sheet/tss_web.json` を引いているだけ）
- `lean/` — Lean 4（Mathlib なし）
  - `BmsTc/TC.lean` — Taranovsky's C の項、比較、標準形判定、基本列（expand）、増加列の上限（supseq）
  - `BmsTc/Bms.lean` — BM4 の展開・比較・標準形判定（yaBMS `bms.c` の移植）
  - `BmsTc/Buchholz.lean` — PSS → Buchholz 順序数表記（naruyoko 氏 common.js `Trans` の移植）
  - `BmsTc/Translate.lean` — BMS → Taranovsky's C（1 行・2 行）
  - `Main.lean` — CLI `bms2tc`
  - `tests/` — `#guard` による照合テスト（`tools/gen_*_tests.py` が生成）
- `cli/bms2tc` — CLI ラッパ
- `sheet/` — 対応表（`README.md` / `README-en.md`、全行は `table.tsv`）
- `tools/` — 検証・生成スクリプト（表記と変換の図、道具の一覧は [tools/README.md](tools/README.md)）
- `refs/` — 収集した資料の索引（`refs/README.md`。資料本体は git 管理外）
- 参考実装（原表経由の 3 行）:
  - `ebpsi.js` — 拡張 Buchholz ψ（添字も項）: 正規形、順序、基本列、+ × ^、原表の UNOCF 表記のパーサ
  - `ebp2tc.js` — 拡張 Buchholz ψ → C（`bms2tc.js` の ι を超限の添字に広げたもの）
  - `ebp_sigma.js` — 写像 σ（原表経由の 3 行の翻訳は f = ι∘σ）

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

### 正しさの基準

翻訳 f に次を求める。

- f(M) は C の標準形
- M < M' ⇒ f(M) < f(M')
- 極限の行列 M で f(M) = sup_n f(M[n])

すべての極限でこれが成り立てば、f は初期切片への順序同型で、一意に決まる。
機械の検査は有限個の M でこれを調べる（証明ではない）:
f(M) の標準形、行列の比較 `bcmp` と項の比較 `cmp` の一致、f(M[n]) < f(M)、
`supseq(f(M[4]), f(M[5]), f(M[6])) = f(M)`（C の中での増加列の上限）。

## 翻訳

### 1 行（原始数列）

森として読み、`C(a,b) = b + ω^a` の 0 番目の系に写す。

### 2 行（ペア数列）

P進大好きbot 氏の写像で Buchholz の表記 (0, D_ν, +) に写し、
それを `Translate.lean` 冒頭の規則 ι で C の項にする。
Ω̂_1 = Ω_1, Ω̂_{ν+1} = C(Ω_2, Ω̂_ν) を D_ν の基点にとる。ν ≥ 2 で引数の最後の項が同じ段 ν のときは
規則 N2 で指数を ψ̂_{ν-1}(Ω_ν + a) に置き換える。ψ_0(α' + ψ_μ(b))（μ ≥ 2）の最後の項は、
log ψ_μ(b) の中で段 ≥ μ の項だけを通る右端の道をたどり、行き着いた素の Ω_μ の指数を E = ψ̂_{μ-1}(a) に
置き換える（R2n/R2g。b = 0 なら指数そのものが E）。道がなく b の最後の項が段 m ≥ μ+2 なら、ι(b) の中で
E = ψ̂_{m-1}(b) の置き換えをする（R2x）。ψ_0(α' + ψ_1(b)) でも同じ置き換えを ι(b) の中で行う（R1d）。
和や鎖を組むときは第 2 引数の最小化 Cn を使う（R2k, CnAll。論文の定義で値は変わらない）。

### 3 行（トリオ数列）: 行列から直接（未実装）

これからの作業。手がかり:

- 1 行の `prss` と、有志の断片的な規則（`refs/wiki/alemagno_bms_to_ton.txt`）は、行列の木の構造から
  直接 C を組む形をしている。根の列のあとに、各要素に 1 を足した列 X が続く木は C(f(X), 0)、
  木の並び（和）は C の鎖をつなぐ、(0,1) は Ω。これを 3 行に広げるのが第一の候補。
- 目印の値: (0,0,0)(1,1,1) ↦ C(C(C(0,Ω_2),0),0)（2 行の対角の列の上限）、
  ψ(I) の行列 (0,0,0)(1,1,1)(2,1,1)(3,1,0)(2,0,0) ↦ C(C(C(Ω_2,Ω_2),0),0)（参考実装での上限探索）。
- 比べる値（参考）: 原表経由の値 `sheet/tc_map.json`、3 行 BMS と C の有志の対応表 `refs/wiki/dan_3row.txt`。
- 行き止まり: f(M) = sup f(M[n]) の再帰だけで訳す試み（`tools/discover.py`）は、計算量が爆発して中止した。

### 3 行・参考実装（原表経由）

原表の UNOCF 列の順序数表記を拡張 Buchholz ψ の項として読み、f = ι∘σ で C に写す。
ι（`ebp2tc.js`）は超限の添字を Ω̂_{γ+ω^e} = C(Ω_2 + e, Ω̂_γ) とし、
σ（`ebp_sigma.js`）は、添字の中の崩壊のせいで ι の値がずれる項を、順序を保って ι が扱える項へ送る
（例 ψ_0(Ω_{Ω_2}·2) ↦ ψ_0(Ω_{ψ_2(Ω_{ψ_1(Ω_{Ω_2}·2)})})）。
原表にない行は訳せず、原表の表記の誤りを引き継ぐ。**直接の翻訳の値と比べるためだけに使う。**

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

1 行・2 行と、各表記の実装:

- `tools/gen_tc_tests.py` → `lean/tests/TCTest.lean`: Taranovsky の Python と標準形判定 3000 件・
  比較 900 件を照合、基本列は葉 6 個以下の項を全列挙して定義どおり計算した値と 846 件照合。
- `tools/gen_bms_tests.py` → `lean/tests/BmsTest.lean`: yaBMS `bms` と 654 件照合。
- `tools/gen_buchholz_tests.py` → `lean/tests/BuchholzTestInline.lean`: 参照実装（naruyoko 氏の JS）と照合。
- `tools/gen_translate_tests.py` → `lean/tests/TranslateTest.lean`: Python 版規則 (`tools/pss_tc.py`) と 441 件照合。
- `tools/check_js.js`: `bms2tc.js` と Lean CLI を 705 件照合（0 不一致）。
- `tools/pss_tc.py`: 翻訳の機械検査。f(M) が標準、順序保存、
  f(M[n]) < f(M) (n ≤ 12) かつ f(M)[k] ≤ f(M[12]) (k ≤ 6)。結果は `sheet/verify_bad.json`。
- `tools/rule_lab.js`: 2 行の規則の実験台。原表の行と、展開でたどった行列の各極限 M で、
  f(M) と `supseq(f(M[4]), f(M[5]), f(M[6]))` を比べる。**3 行の直接の翻訳の検査もこの形で作る。**

参考実装（原表経由の 3 行）:

- `tools/ebp_lab.js`: 拡張 Buchholz ψ 側の基本列 α[n] について f(α) = supseq f(α[4..6])、標準形、原表の隣の行との順序。
- `tools/ebp_std_rule.js`: ι(t) が C の標準形になる条件（規則 R4）の照合。
- `tools/aaa_cmp.js`: 有志（AAA 氏）の拡張 Buchholz ψ と C の対応表との照合。
- `tools/inspect.js` → `sampling.md`: 大きさの区間ごとのエラー数（1・2 行は行列から、3 行は参考実装）。

## 状態

`sheet/README.md` の集計を参照。

- 1 行・2 行: 行列から直接の全域の翻訳。2 行は `tools/rule_lab.js` の極限 313 個（原表と展開サンプル）すべてが
  検査（上限一致・近似列より上・標準形）を通過。
- 3 行: 行列から直接の翻訳は未実装。
- 3 行・参考実装: 原表 4503 行のうち 4493 行が `tools/ebp_lab.js` の検査で指摘なし。原表にない行列は訳せない。
