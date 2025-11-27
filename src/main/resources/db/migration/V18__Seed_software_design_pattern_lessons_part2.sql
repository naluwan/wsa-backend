-- ============================================================
-- V18: 軟體設計模式精通之旅 - Lessons Part 2 (Chapter 4-8)
-- ============================================================

-- ============================================================
-- Chapter 4: 副本四：規模化架構思維 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4001, c.id, j.id, '景點 - 門面模式｜隱藏結構', '各位冒險者好，很開心我們終於來到了新的副本', 'video', TRUE, '23:28', 0, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4002, c.id, j.id, '複習 - 門面模式', '複習 - 門面模式', 'google-form', TRUE, NULL, 1, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4022, c.id, j.id, '大補帖 - 軟體架構學：大道至簡', '架構 - 終於要教怎麼「劃分邊界」了', 'video', TRUE, '31:25', 2, 350, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4005, c.id, j.id, '景點 - 轉接器模式｜跨越邊界', '大家好！接下來的這個模式，相對來說比較輕鬆愜意', 'video', TRUE, '26:54', 3, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 6, c.id, j.id, '複習 - 轉接器模式', '複習 - 轉接器模式', 'google-form', TRUE, NULL, 4, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4009, c.id, j.id, '景點 - 代理人模式｜控制存取', '大家好。 今天我們又要再認識一個十分常用的結構型模式', 'video', TRUE, '25:24', 5, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4010, c.id, j.id, '複習 - 代理人模式', '複習 - 代理人模式', 'google-form', TRUE, NULL, 6, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4013, c.id, j.id, '景點 - 複合模式｜樹狀結構的透明度', '在結構型副本中，我們已經認識了門面模式、轉接器模式和代理人模式', 'video', FALSE, '34:22', 7, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4014, c.id, j.id, '複習：複合模式', '複習：複合模式', 'google-form', TRUE, NULL, 8, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4018, c.id, j.id, '景點：裝飾者模式｜解決組合爆炸', '我們總算來到結構型模式副本中的最後一個景點啦！', 'video', TRUE, '32:33', 9, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4019, c.id, j.id, '複習：裝飾者模式', '複習：裝飾者模式', 'google-form', TRUE, NULL, 10, 180, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 5: 副本五：生命週期及控制反轉 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 5001, c.id, j.id, '景點：單體模式｜資源約束', '我們來到創建型模式副本中的第一個景點——單體模式', 'video', TRUE, '23:59', 0, 200, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 5002, c.id, j.id, '複習：單體模式', '複習：單體模式', 'google-form', TRUE, NULL, 1, 200, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 5004, c.id, j.id, '景點：工廠方法｜生命週期約束', '大家好，我是水球潘。歡迎各位來到創建型模式副本中的第二個模式', 'video', TRUE, '31:41', 2, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 5005, c.id, j.id, '景點：抽象工廠｜從行為型模式一路到套創建型模式', '大家好，我是水球潘。歡迎各位來到創建型模式副本中的最後一個模式', 'video', TRUE, '56:19', 3, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 6: 副本六：自幹高度擴充性的 Web Framework - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 6001, c.id, j.id, '6.B 魔王題：★★★★ 自幹一個 Web Framework', '各位冒險者好，我們終於來到了本課程的「終極副本」', 'video', TRUE, NULL, 0, 8000, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 6 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 7: 副本七：領航員特訓 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 7001, c.id, j.id, '【批改示範】副本二魔王題 Big 2', '各位冒險者們好，這邊有一項很重要的請求', 'video', TRUE, '00:00', 0, 250, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 7 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 8: 課程介紹＆試聽 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8001, c.id, j.id, '課程介紹：這門課手把手帶你成為架構設計的高手', '思維升級：Christopher Alexander 模式六大要素及模式語言', 'video', FALSE, '04:16', 0, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 8 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8002, c.id, j.id, '你該知道：在 AI 的時代下，只會下 prompt 絕對寫不出好 Code', '思維升級', 'video', FALSE, '02:15', 1, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 8 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8003, c.id, j.id, '課程試聽：架構師該學的 C.A. 模式六大要素及模式思維', '思維升級：Christopher Alexander 模式六大要素及模式語言', 'video', FALSE, '31:01', 2, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 8 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8004, c.id, j.id, '入學之後：憑什麼這門課能保證你的學習成效？', '思維升級', 'video', FALSE, '14:47', 3, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 8 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8005, c.id, j.id, 'Code Review 服務：你不夠強，我不會讓你畢業', '思維升級', 'video', FALSE, '03:16', 4, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 8 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8006, c.id, j.id, '學員訪談：他是如何靠這門課，成功錄取 Nvidia 軟體實戰職位的？', '思維升級', 'video', FALSE, '06:10', 5, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 8 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- 驗證
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V18: 軟體設計模式精通之旅 - Lessons Part 2 完成 ===';
    RAISE NOTICE '- Chapter 4 Lessons: 11 個';
    RAISE NOTICE '- Chapter 5 Lessons: 4 個';
    RAISE NOTICE '- Chapter 6 Lessons: 1 個';
    RAISE NOTICE '- Chapter 7 Lessons: 1 個';
    RAISE NOTICE '- Chapter 8 Lessons: 6 個';
END $$;
