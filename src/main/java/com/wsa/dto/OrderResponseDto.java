package com.wsa.dto;

import com.wsa.entity.Order;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * R1.5: 訂單回應 DTO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderResponseDto {
    private UUID id;
    private String orderNo;
    private UUID userId;
    private UUID courseId;
    private String courseTitle;  // 課程名稱
    private String courseSlug;   // 課程 slug（用於前端跳轉）
    private Integer amount;
    private String status;
    private LocalDateTime payDeadline;
    private LocalDateTime paidAt;
    private String memo;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    /**
     * 從 Order entity 轉換為 DTO
     */
    public static OrderResponseDto from(Order order, String courseTitle) {
        return from(order, courseTitle, null);
    }

    /**
     * 從 Order entity 轉換為 DTO（含 courseSlug）
     */
    public static OrderResponseDto from(Order order, String courseTitle, String courseSlug) {
        return OrderResponseDto.builder()
                .id(order.getId())
                .orderNo(order.getOrderNo())
                .userId(order.getUserId())
                .courseId(order.getCourseId())
                .courseTitle(courseTitle)
                .courseSlug(courseSlug)
                .amount(order.getAmount())
                .status(order.getStatus())
                .payDeadline(order.getPayDeadline())
                .paidAt(order.getPaidAt())
                .memo(order.getMemo())
                .createdAt(order.getCreatedAt())
                .updatedAt(order.getUpdatedAt())
                .build();
    }
}
