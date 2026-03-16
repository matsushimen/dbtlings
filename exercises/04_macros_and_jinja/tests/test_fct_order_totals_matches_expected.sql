-- fct_order_totals が期待値と一致することを検証します。
-- TODO: Macros を正しく実装できると、このテストは Green になります。

with actual as (
  select
    order_id,
    round(cast(fees_usd as double), 2) as fees_usd,
    round(cast(total_before_tax_usd as double), 2) as total_before_tax_usd,
    round(cast(total_after_tax_usd as double), 2) as total_after_tax_usd
  from {{ ref('fct_order_totals') }}
),

expected as (
  select
    order_id,
    round(cast(fees_usd as double), 2) as fees_usd,
    round(cast(total_before_tax_usd as double), 2) as total_before_tax_usd,
    round(cast(total_after_tax_usd as double), 2) as total_after_tax_usd
  from {{ ref('expected_order_totals') }}
),

diff as (
  select
    coalesce(a.order_id, e.order_id) as order_id,
    a.fees_usd as actual_fees_usd,
    e.fees_usd as expected_fees_usd,
    a.total_before_tax_usd as actual_total_before_tax_usd,
    e.total_before_tax_usd as expected_total_before_tax_usd,
    a.total_after_tax_usd as actual_total_after_tax_usd,
    e.total_after_tax_usd as expected_total_after_tax_usd
  from actual a
  full outer join expected e using(order_id)
)

select *
from diff
where
  order_id is null
  or actual_fees_usd is null
  or expected_fees_usd is null
  or abs(actual_fees_usd - expected_fees_usd) > 0.001
  or abs(actual_total_before_tax_usd - expected_total_before_tax_usd) > 0.001
  or abs(actual_total_after_tax_usd - expected_total_after_tax_usd) > 0.001
