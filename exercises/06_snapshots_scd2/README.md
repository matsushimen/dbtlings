# Exercise 06: snapshots_scd2

## ゴール
Snapshot を使って「同じキーの行が更新された履歴」を保持する（SCD Type 2 の基本動作を体験する）。

## 学習内容
- `snapshots/` 配下での定義
- `dbt snapshot` の実行
- `strategy`, `unique_key`, `check_cols`（または `updated_at`）の指定

## 手順

1. **Profile の設定**
   ```bash
   cp -n profiles.yml.example profiles.yml
   ```

2. **初期データをロード**
   ```bash
   uv run dbt seed --profiles-dir .
   ```

3. **Snapshot を実行**
   ```bash
   uv run dbt snapshot --profiles-dir .
   ```
   TODO が未完了だと、このステップは失敗します。

4. **データを更新してもう一度 Snapshot**
   `data/customers.csv` を `data/customers_updated.csv` の内容に置き換えてから、seed と snapshot をもう一度実行します。
   ```bash
   cp data/customers_updated.csv data/customers.csv
   uv run dbt seed --profiles-dir .
   uv run dbt snapshot --profiles-dir .
   ```

5. **TODO を埋める**
   - `snapshots/snap_customers.sql` の TODO を埋めてください。

## クリア条件
- `snap_customers` が作成され、2回目の snapshot 後に「同じ customer_id の履歴」が追加される。

