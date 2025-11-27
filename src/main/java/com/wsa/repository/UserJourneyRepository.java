package com.wsa.repository;

import com.wsa.entity.UserJourney;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 使用者 Journey 擁有權 Repository（R4 新增）
 *
 * 用途：
 * - 提供 Journey 購買記錄的資料庫操作方法
 * - 取代 UserCourseRepository（Phase R6）
 * - 支援 Journey Native 架構的權限判斷
 *
 * Phase R4：雙軌並行
 * - OrderService 付款成功後會同時寫入 user_journeys 和 user_courses
 * - JourneyAccessService.ownsJourney() 優先查詢此 Repository
 *
 * Phase R5：資料遷移
 * - Backfill 舊資料到 user_journeys 表
 *
 * Phase R6：完全移除
 * - 移除 UserCourseRepository
 */
@Repository
public interface UserJourneyRepository extends JpaRepository<UserJourney, UUID> {

    /**
     * 查詢使用者是否擁有特定 Journey
     *
     * @param userId    使用者 ID
     * @param journeyId Journey ID
     * @return 擁有權記錄（若存在）
     */
    Optional<UserJourney> findByUserIdAndJourneyId(UUID userId, UUID journeyId);

    /**
     * 查詢使用者擁有的所有 Journey
     *
     * @param userId 使用者 ID
     * @return 使用者擁有的所有 Journey 記錄清單
     */
    List<UserJourney> findAllByUserId(UUID userId);

    /**
     * 查詢特定 Journey 的所有擁有者
     *
     * @param journeyId Journey ID
     * @return 擁有該 Journey 的所有使用者記錄清單
     */
    List<UserJourney> findAllByJourneyId(UUID journeyId);

    /**
     * 檢查使用者是否擁有特定 Journey
     *
     * @param userId    使用者 ID
     * @param journeyId Journey ID
     * @return true 表示使用者擁有該 Journey，false 表示未擁有
     */
    boolean existsByUserIdAndJourneyId(UUID userId, UUID journeyId);

    /**
     * 刪除使用者的所有 Journey 購買記錄
     * 用途：重置使用者資料時使用
     *
     * 注意：
     * - @Modifying: 標示此方法會修改資料庫
     * - @Transactional: 確保在交易中執行
     *
     * @param userId 使用者 UUID
     */
    @Modifying
    @Transactional
    void deleteByUserId(UUID userId);
}
