-- TODO: ref 関数を使って src_orders モデルを参照するように修正してください。
-- また、status が 'returned' 以外のレコードのみを抽出するように filter を追加してください。

with orders as (
    -- TODO: `src_orders` を参照するように修正してください
    select * from {{ ref('orders') }}
)

select
    order_id,
    customer_id,
    order_date,
    -- status をそのまま出力します
    status
from orders
-- TODO: status が 'returned' の行を除外してください（このままだと accepted_values テストに落ちます）
