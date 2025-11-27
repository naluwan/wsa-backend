-- ============================================================
-- Phase R5: Journey Backfill & 權限切換
-- 目的：將舊訂單和購買記錄遷移到 Journey 架構
-- 執行時間：預估 < 5 秒（資料量小）
-- Idempotent：可重複執行，不會造成資料重複
-- ============================================================

-- ============================================================
-- Part 1: 建立 slug ↔ courseCode 的臨時映射表（用於處理特殊規則）
-- ============================================================

CREATE TEMP TABLE journey_course_mapping AS
SELECT
    j.id AS journey_id,
    j.slug AS journey_slug,
    c.id AS course_id,
    c.code AS course_code
FROM journeys j
JOIN courses c ON (
    -- 一般規則：software-design-pattern → SOFTWARE_DESIGN_PATTERN
    c.code = UPPER(REPLACE(j.slug, '-', '_'))
    OR
    -- 特殊規則：ai-bdd / ai-x-bdd → AI_X_BDD
    (j.slug IN ('ai-bdd', 'ai-x-bdd') AND c.code = 'AI_X_BDD')
);

-- 驗證：確保所有 Journey 都有對應的 Course
DO $$
DECLARE
    unmapped_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO unmapped_count
    FROM journeys j
    WHERE NOT EXISTS (
        SELECT 1 FROM journey_course_mapping m WHERE m.journey_id = j.id
    );

    IF unmapped_count > 0 THEN
        RAISE EXCEPTION '發現 % 個 Journey 沒有對應的 Course，請檢查映射規則', unmapped_count;
    END IF;

    RAISE NOTICE 'Journey ↔ Course 映射驗證通過';
END $$;

-- ============================================================
-- Part 2: Backfill orders.journey_id（舊訂單補上 journey_id）
-- ============================================================

-- 更新舊訂單的 journey_id
UPDATE orders o
SET journey_id = m.journey_id
FROM journey_course_mapping m
WHERE o.course_id = m.course_id
  AND o.journey_id IS NULL;  -- 只處理舊訂單（R4 前）

-- 報告 backfill 結果
DO $$
DECLARE
    backfilled_count INTEGER;
    remaining_null_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO backfilled_count
    FROM orders
    WHERE journey_id IS NOT NULL;

    SELECT COUNT(*) INTO remaining_null_count
    FROM orders
    WHERE journey_id IS NULL;

    RAISE NOTICE '[orders.journey_id] Backfill 完成：已補齊 % 筆，仍有 % 筆為 NULL',
        backfilled_count, remaining_null_count;

    IF remaining_null_count > 0 THEN
        RAISE WARNING '仍有 % 筆訂單沒有 journey_id，可能是孤兒資料（course 已不存在）', remaining_null_count;
    END IF;
END $$;

-- ============================================================
-- Part 3: Backfill user_journeys（遷移 user_courses → user_journeys）
-- ============================================================

-- 插入舊購買記錄到 user_journeys
INSERT INTO user_journeys (id, user_id, journey_id, purchased_at, created_at, updated_at)
SELECT
    gen_random_uuid(),
    uc.user_id,
    m.journey_id,
    uc.created_at AS purchased_at,  -- 保留原購買時間
    uc.created_at,
    uc.updated_at
FROM user_courses uc
JOIN journey_course_mapping m ON m.course_id = uc.course_id
WHERE NOT EXISTS (
    SELECT 1
    FROM user_journeys uj
    WHERE uj.user_id = uc.user_id
      AND uj.journey_id = m.journey_id
);

-- 報告 backfill 結果
DO $$
DECLARE
    total_user_courses INTEGER;
    total_user_journeys INTEGER;
    migrated_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_user_courses FROM user_courses;
    SELECT COUNT(*) INTO total_user_journeys FROM user_journeys;

    -- 計算遷移筆數（user_journeys - 之前的新購買記錄）
    -- 假設 R4 開始後的新購買已經有 user_journeys 記錄

    RAISE NOTICE '[user_journeys] Backfill 完成：user_courses 共 % 筆，user_journeys 共 % 筆',
        total_user_courses, total_user_journeys;

    -- 檢查是否有 user_courses 沒有對應的 user_journeys
    SELECT COUNT(*) INTO migrated_count
    FROM user_courses uc
    JOIN journey_course_mapping m ON m.course_id = uc.course_id
    WHERE NOT EXISTS (
        SELECT 1
        FROM user_journeys uj
        WHERE uj.user_id = uc.user_id
          AND uj.journey_id = m.journey_id
    );

    IF migrated_count > 0 THEN
        RAISE WARNING '仍有 % 筆 user_courses 沒有對應的 user_journeys（可能是孤兒資料）', migrated_count;
    ELSE
        RAISE NOTICE '所有 user_courses 都已成功遷移到 user_journeys';
    END IF;
END $$;

-- ============================================================
-- Part 4: 驗證資料一致性
-- ============================================================

-- 驗證 1：檢查是否有訂單沒有 journey_id
DO $$
DECLARE
    null_journey_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO null_journey_count
    FROM orders
    WHERE journey_id IS NULL;

    IF null_journey_count > 0 THEN
        RAISE WARNING '仍有 % 筆訂單的 journey_id 為 NULL', null_journey_count;
    ELSE
        RAISE NOTICE '所有訂單都已補齊 journey_id';
    END IF;
END $$;

-- 驗證 2：檢查 user_courses 和 user_journeys 數量是否接近
DO $$
DECLARE
    user_courses_count INTEGER;
    user_journeys_count INTEGER;
    diff INTEGER;
BEGIN
    SELECT COUNT(*) INTO user_courses_count FROM user_courses;
    SELECT COUNT(*) INTO user_journeys_count FROM user_journeys;
    diff := ABS(user_journeys_count - user_courses_count);

    RAISE NOTICE '資料量比對：user_courses = %, user_journeys = %, 差異 = %',
        user_courses_count, user_journeys_count, diff;

    -- 允許小幅差異（R4 後新購買可能還沒有對應的 user_courses）
    IF diff > 10 THEN
        RAISE WARNING '資料量差異較大（> 10 筆），建議檢查是否有遷移失敗的記錄';
    END IF;
END $$;

-- ============================================================
-- Part 5: 清理臨時表
-- ============================================================

DROP TABLE journey_course_mapping;

-- ============================================================
-- Backfill 完成！
-- ============================================================

COMMENT ON COLUMN orders.journey_id IS 'R5 Backfill: 所有訂單都應有對應的 journey_id';
COMMENT ON TABLE user_journeys IS 'R5 Backfill: 已包含所有歷史購買記錄（從 user_courses 遷移）';
