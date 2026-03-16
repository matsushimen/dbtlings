-- このモデルは完成しています。
-- seed 関数を使って data/orders.csv を参照します。
select
    order_id,
    customer_id,
    order_date,
    status
from {{ ref('orders') }}
