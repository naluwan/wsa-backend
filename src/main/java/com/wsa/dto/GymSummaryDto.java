package com.wsa.dto;

import com.wsa.entity.Gym;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 道館摘要 DTO
 * 用於章節詳情中的道館列表
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GymSummaryDto {

    /** 外部 ID */
    private Integer id;

    /** 道館代碼 */
    private String code;

    /** 道館名稱 */
    private String name;

    /** 道館類型：CHALLENGE, BOSS */
    private String type;

    /** 難度等級 */
    private Integer difficulty;

    /** 排序索引 */
    private Integer orderIndex;

    /** 獎勵 */
    private RewardDto reward;

    /** 挑戰數量 */
    private Integer challengeCount;

    /**
     * 從 Entity 建立 DTO
     */
    public static GymSummaryDto from(Gym gym) {
        return GymSummaryDto.builder()
                .id(gym.getExternalId())
                .code(gym.getCode())
                .name(gym.getName())
                .type(gym.getType())
                .difficulty(gym.getDifficulty())
                .orderIndex(gym.getOrderIndex())
                .reward(RewardDto.of(
                        gym.getRewardExp(),
                        gym.getRewardCoin(),
                        gym.getRewardSubscriptionExtensionDays(),
                        gym.getRewardExternalDescription()))
                .challengeCount(gym.getChallenges() != null ? gym.getChallenges().size() : 0)
                .build();
    }
}
