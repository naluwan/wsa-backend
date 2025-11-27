package com.wsa.repository;

import com.wsa.entity.Journey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 旅程資料存取介面
 * 提供旅程資料的查詢與持久化操作
 */
@Repository
public interface JourneyRepository extends JpaRepository<Journey, UUID> {

    /**
     * 根據 slug 查詢旅程
     *
     * @param slug URL slug（例如：software-design-pattern）
     * @return 旅程資料（若存在）
     */
    Optional<Journey> findBySlug(String slug);

    /**
     * 根據 external_id 查詢旅程
     *
     * @param externalId 外部 ID
     * @return 旅程資料（若存在）
     */
    Optional<Journey> findByExternalId(Integer externalId);

    /**
     * 查詢所有旅程（包含技能）
     *
     * @return 旅程列表
     */
    @Query("SELECT DISTINCT j FROM Journey j LEFT JOIN FETCH j.skills ORDER BY j.externalId")
    List<Journey> findAllWithSkills();

    /**
     * 根據 slug 查詢旅程（包含技能和章節）
     *
     * @param slug URL slug
     * @return 旅程資料（若存在）
     */
    @Query("SELECT j FROM Journey j " +
           "LEFT JOIN FETCH j.skills " +
           "LEFT JOIN FETCH j.chapters " +
           "WHERE j.slug = :slug")
    Optional<Journey> findBySlugWithSkillsAndChapters(@Param("slug") String slug);
}
