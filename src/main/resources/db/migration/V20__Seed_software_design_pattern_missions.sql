-- ============================================================
-- V20: 軟體設計模式精通之旅 - Missions（任務）
--
-- 注意：missions 表目前是預留欄位，僅有基礎結構
-- 完整的任務系統（含 prerequisites, criteria）需要額外的表設計
-- 這裡先插入基本的 mission 資料
-- ============================================================

-- ============================================================
-- Missions 資料
-- ============================================================

-- Mission 1: 新手任務一
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '新手任務一',
    '依序看完以下幾部影片：設計的關鍵是：把無形變有形、UML 不是拿來寫文件的、行雲流水的 OOA | OOD | OOP、上這門課一定要有「空杯心態」、軟體抽象之一：點的萃取、練武 - 點的萃取'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 2: 新手任務二
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '新手任務二',
    '你在這門課中踏出學習的第一步。再接再厲挑戰第一道館吧，在第一道館你會開始應用副本一中學到的技巧，戴上 OOAD 的眼鏡。'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 3: 白段任務一
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '白段任務一',
    '戴上了 OOAD 眼鏡的你有感覺到自己變強了嗎？你已經在這門課中踏出學習的第一步，和大多數工程師相較之下，你更有學習的衝勁和意願。'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 4: 白段任務二
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '白段任務二',
    '在副本二的旅程中對「怎麼抓 Force」和「怎麼有憑有據地套模式」，已經打好一層「基礎」了。接下來就要慢慢「增加專案的規模大小」，並開始學比較特別的行為型模式。'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 5: 白段任務三
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '白段任務三',
    '經過了副本三的旅程，你應該已經找到一種「在思考上至少一直能抓到施力點」、讓一切設計「剛剛好」的感覺。接下來就是開始應用所學挑戰白段的最終大魔王。'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 6: 黑段任務一
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '黑段任務一',
    '恭喜你踏上了黑段的旅程，從這裡開始，就要慢慢放大你能寫的程式規模了。在剛開始先學幾個簡單的結構模式，然後開始訓練架構方面的規劃能力。'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 7: 黑段任務二
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '黑段任務二',
    '學了結構模式後，接下來就來挑戰副本四的魔王題吧'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 8: 黑段任務三
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '黑段任務三',
    '恭喜你挑戰完副本四的魔王，接下來就來挑戰更複雜的框架吧'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 9: 黑段任務三 (支線)
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '黑段任務三 (支線)',
    '恭喜你挑戰完副本四的魔王，接下來就來挑戰更複雜的框架吧'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- Mission 10: 黑段任務四
INSERT INTO missions (id, journey_id, name, description)
SELECT gen_random_uuid(), j.id,
    '黑段任務四',
    '恭喜你來到旅程的最後一關，這一關後通過後，你就成為了旅途的永久學員，加油吧！'
FROM journeys j WHERE j.external_id = 0
ON CONFLICT DO NOTHING;

-- ============================================================
-- 驗證
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V20: 軟體設計模式精通之旅 - Missions 完成 ===';
    RAISE NOTICE '- Missions: 10 個';
    RAISE NOTICE '';
    RAISE NOTICE '=== 軟體設計模式精通之旅 種子資料總結 ===';
    RAISE NOTICE 'V16: Skills (6), Journey (1), Journey-Skills (6), Chapters (9)';
    RAISE NOTICE 'V17: Lessons Part 1 - Chapter 0-3 (~51 lessons)';
    RAISE NOTICE 'V18: Lessons Part 2 - Chapter 4-8 (~23 lessons)';
    RAISE NOTICE 'V19: Gyms (~20), Challenges (~38)';
    RAISE NOTICE 'V20: Missions (10)';
END $$;
