package com.wsa.repository;

import com.wsa.entity.UserLessonProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 使用者課程進度資料存取介面
 * 提供 Journey/Lesson 架構下的使用者進度查詢與持久化操作
 */
@Repository
public interface UserLessonProgressRepository extends JpaRepository<UserLessonProgress, UUID> {

    /**
     * 根據使用者 ID 和課程 ID 查詢進度記錄
     *
     * @param userId 使用者 UUID
     * @param lessonId 課程 UUID
     * @return 進度記錄（若存在）
     */
    Optional<UserLessonProgress> findByUserIdAndLessonId(UUID userId, UUID lessonId);

    /**
     * 根據使用者 ID 和旅程 slug 查詢該旅程下所有已完成的 lesson 進度
     *
     * @param userId 使用者 UUID
     * @param journeySlug 旅程 slug
     * @return 已完成的進度記錄列表
     */
    @Query("SELECT ulp FROM UserLessonProgress ulp " +
           "JOIN Lesson l ON ulp.lessonId = l.id " +
           "JOIN Journey j ON l.journey.id = j.id " +
           "WHERE ulp.userId = :userId AND j.slug = :journeySlug AND ulp.completedAt IS NOT NULL")
    List<UserLessonProgress> findCompletedByUserIdAndJourneySlug(
            @Param("userId") UUID userId,
            @Param("journeySlug") String journeySlug);

    /**
     * 刪除指定使用者的所有課程進度記錄
     * 用於重置使用者資料
     *
     * @param userId 使用者 UUID
     */
    void deleteByUserId(UUID userId);

    /**
     * 查詢使用者在指定旅程下最後觀看的課程進度
     * 用於「進入課程」功能，讓使用者從上次觀看的位置繼續
     *
     * @param userId 使用者 UUID
     * @param journeySlug 旅程 slug
     * @return 最後觀看的進度記錄（若存在）
     */
    @Query("SELECT ulp FROM UserLessonProgress ulp " +
           "JOIN Lesson l ON ulp.lessonId = l.id " +
           "JOIN Chapter c ON l.chapter.id = c.id " +
           "JOIN Journey j ON c.journey.id = j.id " +
           "WHERE ulp.userId = :userId AND j.slug = :journeySlug " +
           "ORDER BY ulp.lastWatchedAt DESC " +
           "LIMIT 1")
    Optional<UserLessonProgress> findLastWatchedByUserIdAndJourneySlug(
            @Param("userId") UUID userId,
            @Param("journeySlug") String journeySlug);
}
