package com.wsa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * 更新使用者個人資料請求 DTO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateUserProfileRequest {

    /** 使用者顯示名稱 */
    private String displayName;

    /** 使用者暱稱 */
    private String nickname;

    /** 使用者心理性別（男/女） */
    private String gender;

    /** 使用者職業 */
    private String occupation;

    /** 使用者生日 */
    private LocalDate birthday;

    /** 使用者所在地區（台灣/中國/新加波/其他地區） */
    private String location;

    /** 使用者 GitHub 連結 */
    private String githubUrl;

    /** 使用者頭像 URL */
    private String avatarUrl;
}
