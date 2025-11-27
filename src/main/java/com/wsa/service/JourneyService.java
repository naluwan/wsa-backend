package com.wsa.service;

import com.wsa.dto.*;
import com.wsa.entity.Chapter;
import com.wsa.entity.Journey;
import com.wsa.entity.Lesson;
import com.wsa.entity.User;
import com.wsa.entity.UserLessonProgress;
import com.wsa.repository.ChapterRepository;
import com.wsa.repository.JourneyRepository;
import com.wsa.repository.LessonRepository;
import com.wsa.repository.UserLessonProgressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * 旅程服務
 * 處理旅程相關的業務邏輯，包含旅程列表、詳情、章節、課程等
 */
@Service
@RequiredArgsConstructor
public class JourneyService {

    private final JourneyRepository journeyRepository;
    private final ChapterRepository chapterRepository;
    private final LessonRepository lessonRepository;
    private final UserLessonProgressRepository lessonProgressRepository;
    private final JourneyAccessService journeyAccessService;
    private final XpService xpService;

    /**
     * 取得所有旅程列表
     *
     * @param userId 使用者 ID（可為 null，表示未登入）
     * @return 旅程列表（包含使用者購買狀態）
     */
    @Transactional(readOnly = true)
    public List<JourneyListItemDto> getAllJourneys(UUID userId) {
        List<Journey> journeys = journeyRepository.findAllWithSkills();

        return journeys.stream()
                .map(journey -> {
                    boolean isOwned = journeyAccessService.ownsJourney(userId, journey.getSlug());
                    return JourneyListItemDto.from(journey, isOwned);
                })
                .collect(Collectors.toList());
    }

    /**
     * 根據 slug 取得旅程詳情
     *
     * @param slug 旅程 slug（例如：software-design-pattern）
     * @param userId 使用者 ID（可為 null，表示未登入）
     * @return 旅程詳情（包含使用者購買狀態）
     */
    @Transactional(readOnly = true)
    public JourneyDetailDto getJourneyBySlug(String slug, UUID userId) {
        Journey journey = journeyRepository.findBySlugWithSkillsAndChapters(slug)
                .orElseThrow(() -> new RuntimeException("找不到旅程：" + slug));

        boolean isOwned = journeyAccessService.ownsJourney(userId, slug);
        return JourneyDetailDto.from(journey, isOwned);
    }

    /**
     * 根據旅程 slug 取得章節列表（包含 lessons 和 gyms）
     *
     * @param slug 旅程 slug
     * @return 章節列表
     */
    @Transactional(readOnly = true)
    public List<ChapterDetailDto> getChaptersByJourneySlug(String slug) {
        // 先確認旅程存在
        if (!journeyRepository.findBySlug(slug).isPresent()) {
            throw new RuntimeException("找不到旅程：" + slug);
        }

        List<Chapter> chapters = chapterRepository.findByJourneySlugWithLessonsAndGyms(slug);

        return chapters.stream()
                .map(ChapterDetailDto::from)
                .collect(Collectors.toList());
    }

    /**
     * 根據旅程 slug 和 lesson ID 取得課程詳情
     *
     * @param slug 旅程 slug
     * @param lessonId lesson 外部 ID
     * @param userId 使用者 UUID（可為 null，表示未登入）
     * @return 課程詳情
     */
    @Transactional(readOnly = true)
    public LessonDetailDto getLessonBySlugAndId(String slug, Integer lessonId, UUID userId) {
        Lesson lesson = lessonRepository.findByJourneySlugAndExternalId(slug, lessonId)
                .orElseThrow(() -> new RuntimeException(
                        String.format("找不到課程：旅程=%s, lessonId=%d", slug, lessonId)));

        LessonDetailDto dto = LessonDetailDto.from(lesson);

        // 設定存取權限相關欄位
        // TODO: 整合 UserCourseService 或 UserJourneyService 來計算實際權限
        // 目前先根據 premiumOnly 簡單判斷
        boolean canAccess = calculateCanAccess(userId, lesson);
        dto.setCanAccess(canAccess);

        // 從 user_lesson_progress 取得完成狀態和上次觀看位置
        boolean isCompleted = false;
        int lastPositionSeconds = 0;

        if (userId != null) {
            UserLessonProgress progress = lessonProgressRepository
                    .findByUserIdAndLessonId(userId, lesson.getId())
                    .orElse(null);

            if (progress != null) {
                isCompleted = progress.getCompletedAt() != null;
                lastPositionSeconds = progress.getLastPositionSeconds() != null
                        ? progress.getLastPositionSeconds()
                        : 0;
            }
        }

        dto.setIsCompleted(isCompleted);
        dto.setLastPositionSeconds(lastPositionSeconds);

        return dto;
    }

    /**
     * 計算使用者是否可以存取特定課程
     *
     * 存取規則：
     * - 若 userId == null（未登入）→ false
     * - 若 premiumOnly == false → true（免費課程）
     * - 若 premiumOnly == true → 檢查使用者是否已購買對應的課程
     *
     * @param userId 使用者 ID（null 表示未登入）
     * @param lesson 課程實體
     * @return true 表示可以存取，false 表示無法存取
     */
    private boolean calculateCanAccess(UUID userId, Lesson lesson) {
        // 未登入 → 無法存取任何課程
        if (userId == null) {
            return false;
        }

        // 非付費內容 → 可存取
        if (!lesson.getPremiumOnly()) {
            return true;
        }

        // 付費內容 → 檢查使用者是否已購買對應的課程
        // 取得 lesson 所屬的 journey slug
        Journey journey = lesson.getChapter().getJourney();
        if (journey == null) {
            return false;
        }

        // 使用 JourneyAccessService 進行權限判斷
        return journeyAccessService.ownsJourney(userId, journey.getSlug());
    }

    /**
     * 完成課程並獲得經驗值
     *
     * 重要：
     * - 此方法會將 completedAt 設為目前時間
     * - 若該課程已有進度記錄（觀看中），則更新現有記錄
     * - 若該課程無進度記錄，則建立新記錄
     * - 若已經完成過，會拋出例外，不會重複給予經驗值
     *
     * 注意：此方法使用 user_unit_progress 表來記錄進度，
     *       lesson.id（UUID）作為 unit_id 存入。
     *
     * @param slug 旅程 slug
     * @param lessonId lesson 外部 ID（external_id）
     * @param userId 使用者 UUID
     * @return 完成課程後的回應資料
     * @throws RuntimeException 找不到課程時拋出
     * @throws RuntimeException 課程已完成過時拋出
     */
    @Transactional
    public CompleteUnitResponseDto completeLesson(String slug, Integer lessonId, UUID userId) {
        System.out.println("========================================");
        System.out.println("[JourneyService.completeLesson] 開始執行");
        System.out.println("[JourneyService.completeLesson] slug=" + slug + ", lessonId=" + lessonId + ", userId=" + userId);
        System.out.println("========================================");

        // 根據 slug 和 lessonId 查詢課程
        System.out.println("[JourneyService.completeLesson] 準備呼叫 findByJourneySlugAndExternalId...");
        Lesson lesson = lessonRepository.findByJourneySlugAndExternalId(slug, lessonId)
                .orElseThrow(() -> {
                    System.out.println("[JourneyService.completeLesson] ❌ 找不到課程！");
                    System.out.println("[JourneyService.completeLesson] 嘗試用 findByExternalId 單獨查詢...");
                    var byExtId = lessonRepository.findByExternalId(lessonId);
                    if (byExtId.isPresent()) {
                        var l = byExtId.get();
                        System.out.println("[JourneyService.completeLesson] 用 externalId 找到了！");
                        System.out.println("[JourneyService.completeLesson] lesson.id=" + l.getId());
                        System.out.println("[JourneyService.completeLesson] lesson.journey=" + (l.getJourney() != null ? l.getJourney().getSlug() : "NULL"));
                    } else {
                        System.out.println("[JourneyService.completeLesson] 用 externalId 也找不到！");
                    }
                    return new RuntimeException(
                            String.format("找不到課程：旅程=%s, lessonId=%d", slug, lessonId));
                });
        System.out.println("[JourneyService.completeLesson] ✅ 找到課程：" + lesson.getName());

        // 使用 lesson.id（UUID）作為 lesson_id
        UUID lessonUUID = lesson.getId();

        // 查詢是否已有進度記錄
        UserLessonProgress progress = lessonProgressRepository
                .findByUserIdAndLessonId(userId, lessonUUID)
                .orElse(null);

        // 檢查是否已經完成過（completedAt 不為 null）
        if (progress != null && progress.getCompletedAt() != null) {
            throw new RuntimeException("課程已經完成過了");
        }

        if (progress == null) {
            // 若不存在進度記錄，建立新記錄
            progress = UserLessonProgress.builder()
                    .userId(userId)
                    .lessonId(lessonUUID)
                    .lastPositionSeconds(0)
                    .lastWatchedAt(null)
                    .build();
        }

        // 設定完成時間
        progress.setCompletedAt(LocalDateTime.now());

        // 保存進度記錄
        lessonProgressRepository.save(progress);

        // 取得經驗值獎勵（使用 lesson 的 rewardExp 欄位）
        Integer xpEarned = lesson.getRewardExp();

        // 增加經驗值並更新等級
        User updatedUser = xpService.addXp(userId, xpEarned);

        // 建立回應（unitId 欄位使用 lesson 的 externalId 轉字串，保持前端相容性）
        return CompleteUnitResponseDto.builder()
                .user(CompleteUnitResponseDto.UserInfo.builder()
                        .id(updatedUser.getId().toString())
                        .level(updatedUser.getLevel())
                        .totalXp(updatedUser.getTotalXp())
                        .weeklyXp(updatedUser.getWeeklyXp())
                        .build())
                .unit(CompleteUnitResponseDto.UnitInfo.builder()
                        .unitId(String.valueOf(lesson.getExternalId()))
                        .isCompleted(true)
                        .xpEarned(xpEarned)
                        .build())
                .build();
    }

    /**
     * 取得使用者在特定旅程下已完成的 lesson ID 列表
     *
     * @param slug 旅程 slug
     * @param userId 使用者 UUID
     * @return 已完成的 lesson external ID 列表
     */
    @Transactional(readOnly = true)
    public List<Integer> getCompletedLessonIds(String slug, UUID userId) {
        if (userId == null) {
            return List.of();
        }

        // 查詢使用者在此旅程下所有已完成的 lesson
        List<UserLessonProgress> completedProgress = lessonProgressRepository
                .findCompletedByUserIdAndJourneySlug(userId, slug);

        // 取得 lesson UUID 列表
        List<UUID> lessonUUIDs = completedProgress.stream()
                .map(UserLessonProgress::getLessonId)
                .collect(Collectors.toList());

        if (lessonUUIDs.isEmpty()) {
            return List.of();
        }

        // 查詢這些 lesson 的 external_id
        return lessonRepository.findAllById(lessonUUIDs).stream()
                .map(Lesson::getExternalId)
                .collect(Collectors.toList());
    }

    /**
     * 取得使用者在特定旅程下最後觀看的課程位置
     *
     * 用途：讓使用者點擊「進入課程」時，可以從上次觀看的位置繼續
     *
     * @param slug 旅程 slug
     * @param userId 使用者 UUID
     * @return 最後觀看位置（若無記錄則返回 null）
     */
    @Transactional(readOnly = true)
    public LastWatchedDto getLastWatched(String slug, UUID userId) {
        if (userId == null) {
            return null;
        }

        // 查詢使用者在此旅程下最後觀看的進度記錄
        return lessonProgressRepository.findLastWatchedByUserIdAndJourneySlug(userId, slug)
                .map(progress -> {
                    // 根據 lessonId（UUID）查詢 Lesson，取得 externalId 和 chapterId
                    Lesson lesson = lessonRepository.findById(progress.getLessonId())
                            .orElse(null);

                    if (lesson == null) {
                        return null;
                    }

                    // 取得 chapter 的 external_id
                    Chapter chapter = lesson.getChapter();
                    Integer chapterExternalId = chapter != null ? chapter.getExternalId() : null;

                    return LastWatchedDto.builder()
                            .chapterId(chapterExternalId)
                            .lessonId(lesson.getExternalId())
                            .lastPositionSeconds(progress.getLastPositionSeconds())
                            .build();
                })
                .orElse(null);
    }

    /**
     * 更新使用者的課程觀看進度（秒數）
     *
     * 行為：
     * - 若進度記錄不存在，建立新記錄（completedAt = null）
     * - 若進度記錄已存在，更新 lastPositionSeconds 和 lastWatchedAt
     * - 不修改 completedAt（保持原值）
     * - 不增加 XP 或等級
     *
     * @param slug 旅程 slug
     * @param lessonId lesson 外部 ID
     * @param userId 使用者 UUID
     * @param lastPositionSeconds 最後觀看秒數
     * @return 更新後的進度資訊
     */
    @Transactional
    public LessonProgressDto updateLessonProgress(String slug, Integer lessonId, UUID userId, int lastPositionSeconds) {
        // 根據 slug 和 lessonId 查詢課程
        Lesson lesson = lessonRepository.findByJourneySlugAndExternalId(slug, lessonId)
                .orElseThrow(() -> new RuntimeException(
                        String.format("找不到課程：旅程=%s, lessonId=%d", slug, lessonId)));

        // 查詢是否已有進度記錄
        UserLessonProgress progress = lessonProgressRepository
                .findByUserIdAndLessonId(userId, lesson.getId())
                .orElse(null);

        if (progress == null) {
            // 若不存在進度記錄，建立新記錄
            progress = UserLessonProgress.builder()
                    .userId(userId)
                    .lessonId(lesson.getId())
                    .lastPositionSeconds(lastPositionSeconds)
                    .lastWatchedAt(LocalDateTime.now())
                    .build();
        } else {
            // 更新現有記錄
            progress.setLastPositionSeconds(lastPositionSeconds);
            progress.setLastWatchedAt(LocalDateTime.now());
        }

        // 保存進度記錄
        lessonProgressRepository.save(progress);

        // 回傳進度資訊
        return LessonProgressDto.builder()
                .lessonId(lessonId)
                .lastPositionSeconds(lastPositionSeconds)
                .build();
    }
}
