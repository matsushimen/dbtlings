# Exercise 05: incremental_models

## ゴール
`incremental` マテリアライゼーションと `is_incremental()` を使い、再実行時に「新しい行だけ」取り込めるようにする。

## 学習内容
- `{{ config(materialized='incremental') }}` の設定
- `is_incremental()` の分岐
- 2回目以降の `dbt run` で重複が生まれないようにする

## 手順

1. **Profile の設定**
   ```bash
   cp -n profiles.yml.example profiles.yml
   ```

2. **Seed**
   ```bash
   uv run dbt seed --profiles-dir .
   ```

3. **初回実行（full-refresh）**
   ```bash
   uv run dbt run --profiles-dir . --full-refresh
   uv run dbt test --profiles-dir .
   ```

4. **2回目実行（差分実行）**
   もう一度同じコマンドを実行します。
   ```bash
   uv run dbt run --profiles-dir .
   uv run dbt test --profiles-dir .
   ```
   TODO が未完了だと、2回目に `unique` テストが落ちます。

5. **TODO を埋める**
   - `models/fct_events_incremental.sql` の TODO を完了させてください。
     - incremental にする
     - `is_incremental()` のとき、新しい行だけに絞る

## ヒント
- 「新しい」の基準は `event_timestamp` を使います。
- `is_incremental()` のブロック内では、既存テーブルの最大 `event_timestamp` を参照できます。

