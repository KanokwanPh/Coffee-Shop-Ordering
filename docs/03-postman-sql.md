# Postman และ SQL พื้นฐาน — ระบบสั่งกาแฟออนไลน์

## ส่วน A: Postman (ยิง API ตรวจคำสั่งซื้อ)

### ตั้งค่า Request
- Method: POST
- URL: https://api.coffeeshop.com/orders
- Body (raw / JSON):

```json
{
  "customer_name": "สมชาย ใจดี",
  "phone": "0812345678",
  "address": "บ้านเลขที่ 10",
  "items": [
    { "menu_id": "M02", "menu_name": "ลาเต้", "price": 45, "qty": 3, "sweetness": "100%" }
  ],
  "total_amount": 135
}
```

### โค้ดในแท็บ Tests (ตรวจว่าตอบกลับ status 200)

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

### อธิบายทีละบรรทัด

| โค้ด | ความหมาย |
|---|---|
| pm.test("Status code is 200", ...) | สร้างการตรวจสอบชื่อ "Status code is 200" (ชื่อจะขึ้นตอนรัน) |
| function () { ... } | ส่วนเขียนว่าจะตรวจอะไร |
| pm.response.to.have.status(200); | คำตอบจากระบบต้องมีสถานะ 200 (สำเร็จ) ถ้าไม่ใช่ขึ้น FAIL สีแดง |

> เพิ่มเติม: ถ้าอยากตรวจด้วยว่าระบบส่ง order_id กลับมา ใช้ `pm.test("มี order_id", () => pm.expect(pm.response.json().order_id).to.be.a("number"));`

ไฟล์ Collection พร้อมนำเข้า: `postman/coffee-shop-orders.postman_collection.json`
(ใน Postman: Import → เลือกไฟล์ → กด Send แล้วดูผล Test Results ด้านล่าง)

## ส่วน B: SQL (ตรวจฐานข้อมูล)

สมมติตาราง `orders` มีคอลัมน์: order_id, customer_name, phone, address, total_amount, order_date

### คำสั่งที่ 1 — ดูคำสั่งซื้อทั้งหมดคร่าวๆ

```sql
SELECT * FROM orders;
```

- SELECT * → เลือกดูข้อมูลทุกคอลัมน์
- FROM orders → จากตาราง orders

### คำสั่งที่ 2 — ตรวจชื่อลูกค้า เบอร์โทร ยอดเงิน ว่าบันทึกถูกไหม

```sql
SELECT customer_name, phone, total_amount
FROM orders
WHERE order_id = 1;
```

- SELECT customer_name, phone, total_amount → ดู 3 คอลัมน์: ชื่อ เบอร์ ยอดรวม
- FROM orders → จากตาราง orders
- WHERE order_id = 1 → เฉพาะคำสั่งซื้อหมายเลข 1
- นำผลลัพธ์ไปเทียบกับที่กรอกบนเว็บ เช่น 0812345678 และ 135.00

### คำสั่งที่ 3 — หาเบอร์โทรผิดรูปแบบที่หลุดเข้าฐานข้อมูล (ต้องได้ 0 แถว)

```sql
SELECT order_id, phone
FROM orders
WHERE phone NOT LIKE '0_________';
```

- WHERE phone NOT LIKE '0_________' → เบอร์ที่ "ไม่ตรง" รูปแบบ ขึ้นต้น 0 ตามด้วยอะไรก็ได้อีก 9 ตัว
- ถ้าระบบทำงานดี ผลลัพธ์ต้องว่าง (0 แถว) ถ้ามีแถว = มีเบอร์ผิดรูปแบบหลุดเข้ามา

ไฟล์สคริปต์: `sql/verify-orders.sql`
