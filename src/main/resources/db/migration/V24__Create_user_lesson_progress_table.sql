-- ============================================================
-- V24: 建立 user_lesson_progress 表
-- 追蹤使用者在 Journey/Lesson 新架構下的課程進度
-- ============================================================

CREATE TABLE IF NOT EXISTS user_lesson_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    lesson_id UUID NOT NULL,
    completed_at TIMESTAMP WITHOUT TIME ZONE,
    last_position_seconds INTEGER DEFAULT 0,
    last_watched_at TIMESTAMP WITHOUT TIME ZONE,

    -- 外鍵約束
    CONSTRAINT fk_user_lesson_progress_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_user_lesson_progress_lesson
        FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,

    -- 唯一約束：每個使用者對每個課程只能有一筆進度記錄
    CONSTRAINT user_lesson_progress_user_id_lesson_id_key
        UNIQUE (user_id, lesson_id)
);

-- 建立索引以加速查詢
CREATE INDEX IF NOT EXISTS idx_user_lesson_progress_user_id
    ON user_lesson_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_user_lesson_progress_lesson_id
    ON user_lesson_progress(lesson_id);

-- 輸出建立成功訊息
DO $$
BEGIN
    RAISE NOTICE '=== V24: user_lesson_progress 表建立完成 ===';
END $$;
