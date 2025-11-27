package com.wsa.repository;

import com.wsa.entity.Chapter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 章節資料存取介面
 * 提供章節資料的查詢與持久化操作
 */
@Repository
public interface ChapterRepository extends JpaRepository<Chapter, UUID> {

    /**
     * 根據旅程 ID 查詢章節（按 orderIndex 排序）
     *
     * @param journeyId 旅程 UUID
     * @return 章節列表
     */
    List<Chapter> findByJourneyIdOrderByOrderIndex(UUID journeyId);

    /**
     * 根據旅程 slug 查詢章節（包含 lessons 和 gyms）
     *
     * @param slug 旅程 slug
     * @return 章節列表
     */
    @Query("SELECT DISTINCT c FROM Chapter c " +
           "LEFT JOIN FETCH c.lessons " +
           "LEFT JOIN FETCH c.gyms g " +
           "LEFT JOIN FETCH g.challenges " +
           "WHERE c.journey.slug = :slug " +
           "ORDER BY c.orderIndex")
    List<Chapter> findByJourneySlugWithLessonsAndGyms(@Param("slug") String slug);

    /**
     * 根據 external_id 查詢章節
     *
     * @param externalId 外部 ID
     * @return 章節資料（若存在）
     */
    Optional<Chapter> findByExternalId(Integer externalId);
}
