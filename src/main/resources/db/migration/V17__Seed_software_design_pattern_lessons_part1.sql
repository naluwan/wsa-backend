-- ============================================================
-- V17: 軟體設計模式精通之旅 - Lessons Part 1 (Chapter 0-3)
-- ============================================================

-- ============================================================
-- Chapter 0: 副本零：冒險者指引 - Lessons
-- ============================================================

-- Lesson 7: 平台使用手冊
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 7, c.id, j.id, '平台使用手冊', '平台使用手冊', 'scroll', TRUE, NULL, 0, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 0 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Lesson 3: 如何使用課程贊助給大家的專業 UML Editor — Astah Pro？
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3, c.id, j.id, '如何使用課程贊助給大家的專業 UML Editor — Astah Pro？', '使用 Astah Professional', 'scroll', TRUE, NULL, 1, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 0 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Lesson 8: SOP 寶典
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8, c.id, j.id, 'SOP 寶典', '水球軟體學院，只教能扎實落地的思路和 SOP。', 'scroll', TRUE, NULL, 2, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 0 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 1: 副本一：行雲流水的設計底層思路 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 12, c.id, j.id, '設計的關鍵是：把無形變有形', '設計的關鍵是：把無形變有形', 'video', TRUE, '13:21', 0, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 13, c.id, j.id, 'UML 不是拿來寫文件用的', 'UML 不是拿來寫文件用的', 'video', TRUE, '07:07', 1, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 14, c.id, j.id, '行雲流水的 OOA | OOD | OOP', '行雲流水的 OOA | OOD | OOP', 'video', TRUE, '16:52', 2, 200, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 15, c.id, j.id, '上這門課一定要有「空杯心態」', '上這門課一定要有「空杯心態」', 'video', TRUE, '05:32', 3, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 35, c.id, j.id, 'OOA / OOD / OOP 概念複習題', 'OOA / OOD / OOP 概念複習題', 'google-form', TRUE, NULL, 4, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 16, c.id, j.id, '軟體抽象之一：點的萃取', '軟體抽象之一：點的萃取', 'video', TRUE, '19:54', 5, 200, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 17, c.id, j.id, '練武 - 點的萃取', '練武 - 點的萃取', 'video', TRUE, '14:27', 6, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 18, c.id, j.id, '軟體抽象之二：萃取行為及操作', '軟體抽象之二：萃取行為及操作', 'video', TRUE, '24:42', 7, 250, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 19, c.id, j.id, '軟體抽象之三：線的萃取', '軟體抽象之三：線的萃取', 'video', TRUE, '32:47', 8, 350, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 20, c.id, j.id, '兩種更強的關聯：聚合＆複合', '兩種更強的關聯：聚合＆複合', 'video', TRUE, '13:45', 9, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 21, c.id, j.id, '線上的點：關聯類別', '線上的點：關聯類別', 'video', TRUE, '10:55', 10, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 22, c.id, j.id, '軟體抽象之四：區分結構、行為和侷限', '軟體抽象之四：區分結構、行為和侷限', 'video', TRUE, '20:42', 11, 250, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 36, c.id, j.id, 'Astah：類別圖教學', 'Astah：類別圖教學', 'video', TRUE, '25:07', 12, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 23, c.id, j.id, '練武 - 單句分析 （初級）', '練武 - 單句分析 （初級）', 'video', TRUE, '40:57', 13, 450, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 31, c.id, j.id, '練武 - 單句分析 （進階）', '練武 - 單句分析 （進階）', 'video', TRUE, '39:32', 14, 400, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 24, c.id, j.id, 'OOD 階段一：用行為模型來梳理實作', 'OOD 階段一：用行為模型來梳理實作', 'video', TRUE, '22:25', 15, 250, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 37, c.id, j.id, '用 Astah 循序圖來讓「象棋」領域模型動起來', '用 Astah 循序圖來讓「象棋」領域模型動起來', 'video', TRUE, '16:16', 16, 200, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 26, c.id, j.id, 'OOP 技法一：依賴', 'OOP 技法一：依賴', 'video', TRUE, '12:33', 17, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 27, c.id, j.id, 'OOP 技法二：關聯', 'OOP 技法二：關聯', 'video', TRUE, '32:29', 18, 350, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 28, c.id, j.id, 'OOP 技法三：關聯類別', 'OOP 技法三：關聯類別', 'video', TRUE, '20:34', 19, 250, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 29, c.id, j.id, 'OOP 技法四：抽象類別', 'OOP 技法四：抽象類別', 'video', TRUE, '13:39', 20, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 38, c.id, j.id, 'OOP 按圖施工（懶人包）', 'OOP 按圖施工（懶人包）', 'scroll', TRUE, NULL, 21, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 25, c.id, j.id, 'OOD 階段二：封裝｜解耦｜萃取', 'OOD 階段二：封裝｜解耦｜萃取', 'video', TRUE, '27:09', 22, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 2: 副本二：Christopher Alexander 設計模式 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 30, c.id, j.id, '前導片：失傳的設計模式', '破除迷思：為什麼四人幫設計模式反而給你添了了更多麻煩？', 'video', TRUE, '14:19', 0, 150, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- 注意：Chapter 2 的 lesson id=31 已被 Chapter 1 使用，這裡用新的 external_id
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2031, c.id, j.id, '架構師該學的 C.A. 模式六大要素及模式思維', '思維升級：Christopher Alexander 模式六大要素及模式語言', 'video', TRUE, '31:01', 1, 350, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2, c.id, j.id, '軟體設計模式觀念複習', '歡迎各位來到了要打通各位韌度二脈的副本——軟體設計模式。', 'google-form', TRUE, NULL, 2, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- 注意：id=3 已用於 Chapter 0，這裡使用新 external_id
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2003, c.id, j.id, '你必須了解何謂「萃取」 (Abstract)｜抽象類別 vs. 介面', '我們曾在 OOA 中提過抽象類別 (Abstract Class) 的概念', 'scroll', TRUE, NULL, 3, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4, c.id, j.id, '景點 - 策略模式｜基礎水平行為擴充', '各位冒險者，準備好要學習第一個設計模式了嗎？', 'video', TRUE, '18:16', 4, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 5, c.id, j.id, '複習 - 策略模式', '歡迎進入到策略模式的挑戰題！', 'google-form', TRUE, NULL, 5, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- 注意：id=8 已用於 Chapter 0，這裡使用新 external_id
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2008, c.id, j.id, '景點 - 樣板方法｜留同存異的萃取能力', '樣板方法模式是一種行為型設計模式', 'video', TRUE, '19:06', 6, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2029, c.id, j.id, '用樣板方法來實現「控制反轉」', '萃取樣板，就是最小的控制反轉', 'video', TRUE, '22:02', 7, 250, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 9, c.id, j.id, '複習 - 樣板方法', '樣板方法——寫一個牌類遊戲框架吧！', 'google-form', TRUE, NULL, 8, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 10, c.id, j.id, '樣板思維暖身帖', '在這一份樣板方法特訓帖中', 'scroll', TRUE, NULL, 9, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2013, c.id, j.id, '景點 - 責任鏈模式｜解析後水平行為擴充', '責任鏈上的每個物件，就像公司中那些本位主義的員工', 'video', FALSE, '26:51', 10, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2014, c.id, j.id, '複習 - 責任鏈模式', '責任鏈模式—— 讓功能由少變多的模式啊！', 'google-form', TRUE, NULL, 11, 100, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2019, c.id, j.id, '開閉原則 (Open-Closed Principle)', '第一個該學的SOLID原則：開閉原則', 'scroll', TRUE, NULL, 12, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2027, c.id, j.id, '精準區分策略＆責任鏈 Forces', '策略 vs. 責任鏈 Forces', 'video', TRUE, '26:20', 13, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2028, c.id, j.id, '練武 - 精準區分策略＆責任鏈 Forces', '練武 - 三種基礎行為 Forces', 'video', TRUE, '43:19', 14, 450, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2023, c.id, j.id, '補帖 - 無招勝有招：依賴反轉之重構三步驟', '練武 - 依賴反轉之重構三步驟', 'video', TRUE, '25:28', 15, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- Chapter 3: 副本三：掌握所有複雜行為變動 - Lessons
-- ============================================================

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 1, c.id, j.id, '景點 - 觀察者模式｜響應式行為變化', '總算進到了「進階型模式」這個副本了！', 'video', TRUE, '21:50', 0, 120, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- 注意：原 JSON 中 id=2 已在 Chapter 2 使用，這裡用新 external_id
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3002, c.id, j.id, '複習 - 觀察者模式', '複習 - 觀察者模式', 'google-form', TRUE, NULL, 1, 120, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3019, c.id, j.id, 'Force-行為變動性（響應式）：關鍵句型', '在行為型設計模式中，觀察者模式', 'scroll', TRUE, NULL, 2, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3007, c.id, j.id, '景點 - 指令模式｜解耦操作及能力', '這個模式旨在找出所有行為最抽象的共同點', 'video', TRUE, '22:23', 3, 120, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3008, c.id, j.id, '複習 - 指令模式', '複習 - 指令模式', 'google-form', TRUE, NULL, 4, 120, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3020, c.id, j.id, 'Force-行為賦予：關鍵句型', '在行為型設計模式中，如果要套用指令模式', 'scroll', TRUE, NULL, 5, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 11, c.id, j.id, '景點 - 狀態模式｜梳理複雜行為變化', '狀態模式——寶藏地圖', 'video', TRUE, '52:30', 6, 300, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3012, c.id, j.id, '複習 - 狀態模式', '複習 - 狀態模式', 'google-form', TRUE, NULL, 7, 120, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3021, c.id, j.id, 'Force-行為變動性（狀態型）：關鍵句型', '在行為型設計模式中，在套用狀態模式', 'scroll', TRUE, NULL, 8, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
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
    RAISE NOTICE '=== V17: 軟體設計模式精通之旅 - Lessons Part 1 完成 ===';
    RAISE NOTICE '- Chapter 0 Lessons: 3 個';
    RAISE NOTICE '- Chapter 1 Lessons: 23 個';
    RAISE NOTICE '- Chapter 2 Lessons: 16 個';
    RAISE NOTICE '- Chapter 3 Lessons: 9 個';
END $$;
