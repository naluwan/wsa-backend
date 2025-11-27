package com.wsa.dto;

import com.wsa.entity.Lesson;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 課程單元詳情 DTO
 * 用於 GET /journeys/:slug/lessons/:lessonId 課程詳情
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LessonDetailDto {

    /** 外部 ID */
    private Integer id;

    /** 課程名稱 */
    private String name;

    /** 課程描述 */
    private String description;

    /** 課程類型：scroll, video, google-form */
    private String type;

    /** 是否僅限付費會員 */
    private Boolean premiumOnly;

    /** 影片長度 */
    private String videoLength;

    /** 影片 URL */
    private String videoUrl;

    /** 排序索引 */
    private Integer orderIndex;

    /** 獎勵 */
    private RewardDto reward;

    /** 所屬章節 ID */
    private Integer chapterId;

    /** 所屬章節名稱 */
    private String chapterName;

    /** 所屬旅程 slug */
    private String journeySlug;

    /** 使用者是否可存取 */
    private Boolean canAccess;

    /** 使用者是否已完成 */
    private Boolean isCompleted;

    /** 使用者上次觀看秒數 */
    private Integer lastPositionSeconds;

    /**
     * 從 Entity 建立 DTO（基本資料）
     */
    public static LessonDetailDto from(Lesson lesson) {
        return LessonDetailDto.builder()
                .id(lesson.getExternalId())
                .name(lesson.getName())
                .description(lesson.getDescription())
                .type(lesson.getType())
                .premiumOnly(lesson.getPremiumOnly())
                .videoLength(lesson.getVideoLength())
                .videoUrl(lesson.getVideoUrl())
                .orderIndex(lesson.getOrderIndex())
                .reward(RewardDto.of(
                        lesson.getRewardExp(),
                        lesson.getRewardCoin(),
                        lesson.getRewardSubscriptionExtensionDays(),
                        lesson.getRewardExternalDescription()))
                .chapterId(lesson.getChapter() != null ? lesson.getChapter().getExternalId() : null)
                .chapterName(lesson.getChapter() != null ? lesson.getChapter().getName() : null)
                .journeySlug(lesson.getJourney() != null ? lesson.getJourney().getSlug() : null)
                .canAccess(false) // 預設值，由 Service 層設定
                .isCompleted(false) // 預設值，由 Service 層設定
                .lastPositionSeconds(0) // 預設值，由 Service 層設定
                .build();
    }
}
