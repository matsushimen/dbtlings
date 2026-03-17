-- TODO: source 関数を使って 'raw' ソースの 'payments' テーブルを参照するようにしてください。
-- https://docs.getdbt.com/docs/build/sources

select
    payment_id,
    order_id,
    payment_method,
    amount
from {{ ref('payments') }} -- TODO: ここを source('raw', 'payments') に修正してください
