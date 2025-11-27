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
 * 旅程實體類別
 * 對應復刻網站的課程資料結構
 */
@Entity
@Table(name = "journeys")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Journey {

    /** 旅程唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 外部 ID（對應 JSON 中的 id） */
    @Column(name = "external_id", nullable = false, unique = true)
    private Integer externalId;

    /** 旅程名稱 */
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    /** URL slug（用於路由） */
    @Column(name = "slug", nullable = false, unique = true, length = 100)
    private String slug;

    /** 課程描述 */
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    /** 講師名稱 */
    @Column(name = "teacher_name", length = 100)
    private String teacherName;

    /** 價格（新台幣）- 現價 */
    @Column(name = "price_twd", nullable = false)
    @Builder.Default
    private Integer priceTwd = 0;

    /** 原價（新台幣） */
    @Column(name = "original_price_twd")
    @Builder.Default
    private Integer originalPriceTwd = 0;

    /** 最低分期金額（24期） */
    @Column(name = "monthly_payment")
    @Builder.Default
    private Integer monthlyPayment = 0;

    /** 縮圖 URL */
    @Column(name = "thumbnail_url", length = 500)
    private String thumbnailUrl;

    /** 難度標籤 */
    @Column(name = "level_tag", length = 50)
    private String levelTag;

    /** 封面圖示 */
    @Column(name = "cover_icon", length = 100)
    private String coverIcon;

    /** 關聯的技能（多對多） */
    @ManyToMany
    @JoinTable(
        name = "journey_skills",
        joinColumns = @JoinColumn(name = "journey_id"),
        inverseJoinColumns = @JoinColumn(name = "skill_id")
    )
    @Builder.Default
    private Set<Skill> skills = new HashSet<>();

    /** 關聯的章節（一對多） */
    @OneToMany(mappedBy = "journey", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("orderIndex ASC")
    @Builder.Default
    private Set<Chapter> chapters = new HashSet<>();

    /** 關聯的任務（一對多） */
    @OneToMany(mappedBy = "journey", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<Mission> missions = new HashSet<>();

    /** 建立時間（自動產生） */
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /** 更新時間（自動更新） */
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}
