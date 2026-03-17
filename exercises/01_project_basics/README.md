# Exercise 01: project_basics

## ゴール
dbt プロジェクトの基本構造を理解し、`dbt run` と `dbt test` を成功させる。

## 学習内容
- `dbt_project.yml` の設定
- `profiles.yml` の役割
- `ref` 関数によるモデル間の依存関係
- 基本的なデータクリーニングと集計
- スキーマテスト（`unique`, `not_null`, `accepted_values`）

## 手順

1. **Profile の設定**
   `profiles.yml.example` の内容を参考に、`~/.dbt/profiles.yml` を作成するか、既存のファイルに追記してください。
   ※ この演習ディレクトリに `profiles.yml` を置いても動作しますが、通常は `~/.dbt/` に置きます。

2. **データのロード（Seeds）**
   今回の演習では CSV データをテーブルとしてロードするために seed を使用します。
   ```bash
   uv run dbt seed --profiles-dir .
   ```

3. **環境チェック**
   ```bash
   uv run dbt debug --profiles-dir .
   ```

4. **モデルの修正**
   以下のファイルの `-- TODO:` コメントに従って修正を行ってください。
   - `models/stg_orders.sql`
   - `models/dim_customers.sql`

5. **テストの追加**
   以下のファイルの `TODO` 部分にテストを追記してください。
   - `tests/schema.yml`

6. **実行と検証**
   ```bash
   uv run dbt run --profiles-dir .
   uv run dbt test --profiles-dir .
   ```
   すべてのテストが Green になればクリアです！

## ヒント
- `stg_orders.sql` では、`returned` ステータスの注文を除外する必要があります。
- `dim_customers.sql` では、`customers` テーブルと `stg_orders` モデルを `left join` して集計します。
