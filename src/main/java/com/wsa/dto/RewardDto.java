package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 獎勵資料傳輸物件
 * 用於課程、章節、單元的獎勵欄位
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RewardDto {

    /** 經驗值 */
    private Integer exp;

    /** 金幣 */
    private Integer coin;

    /** 訂閱延長天數 */
    private Integer subscriptionExtensionDays;

    /** 外部獎勵描述 */
    private String externalRewardDescription;

    /**
     * 建立空獎勵
     */
    public static RewardDto empty() {
        return RewardDto.builder()
                .exp(0)
                .coin(0)
                .subscriptionExtensionDays(0)
                .build();
    }

    /**
     * 從嵌入欄位建立 DTO
     */
    public static RewardDto of(Integer exp, Integer coin, Integer subscriptionDays, String externalDesc) {
        return RewardDto.builder()
                .exp(exp != null ? exp : 0)
                .coin(coin != null ? coin : 0)
                .subscriptionExtensionDays(subscriptionDays != null ? subscriptionDays : 0)
                .externalRewardDescription(externalDesc)
                .build();
    }
}
