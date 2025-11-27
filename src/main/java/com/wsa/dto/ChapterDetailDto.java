package com.wsa.dto;

import com.wsa.entity.Chapter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 章節詳情 DTO
 * 用於 GET /journeys/:slug/chapters 章節列表
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChapterDetailDto {

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

    /** 課程列表 */
    private List<LessonSummaryDto> lessons;

    /** 道館列表 */
    private List<GymSummaryDto> gyms;

    /**
     * 從 Entity 建立 DTO
     */
    public static ChapterDetailDto from(Chapter chapter) {
        return ChapterDetailDto.builder()
                .id(chapter.getExternalId())
                .name(chapter.getName())
                .orderIndex(chapter.getOrderIndex())
                .passwordRequired(chapter.getPasswordRequired())
                .reward(RewardDto.of(
                        chapter.getRewardExp(),
                        chapter.getRewardCoin(),
                        chapter.getRewardSubscriptionExtensionDays(),
                        chapter.getRewardExternalDescription()))
                .lessons(chapter.getLessons().stream()
                        .sorted((a, b) -> a.getOrderIndex().compareTo(b.getOrderIndex()))
                        .map(LessonSummaryDto::from)
                        .collect(Collectors.toList()))
                .gyms(chapter.getGyms().stream()
                        .sorted((a, b) -> a.getOrderIndex().compareTo(b.getOrderIndex()))
                        .map(GymSummaryDto::from)
                        .collect(Collectors.toList()))
                .build();
    }
}
