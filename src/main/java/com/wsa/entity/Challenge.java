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
 * 挑戰實體類別
 * 對應 Gym 下的 Challenge
 * type: PRACTICAL_CHALLENGE, INSTANT_CHALLENGE
 */
@Entity
@Table(name = "challenges")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Challenge {

    /** 挑戰唯一識別碼（UUID 格式） */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    /** 外部 ID（對應 JSON 中的 id） */
    @Column(name = "external_id", nullable = false, unique = true)
    private Integer externalId;

    /** 所屬道館 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gym_id", nullable = false)
    private Gym gym;

    /** 類型：PRACTICAL_CHALLENGE, INSTANT_CHALLENGE */
    @Column(name = "type", length = 50)
    private String type;

    /** 挑戰名稱 */
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    /** 建議完成天數 */
    @Column(name = "recommend_duration_days")
    private Integer recommendDurationDays;

    /** 最大完成天數 */
    @Column(name = "max_duration_days")
    private Integer maxDurationDays;

    /** 建立時間（自動產生） */
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /** 更新時間（自動更新） */
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}
