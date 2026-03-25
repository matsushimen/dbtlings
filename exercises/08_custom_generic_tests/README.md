# Exercise 08: custom_generic_tests

## ゴール
自作の generic test（テストマクロ）を作り、`schema.yml` から呼び出せるようにする。

## 学習内容
- `macros/` 配下に `{% test ... %}` を定義する
- `models/schema.yml` から自作テストを呼ぶ
- 「終了日が開始日以降である」など、複数カラムを使うチェック

## 手順

1. **Profile の設定**
   ```bash
   cp -n profiles.yml.example profiles.yml
   ```

2. **Seed**
   ```bash
   uv run dbt seed --profiles-dir .
   ```

3. **まずはテストを実行**
   ```bash
   uv run dbt run --profiles-dir .
   uv run dbt test --profiles-dir .
   ```
   初期状態ではテストが落ちます（TODO 未完了のため）。

4. **TODO を埋める**
   - `macros/generic_tests.sql` の TODO を実装してください。
   - `models/schema.yml` に書かれている自作テストが Green になればクリアです。

