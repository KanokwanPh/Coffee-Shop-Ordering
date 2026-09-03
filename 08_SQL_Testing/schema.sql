-- ============================================================
-- 08.1) schema.sql — โครงสร้างฐานข้อมูลระบบสั่งกาแฟ (SQLite)
-- ============================================================

CREATE TABLE IF NOT EXISTS menus (
    menu_id     TEXT PRIMARY KEY,      -- รหัสเมนู เช่น M01
    menu_name   TEXT NOT NULL,         -- ชื่อเมนู
    price       REAL NOT NULL CHECK (price > 0)   -- ราคา (บาท)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name   TEXT NOT NULL,
    phone           TEXT NOT NULL,     -- ควรเป็นเลข 10 หลัก ขึ้นต้น 0
    address         TEXT NOT NULL,
    total_amount    REAL NOT NULL,
    order_date      TEXT DEFAULT (datetime('now', 'localtime'))
);

CREATE TABLE IF NOT EXISTS order_items (
    item_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id    INTEGER NOT NULL REFERENCES orders(order_id),
    menu_id     TEXT NOT NULL REFERENCES menus(menu_id),
    qty         INTEGER NOT NULL CHECK (qty >= 1),   -- กฎ BR-04: ห้าม 0/ติดลบ
    sweetness   TEXT DEFAULT 'หวานปกติ 100%'          -- กฎ BR-03: ค่าเริ่มต้น
);
