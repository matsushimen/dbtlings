# Exercise 07: packages_and_dbt_utils

## ゴール
`packages.yml` を使って外部パッケージを導入し、`dbt_utils` のマクロ/テストを利用できるようにする。

## 学習内容
- `packages.yml` と `dbt deps`
- `dbt_utils` のマクロ利用（例: surrogate key 生成）
- `dbt_utils` の generic test 利用

## 手順

1. **Profile の設定**
   ```bash
   cp -n profiles.yml.example profiles.yml
   ```

2. **パッケージの取得**
   ```bash
   uv run dbt deps
   ```

3. **Seed**
   ```bash
   uv run dbt seed --profiles-dir .
   ```

4. **TODO を埋める**
   - `models/dim_users.sql` の TODO を完了させてください（`dbt_utils` を使います）。
   - `models/schema.yml` の TODO を完了させてください（`dbt_utils` のテストを使います）。

5. **実行と検証**
   ```bash
   uv run dbt run --profiles-dir .
   uv run dbt test --profiles-dir .
   ```

