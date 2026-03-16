# Exercise 03: tests_and_docs

## ゴール
dbt の強力なドキュメント機能と、より詳細なスキーマテストの設定を学習する。

## 学習内容
- `description` を用いたカラム・モデルの説明記述
- `accepted_values` などの高度なスキーマテスト
- `dbt docs generate` によるドキュメントのメタデータ生成
- `dbt docs serve` によるドキュメントポータルの起動

## 手順

1. **Seed の実行**
   ```bash
   uv run dbt seed
   ```

2. **ドキュメントとテストの追加**
   `tests/schema.yml` を開き、以下の TODO を完了させてください。
   - `user_id` への `not_null` テストの追加
   - `event_type` への `accepted_values` テストの追加（値: `page_view`, `add_to_cart`, `checkout`）
   - `event_timestamp` への `description` の記述

3. **実行とテスト**
   ```bash
   uv run dbt run
   uv run dbt test
   ```

4. **ドキュメントの生成と確認**
   以下のコマンドを実行し、ブラウザでドキュメントを確認します。
   ```bash
   uv run dbt docs generate
   uv run dbt docs serve
   ```
   GUI 上で、自分が書いた `description` が正しく表示されているか確認してください。

## ヒント
- `dbt docs` は、`target/` ディレクトリ配下の `index.html`, `catalog.json`, `manifest.json` を使用して可視化を行います。
- `accepted_values` は、カラムの値が指定されたリスト内にあることを確認します。
