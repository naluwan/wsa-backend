-- ============================================================
-- V19: 軟體設計模式精通之旅 - Gyms & Challenges
-- ============================================================

-- ============================================================
-- Chapter 1: 副本一 - Gyms
-- ============================================================

-- Gym 10: 行雲流水的設計底層思路
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 10, c.id, j.id, '1', '行雲流水的設計底層思路',
    '軟體設計的關鍵，永遠都不在「你學過多少學問」，而是在於「你在接收到複雜的需求時」，你到底能不能立刻就知道下一步要幹什麼？',
    'CHALLENGE', 1, 0, 500, 0, 0, '',
    '["1_12","1_13","1_14","1_15","1_35","1_16","1_17","1_18","1_19","1_20","1_21","1_22","1_36","1_23","1_31","1_24","1_37","1_25","1_26","1_27","1_28","1_29","1_38"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 1 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 10
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 101, g.id, 'PRACTICAL_CHALLENGE', 'Showdown ! 撲克牌遊戲建模 ★', 14, 14
FROM gyms g WHERE g.external_id = 10
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 102, g.id, 'INSTANT_CHALLENGE', 'Uno Card ✭', 3, 3
FROM gyms g WHERE g.external_id = 10
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 103, g.id, 'INSTANT_CHALLENGE', '處方診斷系統 ✭', 3, 3
FROM gyms g WHERE g.external_id = 10
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 104, g.id, 'INSTANT_CHALLENGE', '資訊兵主控制器 ✭', 3, 3
FROM gyms g WHERE g.external_id = 10
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- Chapter 2: 副本二 - Gyms
-- ============================================================

-- Gym 6: Christopher Alexander：設計模式
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 6, c.id, j.id, '2', 'Christopher Alexander：設計模式',
    '在學完 OOAD 之後，你已經掌握了設計的關鍵「有形的思考」，那麼接下來呢？',
    'CHALLENGE', 1, 0, 300, 0, 0, '',
    '["2_30","2_31","2_2","2_3","2_4","2_23","2_5"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 6
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 201, g.id, 'PRACTICAL_CHALLENGE', '實作交友配對系統 ★', 7, 14
FROM gyms g WHERE g.external_id = 6
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 202, g.id, 'INSTANT_CHALLENGE', 'RPG ✭', 3, 3
FROM gyms g WHERE g.external_id = 6
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 203, g.id, 'INSTANT_CHALLENGE', '導航系統 ✭', 3, 3
FROM gyms g WHERE g.external_id = 6
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 11: 掌握「樣板方法」：最基礎的控制反轉
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 11, c.id, j.id, '3', '掌握「樣板方法」：最基礎的控制反轉',
    '走到了這裡，就代表你已經學會了「Christopher Alexander 設計模式」以及第一則最最最基礎的「策略模式」了，對吧？',
    'CHALLENGE', 2, 1, 500, 0, 0, '',
    '["2_8","2_29","2_24","2_9","2_10"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 11
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 211, g.id, 'PRACTICAL_CHALLENGE', '寫一個牌類遊戲框架！ ★★', 7, 14
FROM gyms g WHERE g.external_id = 11
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 15: 責任鏈模式練習：碰撞偵測＆處理
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 15, c.id, j.id, '4.A', '責任鏈模式練習：碰撞偵測＆處理',
    '很好，你現在不只會處理最基礎的行為變化（套用策略模式），還懂得用在多道行為之間「留同存異」來萃取出樣板。',
    'CHALLENGE', 1, 2, 300, 0, 0, '',
    '["2_13","2_14","2_19"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 15
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 251, g.id, 'PRACTICAL_CHALLENGE', '碰撞偵測＆處理 ★', 7, 14
FROM gyms g WHERE g.external_id = 15
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 252, g.id, 'INSTANT_CHALLENGE', '碰撞偵測＆處理 ★', 7, 3
FROM gyms g WHERE g.external_id = 15
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 17: 複雜行為實戰演練：Big 2
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 17, c.id, j.id, '4', '複雜行為實戰演練：Big 2',
    '各位強者們好！我們現在已經學會了三個設計模式了',
    'BOSS', 2, 3, 1000, 0, 0, '',
    '["2_27","2_28","2_23"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 2 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 17
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 271, g.id, 'PRACTICAL_CHALLENGE', '大老二撲克牌遊戲！ ★★', 7, 14
FROM gyms g WHERE g.external_id = 17
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- Chapter 3: 副本三 - Gyms
-- ============================================================

-- Gym 5: 掌握響應式行為約束
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 5, c.id, j.id, '5.A', '掌握響應式行為約束',
    '觀察者模式——Youtube 訂閱機制',
    'CHALLENGE', 1, 0, 300, 0, 0, '',
    '["3_1","3_16","3_2","3_19"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 5
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 301, g.id, 'PRACTICAL_CHALLENGE', 'Youtube 訂閱機制 ★', 7, 14
FROM gyms g WHERE g.external_id = 5
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 302, g.id, 'INSTANT_CHALLENGE', 'Youtube 訂閱機制 ★', 7, 3
FROM gyms g WHERE g.external_id = 5
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 9: 透過「指令」來綁定行為
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 9, c.id, j.id, '5.B', '透過「指令」來綁定行為',
    '主控制器 (MainController) 需要實作一套快捷鍵設置機制',
    'CHALLENGE', 1, 1, 300, 0, 0, '',
    '["3_7","3_8","3_20"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 9
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 311, g.id, 'PRACTICAL_CHALLENGE', '快捷鍵設置機制 ★', 7, 14
FROM gyms g WHERE g.external_id = 9
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 312, g.id, 'INSTANT_CHALLENGE', '快捷鍵設置機制 ★', 7, 3
FROM gyms g WHERE g.external_id = 9
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 13: 用「狀態機」來精準套用「狀態模式」
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 13, c.id, j.id, '5.C', '用「狀態機」來精準套用「狀態模式」',
    '狀態模式——二維地圖冒險遊戲',
    'CHALLENGE', 2, 2, 600, 0, 0, '',
    '["3_11","3_17","3_12","3_21"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 13
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 321, g.id, 'PRACTICAL_CHALLENGE', '二維地圖冒險遊戲 ★★', 7, 14
FROM gyms g WHERE g.external_id = 13
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 3_15: 多重設計難題解決實戰演練：RPG
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 315, c.id, j.id, '5', '多重設計難題解決實戰演練：RPG',
    '如果你通過了上一個道館，說明你可能已經熟悉，如何透過「Force 關鍵句型」來定位和分類 Forces',
    'BOSS', 3, 3, 2000, 0, 0, '',
    '["3_18"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 3 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 315
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 331, g.id, 'PRACTICAL_CHALLENGE', '真・RPG 之對戰遊戲 ★★★', 7, 21
FROM gyms g WHERE g.external_id = 315
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- Chapter 4: 副本四 - Gyms
-- ============================================================

-- Gym 3: 基礎架構思維、模式及邊界劃分
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 403, c.id, j.id, '6', '基礎架構思維、模式及邊界劃分',
    '恭喜你來到了旅程的黑段部分！',
    'CHALLENGE', 2, 0, 500, 0, 0, '',
    '["4_1","4_22","4_2"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 403
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 401, g.id, 'PRACTICAL_CHALLENGE', '處方診斷系統 ★★', 7, 14
FROM gyms g WHERE g.external_id = 403
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 402, g.id, 'INSTANT_CHALLENGE', '處方診斷系統 ★★', 7, 3
FROM gyms g WHERE g.external_id = 403
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 7: 跨越邊界 - 依賴反轉及轉接器
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 407, c.id, j.id, '6.A', '跨越邊界 - 依賴反轉及轉接器',
    '轉接器模式——好友關係分析器',
    'CHALLENGE', 1, 1, 300, 0, 0, '',
    '["4_5","4_23","4_25","4_6"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 407
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 411, g.id, 'PRACTICAL_CHALLENGE', '好友關係分析器 ★', 7, 14
FROM gyms g WHERE g.external_id = 407
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 412, g.id, 'INSTANT_CHALLENGE', '好友關係分析器 ★', 7, 3
FROM gyms g WHERE g.external_id = 407
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 11: 透過「代理模式」來介入存取控制
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 411, c.id, j.id, '6.B', '透過「代理模式」來介入存取控制',
    '代理人模式——【延遲載入】員工資料表存取',
    'CHALLENGE', 1, 2, 300, 0, 0, '',
    '["4_9","4_10"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 411
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 421, g.id, 'PRACTICAL_CHALLENGE', '【延遲載入】員工資料表存取 ★', 7, 14
FROM gyms g WHERE g.external_id = 411
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 422, g.id, 'INSTANT_CHALLENGE', '【延遲載入】員工資料表存取 ★', 7, 3
FROM gyms g WHERE g.external_id = 411
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 16: 掌握樹狀結構 - 「複合模式」
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 416, c.id, j.id, '6.C', '掌握樹狀結構 - 「複合模式」',
    '複合模式——日誌框',
    'CHALLENGE', 2, 3, 500, 0, 0, '',
    '["4_13","4_24","4_14"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 416
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 431, g.id, 'PRACTICAL_CHALLENGE', '日誌框架 ★★', 7, 14
FROM gyms g WHERE g.external_id = 416
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 432, g.id, 'INSTANT_CHALLENGE', '日誌框架 ★★', 7, 3
FROM gyms g WHERE g.external_id = 416
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 20: 透過複雜結構來組合行為：裝飾者模式
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 420, c.id, j.id, '7', '透過複雜結構來組合行為：裝飾者模式',
    '黑段的強者啊，有沒有覺得自己離「軟體架構師」又更進一步了呢？',
    'CHALLENGE', 1, 4, 300, 0, 0, '',
    '["4_18","4_19"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 420
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 441, g.id, 'PRACTICAL_CHALLENGE', '服務探索/負載平衡 (Service Discovery/ Load Balancing) 機制 ★', 7, 14
FROM gyms g WHERE g.external_id = 420
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 442, g.id, 'INSTANT_CHALLENGE', '服務探索/負載平衡 (Service Discovery/ Load Balancing) 機制 ★', 7, 3
FROM gyms g WHERE g.external_id = 420
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 21: 高級複雜框架實戰：有限狀態機框架
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 421, c.id, j.id, '8', '高級複雜框架實戰：有限狀態機框架',
    '黑段的強者，你終於走到這裡了。',
    'BOSS', 4, 5, 4500, 0, 0, '',
    '["4_26"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 421
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 451, g.id, 'PRACTICAL_CHALLENGE', '社群機器人引擎 | 有限狀態機框架 ★★★★', 7, 40
FROM gyms g WHERE g.external_id = 421
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- Chapter 5: 副本五 - Gyms
-- ============================================================

-- Gym 503: 單體模式練習：計算模型
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 503, c.id, j.id, '9.A', '單體模式練習：計算模型',
    '黑段的強者，讓我問問你一個問題吧。',
    'CHALLENGE', 1, 0, 320, 0, 0, '',
    '["5_1","5_2"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 503
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 501, g.id, 'PRACTICAL_CHALLENGE', '單體模式——計算模型 ★', 7, 14
FROM gyms g WHERE g.external_id = 503
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 506: 劃破一切的「生命週期」約束
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 506, c.id, j.id, '9', '劃破一切的「生命週期」約束',
    '工廠方法 ★★：基因演算法套件',
    'CHALLENGE', 2, 1, 320, 0, 0, '',
    '["5_4"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 506
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 511, g.id, 'PRACTICAL_CHALLENGE', '工廠方法——基因演算法套件 ★★', 7, 14
FROM gyms g WHERE g.external_id = 506
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 508: 二維度的模組化一致性
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 508, c.id, j.id, '9.B', '二維度的模組化一致性',
    '★ 抽象工廠——ASCII 介面主題',
    'CHALLENGE', 1, 2, 300, 0, 0, '',
    '["5_5"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 508
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 521, g.id, 'PRACTICAL_CHALLENGE', '抽象工廠——ASCII 介面主題 (ASCII UI Theme) ★', 7, 14
FROM gyms g WHERE g.external_id = 508
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 522, g.id, 'INSTANT_CHALLENGE', '抽象工廠——ASCII 介面主題 (ASCII UI Theme) ★', 7, 3
FROM gyms g WHERE g.external_id = 508
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- Gym 507: 高級複雜框架實戰：控制反轉框架
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 507, c.id, j.id, '10.A', '高級複雜框架實戰：控制反轉框架',
    '你要開發一個「單字學習系統 (Vocabulary Learning System)」',
    'BOSS', 4, 3, 5500, 0, 0, '',
    '["5_9"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 5 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 507
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 531, g.id, 'PRACTICAL_CHALLENGE', 'IoC 容器魔王參見 ★★★★', 7, 40
FROM gyms g WHERE g.external_id = 507
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- Chapter 6: 副本六 - Gyms
-- ============================================================

-- Gym 601: 期末專案 (Web Framework)
INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index,
    reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 601, c.id, j.id, '10', '期末專案 (Web Framework)',
    '各位黑段強者們好，我們終於來到了本課程的「終極副本」。',
    'BOSS', 4, 0, 8000, 0, 0, '',
    '[]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 6 AND j.external_id = 0
ON CONFLICT (external_id) DO UPDATE SET
    code = EXCLUDED.code, name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type,
    difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index,
    reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin,
    reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days,
    reward_external_description = EXCLUDED.reward_external_description,
    related_lesson_ids = EXCLUDED.related_lesson_ids;

-- Challenges for Gym 601
INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 601, g.id, 'PRACTICAL_CHALLENGE', '自幹一個 Web Framework ★★★★', 7, 40
FROM gyms g WHERE g.external_id = 601
ON CONFLICT (external_id) DO UPDATE SET
    type = EXCLUDED.type, name = EXCLUDED.name,
    recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- 驗證
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V19: 軟體設計模式精通之旅 - Gyms & Challenges 完成 ===';
    RAISE NOTICE '- Chapter 1 Gyms: 1 個 (4 challenges)';
    RAISE NOTICE '- Chapter 2 Gyms: 4 個 (7 challenges)';
    RAISE NOTICE '- Chapter 3 Gyms: 4 個 (7 challenges)';
    RAISE NOTICE '- Chapter 4 Gyms: 6 個 (13 challenges)';
    RAISE NOTICE '- Chapter 5 Gyms: 4 個 (6 challenges)';
    RAISE NOTICE '- Chapter 6 Gyms: 1 個 (1 challenge)';
END $$;
