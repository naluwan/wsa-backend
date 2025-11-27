-- ============================================================
-- V14: 建立 Journey Domain 相關資料表
--
-- 新的課程資料模型，對應復刻網站的 JSON 結構：
-- Journey -> Chapter -> Lesson
--                    -> Gym -> Challenge
-- Journey <-> Skill (M:N)
-- Journey -> Mission (預留)
--
-- 設計特點：
-- 1. 使用 UUID 作為主鍵
-- 2. 保留 external_id 對應 JSON 中的 id
-- 3. Reward 使用嵌入欄位（不拆表）
-- 4. Lesson.type 使用 VARCHAR 存儲 enum 值
-- 5. 與現有 courses/units 表並行存在，逐步遷移
-- ============================================================

-- ============================================================
-- 1. 建立 skills 表（技能標籤）
-- ============================================================
CREATE TABLE IF NOT EXISTS skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_skills_external_id UNIQUE (external_id),
    CONSTRAINT uk_skills_name UNIQUE (name)
);

CREATE INDEX idx_skills_external_id ON skills(external_id);
CREATE INDEX idx_skills_name ON skills(name);

-- ============================================================
-- 2. 建立 journeys 表（課程）
-- ============================================================
CREATE TABLE IF NOT EXISTS journeys (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_journeys_external_id UNIQUE (external_id),
    CONSTRAINT uk_journeys_slug UNIQUE (slug)
);

CREATE INDEX idx_journeys_external_id ON journeys(external_id);
CREATE INDEX idx_journeys_slug ON journeys(slug);

-- ============================================================
-- 3. 建立 journey_skills 關聯表（多對多）
-- ============================================================
CREATE TABLE IF NOT EXISTS journey_skills (
    journey_id UUID NOT NULL,
    skill_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (journey_id, skill_id),
    CONSTRAINT fk_journey_skills_journey FOREIGN KEY (journey_id)
        REFERENCES journeys(id) ON DELETE CASCADE,
    CONSTRAINT fk_journey_skills_skill FOREIGN KEY (skill_id)
        REFERENCES skills(id) ON DELETE CASCADE
);

CREATE INDEX idx_journey_skills_journey_id ON journey_skills(journey_id);
CREATE INDEX idx_journey_skills_skill_id ON journey_skills(skill_id);

-- ============================================================
-- 4. 建立 chapters 表（章節）
-- ============================================================
CREATE TABLE IF NOT EXISTS chapters (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id INTEGER NOT NULL,
    journey_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    order_index INTEGER NOT NULL DEFAULT 0,
    password_required BOOLEAN NOT NULL DEFAULT FALSE,
    -- Reward 嵌入欄位
    reward_exp INTEGER NOT NULL DEFAULT 0,
    reward_coin INTEGER NOT NULL DEFAULT 0,
    reward_subscription_extension_days INTEGER NOT NULL DEFAULT 0,
    reward_external_description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_chapters_external_id UNIQUE (external_id),
    CONSTRAINT fk_chapters_journey FOREIGN KEY (journey_id)
        REFERENCES journeys(id) ON DELETE CASCADE
);

CREATE INDEX idx_chapters_external_id ON chapters(external_id);
CREATE INDEX idx_chapters_journey_id ON chapters(journey_id);
CREATE INDEX idx_chapters_journey_order ON chapters(journey_id, order_index);

-- ============================================================
-- 5. 建立 lessons 表（單元）
-- ============================================================
CREATE TABLE IF NOT EXISTS lessons (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id INTEGER NOT NULL,
    chapter_id UUID NOT NULL,
    journey_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    -- type: scroll, video, google-form
    type VARCHAR(20) NOT NULL,
    premium_only BOOLEAN NOT NULL DEFAULT TRUE,
    video_length VARCHAR(20) NULL,
    -- 保留影片 URL 欄位
    video_url TEXT NULL,
    order_index INTEGER NOT NULL DEFAULT 0,
    -- Reward 嵌入欄位
    reward_exp INTEGER NOT NULL DEFAULT 0,
    reward_coin INTEGER NOT NULL DEFAULT 0,
    reward_subscription_extension_days INTEGER NOT NULL DEFAULT 0,
    reward_external_description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_lessons_external_id UNIQUE (external_id),
    CONSTRAINT fk_lessons_chapter FOREIGN KEY (chapter_id)
        REFERENCES chapters(id) ON DELETE CASCADE,
    CONSTRAINT fk_lessons_journey FOREIGN KEY (journey_id)
        REFERENCES journeys(id) ON DELETE CASCADE,
    CONSTRAINT chk_lessons_type CHECK (type IN ('scroll', 'video', 'google-form'))
);

CREATE INDEX idx_lessons_external_id ON lessons(external_id);
CREATE INDEX idx_lessons_chapter_id ON lessons(chapter_id);
CREATE INDEX idx_lessons_journey_id ON lessons(journey_id);
CREATE INDEX idx_lessons_chapter_order ON lessons(chapter_id, order_index);
CREATE INDEX idx_lessons_type ON lessons(type);

-- ============================================================
-- 6. 建立 gyms 表（挑戰集）
-- ============================================================
CREATE TABLE IF NOT EXISTS gyms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id INTEGER NOT NULL,
    chapter_id UUID NOT NULL,
    journey_id UUID NOT NULL,
    code VARCHAR(50) NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    type VARCHAR(20) NULL,
    difficulty INTEGER NOT NULL DEFAULT 1,
    order_index INTEGER NOT NULL DEFAULT 0,
    -- Reward 嵌入欄位
    reward_exp INTEGER NOT NULL DEFAULT 0,
    reward_coin INTEGER NOT NULL DEFAULT 0,
    reward_subscription_extension_days INTEGER NOT NULL DEFAULT 0,
    reward_external_description TEXT NULL,
    -- 相關 lesson ids (JSON 陣列字串，例如 ["1_1", "1_2"])
    related_lesson_ids TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_gyms_external_id UNIQUE (external_id),
    CONSTRAINT fk_gyms_chapter FOREIGN KEY (chapter_id)
        REFERENCES chapters(id) ON DELETE CASCADE,
    CONSTRAINT fk_gyms_journey FOREIGN KEY (journey_id)
        REFERENCES journeys(id) ON DELETE CASCADE
);

CREATE INDEX idx_gyms_external_id ON gyms(external_id);
CREATE INDEX idx_gyms_chapter_id ON gyms(chapter_id);
CREATE INDEX idx_gyms_journey_id ON gyms(journey_id);
CREATE INDEX idx_gyms_chapter_order ON gyms(chapter_id, order_index);

-- ============================================================
-- 7. 建立 challenges 表（挑戰內容）
-- ============================================================
CREATE TABLE IF NOT EXISTS challenges (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id INTEGER NOT NULL,
    gym_id UUID NOT NULL,
    type VARCHAR(50) NULL,
    name VARCHAR(255) NOT NULL,
    recommend_duration_days INTEGER NULL,
    max_duration_days INTEGER NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_challenges_external_id UNIQUE (external_id),
    CONSTRAINT fk_challenges_gym FOREIGN KEY (gym_id)
        REFERENCES gyms(id) ON DELETE CASCADE
);

CREATE INDEX idx_challenges_external_id ON challenges(external_id);
CREATE INDEX idx_challenges_gym_id ON challenges(gym_id);

-- ============================================================
-- 8. 建立 missions 表（任務 - 預留）
-- ============================================================
CREATE TABLE IF NOT EXISTS missions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    journey_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_missions_journey FOREIGN KEY (journey_id)
        REFERENCES journeys(id) ON DELETE CASCADE
);

CREATE INDEX idx_missions_journey_id ON missions(journey_id);

-- ============================================================
-- 驗證：檢查表建立結果
-- ============================================================
DO $$
BEGIN
    RAISE NOTICE '=== V14: Journey Domain 資料表建立完成 ===';
    RAISE NOTICE '建立的資料表：';
    RAISE NOTICE '  - skills (技能標籤)';
    RAISE NOTICE '  - journeys (課程)';
    RAISE NOTICE '  - journey_skills (課程-技能關聯)';
    RAISE NOTICE '  - chapters (章節)';
    RAISE NOTICE '  - lessons (單元)';
    RAISE NOTICE '  - gyms (挑戰集)';
    RAISE NOTICE '  - challenges (挑戰內容)';
    RAISE NOTICE '  - missions (任務-預留)';
END $$;
