-- TODO: stg_orders (Exercise 01のモデルを想定したダミー) と src_payments を結合して、注文ごとの売上を集計してください。

with orders as (
    -- この演習ディレクトリ単体で完結させるため、seeds の orders を直接参照します。
    -- （Exercise 01 のモデルに依存しない構成にしています）
    select * from {{ ref('orders') }}
),

payments as (
    select * from {{ ref('src_payments') }}
),

final as (
    select
        orders.order_id,
        orders.status,
        -- TODO: 支払いが存在しない注文でも NULL にならないようにしてください（not_null テストに落ちます）
        sum(payments.amount) as total_amount
    from orders
    -- TODO: JOIN 条件を正しく記述してください（このままだと expected と一致しません）
    left join payments on 1 = 1
    group by 1, 2
)

select * from final
