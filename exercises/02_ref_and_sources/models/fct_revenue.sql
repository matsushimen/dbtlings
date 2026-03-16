-- TODO: stg_orders (Exercise 01のモデルを想定したダミー) と src_payments を結合して、注文ごとの売上を集計してください。

with orders as (
    -- 本来は ref('stg_orders') ですが、この演習パッケージ単体で動かすために
    -- 簡易的に seeds の orders を直接参照します（実際の実務では ref を使います）。
    select * from {{ ref('orders') }}
),

payments as (
    select * from {{ ref('src_payments') }}
),

final as (
    select
        orders.order_id,
        orders.status,
        -- 支払いが存在しない注文は NULL ではなく 0 として扱う（not_null テストを満たす）
        coalesce(sum(payments.amount), 0) as total_amount
    from orders
    left join payments on orders.order_id = payments.order_id -- TODO: JOIN 条件を記述してください
    group by 1, 2
)

select * from final
