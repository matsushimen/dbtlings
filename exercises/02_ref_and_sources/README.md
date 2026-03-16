# Exercise 02: ref_and_sources

## ゴール
`sources` の定義方法と、`ref` 関数を用いたモデル間の結合をマスターする。

## 学習内容
- `sources` の定義（`schema.yml`）
- `source()` 関数の使用方法
- `ref()` 関数によるモデルの結合
- `relationships` テスト（参照整合性チェック）
- `dbt ls` によるリソースの確認

## 手順

1. **Seed の実行**
   ```bash
   uv run dbt seed
   ```
   ※ 今回は `payments.csv` と Exercise 01 と同様の `orders.csv` を使用します。
   ※ `dbt-duckdb` では、seed でロードされたテーブルを `source` として定義することも可能です（この演習ではその構成を取っています）。

2. **ソースの定義**
   `tests/schema.yml` を開き、`sources:` セクションが正しく記述されているか確認してください。
   また、`payments` テーブルの `order_id` に対して `relationships` テストが設定されていることを確認してください。

3. **モデルの修正**
   以下のファイルの `-- TODO:` コメントに従って修正を行ってください。
   - `models/src_payments.sql`: `source()` 関数を使ってデータを参照します。
   - `models/fct_revenue.sql`: 2つのモデルを JOIN します。

4. **リソースの確認**
   依存関係が正しく構築されているか、以下のコマンドで確認してみましょう。
   ```bash
   uv run dbt ls
   ```

5. **実行と検証**
   ```bash
   uv run dbt run
   uv run dbt test
   ```
   すべてのテストが Green になればクリアです！

## ヒント
- `source('raw', 'payments')` のように、ソース名とテーブル名を指定します。
- `relationships` テストは、あるカラムの値が別のモデルのカラムに存在することを保証します。
