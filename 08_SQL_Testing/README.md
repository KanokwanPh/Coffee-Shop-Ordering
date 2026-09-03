# 08 — SQL Testing

ฐานข้อมูล: SQLite (รันได้ทันทีไม่ต้องติดตั้ง server)

| ไฟล์ | ทำอะไร |
|---|---|
| `schema.sql` | สร้างตาราง menus / orders / order_items (ฝังกฎ BR-03, BR-04 ใน CHECK + DEFAULT) |
| `seed.sql` | ข้อมูลตั้งต้น: เมนู 4 รายการ + ตัวอย่างคำสั่งซื้อ TC-001 |
| `verification_queries.sql` | 4 คำสั่งตรวจสอบข้อมูลจริงหลังสั่งซื้อ |

## วิธีรัน (เลือกอย่างใดอย่างหนึ่ง)

**อยากลองรันด้วยตัวเอง (แนะนำ):**

```bash
sqlite3 coffee-shop.db < 08_SQL_Testing/schema.sql
sqlite3 coffee-shop.db < 08_SQL_Testing/seed.sql
sqlite3 coffee-shop.db < 08_SQL_Testing/verification_queries.sql
```

หรือใช้ Python (มีในเครื่องส่วนใหญ่) — ดูท้ายไฟล์นี้

**ผลลัพธ์ที่ถูกต้อง (healthy database):**
- Query 3 (เบอร์ผิดรูปแบบ) -> **0 แถว**
- Query 4 (ยอดต่ำกว่า 100 / ติดลบ) -> **0 แถว**

## จุดที่ควรรู้ (เรียนรู้จากการทดสอบจริง)

ตอนแรกใช้ `WHERE phone NOT LIKE '0_________'` แต่การทดสอบจริงพบว่า **จับเบอร์ '081234abcd' ไม่ได้** เพราะ `_` ใน LIKE ตรงกับ "ตัวอักษรอะไรก็ได้" ไม่ใช่เฉพาะตัวเลข จึงเปลี่ยนเป็น GLOB ที่บังคับเฉพาะ 0-9 — นี่คือตัวอย่างว่า verification query เองก็ต้องถูกทดสอบด้วย

## ตัวอย่างรันด้วย Python

```python
import sqlite3
con = sqlite3.connect("coffee-shop.db")
cur = con.cursor()
for f in ["08_SQL_Testing/schema.sql", "08_SQL_Testing/seed.sql"]:
 cur.executescript(open(f, encoding="utf-8").read())
print(cur.execute("SELECT customer_name, phone, total_amount FROM orders WHERE order_id=1").fetchall())
```
