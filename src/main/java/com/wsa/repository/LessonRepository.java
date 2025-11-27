package com.wsa.repository;

import com.wsa.entity.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 課程單元資料存取介面
 * 提供課程單元資料的查詢與持久化操作
 */
@Repository
public interface LessonRepository extends JpaRepository<Lesson, UUID> {

    /**
     * 根據章節 ID 查詢課程（按 orderIndex 排序）
     *
     * @param chapterId 章節 UUID
     * @return 課程列表
     */
    List<Lesson> findByChapterIdOrderByOrderIndex(UUID chapterId);

    /**
     * 根據旅程 ID 查詢所有課程
     *
     * @param journeyId 旅程 UUID
     * @return 課程列表
     */
    List<Lesson> findByJourneyIdOrderByOrderIndex(UUID journeyId);

    /**
     * 根據 external_id 查詢課程
     *
     * @param externalId 外部 ID
     * @return 課程資料（若存在）
     */
    Optional<Lesson> findByExternalId(Integer externalId);

    /**
     * 根據旅程 slug 和 lesson external_id 查詢課程
     *
     * @param slug 旅程 slug
     * @param externalId lesson 外部 ID
     * @return 課程資料（若存在）
     */
    @Query("SELECT l FROM Lesson l " +
           "LEFT JOIN FETCH l.chapter " +
           "LEFT JOIN FETCH l.journey " +
           "WHERE l.journey.slug = :slug AND l.externalId = :externalId")
    Optional<Lesson> findByJourneySlugAndExternalId(
            @Param("slug") String slug,
            @Param("externalId") Integer externalId);
}
