-- 新增使用者個人資料欄位
-- 包含：暱稱、心理性別、職業、生日、所在地區、GitHub 連結

ALTER TABLE users
ADD COLUMN nickname VARCHAR(100),
ADD COLUMN gender VARCHAR(20),
ADD COLUMN occupation VARCHAR(100),
ADD COLUMN birthday DATE,
ADD COLUMN location VARCHAR(50),
ADD COLUMN github_url VARCHAR(255);

-- 建立索引以提升查詢效能
CREATE INDEX idx_users_location ON users(location);
CREATE INDEX idx_users_gender ON users(gender);

COMMENT ON COLUMN users.nickname IS '使用者暱稱';
COMMENT ON COLUMN users.gender IS '使用者心理性別（男/女）';
COMMENT ON COLUMN users.occupation IS '使用者職業';
COMMENT ON COLUMN users.birthday IS '使用者生日';
COMMENT ON COLUMN users.location IS '使用者所在地區（台灣/中國/新加波/其他地區）';
COMMENT ON COLUMN users.github_url IS '使用者 GitHub 個人頁面連結';
