# 02 — Test Plan (ฉบับย่อ)

| รายการ | รายละเอียด |
|---|---|
| โปรเจกต์ | ระบบสั่งกาแฟออนไลน์ (Coffee Shop Ordering) |
| เวอร์ชันที่ทดสอบ | Build 1.0.0 (Cycle 1) -> Build 1.1.0 (Regression) |
| ผู้ทดสอบ | Kanokwan P. |

## Scope

**In scope:**
- หน้าเลือกเมนู / ตะกร้า / กรอกเบอร์-ที่อยู่จัดส่ง
- Business rules BR-01 .. BR-06
- API สร้างคำสั่งซื้อ (POST /orders) — ตรวจ status code
- ฐานข้อมูล: ตรวจข้อมูลคำสั่งซื้อที่บันทึกจริง

**Out of scope:**
- การชำระเงินออนไลน์ / คูปอง / ระบบสมาชิก / แจ้งเตือน SMS

## Entry / Exit Criteria

- **Entry:** SRS พร้อม / environment ทดสอบเปิดใช้ได้ / test data พร้อม
- **Exit:** ทุก test case execute ครบ / บั๊ก Critical-High แก้และ regression ผ่าน / ส่ง Test Report

## ประเภทการทดสอบ

Functional (Manual) · API (Postman) · Database (SQL) · Regression

## กำหนดการ (Mock schedule 2 สัปดาห์)

| สัปดาห์ | งาน |
|---|---|
| 1 | เขียน SRS / Test Plan / Test Case / Test Data |
| 2 | Execute Cycle 1 -> เขียน Bug Report -> Regression -> Test Report |

## Risk

| ความเสี่ยง | ผลกระทบ | แผนรับมือ |
|---|---|---|
| ระบบจริงยังไม่มี (หัดเขียนเอกสาร QA) | execute ต้อง simulated | ระบุชัดว่า simulated run + วางแผน retry เมื่อมีระบบจริง |
| เบอร์โทรรับ input แปลกปลอม | ร้านติดต่อลูกค้าไม่ได้ | negative testing เข้มขึ้น (TC-002/TC-008) |
