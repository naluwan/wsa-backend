package com.wsa.service;

import com.wsa.dto.OAuthLoginRequest;
import com.wsa.entity.User;
import com.wsa.repository.UserRepository;
import com.wsa.repository.UserLessonProgressRepository;
import com.wsa.repository.UserJourneyRepository;
import com.wsa.repository.OrderRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.UUID;

/**
 * 使用者服務類別（Fast R6 更新：100% Journey Native）
 *
 * Fast R6 變更：
 *   - 移除 UserUnitProgressRepository 依賴
 *   - 移除 UserCourseRepository 依賴
 *   - resetUserData() 僅清理 Journey 相關資料
 */
@Service
@Slf4j
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserLessonProgressRepository userLessonProgressRepository;

    @Autowired
    private UserJourneyRepository userJourneyRepository;

    @Autowired
    private OrderRepository orderRepository;

    /**
     * 建立新使用者或更新現有使用者資料
     * 根據 OAuth 提供者和外部 ID 判斷使用者是否已存在：
     * - 若已存在：更新使用者的顯示名稱、電子郵件與頭像
     * - 若不存在：建立新使用者，並初始化等級與經驗值
     *
     * @param request OAuth 登入請求資料
     * @return 建立或更新後的使用者實體
     */
    @Transactional
    public User createOrUpdateUser(OAuthLoginRequest request) {
        // 根據 provider 和 externalId 查詢使用者是否已存在
        Optional<User> existingUser = userRepository.findByProviderAndExternalId(
                request.getProvider(),
                request.getExternalId()
        );

        if (existingUser.isPresent()) {
            // 使用者已存在，更新資料（displayName、email、avatarUrl 可能會變更）
            User user = existingUser.get();
            user.setDisplayName(request.getDisplayName());
            user.setEmail(request.getEmail());
            user.setAvatarUrl(request.getAvatarUrl());
            return userRepository.save(user);
        } else {
            // 使用者不存在，建立新使用者
            // 初始等級為 1，經驗值為 0
            User newUser = User.builder()
                    .externalId(request.getExternalId())
                    .provider(request.getProvider())
                    .displayName(request.getDisplayName())
                    .email(request.getEmail())
                    .avatarUrl(request.getAvatarUrl())
                    .level(1)      // 新使用者初始等級為 1
                    .totalXp(0)    // 新使用者初始總經驗值為 0
                    .weeklyXp(0)   // 新使用者初始本週經驗值為 0
                    .build();
            return userRepository.save(newUser);
        }
    }

    /**
     * 重置使用者的所有學習資料（Fast R6 更新：僅清理 Journey 資料）
     *
     * Fast R6 變更：
     *   - 移除 user_unit_progress 清理（舊架構資料不再維護）
     *   - 移除 user_courses 清理（改為清理 user_journeys）
     *   - 僅清理 Journey 相關資料
     *
     * 功能：
     *   1. 清除所有課程觀看進度（user_lesson_progress）
     *   2. 清除所有 Journey 擁有記錄（user_journeys）
     *   3. 刪除所有訂單記錄（orders）
     *   4. 重置經驗值（totalXp = 0, weeklyXp = 0, level = 1）
     *
     * 使用場景：
     *   - 開發測試時重置資料
     *   - 使用者想要重新開始學習
     *
     * 注意：
     *   - 此操作無法復原
     *   - 使用 @Transactional 確保資料一致性
     *
     * @param userId 使用者 UUID
     * @return 重置後的使用者實體
     * @throws RuntimeException 當找不到使用者時
     */
    @Transactional
    public User resetUserData(UUID userId) {
        // 步驟 1：查詢使用者
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("找不到使用者：" + userId));

        log.info("[UserService] Fast R6: 開始重置使用者 {} 的資料（僅 Journey 世界）", userId);

        // 步驟 2：清除所有課程觀看進度（user_lesson_progress）
        userLessonProgressRepository.deleteByUserId(userId);
        log.info("[UserService] Fast R6: 已清除使用者 {} 的課程進度 (user_lesson_progress)", userId);

        // 步驟 3：清除所有 Journey 擁有記錄（user_journeys）
        userJourneyRepository.deleteByUserId(userId);
        log.info("[UserService] Fast R6: 已清除使用者 {} 的 Journey 擁有記錄 (user_journeys)", userId);

        // 步驟 4：刪除所有訂單記錄（orders）
        orderRepository.deleteByUserId(userId);
        log.info("[UserService] Fast R6: 已刪除使用者 {} 的所有訂單記錄", userId);

        // 步驟 5：重置經驗值和等級
        user.setTotalXp(0);
        user.setWeeklyXp(0);
        user.setLevel(1);
        log.info("[UserService] Fast R6: 已重置使用者 {} 的經驗值和等級", userId);

        // 步驟 6：保存更新後的使用者資料
        return userRepository.save(user);
    }
}
