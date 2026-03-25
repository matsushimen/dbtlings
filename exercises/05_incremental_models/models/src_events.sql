-- このモデルは完成しています。
select
  event_id,
  user_id,
  event_type,
  cast(event_timestamp as timestamp) as event_timestamp
from {{ ref('events') }}

