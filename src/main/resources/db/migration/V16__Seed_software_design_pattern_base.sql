-- ============================================================
-- V16: 軟體設計模式精通之旅 - 基礎架構種子資料
--
-- 包含：Skills, Journey, Journey-Skills, Chapters
-- 後續 V17 會包含：Lessons, Gyms, Challenges, Missions
-- ============================================================

-- ============================================================
-- 1. Skills (技能標籤) - 使用 external_id 101-106 避免與 AI x BDD 衝突
-- ============================================================

INSERT INTO skills (external_id, name)
VALUES (101, '物件導向分析：
需求結構化分析')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO skills (external_id, name)
VALUES (102, '物件導向分析：
區分結構與行為')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO skills (external_id, name)
VALUES (103, '物件導向設計：
抽象/萃取能力')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO skills (external_id, name)
VALUES (104, '物件導向設計：
建立 Well-Defined Context')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO skills (external_id, name)
VALUES (105, '物件導向設計：
熟悉設計模式的 Form')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO skills (external_id, name)
VALUES (106, '物件導向程式設計：
游刃有餘的開發能力')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

-- ============================================================
-- 2. Journey (課程)
-- ============================================================

INSERT INTO journeys (external_id, name, slug)
VALUES (0, '軟體設計模式精通之旅', 'software-design-pattern')
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    slug = EXCLUDED.slug;

-- ============================================================
-- 3. Journey-Skills 關聯
-- ============================================================

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s
WHERE j.external_id = 0 AND s.external_id = 101
ON CONFLICT DO NOTHING;

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s
WHERE j.external_id = 0 AND s.external_id = 102
ON CONFLICT DO NOTHING;

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s
WHERE j.external_id = 0 AND s.external_id = 103
ON CONFLICT DO NOTHING;

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s
WHERE j.external_id = 0 AND s.external_id = 104
ON CONFLICT DO NOTHING;

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s
WHERE j.external_id = 0 AND s.external_id = 105
ON CONFLICT DO NOTHING;

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s
WHERE j.external_id = 0 AND s.external_id = 106
ON CONFLICT DO NOTHING;

-- ============================================================
-- 4. Chapters (章節) - 9 個章節
-- ============================================================

-- Chapter 0: 副本零：冒險者指引
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 0, j.id, '副本零：冒險者指引', 0, FALSE, 0, 0, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 1: 副本一：行雲流水的設計底層思路
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 1, j.id, '副本一：行雲流水的設計底層思路', 1, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 2: 副本二：Christopher Alexander 設計模式
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 2, j.id, '副本二：Christopher Alexander 設計模式', 2, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 3: 副本三：掌握所有複雜行為變動
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 3, j.id, '副本三：掌握所有複雜行為變動', 3, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 4: 副本四：規模化架構思維
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4, j.id, '副本四：規模化架構思維', 4, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 5: 副本五：生命週期及控制反轉
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 5, j.id, '副本五：生命週期及控制反轉', 5, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 6: 副本六：自幹高度擴充性的 Web Framework
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 6, j.id, '副本六：自幹高度擴充性的 Web Framework', 6, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 7: 副本七：領航員特訓
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 7, j.id, '副本七：領航員特訓', 7, TRUE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 8: 課程介紹＆試聽
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 8, j.id, '課程介紹＆試聽', 8, FALSE, 0, 0, 0, ''
FROM journeys j WHERE j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    name = EXCLUDED.name,
    order_index = EXCLUDED.order_index,
    password_required = EXCLUDED.password_required,
    reward_exp = EXCLUDED.reward_exp,
    reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- 驗證
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V16: 軟體設計模式精通之旅 - 基礎架構種子資料完成 ===';
    RAISE NOTICE '- Skills: 6 個 (external_id 101-106)';
    RAISE NOTICE '- Journey: 1 個 (external_id 0)';
    RAISE NOTICE '- Journey-Skills: 6 個關聯';
    RAISE NOTICE '- Chapters: 9 個 (external_id 0-8)';
END $$;
