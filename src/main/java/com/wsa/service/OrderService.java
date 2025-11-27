package com.wsa.service;

import com.wsa.dto.CreateOrderResponse;
import com.wsa.dto.OrderResponseDto;
import com.wsa.dto.PayOrderResponse;
import com.wsa.entity.Journey;
import com.wsa.entity.Order;
import com.wsa.entity.UserJourney;
import com.wsa.repository.JourneyRepository;
import com.wsa.repository.OrderRepository;
import com.wsa.repository.UserJourneyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * 訂單服務（Fast R6 更新：100% Journey Native）
 *
 * Fast R6 變更：
 *   - 移除所有 Course/UserCourse 依賴
 *   - 改用 Journey 取得價格和標題
 *   - payOrder() 僅寫入 user_journeys（移除雙寫）
 *   - 所有訂單必須有 journey_id
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final JourneyRepository journeyRepository;
    private final UserJourneyRepository userJourneyRepository;

    private static final DateTimeFormatter ORDER_NO_DATE_FORMAT = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
    private static final Random RANDOM = new Random();

    /**
     * 生成訂單編號
     * 格式：YYYYMMDDHHmmss + 4位十六進位亂碼
     * 例如：20251121160940a6e5
     */
    private String generateOrderNo() {
        String datePart = LocalDateTime.now().format(ORDER_NO_DATE_FORMAT);
        String randomPart = String.format("%04x", RANDOM.nextInt(0x10000)); // 0000-ffff
        return datePart + randomPart;
    }

    /**
     * 透過 Journey slug 建立訂單（Fast R6 更新：100% Journey Native）
     *
     * Fast R6 變更：
     *   - 移除 Course 依賴，改用 Journey
     *   - 價格從 Journey.priceTwd 取得
     *   - 檢查購買狀態改查 user_journeys
     *
     * @param userId 使用者 ID
     * @param slug Journey 的 slug（例如：software-design-pattern）
     * @return 訂單編號
     */
    @Transactional
    public CreateOrderResponse createOrderBySlug(UUID userId, String slug) {
        log.info("[OrderService] Fast R6 建立訂單: userId={}, slug={}", userId, slug);

        // 取得 Journey
        Journey journey = journeyRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Journey 不存在: " + slug));

        // 檢查是否已購買
        boolean alreadyPurchased = userJourneyRepository.existsByUserIdAndJourneyId(userId, journey.getId());
        if (alreadyPurchased) {
            throw new RuntimeException("您已購買此課程");
        }

        // 生成訂單編號
        String orderNo = generateOrderNo();

        // 計算付款期限（3天後）
        LocalDateTime payDeadline = LocalDateTime.now().plusDays(3);

        // Fast R6: 建立訂單（僅使用 Journey）
        Order order = Order.builder()
                .orderNo(orderNo)
                .userId(userId)
                .courseId(null)  // Fast R6: 不再使用 courseId
                .journeyId(journey.getId())
                .amount(journey.getPriceTwd())  // Fast R6: 從 Journey 取得價格
                .status(Order.Status.PENDING)
                .payDeadline(payDeadline)
                .build();

        orderRepository.save(order);

        log.info("[OrderService] Fast R6 訂單建立成功: orderNo={}, journeyId={}, amount={}",
                orderNo, journey.getId(), journey.getPriceTwd());

        return CreateOrderResponse.builder()
                .orderNo(orderNo)
                .build();
    }

    /**
     * 取得單一訂單（Fast R6 更新：使用 Journey）
     *
     * @param orderNo 訂單編號
     * @return 訂單資料
     */
    public OrderResponseDto getOrder(String orderNo) {
        log.info("[OrderService] Fast R6 查詢訂單: orderNo={}", orderNo);

        Order order = orderRepository.findByOrderNo(orderNo)
                .orElseThrow(() -> new RuntimeException("訂單不存在"));

        // 檢查是否過期
        if (Order.Status.PENDING.equals(order.getStatus()) &&
                LocalDateTime.now().isAfter(order.getPayDeadline())) {
            cancelExpiredOrder(order);
        }

        // Fast R6: 從 Journey 取得標題
        Journey journey = journeyRepository.findById(order.getJourneyId())
                .orElseThrow(() -> new RuntimeException("Journey 不存在"));

        return OrderResponseDto.from(order, journey.getName());
    }

    /**
     * 訂單付款（Fast R6 更新：僅寫入 user_journeys）
     *
     * Fast R6 變更：
     *   - 移除 user_courses 雙寫邏輯
     *   - 僅寫入 user_journeys
     *   - 所有訂單必須有 journey_id
     *
     * @param orderNo 訂單編號
     * @param userId 使用者 ID
     * @return 付款結果
     */
    @Transactional
    public PayOrderResponse payOrder(String orderNo, UUID userId) {
        log.info("[OrderService] Fast R6 訂單付款: orderNo={}, userId={}", orderNo, userId);

        Order order = orderRepository.findByOrderNo(orderNo)
                .orElseThrow(() -> new RuntimeException("訂單不存在"));

        // 驗證訂單所有者
        if (!order.getUserId().equals(userId)) {
            throw new RuntimeException("無權限操作此訂單");
        }

        // 檢查訂單狀態
        if (Order.Status.PAID.equals(order.getStatus())) {
            throw new RuntimeException("訂單已付款");
        }

        if (Order.Status.CANCELLED.equals(order.getStatus())) {
            throw new RuntimeException("訂單已取消");
        }

        // 檢查是否過期
        if (LocalDateTime.now().isAfter(order.getPayDeadline())) {
            cancelExpiredOrder(order);
            throw new RuntimeException("訂單已過期");
        }

        // Fast R6: 驗證訂單必須有 journey_id
        if (order.getJourneyId() == null) {
            log.error("[OrderService] Fast R6 Error: 訂單缺少 journey_id，orderNo={}", orderNo);
            throw new RuntimeException("訂單資料不完整，無法完成付款");
        }

        // 模擬付款成功
        order.setStatus(Order.Status.PAID);
        order.setPaidAt(LocalDateTime.now());
        order.setMemo(null); // 清空備註
        orderRepository.save(order);

        // Fast R6: 僅寫入 user_journeys（Journey Native）
        UserJourney userJourney = UserJourney.builder()
                .userId(order.getUserId())
                .journeyId(order.getJourneyId())
                .purchasedAt(order.getPaidAt())
                .build();
        userJourneyRepository.save(userJourney);

        log.info("[OrderService] Fast R6 訂單付款成功: orderNo={}, journeyId={}",
                orderNo, order.getJourneyId());

        return PayOrderResponse.builder()
                .status(Order.Status.PAID)
                .paidAt(order.getPaidAt())
                .build();
    }

    /**
     * 查詢某 Journey 的所有訂單（Fast R6 更新：改用 Journey）
     *
     * @param journeyId Journey ID
     * @return 訂單列表
     */
    public List<OrderResponseDto> getJourneyOrders(UUID journeyId) {
        log.info("[OrderService] Fast R6 查詢 Journey 訂單: journeyId={}", journeyId);

        List<Order> orders = orderRepository.findByJourneyIdOrderByCreatedAtDesc(journeyId);

        Journey journey = journeyRepository.findById(journeyId)
                .orElseThrow(() -> new RuntimeException("Journey 不存在"));

        return orders.stream()
                .map(order -> {
                    // 檢查是否過期
                    if (Order.Status.PENDING.equals(order.getStatus()) &&
                            LocalDateTime.now().isAfter(order.getPayDeadline())) {
                        cancelExpiredOrder(order);
                    }
                    return OrderResponseDto.from(order, journey.getName());
                })
                .collect(Collectors.toList());
    }

    /**
     * 查詢使用者的所有訂單（Fast R6 更新：使用 Journey）
     *
     * @param userId 使用者 ID
     * @return 訂單列表
     */
    public List<OrderResponseDto> getUserOrders(UUID userId) {
        log.info("[OrderService] Fast R6 查詢使用者訂單: userId={}", userId);

        List<Order> orders = orderRepository.findByUserIdOrderByCreatedAtDesc(userId);

        return orders.stream()
                .map(order -> {
                    // 檢查是否過期
                    if (Order.Status.PENDING.equals(order.getStatus()) &&
                            LocalDateTime.now().isAfter(order.getPayDeadline())) {
                        cancelExpiredOrder(order);
                    }

                    // Fast R6: 從 Journey 取得資訊
                    Journey journey = journeyRepository.findById(order.getJourneyId())
                            .orElseThrow(() -> new RuntimeException("Journey 不存在"));

                    return OrderResponseDto.from(order, journey.getName(), journey.getSlug());
                })
                .collect(Collectors.toList());
    }

    /**
     * 查詢使用者的未完成訂單（Fast R6 更新：使用 Journey）
     *
     * @param userId 使用者 ID
     * @return 訂單列表
     */
    public List<OrderResponseDto> getPendingOrders(UUID userId) {
        log.info("[OrderService] Fast R6 查詢未完成訂單: userId={}", userId);

        List<Order> orders = orderRepository.findPendingOrdersByUserId(
                userId,
                Order.Status.PENDING,
                LocalDateTime.now()
        );

        return orders.stream()
                .map(order -> {
                    // Fast R6: 從 Journey 取得標題
                    Journey journey = journeyRepository.findById(order.getJourneyId())
                            .orElseThrow(() -> new RuntimeException("Journey 不存在"));
                    return OrderResponseDto.from(order, journey.getName());
                })
                .collect(Collectors.toList());
    }

    /**
     * 取消過期訂單
     *
     * @param order 訂單
     */
    @Transactional
    public void cancelExpiredOrder(Order order) {
        if (!Order.Status.PENDING.equals(order.getStatus())) {
            return;
        }

        log.info("[OrderService] 取消過期訂單: orderNo={}", order.getOrderNo());

        order.setStatus(Order.Status.CANCELLED);
        order.setMemo("期限內未完成付款");
        orderRepository.save(order);
    }

    /**
     * 批次檢查並取消過期訂單
     * 可由排程任務定期呼叫
     */
    @Transactional
    public void checkAndCancelExpiredOrders() {
        log.info("[OrderService] 檢查過期訂單");

        List<Order> expiredOrders = orderRepository.findExpiredOrders(
                Order.Status.PENDING,
                LocalDateTime.now()
        );

        expiredOrders.forEach(this::cancelExpiredOrder);

        log.info("[OrderService] 已取消 {} 筆過期訂單", expiredOrders.size());
    }
}
