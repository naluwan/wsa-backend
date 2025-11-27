package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * R4-5：診斷 API - 沒有 journey_id 的訂單 DTO
 *
 * 用途：
 * - 列出所有 orders.journey_id = NULL 的訂單
 * - 供 R5 Backfill 前的診斷使用
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderWithoutJourneyIdDto {

    /** 訂單編號 */
    private String orderNo;

    /** 使用者 ID */
    private UUID userId;

    /** 課程 ID */
    private UUID courseId;

    /** 課程代碼（例如：SOFTWARE_DESIGN_PATTERN）*/
    private String courseCode;

    /** 訂單狀態 */
    private String status;

    /** 建立時間 */
    private LocalDateTime createdAt;

    /** 付款時間（若已付款）*/
    private LocalDateTime paidAt;
}
