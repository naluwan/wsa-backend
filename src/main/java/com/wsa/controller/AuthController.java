package com.wsa.controller;

import com.wsa.dto.OAuthLoginRequest;
import com.wsa.dto.OAuthLoginResponse;
import com.wsa.dto.UserDto;
import com.wsa.entity.User;
import com.wsa.repository.UserRepository;
import com.wsa.service.JwtService;
import com.wsa.service.UserService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 認證相關 API Controller
 * 處理 OAuth 登入等認證相關的 HTTP 請求
 */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private UserRepository userRepository;

    /**
     * OAuth 登入 API
     * 接收前端傳來的 OAuth 使用者資料，建立或更新使用者，並產生 JWT token
     *
     * 流程：
     * 1. 根據 provider 和 externalId 建立或更新使用者
     * 2. 產生 JWT token
     * 3. 回傳 token 和使用者資料給前端
     *
     * @param request OAuth 登入請求（包含 provider、externalId、email、displayName、avatarUrl）
     * @return OAuthLoginResponse（包含 JWT token 和使用者資料）
     */
    @PostMapping("/oauth-login")
    public ResponseEntity<OAuthLoginResponse> oauthLogin(@RequestBody OAuthLoginRequest request) {
        // 建立或更新使用者資料
        User user = userService.createOrUpdateUser(request);

        // 為使用者產生 JWT token
        String token = jwtService.generateToken(user.getId());

        // 建立回應物件，包含 token 和使用者基本資料
        OAuthLoginResponse response = OAuthLoginResponse.builder()
                .token(token)
                .user(UserDto.from(user))
                .build();

        return ResponseEntity.ok(response);
    }

    /**
     * Dev 一鍵登入 API（僅供開發與測試使用）
     * 使用種子使用者（provider = "seed"）進行快速登入，方便 E2E 測試與開發
     *
     * 流程：
     * 1. 根據 externalId 查詢種子使用者（provider = "seed"）
     * 2. 若找到使用者，產生 JWT token
     * 3. 回傳 token 和使用者資料
     *
     * ⚠️ 警告：此 API 應僅在開發與測試環境使用，生產環境應停用
     *
     * @param request Dev 登入請求（包含 externalId，例如 "seed_test_001"）
     * @return OAuthLoginResponse（包含 JWT token 和使用者資料）
     */
    @PostMapping("/dev-login")
    public ResponseEntity<OAuthLoginResponse> devLogin(@RequestBody DevLoginRequest request) {
        System.out.println("[AuthController] Dev 登入請求：externalId = " + request.getExternalId());

        // 根據 provider = "seed" 和 externalId 查詢種子使用者
        User user = userRepository.findByProviderAndExternalId("seed", request.getExternalId())
                .orElseThrow(() -> new RuntimeException("找不到種子使用者：" + request.getExternalId()));

        System.out.println("[AuthController] 找到種子使用者：" + user.getDisplayName());

        // 為使用者產生 JWT token
        String token = jwtService.generateToken(user.getId());

        // 建立回應物件，包含 token 和使用者基本資料
        OAuthLoginResponse response = OAuthLoginResponse.builder()
                .token(token)
                .user(UserDto.from(user))
                .build();

        return ResponseEntity.ok(response);
    }

    /**
     * Dev 登入請求 DTO
     * 用於接收 dev 一鍵登入的請求參數
     */
    @Data
    public static class DevLoginRequest {
        /**
         * 種子使用者的 external_id
         * 例如：seed_test_001, seed_test_002 等
         */
        private String externalId;
    }
}
