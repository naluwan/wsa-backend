package com.wsa.controller;

import com.wsa.dto.CreateOrderRequest;
import com.wsa.dto.CreateOrderResponse;
import com.wsa.dto.OrderResponseDto;
import com.wsa.dto.PayOrderResponse;
import com.wsa.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * R1.5: 訂單相關 API Controller
 * 處理訂單建立、付款、查詢等 HTTP 請求
 */
@Slf4j
@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    /**
     * 4.1 建立訂單
     * POST /api/orders
     *
     * @param request 建立訂單請求（包含 courseId）
     * @param authentication Spring Security 認證物件
     * @return 訂單編號
     */
    @PostMapping
    public ResponseEntity<CreateOrderResponse> createOrder(
            @RequestBody CreateOrderRequest request,
            Authentication authentication
    ) {
        log.info("[OrderController] POST /api/orders");

        // 檢查是否已認證
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("[OrderController] 未認證，回傳 401");
            return ResponseEntity.status(401).build();
        }

        // 從 Authentication 中取得使用者 ID
        UUID userId = (UUID) authentication.getPrincipal();
        log.info("[OrderController] 使用者 ID: {}, 課程 ID: {}", userId, request.getCourseId());

        try {
            CreateOrderResponse response = orderService.createOrder(userId, request.getCourseId());
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            log.error("[OrderController] 建立訂單失敗: {}", e.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    /**
     * 4.2 取得單一訂單（Step2 用）
     * GET /api/orders/{orderNo}
     *
     * @param orderNo 訂單編號
     * @return 訂單資料
     */
    @GetMapping("/{orderNo}")
    public ResponseEntity<OrderResponseDto> getOrder(@PathVariable String orderNo) {
        log.info("[OrderController] GET /api/orders/{}", orderNo);

        try {
            OrderResponseDto order = orderService.getOrder(orderNo);
            return ResponseEntity.ok(order);
        } catch (RuntimeException e) {
            log.error("[OrderController] 查詢訂單失敗: {}", e.getMessage());
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 4.3 訂單付款（模擬）
     * POST /api/orders/{orderNo}/pay
     *
     * @param orderNo 訂單編號
     * @param authentication Spring Security 認證物件
     * @return 付款結果
     */
    @PostMapping("/{orderNo}/pay")
    public ResponseEntity<PayOrderResponse> payOrder(
            @PathVariable String orderNo,
            Authentication authentication
    ) {
        log.info("[OrderController] POST /api/orders/{}/pay", orderNo);

        // 檢查是否已認證
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("[OrderController] 未認證，回傳 401");
            return ResponseEntity.status(401).build();
        }

        // 從 Authentication 中取得使用者 ID
        UUID userId = (UUID) authentication.getPrincipal();
        log.info("[OrderController] 使用者 ID: {}", userId);

        try {
            PayOrderResponse response = orderService.payOrder(orderNo, userId);
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            log.error("[OrderController] 訂單付款失敗: {}", e.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    /**
     * 4.5 個人檔案：取得所有訂單
     * GET /api/user/orders
     *
     * @param authentication Spring Security 認證物件
     * @return 訂單列表
     */
    @GetMapping("/user")
    public ResponseEntity<List<OrderResponseDto>> getUserOrders(Authentication authentication) {
        log.info("[OrderController] GET /api/orders/user");

        // 檢查是否已認證
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("[OrderController] 未認證，回傳 401");
            return ResponseEntity.status(401).build();
        }

        // 從 Authentication 中取得使用者 ID
        UUID userId = (UUID) authentication.getPrincipal();
        log.info("[OrderController] 使用者 ID: {}", userId);

        List<OrderResponseDto> orders = orderService.getUserOrders(userId);
        return ResponseEntity.ok(orders);
    }

    /**
     * 取得使用者的未完成訂單
     * GET /api/orders/user/pending
     *
     * @param authentication Spring Security 認證物件
     * @return 未完成訂單列表
     */
    @GetMapping("/user/pending")
    public ResponseEntity<List<OrderResponseDto>> getPendingOrders(Authentication authentication) {
        log.info("[OrderController] GET /api/orders/user/pending");

        // 檢查是否已認證
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("[OrderController] 未認證，回傳 401");
            return ResponseEntity.status(401).build();
        }

        // 從 Authentication 中取得使用者 ID
        UUID userId = (UUID) authentication.getPrincipal();
        log.info("[OrderController] 使用者 ID: {}", userId);

        List<OrderResponseDto> orders = orderService.getPendingOrders(userId);
        return ResponseEntity.ok(orders);
    }
}
