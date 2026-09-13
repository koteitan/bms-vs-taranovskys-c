# 参考資料 (2026-09-13 収集)

## taranovsky/ — Taranovsky 本人の資料

出典: https://github.com/taranovsky/taranovsky.github.io (2026-01-28 初回 import, 最終 commit 2026-01-29)。
サイト https://taranovsky.github.io/ のリンク `other/…` は壊れており、実体はリポジトリ直下にある。

| ファイル | 内容 | 日付 |
|---|---|---|
| OrdinalNotation-2025-03-08.html | 論文 "Ordinal Notation" | Updated: March 8, 2025 |
| OrdinalArithmetic.py | 順序数演算・標準形判定・比較プログラム (main system, combined) | Last Modified: August 31, 2016 |
| OrdinalArithmetic_old1.py | 上の旧版 | |
| CompareOrdinals.py | 旧 "A Stronger Ordinal Notation" 節の比較プログラム (python2) | |

### 2022-10-05 版 (MIT サイトの Wayback 版) との差分
- 本文の差分は約 120 文 (文単位)。すべて説明の加筆・小見出し追加・誤字修正・参考文献追加。
- 定義 (main system の n-built from below, 標準形, 比較) に変更なし。
- 追加された注記で実装に関係するもの:
  - "An alternative to the standard form of the combined system is to use C(a,Ω_i) in place of C(a,0) when Ω_i < C(a,0) < Ω_{i+1}; this allows lexicographical comparison in postfix form."
- OrdinalArithmetic.py は末尾改行以外同一。

## wiki/ — Googology Wiki (en/ja) の wikitext と関連ページ

MediaWiki API (`action=parse&prop=wikitext`) で取得。ファイル名 → ページ:

### 定義
- fandom_TC.txt — en: Taranovsky's C (定義, 標準形, ill-foundedness の注記: main system with passthrough は ill-founded と報告あり)
- mira_TON.txt — miraheze: Taranovsky's ordinal notations (DoRI / DoR / main system の定義。2nd system ≠ Degrees of Reflection と判明したこと)
- ja_TC.txt — ja: タラノフスキーのC
- ja_rpakr.txt — ja: Rpakr/Taranovsky's C の厳密な定義 (main system の厳密な定義文)
- hypcos_various.txt — Hyp cos/Taranovsky's various ordinal notations (12 系統の分類と比較)
- hypcos_various_pi11.txt — 同 /Π11-TR0 (系統間比較、1.2MB)
- fandom_nayuta.txt, bubby3_1st.txt, 12abba.txt — 入門解説

### 基本列 (expand に必要)
Taranovsky 本人は基本列を定義していない。候補は 2 つ:
- hypcos_FS.txt — Hyp cos/Fundamental Sequences in Taranovsky's Notation。
  α[n] = max{β | β < α, L(β) ≤ L(α)+n, β standard} (L = C の個数)。総当たり定義。
- fandom_FS.txt — en: List of systems of fundamental sequences (Taranovsky's C 節は上と同じ定義)
- ja_AAA_analysis.txt — ja: AAAgoogology/TaranovskyのC表記の解析。木構造・ノード番号付けによる非総当たりの基本列規則 (推測、Ω_2 で C 9 個以下等をプログラム検証済みと記載)
- alemagno_AAA.txt, rpakr_AAA_tr.txt — 上の英訳 (Alemagno12 版 / Rpakr+koteitan 版)
- ja_AAA_script.txt — AAAgoogology の木構造 LaTeX スクリプト
- steps_ordinal3.html — Hyp cos, Ordinal notations (part 3) – Taranovsky's notation (stepstowardinfinity)

### BMS との対応 (既存の表)
- alemagno_bms_vs_ton.txt — Alemagno12/BMS vs TON。PrSS 範囲のみ + (0,0)(1,1)=C(Ω,0)。WIP。
- alemagno_bms_to_ton.txt — Alemagno12/BMS to TON。翻訳規則の断片 (ε0 まで, BHO まで)。WIP。
- dan_3row.txt — Danthemandixon/Comparing 3-Row BMS with TON。C(C(Ω_2+1,0),0)=(0,0,0)(1,1,1) 以降の 3 行 BMS との対応表 (約 80 項目)。
- dan_full.txt — Danthemandixon/Full analysis of TON
- redstone_pdan.txt — pDAN / OCF / TON 対応表 (ψ(Ω_ω)=C(C(Ω_2+1,0),0) 等)
- mira_list.txt — List of ordinal notations (DoR の限界 = (0,0,0)(1,1,1)(2,2,0) など BMS で表した限界一覧)
- fandom_scorcher.txt — Scorcher007/Analysis of 2nd system TON (C(Ω_2,0) 以上の停止性理論との対応)
- scorcher_gandy.txt — Scorcher007/Strength of TON considering non-Gandy ordinals
- hypcos_TON_stable.txt, hypcos_stab_rem.txt — Hyp cos: TON vs stable ordinals
- hypcos_ocf_p2.txt, hypcos_ocf_p3.txt — Hyp cos: OCF vs Array Notation (限界の推測)
- hypcos_vs_R.txt — Hyp cos: TON vs R function
- edwin.txt — Edwin Shade/A Complete Analysis of TON
- ja_AAA_cmp1/2/3.txt — AAAgoogology: TON と Buchholz ψ / 弱到達不能 OCF / Username's OCF の比較表
- rpakr_hydra.txt — Rpakr: 2nd system TON を labelled hydra に変換

### BMS 側
- fandom_BMS.txt, mira_BMS.txt — BMS の定義
- rpakr_bms_analysis.txt, aarex_bms1.txt, fandom_romanesco.txt, kuroha_bms.txt — BMS の解析
- hypcos_bm_bhm.txt — Hyp cos: BM vs BHM vs BSM
- padic_eval.txt — P進大好きbot/Evaluation of Analysis (表解析の注意)
- alemagno_stab_bms.txt — Alemagno12/Stability OCF and its analysis with BMS (WIP)

## rpakr/ — rpakr の yabasic プログラム
出典: https://github.com/rpakr-googology/Googology/tree/master/TON
- TON_Standardness — main system の標準形判定
- TON_to_TONPrSS / TONPrSS_to_TON — TON と "TONPrSS" (原始数列風表現) の相互変換
- TONPrSS_Expansion — TONPrSS の展開
- TONPrSS_Standardness, TONPrSS_BR_and_CR, TON_Hydra
