-- このモデルは完成しています。
select
  cast(subscription_id as integer) as subscription_id,
  cast(user_id as integer) as user_id,
  cast(start_date as date) as start_date,
  cast(end_date as date) as end_date
from {{ ref('subscriptions') }}

