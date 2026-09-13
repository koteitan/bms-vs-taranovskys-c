# tools: 表記と変換の地図

[← Back](../README.md)

このリポジトリには表記が 6 種類あり、実装も Lean・JS・Python に分かれている。
下の図で、四角は表記（とその内部表現）、矢印は変換（関数名とファイル）。

## 表記と翻訳の流れ

```mermaid
flowchart LR
  BMS1["BMS 1 行（原始数列）<br/>文字列 (0)(1)(2)"]
  BMS2["BMS 2 行（ペア数列）<br/>文字列 (0,0)(1,1)"]
  BMS3["BMS 3 行（トリオ数列）<br/>文字列 (0,0,0)(1,1,1)"]
  LABEL["原表の UNOCF 表記<br/>psi(W_w+W_2) など"]
  BT["Buchholz ψ 項（添字は有限）<br/>Lean Buchholz.BT / JS {nu,a} / Py ('D',nu,a)"]
  EBP["拡張 Buchholz ψ 項（添字も項）<br/>JS {i,a}（ebpsi.js）"]
  TC["Taranovsky's C の項<br/>Lean TC.T / JS ['C',a,b] / Py ('C',a,b)<br/>文字列 C(C(W_2,W),0)"]
  AAA["有志（AAA 氏）の木<br/>LaTeX array"]

  BMS1 -->|"prss<br/>Translate.lean / bms2tc.js / gen_translate_tests.py"| TC
  BMS2 -->|"transPS（naruyoko 氏 common.js Trans の移植）<br/>Buchholz.lean / bms2tc.js"| BT
  BMS2 -.->|"参照実装（BUCHHOLZ_REF_JS）<br/>pss_tc.py / gen_buchholz_tests.py"| BT
  BT -->|"iota（規則 N2, R2n, R2g, R1d, R2x, R2k, CnAll）<br/>Translate.lean / bms2tc.js / pss_tc.py"| TC
  BMS3 -.->|"原表の作者の手解析<br/>（プログラムなし）"| LABEL
  LABEL -->|"parseLabel（+ fixLabel で誤記補正）<br/>ebpsi.js / ebp2tc.js"| EBP
  EBP -->|"iota（Ω̂ の超限添字と同じ規則）<br/>ebp2tc.js"| TC
  BT -.->|"添字が有限なら同じ規則"| EBP
  AAA -->|"parseArray<br/>aaa_cmp.js"| TC
```

- 1 行と 2 行は行列から直接翻訳する（`bms2tc`）。
- 3 行は行列を読まず、原表の UNOCF 表記を経由する（`tools/tss_sheet.js`）。原表にない行は訳せない。

## 各表記の中での操作

```mermaid
flowchart TB
  subgraph BMSops["BMS"]
    bexp["展開 M[n]<br/>Bms.lean expand / bms_ref.py"]
    bcmp["比較・標準形<br/>Bms.lean compare, isStandard"]
  end
  subgraph TCops["Taranovsky's C"]
    tcmp["比較（postfix の辞書式）・標準形<br/>TC.lean cmp, isStandard / bms2tc.js cmp"]
    texp["基本列 α[k]（Hyp cos の定義）<br/>TC.lean expand"]
    tsup["増加列の上限 supseq<br/>TC.lean supSeqAuto"]
  end
  subgraph EBPops["拡張 Buchholz ψ"]
    efs["基本列 α[n]・dom<br/>ebpsi.js fs, dom"]
    ear["正規形・順序・+ × ^<br/>ebpsi.js isStd, cmp, add, mul, pow"]
  end
  CLI["Lean CLI lean/.lake/build/bin/bms2tc<br/>batch: std cmp expand supseq bexp bstd bcmp tr"]
  CLI --- BMSops
  CLI --- TCops
```

JS と Python のツールは、Lean の計算（比較、標準形、基本列、上限、BMS 展開）を
`bms2tc batch` に標準入力で一括して問い合わせる。

## 検査と表の生成

```mermaid
flowchart LR
  rows["sheet/bms_rows.json<br/>（原表 xlsx の BMS 列と UNOCF 列）"]
  pss["pss_tc.py<br/>2 行: 標準形・順序・f(M[n]) < f(M)・共終性"]
  rl["rule_lab.js<br/>2 行: 規則スイッチ + 上限探索"]
  el["ebp_lab.js<br/>3 行: ψ 側の基本列 + 上限探索 + 隣の行との順序"]
  vb["sheet/verify_bad.json"]
  tb["sheet/tss_bad.json"]
  ts["tss_sheet.js<br/>3 行: 表記 → ψ → C"]
  ms["make_sheet.py"]
  out["sheet/README.md, README-en.md<br/>sheet/rows3-*.md, table.tsv, tc_map.json"]
  web["sheet/tss_web.json<br/>（tss_sheet.js --web）"]
  page["index.html + main.js<br/>（bms2tc.js, 3 行は tss_web.json を引く）"]

  rows --> pss --> vb --> ms
  rows --> el --> tb --> ts
  rows --> rl
  ts --> ms
  ms --> out
  ts --> web --> page
```

Lean と JS と Python の実装が同じ結果を出すことは次で確かめる。

```mermaid
flowchart LR
  py["pss_tc.py（Python の規則）"] -->|"gen_translate_tests.py"| tt["lean/tests/TranslateTest.lean<br/>#guard 441 件"]
  tt -->|"leanman check"| lean["Translate.lean"]
  lean -->|"bms2tc batch tr"| cj["check_js.js"]
  js["bms2tc.js"] --> cj
  tcpy["Taranovsky の OrdinalArithmetic.py"] -->|"gen_tc_tests.py"| tct["lean/tests/TCTest.lean"]
  ya["yaBMS bms（YABMS_BMS）"] -->|"gen_bms_tests.py"| bt["lean/tests/BmsTest.lean"]
  ref["参照実装 JS（BUCHHOLZ_REF_JS）"] -->|"gen_buchholz_tests.py"| bht["lean/tests/BuchholzTestInline.lean"]
```

## ファイル一覧

| ファイル | 役割 |
|---|---|
| `pss_tc.py` | 2 行の規則の Python 版と機械検査（`sheet/verify_bad.json` を書く） |
| `rule_lab.js` | 2 行の規則の実験台（`bms2tc.js` の `RULES` を切り替え、上限探索と比べる） |
| `ebp_lab.js` | 拡張 Buchholz ψ → C の検査（`--labels` で任意の表記、`--bad` で `sheet/tss_bad.json`） |
| `tss_sheet.js` | 3 行の行の翻訳（原表の表記経由）。`--web` でページ用の表 |
| `psi_i_sup.js` | ψ(I) の像を上限探索で確かめる |
| `aaa_cmp.js` | 有志（AAA 氏）の拡張 Buchholz ψ と C の対応表との照合 |
| `supfix.py` | 旧版の上限候補による補正（`rule_lab.js` に置き換え） |
| `make_sheet.py` | 対応表の生成 |
| `check_js.js` | `bms2tc.js` と Lean CLI の照合 |
| `gen_tc_tests.py` | TC の標準形・比較・基本列のテスト生成 |
| `gen_bms_tests.py`, `bms_ref.py` | BMS 展開のテスト生成と Python の参照実装 |
| `gen_buchholz_tests.py` | PSS → Buchholz のテスト生成 |
| `gen_translate_tests.py` | 翻訳（Python 規則）のテスト生成 |
| `discover.py` | 上限だけで翻訳を探す試み（計算量が爆発するため中止） |

環境変数: `BUCHHOLZ_REF_JS`（PSS → Buchholz の参照 JS）、`YABMS_BMS`（yaBMS の `bms`）。
