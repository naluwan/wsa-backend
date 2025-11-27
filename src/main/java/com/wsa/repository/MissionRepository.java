package com.wsa.repository;

import com.wsa.entity.Mission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

/**
 * 任務資料存取介面
 * 提供任務資料的查詢與持久化操作
 */
@Repository
public interface MissionRepository extends JpaRepository<Mission, UUID> {

    /**
     * 根據旅程 ID 查詢任務
     *
     * @param journeyId 旅程 UUID
     * @return 任務列表
     */
    List<Mission> findByJourneyId(UUID journeyId);
}
