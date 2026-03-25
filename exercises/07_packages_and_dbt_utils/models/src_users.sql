-- このモデルは完成しています。
select
  cast(user_id as integer) as user_id,
  email,
  first_name,
  last_name
from {{ ref('users') }}

