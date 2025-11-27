package com.wsa.repository;

import com.wsa.entity.Challenge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 挑戰資料存取介面
 * 提供挑戰資料的查詢與持久化操作
 */
@Repository
public interface ChallengeRepository extends JpaRepository<Challenge, UUID> {

    /**
     * 根據道館 ID 查詢挑戰
     *
     * @param gymId 道館 UUID
     * @return 挑戰列表
     */
    List<Challenge> findByGymId(UUID gymId);

    /**
     * 根據 external_id 查詢挑戰
     *
     * @param externalId 外部 ID
     * @return 挑戰資料（若存在）
     */
    Optional<Challenge> findByExternalId(Integer externalId);
}
