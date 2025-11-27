package com.wsa.service;

import com.wsa.entity.Journey;
import com.wsa.repository.JourneyRepository;
import com.wsa.repository.LessonRepository;
import com.wsa.repository.UserJourneyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/**
 * Journey 權限服務
 *
 * Fast R6 更新：完全移除對舊 Course/Unit 架構的依賴
 *
 * 職責：
 *   1. 判斷使用者是否擁有某個 Journey（僅查詢 user_journeys）
 *   2. 判斷 Journey 是否有免費試看內容
 *
 * 變更歷史：
 *   - R4: 雙軌並行（user_journeys + user_courses fallback）
 *   - R5: hasFreePreview() 改用 Lesson 表
 *   - Fast R6: 移除所有 Course/UserCourse 依賴，100% Journey Native
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class JourneyAccessService {

    private final JourneyRepository journeyRepository;
    private final UserJourneyRepository userJourneyRepository;
    private final LessonRepository lessonRepository;

    /**
     * 判斷使用者是否擁有指定的 Journey（Fast R6 更新：僅查詢 user_journeys）
     *
     * Fast R6 變更：
     *   - 移除 user_courses fallback 邏輯
     *   - 僅查詢 user_journeys 表
     *   - 前提：R5 已完成 backfill，所有歷史購買記錄已在 user_journeys
     *
     * @param userId 使用者 UUID（可為 null，表示未登入）
     * @param slug Journey 的 slug（例如：software-design-pattern）
     * @return true 表示使用者已擁有此 Journey，false 表示未擁有或未登入
     */
    @Transactional(readOnly = true)
    public boolean ownsJourney(UUID userId, String slug) {
        if (userId == null || slug == null) {
            return false;
        }

        log.debug("[JourneyAccessService] Fast R6 ownsJourney: userId={}, slug={}", userId, slug);

        // Fast R6: Only check user_journeys (Journey Native)
        return journeyRepository.findBySlug(slug)
                .map(journey -> {
                    boolean owns = userJourneyRepository.existsByUserIdAndJourneyId(
                            userId, journey.getId());
                    log.debug("[JourneyAccessService] Fast R6 ownsJourney result: {}", owns);
                    return owns;
                })
                .orElse(false);
    }

    /**
     * 判斷指定的 Journey 是否有免費試看內容（R5 更新：使用 Lesson 表）
     *
     * R5 邏輯：
     *   1. 根據 Journey slug 查詢 Journey 表
     *   2. 查詢 lessons 表是否有 premium_only = false 的課程
     *
     * 變更原因：
     *   - 移除對舊 Unit 表的依賴
     *   - 直接使用 Journey 架構的 Lesson 表
     *   - premium_only = false 表示免費試看內容
     *
     * @param slug Journey 的 slug
     * @return true 表示有免費試看內容，false 表示沒有
     */
    @Transactional(readOnly = true)
    public boolean hasFreePreview(String slug) {
        if (slug == null) {
            return false;
        }

        log.debug("[JourneyAccessService] R5 hasFreePreview: slug={}", slug);

        return journeyRepository.findBySlug(slug)
                .map(journey -> {
                    boolean hasPreview = lessonRepository.findByJourneyIdOrderByOrderIndex(journey.getId())
                            .stream()
                            .anyMatch(lesson -> Boolean.FALSE.equals(lesson.getPremiumOnly()));
                    log.debug("[JourneyAccessService] R5 hasFreePreview result: {} (journeyId={})",
                            hasPreview, journey.getId());
                    return hasPreview;
                })
                .orElse(false);
    }

}
