package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * R1.5: 訂單付款回應
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PayOrderResponse {
    /** 訂單狀態 */
    private String status;

    /** 付款完成時間 */
    private LocalDateTime paidAt;
}
