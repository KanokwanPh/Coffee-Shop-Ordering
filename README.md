# ☕ Coffee Shop Ordering — QA Portfolio

**ระบบสั่งกาแฟออนไลน์ (Coffee Shop Ordering)** — ชุดงาน QA ครบวงจรสำหรับพอร์ต Software Tester

`Manual (Chrome/Edge)` `Postman` `SQL (SQLite)` `Git/GitHub` `Excel/Markdown`

---

## 📋 Project Overview

- **โปรเจกต์:** ระบบสั่งกาแฟออนไลน์ (Customer: เลือกเมนู → ตะกร้า → กรอกเบอร์/ที่อยู่ → ยืนยันสั่งซื้อ)
- **ขอบเขตงาน QA:** Manual Testing + API Testing (Postman) + SQL Verification + Bug Report + Regression
- **ผลการทดสอบ:** execute 10/10 test cases (simulated run) 2 รอบ — รอบแรก pass 80% พบ 2 bugs, รอบ regression pass 100%
- **การตัดสินใจปล่อยระบบ (Release Decision): GO** หลังแก้บั๊กครบและ regression ผ่านทั้งหมด

---

## 🎯 Testing Scope & Coverage

| ด้าน | ครอบคลุม | รายละเอียด |
|---|---|---|
| **Functional Test Cases** | หน้าเมนู, ตะกร้า, จัดส่ง, คำสั่งซื้อ (6 business rules) | 10 test cases — Positive / Negative / Boundary / Validation |
| **API Testing** | POST /orders | Postman collection 2 requests + assertions (status code) |
| **Database (SQL)** | ตาราง orders | schema + seed 4 เมนู + 4 verification queries |
| **Bug Reports** | 2 bugs | Critical 1 / High 1 พร้อม root cause |
| **Regression** | ทุกเคสหลังแก้บั๊ก | 10/10 pass (build 1.1.0) |

---

## 📁 Structure

```
coffee-shop-qa-portfolio/
├── 01_Requirement/          SRS + business rules (BR-01..06)
├── 02_Test_Plan/            Test Plan (scope, entry/exit criteria, risk)
├── 03_Test_Scenario/        4 scenario groups
├── 04_Test_Case/            10 test cases (.md + .csv สำหรับ Google Sheets)
├── 05_Test_Data/            เมนู/เบอร์โทร/boundary ยอดเงิน
├── 06_Traceability_Matrix/  RTM: requirement ↔ test case (100%)
├── 07_API_Testing/          + Postman collection
├── 08_SQL_Testing/          schema.sql + seed.sql + verification_queries.sql
├── 09_Bug_Report/           2 bug reports
├── 10_Test_Evidence/        (ที่สำหรับแนบภาพหน้าจอ)
├── 11_Test_Execution/       ผลรัน 2 รอบ (CSV)
├── 12_Test_Report/          Summary + release decision
└── README.md
```

---

## 📊 Test Results

| รอบ | Build | Executed | Pass | Fail | พบบั๊ก | Pass Rate |
|---|---|---|---|---|---|---|
| Cycle 1 | 1.0.0 | 10 | 8 | 2 | 2 bugs (1 Critical) | 80.0% |
| Regression | 1.1.0 | 10 | 10 | 0 | — (แก้ครบ) | 100% |

> หมายเหตุ: ผลการ execute เป็น simulated run เพื่อการเรียนรู้/ทำพอร์ต

---

## 🛠 Tools

Manual (Chrome/Edge) · Postman · SQL (SQLite) · Git/GitHub · Excel/Markdown

---

## ✨ Highlights

1. **Boundary Value Analysis** ยอดขั้นต่ำ 100 บาท: ทดสอบ 80 (ไม่ผ่าน) / 100 พอดี (ผ่าน) / 135 (ผ่าน)
2. **Negative Testing เจอบั๊ก Critical:** ยอดติดลบจากการกดลดจำนวนแก้ว (BUG-002)
3. **SQL Verification:** ตรวจ transaction จริงในฐานข้อมูล (ชื่อ เบอร์ ยอด ถูกบันทึกถูกต้อง)
4. **Traceability Matrix:** requirement ถูก cover 100% (6/6 business rules ↔ 10/10 test cases)
5. **Bug Report มี reproduce 3-4 steps** ให้ dev ตามทำซ้ำได้ทันที
