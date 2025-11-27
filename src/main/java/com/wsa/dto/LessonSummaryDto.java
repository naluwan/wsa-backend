package com.wsa.dto;

import com.wsa.entity.Lesson;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 課程單元摘要 DTO
 * 用於章節詳情中的課程列表
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LessonSummaryDto {

    /** 外部 ID */
    private Integer id;

    /** 課程名稱 */
    private String name;

    /** 課程類型：scroll, video, google-form */
    private String type;

    /** 排序索引 */
    private Integer orderIndex;

    /** 是否僅限付費會員 */
    private Boolean premiumOnly;

    /** 影片長度 */
    private String videoLength;

    /** 獎勵 */
    private RewardDto reward;

    /**
     * 從 Entity 建立 DTO
     */
    public static LessonSummaryDto from(Lesson lesson) {
        return LessonSummaryDto.builder()
                .id(lesson.getExternalId())
                .name(lesson.getName())
                .type(lesson.getType())
                .orderIndex(lesson.getOrderIndex())
                .premiumOnly(lesson.getPremiumOnly())
                .videoLength(lesson.getVideoLength())
                .reward(RewardDto.of(
                        lesson.getRewardExp(),
                        lesson.getRewardCoin(),
                        lesson.getRewardSubscriptionExtensionDays(),
                        lesson.getRewardExternalDescription()))
                .build();
    }
}
