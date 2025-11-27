package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * R4-5：診斷 API - 使用者 Journey 一致性檢查 DTO
 *
 * 用途：
 * - 比對 user_courses 和 user_journeys 的一致性
 * - 列出只在 user_courses 但不在 user_journeys 的記錄
 * - 供 R5 Backfill 前的診斷使用
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserJourneyConsistencyDto {

    /** 使用者 ID */
    private UUID userId;

    /** 課程 ID */
    private UUID courseId;

    /** 課程代碼（例如：SOFTWARE_DESIGN_PATTERN）*/
    private String courseCode;

    /** Journey slug（例如：software-design-pattern）*/
    private String journeySlug;

    /** 是否存在於 user_journeys */
    private boolean existsInUserJourneys;

    /** user_courses 建立時間 */
    private LocalDateTime userCoursesCreatedAt;
}
