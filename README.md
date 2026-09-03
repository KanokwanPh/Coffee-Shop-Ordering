# ระบบสั่งกาแฟออนไลน์ — QA Portfolio (Software Testing Practice)

ชุดงานทดสอบซอฟต์แวร์ (Software Testing) สำหรับระบบ **สั่งกาแฟออนไลน์ (Coffee Shop Ordering)** ออกแบบมาให้เข้าใจง่ายสำหรับคนเริ่มต้นทำพอร์ต Software Tester / QA

## โครงสร้างไฟล์ใน Repo นี้

| ไฟล์ | เนื้อหา |
|---|---|
| `docs/01-srs.md` | ภาพรวมระบบและเงื่อนไข (SRS ฉบับย่อ) |
| `docs/02-test-cases.md` | Test Case 10 ข้อ พร้อมตาราง |
| `data/test-cases.csv` | ไฟล์ CSV ก๊อปปี้/นำเข้า Google Sheets ได้ทันที |
| `docs/03-postman-sql.md` | ตัวอย่าง Postman Tests และคำสั่ง SQL |
| `postman/coffee-shop-orders.postman_collection.json` | Postman Collection พร้อมนำเข้าใช้งาน |
| `docs/04-bug-reports.md` | ตัวอย่างรายงานบั๊ก (Defect Report) 2 ข้อ |
| `sql/verify-orders.sql` | สคริปต์ SQL ตรวจสอบตาราง orders |

## สรุประบบใน 1 นาที

ลูกค้าสั่งกาแฟผ่าน 3 หน้า: **เลือกเมนู → ตะกร้าสินค้า → กรอกเบอร์โทร/ที่อยู่จัดส่ง**

กฎเกณฑ์สำคัญ (Business Rules):
1. ยอดสั่งซื้อขั้นต่ำ **100 บาท**
2. เบอร์โทรต้องเป็น **ตัวเลข 0-9 ครบ 10 หลัก** ขึ้นต้นด้วย 0
3. ไม่เลือกความหวาน → ตั้งค่าเริ่มต้น **"หวานปกติ 100%"**
4. จำนวนแก้วต้องเป็น **1 ขึ้นไป** (ห้าม 0 / ติดลบ)

## เมนูตัวอย่าง

| รหัส | เมนู | ราคา |
|---|---|---|
| M01 | อเมริกาโน่ | 40 บาท |
| M02 | ลาเต้ | 45 บาท |
| M03 | โมจิ | 50 บาท |
| M04 | มัทฉะลาเต้ | 55 บาท |

## ผู้จัดทำ

Kanokwan P. — QA Portfolio Project
