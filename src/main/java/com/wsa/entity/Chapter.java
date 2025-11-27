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
 * 章節實體類別
 * 對應 Journey 下的 Chapter，包含 Lesson 和 Gym
 */
@Entity
@Table(name = "chapters")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Chapter {

    /** 章節唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 外部 ID（對應 JSON 中的 id） */
    @Column(name = "external_id", nullable = false, unique = true)
    private Integer externalId;

    /** 所屬旅程 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "journey_id", nullable = false)
    private Journey journey;

    /** 章節名稱 */
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    /** 排序索引 */
    @Column(name = "order_index", nullable = false)
    @Builder.Default
    private Integer orderIndex = 0;

    /** 是否需要密碼 */
    @Column(name = "password_required", nullable = false)
    @Builder.Default
    private Boolean passwordRequired = false;

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

    // ========== 關聯 ==========

    /** 關聯的課程（一對多） */
    @OneToMany(mappedBy = "chapter", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("orderIndex ASC")
    @Builder.Default
    private Set<Lesson> lessons = new HashSet<>();

    /** 關聯的道館（一對多） */
    @OneToMany(mappedBy = "chapter", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("orderIndex ASC")
    @Builder.Default
    private Set<Gym> gyms = new HashSet<>();

    /** 建立時間（自動產生） */
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /** 更新時間（自動更新） */
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}
