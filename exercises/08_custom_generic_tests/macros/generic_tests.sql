{% test end_date_not_before_start_date(model, start_date_column, end_date_column) %}

-- TODO: 「end_date が start_date より前」の行を返すテストにしてください。
--
-- 仕様:
-- - end_date が null の行は、このテストでは対象外（失敗扱いにしない）
-- - end_date < start_date の行だけを返す（返った行数が 0 なら Green）

select *
from {{ model }}
where 1 = 1
  -- TODO: 条件を書いてください

{% endtest %}

