# 07 — API Testing (Postman)

## ตั้งค่า Request

- Method: `POST`
- URL: `https://api.coffeeshop.com/orders`
- Headers: `Content-Type: application/json`
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

## โค้ดในแท็บ Tests (ตรวจว่าตอบกลับ status 200)

```javascript
pm.test("Status code is 200", function () {
 pm.response.to.have.status(200);
});
```

### อธิบายทีละบรรทัด

| โค้ด | ความหมาย |
|---|---|
| `pm.test("Status code is 200", ...)` | สร้างการตรวจสอบชื่อ "Status code is 200" (ชื่อจะขึ้นตอนรัน) |
| `function () { ... }` | ส่วนที่เขียนว่าจะตรวจอะไร |
| `pm.response.to.have.status(200);` | คำตอบจากระบบต้องมีสถานะ 200 (สำเร็จ) ถ้าไม่ใช่ขึ้น FAIL สีแดง |

## Request ที่ 2 — เคสเบอร์โทรผิด (Negative)

Body เดียวกันแต่เปลี่ยน `"phone": "081234abcd"` และ test กลับด้าน:

```javascript
pm.test("Invalid phone must NOT return 200", function () {
 pm.response.to.not.have.status(200);
});
```

## วิธีใช้ไฟล์

1. เปิด Postman -> Import -> เลือก `coffee-shop-orders.postman_collection.json`
2. กด Send ที่ request "Create Order - Success" -> ดู Test Results ด้านล่าง (ต้อง PASS)
3. กด Send ที่ request "Create Order - Invalid Phone" -> ต้อง PASS (ระบบปฏิเสธเบอร์ผิด)
