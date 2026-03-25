# Exercise 04: macros_and_jinja

## ゴール
dbt の **Macro** と **Jinja** を使って、SQL の重複を減らし（DRY）、読みやすく保守しやすいモデルを書けるようになる。

## 学習内容
- Macro の作成（`macros/`）
- Jinja の基本（`set`, `for`, フィルタ）
- 「金額の単位変換（セント→ドル）」や「税計算」を関数化して使い回す
- 繰り返し項目（複数の fee カラムなど）の合計を **ループ**で組み立てる

## 手順

1. **Profile の設定**
   ```bash
   cp -n profiles.yml.example profiles.yml
   ```

2. **Seed の実行**
   ```bash
   uv run dbt seed --profiles-dir .
   ```

3. **まずは現状の状態を確認**
   ```bash
   uv run dbt run --profiles-dir .
   uv run dbt test --profiles-dir .
   ```
   `dbt run` は通るが、`dbt test` は失敗する状態が初期状態です（rustlings 風）。

4. **TODO を埋める（ここが本番）**
   以下の TODO を順に実装してください。
   - `macros/money.sql`
     - `cents_to_usd()`（セント→ドルの単位変換）
     - `add_tax()`（税率を加味して税込みにする）
     - `sum_cents_columns()`（複数カラムを Jinja ループで合計）
   - `models/fct_order_totals.sql`
     - 上記マクロを使って、各種金額（fee / 税抜 / 税込）を計算する

5. **再実行してクリア判定**
   ```bash
   uv run dbt run --profiles-dir .
   uv run dbt test --profiles-dir .
   ```
   すべてのテストが Green になればクリアです！

## ヒント
- Macro は「SQL を返す関数」です。戻り値は **SQL の式**になるように設計すると使い回しやすいです。
- DuckDB は整数割り算だと 0 になりがちなので、`/ 100.0` のように小数にして割ると安全です。
- Jinja の `for` で `+` を組み立てるときは、`loop.last` を使うと末尾だけ区切り文字を省けます。
