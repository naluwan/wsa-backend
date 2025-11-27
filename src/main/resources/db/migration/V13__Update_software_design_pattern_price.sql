-- ============================================================
-- V13: 更新「軟體設計精通模式之旅」課程價格
--
-- 說明：將 SOFTWARE_DESIGN_PATTERN 課程價格從 7599 調整為 38999
-- ============================================================

UPDATE courses
SET price_twd = 38999
WHERE code = 'SOFTWARE_DESIGN_PATTERN';

-- 驗證更新結果
DO $$
DECLARE
  updated_price INTEGER;
BEGIN
  SELECT price_twd INTO updated_price
  FROM courses
  WHERE code = 'SOFTWARE_DESIGN_PATTERN';

  IF updated_price = 38999 THEN
    RAISE NOTICE '✓ 價格更新成功: SOFTWARE_DESIGN_PATTERN -> 38999 TWD';
  ELSE
    RAISE EXCEPTION '✗ 價格更新失敗: 預期 38999, 實際 %', updated_price;
  END IF;
END $$;
