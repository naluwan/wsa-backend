-- ============================================================
-- V15: Journey Domain 種子資料 - AI x BDD 課程
--
-- 包含 AI x BDD：規格驅動全自動開發術 (external_id=4) 完整資料
--
-- 特性：
-- 1. 使用 ON CONFLICT (external_id) DO UPDATE 實現 upsert
-- 2. 所有 reward 欄位都完整寫入
-- 3. relatedLessonIds 轉成 JSON 字串存放
-- 4. 可安全重跑（idempotent）
-- ============================================================

-- ============================================================
-- 1. Skills 技能標籤
-- ============================================================

INSERT INTO skills (external_id, name) VALUES (1, 'Spec By Example') ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO skills (external_id, name) VALUES (2, '規格化＆SSOT') ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO skills (external_id, name) VALUES (3, '開發流程原子化') ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO skills (external_id, name) VALUES (4, 'AI 自我審查機制') ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO skills (external_id, name) VALUES (5, '高效率重構導入') ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO skills (external_id, name) VALUES (6, '原子流程自動化') ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name;

-- ============================================================
-- 2. Journey 課程
-- ============================================================

INSERT INTO journeys (external_id, name, slug)
VALUES (4, 'AI x BDD：規格驅動全自動開發術', 'ai-bdd')
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, slug = EXCLUDED.slug;

-- ============================================================
-- 3. Journey-Skills 關聯
-- ============================================================

INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s WHERE j.external_id = 4 AND s.external_id = 1
ON CONFLICT DO NOTHING;
INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s WHERE j.external_id = 4 AND s.external_id = 2
ON CONFLICT DO NOTHING;
INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s WHERE j.external_id = 4 AND s.external_id = 3
ON CONFLICT DO NOTHING;
INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s WHERE j.external_id = 4 AND s.external_id = 4
ON CONFLICT DO NOTHING;
INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s WHERE j.external_id = 4 AND s.external_id = 5
ON CONFLICT DO NOTHING;
INSERT INTO journey_skills (journey_id, skill_id)
SELECT j.id, s.id FROM journeys j, skills s WHERE j.external_id = 4 AND s.external_id = 6
ON CONFLICT DO NOTHING;

-- ============================================================
-- 4. Chapters 章節 (9 個)
-- ============================================================

-- Chapter 0: 課程介紹＆試聽
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4000, j.id, '課程介紹＆試聽', 0, FALSE, 150, 100, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 1: 規格驅動開發的前提
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4001, j.id, '規格驅動開發的前提', 1, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 2: 100% 全自動化開發的脈絡：規格的光譜
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4002, j.id, '100% 全自動化開發的脈絡：規格的光譜', 2, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 3: 70% 自動化：測試驅動開發
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4003, j.id, '70% 自動化：測試驅動開發', 3, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 4: 80% 自動化：行為驅動開發 (BDD)
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4004, j.id, '80% 自動化：行為驅動開發 (BDD)', 4, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 5: 90% 自動化：指令集架構之可執行規格
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4005, j.id, '90% 自動化：指令集架構之可執行規格', 5, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 6: 99% 自動化：為企業打造專屬 BDD Master Agent
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4006, j.id, '99% 自動化：為企業打造專屬 BDD Master Agent', 6, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 7: 100% 自動化：超 AI 化
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4007, j.id, '100% 自動化：超 AI 化', 7, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 8: 全自動化開發 in 敏捷/DevOps
INSERT INTO chapters (external_id, journey_id, name, order_index, password_required, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 4008, j.id, '全自動化開發 in 敏捷/DevOps', 8, FALSE, 3000, 12000, 0, ''
FROM journeys j WHERE j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, order_index = EXCLUDED.order_index, password_required = EXCLUDED.password_required, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- 5. Lessons 單元 - 完整 78 個
-- ============================================================

-- Chapter 0: 課程介紹＆試聽 (2 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 40001, c.id, j.id, '這門課絕對不只是教你寫規格', NULL, 'scroll', FALSE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4000 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 40008, c.id, j.id, 'Prompt 寶典', '水球軟體學院，只教能扎實落地的思路和 SOP。歡迎下載本課程用到的思路及 SOP圖片，在學習過程中，記得善用 SOP資源來遂步訓練自己的思路，或是使用 SOP來指導他人。', 'scroll', TRUE, NULL, 1, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4000 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 1: 規格驅動開發的前提 (9 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41001, c.id, j.id, '課程拆解：規格驅動開發三維大展開', NULL, 'video', TRUE, '08:33', 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41002, c.id, j.id, '把規格寫清楚，只是個假議題', NULL, 'video', TRUE, '07:25', 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41004, c.id, j.id, '不釐清規格，AI 開發成效如何？', NULL, 'video', TRUE, '06:32', 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41003, c.id, j.id, 'Discovery → Formulation 魔法實戰', NULL, 'video', TRUE, '26:48', 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41005, c.id, j.id, '用模型思維釐清完規格了，AI 開發成效又如何？', NULL, 'video', TRUE, '12:46', 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41006, c.id, j.id, 'Gherkin Language 模型教學', NULL, 'video', TRUE, '25:40', 5, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41007, c.id, j.id, '【總結】規格驅動開發的前提｜主流工具都做不到', NULL, 'video', TRUE, '15:00', 6, 301, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41008, c.id, j.id, '如何存取 SDD.os 原始碼？', '請遵照底下 SOP 進行即可存取 SDD.os 的原始碼', 'scroll', TRUE, NULL, 7, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 41010, c.id, j.id, '【回饋問卷】AI x BDD：規格驅動全自動開發術', NULL, 'google-form', TRUE, NULL, 8, 1000, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4001 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 2: 100% 全自動化開發的脈絡：規格的光譜 (6 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 42000, c.id, j.id, '第二章內容介紹 (Intro)', NULL, 'video', TRUE, '13:20', 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 42009, c.id, j.id, '第二章：共學回放影片列表', '第二章：共學回放影片列表', 'scroll', FALSE, NULL, 1, 0, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 42004, c.id, j.id, '領域驅動設計：沒有「抽象」就沒法「協作」', '各位*規格驅動全自動開發術*的魔法初學者們好！', 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 42005, c.id, j.id, '事件風暴模型：貫穿問題及解法領域 - 規格的共同語言', '這個單元中，我來教你一個很重要的思維。', 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 42007, c.id, j.id, '用「事件風暴」來定義「Gherkin」的 Given/When/Then', '在上一個單元中，我們建立了 Event Storming 的兩種系統邊界模型', 'scroll', TRUE, NULL, 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 42008, c.id, j.id, '測試程式碼的抽象：DSL-Level Gherkin vs. ISA-Level Gherkin', '如果你現在跟 AI 說：「請你幫我從這個 DSL-Level 的 Feature File 規格生成測試程式碼」的話，會發生什麼事情？', 'scroll', TRUE, NULL, 5, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 3: 70% 自動化：測試驅動開發 (5 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 43010, c.id, j.id, 'TDD 循環基礎概念：先畫靶後射箭', '各位規格驅動全自動開發術的魔法初學者們好！', 'scroll', TRUE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4003 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 43011, c.id, j.id, '從 Gherkin 到測試程式碼：事件風暴部位的直接翻譯', '各位規格驅動全自動開發術的魔法初學者們好！', 'scroll', TRUE, NULL, 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4003 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 43012, c.id, j.id, 'AI x TDD：4 大 Prompts 手把手實戰篇', '大家好，接下來的這個單元啊，就要手把手帶各位來實戰練功了！', 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4003 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 43013, c.id, j.id, 'AI x TDD：從單元測試到後端 End to End 測試驅動開發', 'AI x TDD：從單元測試到後端 End to End 測試驅動開發', 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4003 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 43014, c.id, j.id, 'AI x TDD：掌握進階測試技巧 (Mock)', 'AI x TDD：掌握進階測試技巧 (Mock)', 'scroll', TRUE, NULL, 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4003 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 4: 80% 自動化：行為驅動開發 (BDD) (16 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44018, c.id, j.id, 'AI x TDD 的問題', NULL, 'scroll', TRUE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44019, c.id, j.id, '行為驅動開發 (BDD)：概念及 SOP', NULL, 'scroll', TRUE, NULL, 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44020, c.id, j.id, '人工 BDD 實戰示範', NULL, 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44021, c.id, j.id, 'AI x BDD 實戰示範', NULL, 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44022, c.id, j.id, '【逆向工程】把測試程式抽象成 Scenario', NULL, 'scroll', TRUE, NULL, 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44023, c.id, j.id, '【逆向工程】多個 Scenario 聚成一條 Rule', NULL, 'scroll', TRUE, NULL, 5, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44024, c.id, j.id, '【逆向工程】為每一個 Rule 舉出多個 Examples', NULL, 'scroll', TRUE, NULL, 6, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44025, c.id, j.id, 'AI 輔助逆向工程', NULL, 'scroll', TRUE, NULL, 7, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44026, c.id, j.id, '【不准用 AI】把測試類別抽象成 Feature！', NULL, 'scroll', TRUE, NULL, 8, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44027, c.id, j.id, '【正向工程】從 User Story 拆解 Examples：SOP', NULL, 'scroll', TRUE, NULL, 9, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44028, c.id, j.id, '【不准用 AI】從 User Story 拆解 Examples：SOP', NULL, 'scroll', TRUE, NULL, 10, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44029, c.id, j.id, 'AI 輔助 Example Mapping', NULL, 'scroll', TRUE, NULL, 11, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44030, c.id, j.id, '【Solution Mapping】切換開發之技術層級 - 從 CLI 變成後端', NULL, 'scroll', TRUE, NULL, 12, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44031, c.id, j.id, 'Solution Mapping 實戰示範', NULL, 'scroll', TRUE, NULL, 13, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44032, c.id, j.id, '總結 1：BDD 就是 可執行規格 + TDD', NULL, 'scroll', TRUE, NULL, 14, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 44033, c.id, j.id, '總結 2：BDD 的三大環節', NULL, 'scroll', TRUE, NULL, 15, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 5: 90% 自動化：指令集架構之可執行規格 (28 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45034, c.id, j.id, 'BDD 在全自動化 4S 的剩餘問題', NULL, 'scroll', TRUE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45035, c.id, j.id, '【上帝視角】90% 全自動化開發長怎樣？', NULL, 'scroll', TRUE, NULL, 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45036, c.id, j.id, '軟體工程是藝術嗎？一項令人落寞的統計問題', NULL, 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45037, c.id, j.id, '【價值轉型】這世界永遠都會留下一些樂趣給工程師', NULL, 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45038, c.id, j.id, '【職涯競爭】寫組語的工程師會被取代嗎？不可能', NULL, 'scroll', TRUE, NULL, 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45039, c.id, j.id, '【上帝視角】那來吧，我們來寫 AI 時代下的組語', NULL, 'scroll', TRUE, NULL, 5, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45040, c.id, j.id, '【開發流程原子化】變與不變', NULL, 'scroll', TRUE, NULL, 6, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45041, c.id, j.id, '【開發流程原子化】後端程式', NULL, 'scroll', TRUE, NULL, 7, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45042, c.id, j.id, '【開發流程原子化】不同場域的原子化', NULL, 'scroll', TRUE, NULL, 8, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45043, c.id, j.id, '補齊每一個步驟的 SSOT', NULL, 'scroll', TRUE, NULL, 9, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45044, c.id, j.id, '【SSOT】領域驅動設計 (DDD)：模型之間的映射性', NULL, 'scroll', TRUE, NULL, 10, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45045, c.id, j.id, '【SSOT】DDD - API 規格自動化產出', NULL, 'scroll', TRUE, NULL, 11, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45046, c.id, j.id, '【SSOT】DDD - ERD 規格自動化產出', NULL, 'scroll', TRUE, NULL, 12, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45047, c.id, j.id, '【指令集】指令 vs. 語言規格', NULL, 'scroll', TRUE, NULL, 13, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45048, c.id, j.id, '【指令集】建立後端程式的 ISA：SOP', NULL, 'scroll', TRUE, NULL, 14, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45049, c.id, j.id, '【指令集】建立後端程式的 ISA：實戰', NULL, 'scroll', TRUE, NULL, 15, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45050, c.id, j.id, '【會尖叫的架構】超高拓展性的 AI x BDD 測試架構', NULL, 'scroll', TRUE, NULL, 16, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45051, c.id, j.id, '【指令集】動態斷言指令：枚舉', NULL, 'scroll', TRUE, NULL, 17, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45052, c.id, j.id, '【指令集】動態斷言指令：示範', NULL, 'scroll', TRUE, NULL, 18, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45053, c.id, j.id, '【指令集】Auth 指令集怎麼做？', NULL, 'scroll', TRUE, NULL, 19, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45054, c.id, j.id, '【指令集】Auth 指令集實戰示範', NULL, 'scroll', TRUE, NULL, 20, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45055, c.id, j.id, '【契約測試】微服務之指令集怎麼做？', NULL, 'scroll', TRUE, NULL, 21, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45056, c.id, j.id, '【契約測試】微服務之指令集實戰', NULL, 'scroll', TRUE, NULL, 22, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45057, c.id, j.id, '【契約測試】微服務之指令集之練習', NULL, 'scroll', TRUE, NULL, 23, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45058, c.id, j.id, '【契約測試】用同樣的 SOP 測試 Redis', NULL, 'scroll', TRUE, NULL, 24, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45059, c.id, j.id, '【契約測試】用同樣的 SOP 測試 AWS S3', NULL, 'scroll', TRUE, NULL, 25, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45060, c.id, j.id, '【契約測試】分散式系統指令集實戰', NULL, 'scroll', TRUE, NULL, 26, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 45061, c.id, j.id, '【指令集】建立前端程式的 ISA', NULL, 'scroll', TRUE, NULL, 27, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 6: 99% 自動化：為企業打造專屬 BDD Master Agent (8 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46062, c.id, j.id, '使用 N8N 自幹一個 BDD Agent', NULL, 'scroll', TRUE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46063, c.id, j.id, '了解 N8N 基本概念', NULL, 'scroll', TRUE, NULL, 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46064, c.id, j.id, '快速建立一個 BDD Cycle Workflow', NULL, 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46065, c.id, j.id, '建立指令組譯器', NULL, 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46066, c.id, j.id, '打造 Context Engineering 自動化機制', NULL, 'scroll', TRUE, NULL, 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46067, c.id, j.id, '完成全自動化 BDD Cycle Workflow', NULL, 'scroll', TRUE, NULL, 5, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46068, c.id, j.id, '建立 AI Review AI 機制', NULL, 'scroll', TRUE, NULL, 6, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 46069, c.id, j.id, '使用 Claude Code SDK 自幹一個 BDD Agent', NULL, 'scroll', TRUE, NULL, 7, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 7: 100% 自動化：超 AI 化 (5 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 47070, c.id, j.id, '99% 到 100% 的最後一哩路：超 AI 化', NULL, 'scroll', TRUE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4007 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 47071, c.id, j.id, '分析每一步指令的空間複雜度', NULL, 'scroll', TRUE, NULL, 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4007 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 47072, c.id, j.id, '用枚舉來做到 CodeGen', NULL, 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4007 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 47073, c.id, j.id, '整合回 BDD Agent：不到三秒就產出所有測試程式碼', NULL, 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4007 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 47074, c.id, j.id, '總結：規格光譜之「指令集架構」', NULL, 'scroll', TRUE, NULL, 4, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4007 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- Chapter 8: 全自動化開發 in 敏捷/DevOps (4 lessons)
INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 48075, c.id, j.id, '【上帝視角】將 AI x BDD 部署至 CI/CD 之中', NULL, 'scroll', TRUE, NULL, 0, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4008 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 48076, c.id, j.id, '直接部署 Feature file 叫 BDD Master 開發', NULL, 'scroll', TRUE, NULL, 1, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4008 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 48077, c.id, j.id, 'Code Review 檢驗重點：非功能性需求', NULL, 'scroll', TRUE, NULL, 2, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4008 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

INSERT INTO lessons (external_id, chapter_id, journey_id, name, description, type, premium_only, video_length, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description)
SELECT 48078, c.id, j.id, '測試環境的 Feedback Loop', NULL, 'scroll', TRUE, NULL, 3, 201, 0, 0, ''
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4008 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, premium_only = EXCLUDED.premium_only, video_length = EXCLUDED.video_length, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description;

-- ============================================================
-- 6. Gyms 挑戰集 (7 個)
-- ============================================================

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 42001, c.id, j.id, '1', '60% 自動化：AI 協作式開發的低效率', '使用協作式的方法', 'CHALLENGE', 1, 0, 2000, 6000, 0, '', '["1_1","1_2","1_3","2_4","2_5","2_6","2_7","2_8","2_9"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4002 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 43002, c.id, j.id, '2', '70% 自動化：測試驅動開發', '用 AI x TDD 開發一個 CLI 應用', 'CHALLENGE', 1, 0, 3000, 6000, 0, '', '["3_10","3_11","3_12","3_13","3_14","3_15","3_16","3_17"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4003 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 44003, c.id, j.id, '3', '80% 自動化：行為驅動開發', '用 AI x BDD 開發一個 MVP 全端應用程式（畫面隨意）', 'CHALLENGE', 2, 0, 4000, 8000, 0, '', '["4_18","4_19","4_20","4_21","4_22","4_23","4_24","4_25","4_26","4_27","4_28","4_29","4_30","4_31","4_32","4_33"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4004 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 45004, c.id, j.id, '4', '90% 自動化：指令集架構之可執行規格', '用 AI x BDD 開發一個微服務應用程式（畫面隨意）', 'CHALLENGE', 3, 0, 4000, 8000, 0, '', '["5_34","5_35","5_36","5_37","5_38","5_39","5_40","5_41","5_42","5_43","5_44","5_45","5_46","5_47","5_48","5_49","5_50","5_51","5_52","5_53","5_54","5_55","5_56","5_57","5_58","5_59","5_60","5_61"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4005 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 46005, c.id, j.id, '5', '99% 自動化：為企業打造專屬 BDD Master Agent', '自己開發一個 Claude BDD Master Agent', 'CHALLENGE', 3, 0, 5000, 12000, 0, '', '["6_62","6_63","6_64","6_65","6_66","6_67","6_68","6_69"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4006 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 47006, c.id, j.id, '6', '100% 自動化：超 AI 化', '開發一個 CodeGen', 'CHALLENGE', 3, 0, 5000, 12000, 0, '', '["7_70","7_71","7_72","7_73","7_74"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4007 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

INSERT INTO gyms (external_id, chapter_id, journey_id, code, name, description, type, difficulty, order_index, reward_exp, reward_coin, reward_subscription_extension_days, reward_external_description, related_lesson_ids)
SELECT 48007, c.id, j.id, '7', '全自動化開發 in 敏捷/DevOps', '導入後端', 'CHALLENGE', 3, 0, 5000, 12000, 0, '', '["8_75","8_76","8_77","8_78"]'
FROM chapters c JOIN journeys j ON c.journey_id = j.id WHERE c.external_id = 4008 AND j.external_id = 4
ON CONFLICT (external_id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, type = EXCLUDED.type, difficulty = EXCLUDED.difficulty, order_index = EXCLUDED.order_index, reward_exp = EXCLUDED.reward_exp, reward_coin = EXCLUDED.reward_coin, reward_subscription_extension_days = EXCLUDED.reward_subscription_extension_days, reward_external_description = EXCLUDED.reward_external_description, related_lesson_ids = EXCLUDED.related_lesson_ids;

-- ============================================================
-- 7. Challenges 挑戰內容 (7 個)
-- ============================================================

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 420011, g.id, 'PRACTICAL_CHALLENGE', '60% 自動化：AI 協作式開發的低效率', 14, 14
FROM gyms g WHERE g.external_id = 42001
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 430021, g.id, 'PRACTICAL_CHALLENGE', '70% 自動化：測試驅動開發', 14, 14
FROM gyms g WHERE g.external_id = 43002
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 440031, g.id, 'PRACTICAL_CHALLENGE', '80% 自動化：行為驅動開發', 14, 14
FROM gyms g WHERE g.external_id = 44003
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 450041, g.id, 'PRACTICAL_CHALLENGE', '90% 自動化：指令集架構之可執行規格', 28, 28
FROM gyms g WHERE g.external_id = 45004
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 460051, g.id, 'PRACTICAL_CHALLENGE', '99% 自動化：為企業打造專屬 BDD Master Agent', 28, 28
FROM gyms g WHERE g.external_id = 46005
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 470061, g.id, 'PRACTICAL_CHALLENGE', '100% 自動化：超 AI 化', 28, 28
FROM gyms g WHERE g.external_id = 47006
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

INSERT INTO challenges (external_id, gym_id, type, name, recommend_duration_days, max_duration_days)
SELECT 480071, g.id, 'PRACTICAL_CHALLENGE', '全自動化開發 in 敏捷/DevOps', 14, 14
FROM gyms g WHERE g.external_id = 48007
ON CONFLICT (external_id) DO UPDATE SET type = EXCLUDED.type, name = EXCLUDED.name, recommend_duration_days = EXCLUDED.recommend_duration_days, max_duration_days = EXCLUDED.max_duration_days;

-- ============================================================
-- 驗證：檢查插入結果
-- ============================================================

DO $$
BEGIN
  RAISE NOTICE '=== V15: AI x BDD 課程種子資料插入完成 ===';
  RAISE NOTICE '技能數量: %', (SELECT COUNT(*) FROM skills);
  RAISE NOTICE '課程數量: %', (SELECT COUNT(*) FROM journeys);
  RAISE NOTICE '章節數量: %', (SELECT COUNT(*) FROM chapters);
  RAISE NOTICE '單元數量: %', (SELECT COUNT(*) FROM lessons);
  RAISE NOTICE '挑戰集數量: %', (SELECT COUNT(*) FROM gyms);
  RAISE NOTICE '挑戰內容數量: %', (SELECT COUNT(*) FROM challenges);
END $$;
