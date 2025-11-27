package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 最後觀看位置 DTO
 * 用於 GET /api/journeys/{slug}/last-watched 回應
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LastWatchedDto {

    /** 章節外部 ID */
    private Integer chapterId;

    /** 課程外部 ID */
    private Integer lessonId;

    /** 最後觀看的影片秒數位置 */
    private Integer lastPositionSeconds;
}
