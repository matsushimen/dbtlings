-- TODO: incremental モデルを完成させてください。
-- ゴール: 2回目以降の `dbt run` で同じ行を再投入せず、テストが落ちないようにする。

{{ config(materialized='incremental') }}

with src as (
  select * from {{ ref('src_events') }}
)

select
  event_id,
  user_id,
  event_type,
  event_timestamp
from src

{% if is_incremental() %}
  -- TODO: ここで「新しい行だけ」に絞ってください。
  -- ヒント: 既存テーブル（このモデル）に入っている最大 event_timestamp を参照できます。
{% endif %}

