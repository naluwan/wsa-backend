package com.wsa.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * 使用者課程進度實體類別
 * 用於追蹤 Journey/Lesson 架構下的使用者學習進度
 *
 * 用途：
 *   1. 記錄使用者觀看課程的進度（最後觀看位置、最後觀看時間）
 *   2. 記錄使用者完成課程的狀態（完成時間）
 *
 * 重要：
 *   - 進度更新（觀看中）時，completedAt 為 null
 *   - 完成課程時，completedAt 才設為當前時間
 *   - 每個使用者對每個課程只能有一筆記錄（UNIQUE 約束）
 */
@Entity
@Table(
    name = "user_lesson_progress",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"user_id", "lesson_id"})
    }
)
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserLessonProgress {

    /** 進度記錄唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 使用者 UUID */
    @Column(name = "user_id", nullable = false)
    private UUID userId;

    /** 課程 UUID */
    @Column(name = "lesson_id", nullable = false)
    private UUID lessonId;

    /**
     * 使用者最後觀看到的影片秒數位置
     * 用途：讓使用者下次可以從此位置繼續觀看
     * 預設值：0（表示尚未觀看）
     */
    @Column(name = "last_position_seconds")
    private Integer lastPositionSeconds;

    /**
     * 使用者最後一次觀看此課程的時間
     * 用途：
     *   1. 追蹤使用者學習行為
     *   2. 分析使用者活躍度
     *   3. 提供「最近觀看」等功能
     */
    @Column(name = "last_watched_at")
    private LocalDateTime lastWatchedAt;

    /**
     * 完成時間
     * 重要：
     *   - 若為 null，表示課程尚未完成（可能正在觀看中）
     *   - 若不為 null，表示課程已完成（此時間用於避免重複獲得 XP）
     *   - 完成課程時，應手動設為 LocalDateTime.now()
     */
    @Column(name = "completed_at")
    private LocalDateTime completedAt;
}
