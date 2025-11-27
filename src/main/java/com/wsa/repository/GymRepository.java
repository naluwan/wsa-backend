package com.wsa.repository;

import com.wsa.entity.Gym;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 道館資料存取介面
 * 提供道館資料的查詢與持久化操作
 */
@Repository
public interface GymRepository extends JpaRepository<Gym, UUID> {

    /**
     * 根據章節 ID 查詢道館（按 orderIndex 排序）
     *
     * @param chapterId 章節 UUID
     * @return 道館列表
     */
    List<Gym> findByChapterIdOrderByOrderIndex(UUID chapterId);

    /**
     * 根據 external_id 查詢道館
     *
     * @param externalId 外部 ID
     * @return 道館資料（若存在）
     */
    Optional<Gym> findByExternalId(Integer externalId);

    /**
     * 根據道館 ID 查詢道館（包含挑戰）
     *
     * @param id 道館 UUID
     * @return 道館資料（若存在）
     */
    @Query("SELECT g FROM Gym g LEFT JOIN FETCH g.challenges WHERE g.id = :id")
    Optional<Gym> findByIdWithChallenges(@Param("id") UUID id);
}
