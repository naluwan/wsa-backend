-- R4: Orders 表新增 journey_id 欄位（雙軌並行 Phase 1）
--
-- 目的：
-- - 為 R4 雙軌並行架構準備
-- - 新訂單將同時寫入 journey_id 和 course_id
-- - 舊訂單的 journey_id 為 NULL（R5 才會 backfill）
--
-- 重要設計決策：
-- - journey_id 設為 NULL（不能 NOT NULL，避免影響舊資料）
-- - 不建立 foreign key（R5 backfill 完成後才建立）
-- - 保留 course_id（雙軌並行期間需要）
--
-- Phase R4: 雙軌並行（新舊並存）
-- Phase R5: 資料遷移（backfill 舊訂單）
-- Phase R6: 完全移除（移除 course_id）

-- 新增 journey_id 欄位
ALTER TABLE orders
ADD COLUMN journey_id UUID;

-- 建立索引（提升查詢效能）
CREATE INDEX idx_orders_journey_id ON orders(journey_id);

-- 註解
COMMENT ON COLUMN orders.journey_id IS 'R4: 對應的 Journey ID（新訂單會寫入，舊訂單為 NULL）';

-- 說明：
-- 1. 此欄位目前為 NULL，不影響現有資料
-- 2. 新訂單（R4+）會同時寫入 journey_id 和 course_id
-- 3. 舊訂單（R4 之前）的 journey_id 為 NULL
-- 4. R5 會執行 backfill 將舊訂單的 journey_id 填入
-- 5. R6 才會移除 course_id 欄位
