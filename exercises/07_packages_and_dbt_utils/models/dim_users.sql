-- TODO: dbt_utils を使って dim_users を完成させてください。
--
-- ゴール:
-- - user_key（surrogate key）を作る
-- - user_key は user_id と email から作る

with src as (
  select * from {{ ref('src_users') }}
)

select
  user_id,
  email,
  first_name,
  last_name,

  -- TODO: dbt_utils の surrogate key 生成マクロを使ってください
  null as user_key
from src

