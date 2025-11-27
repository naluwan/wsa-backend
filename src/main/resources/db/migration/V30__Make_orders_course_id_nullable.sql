/**
 * Fast R6: 將 orders.course_id 改為可為 null
 *
 * 原因：
 * - Fast R6 進入 100% Journey Native 模式
 * - 新訂單只使用 journey_id，course_id 設為 null
 * - 保留 course_id 欄位以相容舊資料
 *
 * 變更：
 * - orders.course_id: NOT NULL -> NULL
 */

-- 將 course_id 改為可為 null
ALTER TABLE orders ALTER COLUMN course_id DROP NOT NULL;

-- 註解說明此欄位已棄用
COMMENT ON COLUMN orders.course_id IS 'Fast R6: 已棄用，保留以相容舊資料。新訂單使用 journey_id。';
