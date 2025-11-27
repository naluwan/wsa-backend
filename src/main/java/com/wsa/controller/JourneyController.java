package com.wsa.controller;

import com.wsa.dto.ChapterDetailDto;
import com.wsa.dto.CompleteUnitResponseDto;
import com.wsa.dto.JourneyDetailDto;
import com.wsa.dto.JourneyListItemDto;
import com.wsa.dto.LastWatchedDto;
import com.wsa.dto.LessonDetailDto;
import com.wsa.dto.LessonProgressDto;
import com.wsa.service.JourneyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * 旅程相關 API Controller
 * 處理旅程查詢、詳情、章節與課程相關的 HTTP 請求
 *
 * API Endpoints:
 * - GET /api/journeys - 取得所有旅程列表
 * - GET /api/journeys/{slug} - 取得旅程詳情
 * - GET /api/journeys/{slug}/chapters - 取得旅程的章節列表（含 lessons 和 gyms）
 * - GET /api/journeys/{slug}/lessons/{lessonId} - 取得特定課程詳情
 * - POST /api/journeys/{slug}/lessons/{lessonId}/complete - 完成課程並獲得經驗值
 * - POST /api/journeys/{slug}/lessons/{lessonId}/progress - 更新課程觀看進度
 * - GET /api/journeys/{slug}/progress - 取得使用者已完成的 lesson ID 列表
 * - GET /api/journeys/{slug}/last-watched - 取得使用者最後觀看的課程位置
 */
@RestController
@RequestMapping("/api/journeys")
@RequiredArgsConstructor
public class JourneyController {

    private final JourneyService journeyService;

    /**
     * 取得所有旅程列表（公開端點，未登入也可存取）
     * GET /api/journeys
     *
     * @param authentication Spring Security 認證物件（可為 null）
     * @return 旅程列表（包含使用者購買狀態）
     *
     * Response Example:
     * [
     *   {
     *     "id": 0,
     *     "name": "軟體設計模式精通之旅",
     *     "slug": "software-design-pattern",
     *     "skills": [
     *       { "id": 101, "name": "軟體設計" },
     *       { "id": 102, "name": "物件導向" }
     *     ],
     *     "chapterCount": 9,
     *     "isOwned": true
     *   }
     * ]
     */
    @GetMapping
    public ResponseEntity<List<JourneyListItemDto>> getAllJourneys(Authentication authentication) {
        UUID userId = extractUserId(authentication);
        List<JourneyListItemDto> journeys = journeyService.getAllJourneys(userId);
        return ResponseEntity.ok(journeys);
    }

    /**
     * 取得旅程詳情（公開端點，未登入也可存取）
     * GET /api/journeys/{slug}
     *
     * @param slug 旅程 slug（例如：software-design-pattern）
     * @param authentication Spring Security 認證物件（可為 null）
     * @return 旅程詳情（包含技能、章節摘要和購買狀態）
     *
     * Response Example:
     * {
     *   "id": 0,
     *   "name": "軟體設計模式精通之旅",
     *   "slug": "software-design-pattern",
     *   "skills": [
     *     { "id": 101, "name": "軟體設計" }
     *   ],
     *   "chapters": [
     *     {
     *       "id": 0,
     *       "name": "出發吧！來一場設計模式旅程！",
     *       "orderIndex": 0,
     *       "passwordRequired": false,
     *       "reward": { "exp": 0, "coin": 0, "subscriptionExtensionDays": 0 },
     *       "lessonCount": 6,
     *       "gymCount": 0
     *     }
     *   ],
     *   "isOwned": true
     * }
     */
    @GetMapping("/{slug}")
    public ResponseEntity<JourneyDetailDto> getJourneyBySlug(
            @PathVariable String slug,
            Authentication authentication) {
        UUID userId = extractUserId(authentication);
        try {
            JourneyDetailDto journey = journeyService.getJourneyBySlug(slug, userId);
            return ResponseEntity.ok(journey);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 取得旅程的章節列表（包含 lessons 和 gyms）（公開端點，未登入也可存取）
     * GET /api/journeys/{slug}/chapters
     *
     * @param slug 旅程 slug
     * @return 章節列表（包含 lessons 和 gyms）
     *
     * Response Example:
     * [
     *   {
     *     "id": 0,
     *     "name": "出發吧！來一場設計模式旅程！",
     *     "orderIndex": 0,
     *     "passwordRequired": false,
     *     "reward": { "exp": 0, "coin": 0, "subscriptionExtensionDays": 0 },
     *     "lessons": [
     *       {
     *         "id": 1,
     *         "name": "設計的關鍵是：把無形變有形",
     *         "type": "video",
     *         "orderIndex": 0,
     *         "premiumOnly": false,
     *         "videoLength": "10:30",
     *         "reward": { "exp": 100, "coin": 0, "subscriptionExtensionDays": 0 }
     *       }
     *     ],
     *     "gyms": [
     *       {
     *         "id": 1,
     *         "code": "G1",
     *         "name": "第一道館",
     *         "type": "CHALLENGE",
     *         "difficulty": 1,
     *         "orderIndex": 0,
     *         "reward": { "exp": 500, "coin": 100, "subscriptionExtensionDays": 0 },
     *         "challengeCount": 3
     *       }
     *     ]
     *   }
     * ]
     */
    @GetMapping("/{slug}/chapters")
    public ResponseEntity<List<ChapterDetailDto>> getChaptersByJourneySlug(@PathVariable String slug) {
        try {
            List<ChapterDetailDto> chapters = journeyService.getChaptersByJourneySlug(slug);
            return ResponseEntity.ok(chapters);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 取得特定課程詳情（公開端點，但存取權限會影響回傳內容）
     * GET /api/journeys/{slug}/lessons/{lessonId}
     *
     * @param slug 旅程 slug
     * @param lessonId lesson 外部 ID
     * @param authentication Spring Security 認證物件（可為 null）
     * @return 課程詳情
     *
     * Response Example:
     * {
     *   "id": 1,
     *   "name": "設計的關鍵是：把無形變有形",
     *   "description": "這是一堂關於...",
     *   "type": "video",
     *   "premiumOnly": false,
     *   "videoLength": "10:30",
     *   "videoUrl": "https://...",
     *   "orderIndex": 0,
     *   "reward": { "exp": 100, "coin": 0, "subscriptionExtensionDays": 0 },
     *   "chapterId": 0,
     *   "chapterName": "出發吧！來一場設計模式旅程！",
     *   "journeySlug": "software-design-pattern",
     *   "canAccess": true,
     *   "isCompleted": false,
     *   "lastPositionSeconds": 0
     * }
     */
    @GetMapping("/{slug}/lessons/{lessonId}")
    public ResponseEntity<LessonDetailDto> getLessonBySlugAndId(
            @PathVariable String slug,
            @PathVariable Integer lessonId,
            Authentication authentication) {

        // 取得當前使用者 ID（未登入時為 null）
        UUID userId = extractUserId(authentication);

        try {
            LessonDetailDto lesson = journeyService.getLessonBySlugAndId(slug, lessonId, userId);
            return ResponseEntity.ok(lesson);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 完成課程並獲得經驗值
     * POST /api/journeys/{slug}/lessons/{lessonId}/complete
     *
     * 此端點需要登入才能使用。若未登入或 token 無效，將返回 401 Unauthorized。
     * 如果課程已經完成過，將返回 400 Bad Request。
     *
     * @param slug 旅程 slug（例如：software-design-pattern）
     * @param lessonId lesson 外部 ID
     * @param authentication Spring Security 認證物件
     * @return 完成後的回應資料，包含使用者經驗值更新資訊
     *
     * Response Example (Success 200):
     * {
     *   "user": {
     *     "id": "uuid-string",
     *     "level": 5,
     *     "totalXp": 3500,
     *     "weeklyXp": 500
     *   },
     *   "unit": {
     *     "unitId": "123",
     *     "isCompleted": true,
     *     "xpEarned": 100
     *   }
     * }
     *
     * Error Responses:
     * - 401 Unauthorized: 未登入
     * - 400 Bad Request: 課程已完成過
     * - 404 Not Found: 找不到旅程或課程
     */
    @PostMapping("/{slug}/lessons/{lessonId}/complete")
    public ResponseEntity<CompleteUnitResponseDto> completeLesson(
            @PathVariable String slug,
            @PathVariable Integer lessonId,
            Authentication authentication) {

        System.out.println("========================================");
        System.out.println("[JourneyController.completeLesson] 收到請求!");
        System.out.println("[JourneyController.completeLesson] slug=" + slug + ", lessonId=" + lessonId);
        System.out.println("========================================");

        // 取得當前使用者 ID（未登入時為 null）
        UUID userId = extractUserId(authentication);
        System.out.println("[JourneyController.completeLesson] userId=" + userId);

        // 若未登入，回傳 401 Unauthorized
        if (userId == null) {
            System.out.println("[JourneyController.completeLesson] userId 為 null，回傳 401");
            return ResponseEntity.status(401).build();
        }

        try {
            CompleteUnitResponseDto response = journeyService.completeLesson(slug, lessonId, userId);
            System.out.println("[JourneyController.completeLesson] 成功完成課程!");
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            System.out.println("[JourneyController.completeLesson] 發生錯誤: " + e.getMessage());
            String message = e.getMessage();
            if (message != null && message.contains("已經完成過")) {
                return ResponseEntity.badRequest().build();
            }
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 更新課程觀看進度（秒數）
     * POST /api/journeys/{slug}/lessons/{lessonId}/progress
     *
     * 此端點需要登入才能使用。用於保存使用者觀看影片的進度。
     * 不會增加 XP 或改變等級，純粹記錄觀看位置。
     *
     * @param slug 旅程 slug（例如：software-design-pattern）
     * @param lessonId lesson 外部 ID
     * @param request 包含 lastPositionSeconds 的請求
     * @param authentication Spring Security 認證物件
     * @return 更新後的進度資訊
     *
     * Request Example:
     * {
     *   "lastPositionSeconds": 120
     * }
     *
     * Response Example:
     * {
     *   "lessonId": 8001,
     *   "lastPositionSeconds": 120
     * }
     */
    @PostMapping("/{slug}/lessons/{lessonId}/progress")
    public ResponseEntity<LessonProgressDto> updateLessonProgress(
            @PathVariable String slug,
            @PathVariable Integer lessonId,
            @RequestBody UpdateProgressRequest request,
            Authentication authentication) {

        UUID userId = extractUserId(authentication);

        // 若未登入，回傳 401 Unauthorized
        if (userId == null) {
            return ResponseEntity.status(401).build();
        }

        try {
            // 處理負數秒數
            int lastPositionSeconds = Math.max(0, request.getLastPositionSeconds());

            LessonProgressDto progress = journeyService.updateLessonProgress(
                    slug, lessonId, userId, lastPositionSeconds);
            return ResponseEntity.ok(progress);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 取得使用者在特定旅程下已完成的 lesson ID 列表
     * GET /api/journeys/{slug}/progress
     *
     * 此端點需要登入才能取得進度資料。若未登入，返回空列表。
     *
     * @param slug 旅程 slug（例如：software-design-pattern）
     * @param authentication Spring Security 認證物件
     * @return 已完成的 lesson ID 列表
     *
     * Response Example:
     * {
     *   "completedLessonIds": [8001, 12, 13]
     * }
     */
    @GetMapping("/{slug}/progress")
    public ResponseEntity<?> getProgress(
            @PathVariable String slug,
            Authentication authentication) {

        UUID userId = extractUserId(authentication);

        List<Integer> completedIds = journeyService.getCompletedLessonIds(slug, userId);

        return ResponseEntity.ok(java.util.Map.of("completedLessonIds", completedIds));
    }

    /**
     * 取得使用者在特定旅程下最後觀看的課程位置
     * GET /api/journeys/{slug}/last-watched
     *
     * 此端點需要登入才能取得進度資料。若未登入或無進度記錄，返回 204 No Content。
     *
     * 用途：讓使用者點擊「進入課程」時，可以從上次觀看的位置繼續
     *
     * @param slug 旅程 slug（例如：software-design-pattern）
     * @param authentication Spring Security 認證物件
     * @return 最後觀看的課程位置
     *
     * Response Example (Success 200):
     * {
     *   "chapterId": 8,
     *   "lessonId": 8001,
     *   "lastPositionSeconds": 120
     * }
     *
     * Response (No Content 204):
     * 若未登入或無進度記錄
     */
    @GetMapping("/{slug}/last-watched")
    public ResponseEntity<LastWatchedDto> getLastWatched(
            @PathVariable String slug,
            Authentication authentication) {

        UUID userId = extractUserId(authentication);

        // 若未登入，回傳 204 No Content
        if (userId == null) {
            return ResponseEntity.noContent().build();
        }

        LastWatchedDto lastWatched = journeyService.getLastWatched(slug, userId);

        if (lastWatched == null) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.ok(lastWatched);
    }

    /**
     * 更新進度請求 DTO
     */
    @lombok.Data
    public static class UpdateProgressRequest {
        private int lastPositionSeconds;
    }

    /**
     * 從 Authentication 物件中提取使用者 ID
     *
     * @param authentication Spring Security 認證物件
     * @return 使用者 UUID（未登入時返回 null）
     */
    private UUID extractUserId(Authentication authentication) {
        if (authentication != null && authentication.getPrincipal() != null) {
            try {
                return (UUID) authentication.getPrincipal();
            } catch (ClassCastException e) {
                return null;
            }
        }
        return null;
    }
}
