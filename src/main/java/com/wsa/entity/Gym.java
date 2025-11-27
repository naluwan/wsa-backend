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
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/**
 * 道館實體類別
 * 對應 Chapter 下的 Gym（挑戰集）
 * type: CHALLENGE, BOSS
 */
@Entity
@Table(name = "gyms")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Gym {

    /** 道館唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 外部 ID（對應 JSON 中的 id） */
    @Column(name = "external_id", nullable = false, unique = true)
    private Integer externalId;

    /** 所屬章節 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chapter_id", nullable = false)
    private Chapter chapter;

    /** 所屬旅程（冗餘欄位，方便查詢） */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "journey_id", nullable = false)
    private Journey journey;

    /** 道館代碼 */
    @Column(name = "code", length = 50)
    private String code;

    /** 道館名稱 */
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    /** 道館描述 */
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    /** 類型：CHALLENGE, BOSS */
    @Column(name = "type", length = 20)
    private String type;

    /** 難度等級 */
    @Column(name = "difficulty", nullable = false)
    @Builder.Default
    private Integer difficulty = 1;

    /** 排序索引 */
    @Column(name = "order_index", nullable = false)
    @Builder.Default
    private Integer orderIndex = 0;

    // ========== Reward 嵌入欄位 ==========

    /** 經驗值獎勵 */
    @Column(name = "reward_exp", nullable = false)
    @Builder.Default
    private Integer rewardExp = 0;

    /** 金幣獎勵 */
    @Column(name = "reward_coin", nullable = false)
    @Builder.Default
    private Integer rewardCoin = 0;

    /** 訂閱延長天數獎勵 */
    @Column(name = "reward_subscription_extension_days", nullable = false)
    @Builder.Default
    private Integer rewardSubscriptionExtensionDays = 0;

    /** 外部獎勵描述 */
    @Column(name = "reward_external_description", columnDefinition = "TEXT")
    private String rewardExternalDescription;

    /** 相關課程 ID（JSON 陣列字串） */
    @Column(name = "related_lesson_ids", columnDefinition = "TEXT")
    private String relatedLessonIds;

    // ========== 關聯 ==========

    /** 關聯的挑戰（一對多） */
    @OneToMany(mappedBy = "gym", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<Challenge> challenges = new HashSet<>();

    /** 建立時間（自動產生） */
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /** 更新時間（自動更新） */
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}
