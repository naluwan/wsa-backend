package com.wsa.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * 使用者 Journey 擁有權實體類別（R4 新增）
 *
 * 用途：
 * - 記錄使用者購買/擁有的 Journey，取代 UserCourse
 * - 用於實現 Journey 存取權限控制
 * - 支援 Journey Native 架構
 *
 * Phase R4：雙軌並行
 * - 新訂單付款成功後，同時寫入 user_journeys 和 user_courses
 * - JourneyAccessService.ownsJourney() 優先查此表，查不到再 fallback 到 user_courses
 *
 * Phase R5：資料遷移
 * - 將 user_courses 的記錄遷移到 user_journeys
 *
 * Phase R6：完全移除
 * - 移除 user_courses 表和 UserCourse entity
 */
@Entity
@Table(
    name = "user_journeys",
    uniqueConstraints = @UniqueConstraint(
        name = "uk_user_journeys_user_journey",
        columnNames = {"user_id", "journey_id"}
    )
)
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserJourney {

    /** 擁有權記錄唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 使用者 ID */
    @Column(name = "user_id", nullable = false)
    private UUID userId;

    /** Journey ID */
    @Column(name = "journey_id", nullable = false)
    private UUID journeyId;

    /** 購買時間 */
    @Column(name = "purchased_at", nullable = false)
    @Builder.Default
    private LocalDateTime purchasedAt = LocalDateTime.now();

    /** 建立時間（自動產生） */
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /** 更新時間（自動更新） */
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}
