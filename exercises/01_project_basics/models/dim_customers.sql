-- TODO: stg_orders と customers (seed) を結合して、顧客ごとの注文数を集計するモデルを作成してください。

with customers as (
    select * from {{ ref('customers') }}
),

stg_orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        -- TODO: 顧客ごとの注文数を集計してください（例: count(stg_orders.order_id)）
        null as number_of_orders
    from customers
    left join stg_orders on customers.customer_id = stg_orders.customer_id
)

select * from final
