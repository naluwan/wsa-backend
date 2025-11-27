-- ============================================================
-- V26: 修正 AI x BDD 課程的價格資料
--
-- V25 中 slug 寫錯了（ai-x-bdd），實際上應該是 ai-bdd
-- ============================================================

-- 更新 AI x BDD 課程的價格
-- 原價：15,999 / 現價：7,799 / 分期：374
UPDATE journeys
SET
    price_twd = 7799,
    original_price_twd = 15999,
    monthly_payment = 374
WHERE slug = 'ai-bdd';

-- ============================================================
-- 驗證
-- ============================================================
DO $$
DECLARE
    bdd_record RECORD;
BEGIN
    SELECT price_twd, original_price_twd, monthly_payment INTO bdd_record
    FROM journeys WHERE slug = 'ai-bdd';

    RAISE NOTICE '=== V26: AI x BDD 價格修正完成 ===';
    RAISE NOTICE 'AI x BDD: 現價=%, 原價=%, 分期=%', bdd_record.price_twd, bdd_record.original_price_twd, bdd_record.monthly_payment;
END $$;
