package com.wsa.dto;

import com.wsa.entity.Journey;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 旅程詳情 DTO
 * 用於 GET /journeys/:slug 詳情頁面
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class JourneyDetailDto {

    /** 外部 ID */
    private Integer id;

    /** 旅程名稱 */
    private String name;

    /** URL slug */
    private String slug;

    /** 課程描述 */
    private String description;

    /** 講師名稱 */
    private String teacherName;

    /** 價格（新台幣）- 現價 */
    private Integer priceTwd;

    /** 原價（新台幣） */
    private Integer originalPriceTwd;

    /** 最低分期金額（24期） */
    private Integer monthlyPayment;

    /** 縮圖 URL */
    private String thumbnailUrl;

    /** 難度標籤 */
    private String levelTag;

    /** 封面圖示 */
    private String coverIcon;

    /** 技能列表 */
    private List<SkillDto> skills;

    /** 章節列表 */
    private List<ChapterSummaryDto> chapters;

    /** 課程總數（lessons + gyms） */
    private Integer totalUnits;

    /** 使用者是否已購買此旅程 */
    private Boolean isOwned;

    /**
     * 從 Entity 建立 DTO（不帶購買狀態）
     */
    public static JourneyDetailDto from(Journey journey) {
        return from(journey, false);
    }

    /**
     * 從 Entity 建立 DTO（帶購買狀態）
     */
    public static JourneyDetailDto from(Journey journey, boolean isOwned) {
        // 計算課程總數（所有章節的 lessons + gyms）
        int totalUnits = 0;
        if (journey.getChapters() != null) {
            for (var chapter : journey.getChapters()) {
                if (chapter.getLessons() != null) {
                    totalUnits += chapter.getLessons().size();
                }
                if (chapter.getGyms() != null) {
                    totalUnits += chapter.getGyms().size();
                }
            }
        }

        return JourneyDetailDto.builder()
                .id(journey.getExternalId())
                .name(journey.getName())
                .slug(journey.getSlug())
                .description(journey.getDescription())
                .teacherName(journey.getTeacherName())
                .priceTwd(journey.getPriceTwd())
                .originalPriceTwd(journey.getOriginalPriceTwd())
                .monthlyPayment(journey.getMonthlyPayment())
                .thumbnailUrl(journey.getThumbnailUrl())
                .levelTag(journey.getLevelTag())
                .coverIcon(journey.getCoverIcon())
                .skills(journey.getSkills().stream()
                        .map(SkillDto::from)
                        .collect(Collectors.toList()))
                .chapters(journey.getChapters().stream()
                        .sorted((a, b) -> a.getOrderIndex().compareTo(b.getOrderIndex()))
                        .map(ChapterSummaryDto::from)
                        .collect(Collectors.toList()))
                .totalUnits(totalUnits)
                .isOwned(isOwned)
                .build();
    }
}
