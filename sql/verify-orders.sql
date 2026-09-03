-- ============================================================
-- SQL ตรวจสอบฐานข้อมูลระบบสั่งกาแฟออนไลน์ (ตาราง orders)
-- สมมติคอลัมน์: order_id, customer_name, phone, address, total_amount, order_date
-- ============================================================

-- 1) ดูคำสั่งซื้อทั้งหมดคร่าวๆ
SELECT * FROM orders;

-- 2) ตรวจว่าชื่อลูกค้า เบอร์โทร ยอดเงิน บันทึกถูกต้องหรือไม่
--    เทียบผลลัพธ์กับที่กรอกบนหน้าเว็บ
SELECT customer_name, phone, total_amount
FROM orders
WHERE order_id = 1;

-- 3) หาเบอร์โทรที่ผิดรูปแบบ (ผลลัพธ์ที่ดีต้องเป็น 0 แถว)
--    '0_________' = ขึ้นต้น 0 ตามด้วยอะไรก็ได้อีก 9 ตัว
SELECT order_id, phone
FROM orders
WHERE phone NOT LIKE '0_________';

-- 4) (โบนัส) หาคำสั่งซื้อที่ยอดติดลบหรือต่ำกว่าขั้นต่ำ 100 บาท
--    ผลลัพธ์ที่ดีต้องเป็น 0 แถว
SELECT order_id, total_amount
FROM orders
WHERE total_amount < 100;
