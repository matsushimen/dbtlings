-- このモデルは完成しています。
-- seed（data/orders_with_fees.csv）を参照する薄いラッパーです。

select
  order_id,
  customer_id,
  order_date,
  subtotal_cents,
  shipping_cents,
  tip_cents,
  service_fee_cents,
  discount_cents,
  tax_rate
from {{ ref('orders_with_fees') }}
