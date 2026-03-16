-- TODO: ref 関数を使って src_orders モデルを参照するように修正してください。
-- また、status が 'returned' 以外のレコードのみを抽出するように filter を追加してください。

with orders as (
    select * from {{ ref('src_orders') }} -- 修正が必要な場合があります
)

select
    order_id,
    customer_id,
    order_date,
    -- status をそのまま出力します
    status
from orders
where status != 'returned' -- TODO: ここを適切に実装してください
