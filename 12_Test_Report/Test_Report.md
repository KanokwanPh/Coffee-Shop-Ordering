# 12 — Test Summary Report

## สรุปผลการทดสอบ

| รายการ | Cycle 1 (Build 1.0.0) | Regression (Build 1.1.0) |
|---|---|---|
| Executed | 10 | 10 |
| Pass | 8 | 10 |
| Fail | 2 | 0 |
| Pass Rate | 80.0% | **100%** |
| Bugs ที่พบ | 2 (Critical 1 / High 1) | 0 (แก้ครบแล้ว) |

## บั๊กที่พบ

| Bug | ความรุนแรง | สรุป | สถานะ Regression |
|---|---|---|---|
| BUG-001 | High | รับเบอร์โทรเป็นเลขไทยได้ ไม่แจ้งเตือน | แก้แล้ว (TC-008 ผ่าน) |
| BUG-002 | Critical | ลดจำนวนแก้วจนยอดติดลบ และสั่งซื้อได้ | แก้แล้ว (TC-010 ผ่าน) |

## การครอบคลุม (Coverage)

- Business rules: 6/6 (100%) — ดู RTM ที่ 06_Traceability_Matrix
- API: POST /orders 2 requests (positive + negative) — assertions ผ่าน
- SQL: verification queries 4 คำสั่ง (ตรวจเบอร์ผิดรูปแบบ / ยอดต่ำกว่า 100 = 0 แถว)

## ความเสี่ยงที่เหลือ

- ชำระเงินออนไลน์ / คูปอง ยังอยู่นอกขอบเขต (out of scope) — ควรทดสอบในรอบถัดไป

## Release Decision

**GO** — บั๊ก Critical/High แก้ครบ, regression ผ่าน 100%, coverage ครบตามแผน

> หมายเหตุ: การ execute เป็น simulated run เพื่อการเรียนรู้/ทำพอร์ต
