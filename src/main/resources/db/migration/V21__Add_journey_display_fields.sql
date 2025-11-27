-- ============================================================
-- V21: 擴展 journeys 表，添加課程列表顯示所需欄位
--
-- 新增欄位：
-- - description: 課程描述
-- - teacher_name: 講師名稱
-- - price_twd: 價格（新台幣）
-- - thumbnail_url: 縮圖 URL
-- - level_tag: 難度標籤
-- - cover_icon: 封面圖示
-- ============================================================

-- 添加新欄位
ALTER TABLE journeys ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE journeys ADD COLUMN IF NOT EXISTS teacher_name VARCHAR(100);
ALTER TABLE journeys ADD COLUMN IF NOT EXISTS price_twd INTEGER NOT NULL DEFAULT 0;
ALTER TABLE journeys ADD COLUMN IF NOT EXISTS thumbnail_url VARCHAR(500);
ALTER TABLE journeys ADD COLUMN IF NOT EXISTS level_tag VARCHAR(50);
ALTER TABLE journeys ADD COLUMN IF NOT EXISTS cover_icon VARCHAR(100);

-- ============================================================
-- 驗證
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V21: journeys 表擴展欄位完成 ===';
    RAISE NOTICE '新增欄位：description, teacher_name, price_twd, thumbnail_url, level_tag, cover_icon';
END $$;
