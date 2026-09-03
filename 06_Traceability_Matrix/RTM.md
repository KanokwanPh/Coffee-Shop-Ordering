# 06 — Traceability Matrix (RTM)

หลักการ: ทุก business rule ต้องมี test case cover (เป้าหมาย 100%)

| Requirement | รายละเอียดกฎ | Test Cases | สถานะ |
|---|---|---|---|
| BR-01 | ยอดขั้นต่ำ 100 บาท | TC-006, TC-009 | Covered |
| BR-02 | เบอร์โทรตัวเลข 10 หลัก | TC-002, TC-008 | Covered |
| BR-03 | ความหวานเริ่มต้น 100% | TC-007 | Covered |
| BR-04 | จำนวนแก้วขั้นต่ำ 1 | TC-004, TC-005, TC-010 | Covered |
| BR-05 | ที่อยู่ห้ามว่าง | TC-003 | Covered |
| BR-06 | ยอดรวมถูกต้อง | TC-001, TC-005, TC-009 | Covered |

## สรุป Coverage

- Business rules ถูก cover: **6/6 (100%)**
- Test cases ผูกกับ requirement: **10/10 (100%)**

> อ่านตาราง: แถว BR-01 บอกว่ากฎ "ขั้นต่ำ 100 บาท" ถูกทดสอบโดย TC-006 (ยอด 40 ไม่ผ่าน) และ TC-009 (ยอด 100 พอดี ผ่าน)
