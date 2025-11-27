-- ============================================================
-- V22: 更新 journeys 表的顯示資料欄位
--
-- 為已存在的 journey 記錄填入顯示所需的資訊
-- ============================================================

-- 更新軟體設計模式精通之旅
UPDATE journeys
SET
    description = '這是一門設計模式課程，將帶你從零開始學習軟體設計的核心觀念。透過實戰練習，你將學會如何運用設計模式解決真實世界的問題。',
    teacher_name = '水球潘',
    price_twd = 16800,
    thumbnail_url = 'images/course_0.png',
    level_tag = '中級',
    cover_icon = 'design-pattern'
WHERE slug = 'software-design-pattern';

-- 更新 AI x BDD 課程
UPDATE journeys
SET
    description = '學習如何使用 AI 輔助 BDD（行為驅動開發），透過規格驅動的方式實現全自動化開發流程。',
    teacher_name = '水球潘',
    price_twd = 9800,
    thumbnail_url = 'images/course_1.png',
    level_tag = '進階',
    cover_icon = 'ai-bdd'
WHERE slug = 'ai-x-bdd';

-- ============================================================
-- 驗證
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V22: journeys 顯示資料更新完成 ===';
    RAISE NOTICE '已更新：software-design-pattern, ai-x-bdd';
END $$;
