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
 * R1.5: 訂單實體類別
 * 儲存課程購買訂單資料，包含訂單編號、金額、狀態、付款期限等資訊
 */
@Entity
@Table(name = "orders")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    /** 訂單唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 訂單編號（格式：YYYYMMDDHHmmss + 4位十六進位亂碼） */
    @Column(name = "order_no", nullable = false, unique = true, length = 50)
    private String orderNo;

    /** 購買使用者 ID */
    @Column(name = "user_id", nullable = false)
    private UUID userId;

    /**
     * 購買課程 ID（Fast R6: 已棄用，改用 journey_id）
     * 保留此欄位以相容舊資料，新訂單此欄位為 null
     */
    @Column(name = "course_id", nullable = true)
    private UUID courseId;

    /** Journey ID（R4 新增：對應購買的 Journey，舊訂單為 null）*/
    @Column(name = "journey_id")
    private UUID journeyId;

    /** 訂單金額（單位：元） */
    @Column(name = "amount", nullable = false)
    private Integer amount;

    /**
     * 訂單狀態
     * - pending: 待付款
     * - paid: 已付款
     * - cancelled: 已取消
     */
    @Column(name = "status", nullable = false, length = 20)
    @Builder.Default
    private String status = "pending";

    /** 付款期限（建立訂單後3天） */
    @Column(name = "pay_deadline", nullable = false)
    private LocalDateTime payDeadline;

    /** 完成付款時間（null 表示尚未付款） */
    @Column(name = "paid_at")
    private LocalDateTime paidAt;

    /** 備註（如：期限內未完成付款） */
    @Column(name = "memo", columnDefinition = "TEXT")
    private String memo;

    /** 建立時間（自動產生） */
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /** 更新時間（自動更新） */
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    /**
     * 訂單狀態枚舉
     */
    public static class Status {
        public static final String PENDING = "pending";
        public static final String PAID = "paid";
        public static final String CANCELLED = "cancelled";
    }
}
