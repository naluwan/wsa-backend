-- ============================================================
-- V25: 新增 journeys 表的價格相關欄位
--
-- 新增欄位：
-- - original_price_twd: 原價（新台幣）
-- - monthly_payment: 最低分期金額（24期）
-- ============================================================

-- 新增原價欄位
ALTER TABLE journeys
ADD COLUMN IF NOT EXISTS original_price_twd INTEGER DEFAULT 0;

-- 新增分期金額欄位
ALTER TABLE journeys
ADD COLUMN IF NOT EXISTS monthly_payment INTEGER DEFAULT 0;

-- 更新軟體設計模式精通之旅的價格
-- 原價：38,900 / 現價：35,899 / 分期：1,720
UPDATE journeys
SET
    price_twd = 35899,
    original_price_twd = 38900,
    monthly_payment = 1720
WHERE slug = 'software-design-pattern';

-- 更新 AI x BDD 課程的價格
-- 原價：15,999 / 現價：7,799 / 分期：374
UPDATE journeys
SET
    price_twd = 7799,
    original_price_twd = 15999,
    monthly_payment = 374
WHERE slug = 'ai-x-bdd';

-- ============================================================
-- 驗證
-- ============================================================
DO $$
DECLARE
    sdp_record RECORD;
    bdd_record RECORD;
BEGIN
    SELECT price_twd, original_price_twd, monthly_payment INTO sdp_record
    FROM journeys WHERE slug = 'software-design-pattern';

    SELECT price_twd, original_price_twd, monthly_payment INTO bdd_record
    FROM journeys WHERE slug = 'ai-x-bdd';

    RAISE NOTICE '=== V25: journeys 價格欄位更新完成 ===';
    RAISE NOTICE '軟體設計模式: 現價=%, 原價=%, 分期=%', sdp_record.price_twd, sdp_record.original_price_twd, sdp_record.monthly_payment;
    RAISE NOTICE 'AI x BDD: 現價=%, 原價=%, 分期=%', bdd_record.price_twd, bdd_record.original_price_twd, bdd_record.monthly_payment;
END $$;
