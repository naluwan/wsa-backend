package com.wsa.dto;

import com.wsa.entity.Challenge;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 挑戰 DTO
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChallengeDto {

    /** 外部 ID */
    private Integer id;

    /** 挑戰類型：PRACTICAL_CHALLENGE, INSTANT_CHALLENGE */
    private String type;

    /** 挑戰名稱 */
    private String name;

    /** 建議完成天數 */
    private Integer recommendDurationDays;

    /** 最大完成天數 */
    private Integer maxDurationDays;

    /**
     * 從 Entity 建立 DTO
     */
    public static ChallengeDto from(Challenge challenge) {
        return ChallengeDto.builder()
                .id(challenge.getExternalId())
                .type(challenge.getType())
                .name(challenge.getName())
                .recommendDurationDays(challenge.getRecommendDurationDays())
                .maxDurationDays(challenge.getMaxDurationDays())
                .build();
    }
}
