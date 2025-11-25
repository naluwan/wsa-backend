package com.wsa.dto;

import lombok.Data;
import java.util.UUID;

/**
 * R1.5: 建立訂單請求
 */
@Data
public class CreateOrderRequest {
    /** 課程 ID */
    private UUID courseId;
}
