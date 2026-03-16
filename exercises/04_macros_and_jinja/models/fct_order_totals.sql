-- TODO: このモデルを完成させてください。
-- ゴール: Macro と Jinja を使って DRY に金額計算を行い、`expected_order_totals` と一致させます。
--
-- 期待する出力（カラム）:
-- - order_id
-- - fees_usd
-- - total_before_tax_usd
-- - total_after_tax_usd

with base as (
  select * from {{ ref('src_orders_with_fees') }}
),

calc as (
  select
    order_id,

    -- TODO: sum_cents_columns() を使って fees（cents）を求めてください。
    -- fees 対象: shipping_cents, tip_cents, service_fee_cents
    {{ sum_cents_columns(['shipping_cents', 'tip_cents', 'service_fee_cents']) }} as fees_cents,

    -- TODO: 税抜合計（cents）を計算してください。
    -- 税抜合計 = subtotal + fees - discount
    (subtotal_cents + 0 - discount_cents) as total_before_tax_cents,

    tax_rate
  from base
),

final as (
  select
    order_id,

    -- TODO: cents_to_usd() を使って fees_usd を計算してください。
    {{ cents_to_usd('fees_cents') }} as fees_usd,

    -- TODO: cents_to_usd() を使って total_before_tax_usd を計算してください。
    {{ cents_to_usd('total_before_tax_cents') }} as total_before_tax_usd,

    -- TODO: add_tax() を使って税込み total_after_tax_usd を計算してください。
    {{ add_tax('total_before_tax_usd', 'tax_rate') }} as total_after_tax_usd
  from calc
)

select * from final
