-- R1.5: 建立訂單表（Orders Table）
--
-- 用途：
-- - 儲存課程購買訂單
-- - 追蹤訂單狀態（pending / paid / cancelled）
-- - 記錄付款期限與完成時間

CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_no VARCHAR(50) NOT NULL UNIQUE,
  user_id UUID NOT NULL REFERENCES users(id),
  course_id UUID NOT NULL REFERENCES courses(id),
  amount INTEGER NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'pending',
  pay_deadline TIMESTAMP NOT NULL,
  paid_at TIMESTAMP,
  memo TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 索引優化查詢效能
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_course_id ON orders(course_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_pay_deadline ON orders(pay_deadline);

-- 註解
COMMENT ON TABLE orders IS 'R1.5: 課程購買訂單表';
COMMENT ON COLUMN orders.order_no IS '訂單編號（格式：YYYYMMDDHHmmss + 4位十六進位亂碼）';
COMMENT ON COLUMN orders.amount IS '訂單金額（整數，單位：元）';
COMMENT ON COLUMN orders.status IS '訂單狀態：pending（待付款）/ paid（已付款）/ cancelled（已取消）';
COMMENT ON COLUMN orders.pay_deadline IS '付款期限（建立訂單後3天）';
COMMENT ON COLUMN orders.paid_at IS '完成付款時間（null 表示尚未付款）';
COMMENT ON COLUMN orders.memo IS '備註（如：期限內未完成付款）';
