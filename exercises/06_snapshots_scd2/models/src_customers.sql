-- このモデルは完成しています。
select
  cast(customer_id as integer) as customer_id,
  customer_name,
  member_tier
from {{ ref('customers') }}

