package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 課程進度 DTO
 * 用於回傳課程觀看進度更新結果
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LessonProgressDto {

    /** lesson 外部 ID */
    private Integer lessonId;

    /** 最後觀看秒數 */
    private Integer lastPositionSeconds;
}
