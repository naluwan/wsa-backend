-- R4: 建立 user_journeys 表（新購買記錄系統）
--
-- 目的：
-- - 取代 user_courses 表（舊購買記錄系統）
-- - 記錄使用者購買的 Journey（而非 Course）
-- - 用於 Journey Native 架構的權限判斷
--
-- 設計說明：
-- - 這是新世界的購買記錄表
-- - R4 雙軌並行：新訂單會同時寫入 user_journeys 和 user_courses
-- - R5 資料遷移：將 user_courses 的記錄遷移到 user_journeys
-- - R6 完全移除：移除 user_courses 表
--
-- 重要設計決策：
-- - 不建立 foreign key（避免 R4 風險，R5 才建立）
-- - 保留 user_courses 表（雙軌並行期間需要）
-- - UNIQUE(user_id, journey_id)（避免重複購買記錄）

CREATE TABLE user_journeys (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL,
  journey_id UUID NOT NULL,
  purchased_at TIMESTAMP NOT NULL DEFAULT NOW(),
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

  -- 唯一約束：避免重複購買記錄
  CONSTRAINT uk_user_journeys_user_journey UNIQUE (user_id, journey_id)
);

-- 索引優化查詢效能
CREATE INDEX idx_user_journeys_user_id ON user_journeys(user_id);
CREATE INDEX idx_user_journeys_journey_id ON user_journeys(journey_id);

-- 註解
COMMENT ON TABLE user_journeys IS 'R4: 使用者購買 Journey 記錄表（新系統）';
COMMENT ON COLUMN user_journeys.user_id IS '使用者 ID';
COMMENT ON COLUMN user_journeys.journey_id IS 'Journey ID';
COMMENT ON COLUMN user_journeys.purchased_at IS '購買時間';

-- 說明：
-- 1. 此表為 R4 新建立，目前無資料
-- 2. 新訂單（R4+）付款成功後會寫入此表
-- 3. 舊訂單的記錄仍在 user_courses 表（R5 才會遷移）
-- 4. JourneyAccessService.ownsJourney() 會先查此表，查不到再 fallback 到 user_courses
-- 5. R6 才會移除 user_courses 表
