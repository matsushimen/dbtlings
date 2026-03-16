-- このモデルは完成しています。
-- 主に schema.yml でのドキュメント記述とテスト追加の練習に使います。

select
    event_id,
    user_id,
    event_type,
    event_timestamp
from {{ ref('events') }}
