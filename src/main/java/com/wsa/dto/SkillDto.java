package com.wsa.dto;

import com.wsa.entity.Skill;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 技能資料傳輸物件
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SkillDto {

    /** 外部 ID */
    private Integer id;

    /** 技能名稱 */
    private String name;

    /**
     * 從 Entity 建立 DTO
     */
    public static SkillDto from(Skill skill) {
        return SkillDto.builder()
                .id(skill.getExternalId())
                .name(skill.getName())
                .build();
    }
}
