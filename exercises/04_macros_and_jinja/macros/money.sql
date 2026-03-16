{% macro cents_to_usd(cents_expr, scale=2) -%}
  -- TODO: cents（例: 1234）を usd（例: 12.34）に変換する式を返してください。
  -- ヒント: DuckDB では整数同士の割り算で意図せず丸めが起きることがあるので、`100.0` のように小数を使うと安全です。
  -- 期待: cents_to_usd('subtotal_cents') -> round(subtotal_cents / 100.0, 2)
  round(({{ cents_expr }}), {{ scale }})
{%- endmacro %}

{% macro add_tax(amount_usd_expr, tax_rate_expr, scale=2) -%}
  -- TODO: 税率（例: 0.10）を加味して税込み金額を返してください。
  -- 期待: add_tax('total_before_tax_usd', 'tax_rate') -> round(total_before_tax_usd * (1 + tax_rate), 2)
  round(({{ amount_usd_expr }}), {{ scale }})
{%- endmacro %}

{% macro sum_cents_columns(columns) -%}
  -- TODO: columns（例: ['shipping_cents','tip_cents','service_fee_cents']）をループで合計する式を返してください。
  -- 期待: null は 0 扱い（coalesce）にしてください。
  -- 例: coalesce(shipping_cents,0) + coalesce(tip_cents,0) + ...
  (
    -- TODO: いまはダミーで「最初の1個」しか足していません（テストが落ちるはず）
    coalesce({{ columns[0] }}, 0)
  )
{%- endmacro %}
