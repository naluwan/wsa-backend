package com.wsa.repository;

import com.wsa.entity.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

/**
 * 技能資料存取介面
 * 提供技能資料的查詢與持久化操作
 */
@Repository
public interface SkillRepository extends JpaRepository<Skill, UUID> {

    /**
     * 根據 external_id 查詢技能
     *
     * @param externalId 外部 ID
     * @return 技能資料（若存在）
     */
    Optional<Skill> findByExternalId(Integer externalId);

    /**
     * 根據名稱查詢技能
     *
     * @param name 技能名稱
     * @return 技能資料（若存在）
     */
    Optional<Skill> findByName(String name);
}
