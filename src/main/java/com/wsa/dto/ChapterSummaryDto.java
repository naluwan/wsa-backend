package com.wsa.dto;

import com.wsa.entity.Chapter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 章節摘要 DTO
 * 用於旅程詳情中的章節列表
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChapterSummaryDto {

    /** 外部 ID */
    private Integer id;

    /** 章節名稱 */
    private String name;

    /** 排序索引 */
    private Integer orderIndex;

    /** 是否需要密碼 */
    private Boolean passwordRequired;

    /** 獎勵 */
    private RewardDto reward;

    /** 課程數量 */
    private Integer lessonCount;

    /** 道館數量 */
    private Integer gymCount;

    /**
     * 從 Entity 建立 DTO
     */
    public static ChapterSummaryDto from(Chapter chapter) {
        return ChapterSummaryDto.builder()
                .id(chapter.getExternalId())
                .name(chapter.getName())
                .orderIndex(chapter.getOrderIndex())
                .passwordRequired(chapter.getPasswordRequired())
                .reward(RewardDto.of(
                        chapter.getRewardExp(),
                        chapter.getRewardCoin(),
                        chapter.getRewardSubscriptionExtensionDays(),
                        chapter.getRewardExternalDescription()))
                .lessonCount(chapter.getLessons() != null ? chapter.getLessons().size() : 0)
                .gymCount(chapter.getGyms() != null ? chapter.getGyms().size() : 0)
                .build();
    }
}
