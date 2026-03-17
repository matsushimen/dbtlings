-- fct_revenue が期待値と一致することを検証します。
-- TODO: models/fct_revenue.sql を正しく実装できると、このテストは Green になります。

with actual as (
  select
    order_id,
    status,
    cast(total_amount as bigint) as total_amount
  from {{ ref('fct_revenue') }}
),

expected as (
  select
    order_id,
    status,
    cast(total_amount as bigint) as total_amount
  from {{ ref('expected_revenue') }}
),

diff as (
  select
    coalesce(a.order_id, e.order_id) as order_id,
    a.status as actual_status,
    e.status as expected_status,
    a.total_amount as actual_total_amount,
    e.total_amount as expected_total_amount
  from actual a
  full outer join expected e using(order_id)
)

select *
from diff
where
  order_id is null
  or actual_status is distinct from expected_status
  or actual_total_amount is null
  or expected_total_amount is null
  or actual_total_amount != expected_total_amount
