{% snapshot snap_customers %}

-- TODO: Snapshot 定義を完成させてください。
-- ここでは `src_customers` を対象にします。

{{
  config(
    target_schema='main',
    -- TODO: unique_key を設定してください
    -- TODO: strategy を設定してください
    -- TODO: check_cols（または updated_at）を設定してください
  )
}}

select * from {{ ref('src_customers') }}

{% endsnapshot %}

