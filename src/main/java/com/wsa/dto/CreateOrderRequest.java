package com.wsa.dto;

import lombok.Data;
import java.util.UUID;

/**
 * R1.5: 建立訂單請求
 * 支援兩種方式指定課程：
 * 1. courseId: 課程的 UUID（舊方式）
 * 2. slug: Journey 的 slug，會自動轉換成對應的 Course（新方式）
 */
@Data
public class CreateOrderRequest {
    /** 課程 ID（UUID 格式） */
    private UUID courseId;

    /** Journey slug（例如：software-design-pattern），會轉換成對應的 Course Code */
    private String slug;
}
