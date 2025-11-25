package com.wsa.repository;

import com.wsa.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * R1.5: 訂單資料存取介面
 * 提供訂單資料的查詢與持久化操作
 */
@Repository
public interface OrderRepository extends JpaRepository<Order, UUID> {

    /**
     * 根據訂單編號查詢訂單
     *
     * @param orderNo 訂單編號
     * @return 訂單資料（若存在）
     */
    Optional<Order> findByOrderNo(String orderNo);

    /**
     * 查詢使用者的所有訂單
     * 按建立時間降序排列
     *
     * @param userId 使用者 ID
     * @return 訂單列表
     */
    @Query("SELECT o FROM Order o WHERE o.userId = :userId ORDER BY o.createdAt DESC")
    List<Order> findByUserIdOrderByCreatedAtDesc(@Param("userId") UUID userId);

    /**
     * 查詢特定課程的所有訂單
     * 按建立時間降序排列
     *
     * @param courseId 課程 ID
     * @return 訂單列表
     */
    @Query("SELECT o FROM Order o WHERE o.courseId = :courseId ORDER BY o.createdAt DESC")
    List<Order> findByCourseIdOrderByCreatedAtDesc(@Param("courseId") UUID courseId);

    /**
     * 查詢使用者特定課程的所有訂單
     *
     * @param userId 使用者 ID
     * @param courseId 課程 ID
     * @return 訂單列表
     */
    List<Order> findByUserIdAndCourseId(UUID userId, UUID courseId);

    /**
     * 查詢使用者的未完成訂單（pending 且尚未過期）
     *
     * @param userId 使用者 ID
     * @param status 訂單狀態
     * @param now 當前時間
     * @return 訂單列表
     */
    @Query("SELECT o FROM Order o WHERE o.userId = :userId AND o.status = :status AND o.payDeadline > :now")
    List<Order> findPendingOrdersByUserId(
        @Param("userId") UUID userId,
        @Param("status") String status,
        @Param("now") LocalDateTime now
    );

    /**
     * 查詢所有已過期但尚未取消的訂單
     * 用於定期檢查和自動取消過期訂單
     *
     * @param status 訂單狀態（pending）
     * @param now 當前時間
     * @return 訂單列表
     */
    @Query("SELECT o FROM Order o WHERE o.status = :status AND o.payDeadline <= :now")
    List<Order> findExpiredOrders(
        @Param("status") String status,
        @Param("now") LocalDateTime now
    );
}
