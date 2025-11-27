-- ============================================================
-- V23: 為影片類型的 Lesson 設定 video_url
--
-- 軟體設計模式精通之旅 (software-design-pattern):
--   - https://www.youtube.com/watch?v=3GxftuDUBXM
--   - https://www.youtube.com/watch?v=UslcIlL-1xo
--
-- AI x BDD (ai-bdd):
--   - https://www.youtube.com/watch?v=W09vydJH6jo&t=1s
--   - https://www.youtube.com/watch?v=mOJzH0U_3EU
--
-- 使用 random() 函數隨機分配 URL
-- ============================================================

-- 軟體設計模式精通之旅：隨機分配兩個 URL
UPDATE lessons
SET video_url = CASE
    WHEN random() < 0.5 THEN 'https://www.youtube.com/watch?v=3GxftuDUBXM'
    ELSE 'https://www.youtube.com/watch?v=UslcIlL-1xo'
END
WHERE type = 'video'
  AND journey_id = (SELECT id FROM journeys WHERE slug = 'software-design-pattern');

-- AI x BDD：隨機分配兩個 URL
UPDATE lessons
SET video_url = CASE
    WHEN random() < 0.5 THEN 'https://www.youtube.com/watch?v=W09vydJH6jo&t=1s'
    ELSE 'https://www.youtube.com/watch?v=mOJzH0U_3EU'
END
WHERE type = 'video'
  AND journey_id = (SELECT id FROM journeys WHERE slug = 'ai-bdd');

-- 驗證結果
DO $$
DECLARE
    sdp_count INTEGER;
    bdd_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO sdp_count
    FROM lessons l
    JOIN journeys j ON l.journey_id = j.id
    WHERE l.type = 'video' AND j.slug = 'software-design-pattern' AND l.video_url IS NOT NULL;

    SELECT COUNT(*) INTO bdd_count
    FROM lessons l
    JOIN journeys j ON l.journey_id = j.id
    WHERE l.type = 'video' AND j.slug = 'ai-bdd' AND l.video_url IS NOT NULL;

    RAISE NOTICE '=== V23: 影片 URL 設定完成 ===';
    RAISE NOTICE '軟體設計模式精通之旅: % 個影片已設定 URL', sdp_count;
    RAISE NOTICE 'AI x BDD: % 個影片已設定 URL', bdd_count;
END $$;
