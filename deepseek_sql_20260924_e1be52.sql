-- ============================================
-- BÀI THỰC HÀNH: TẠO VIEW TRONG MYSQL
-- CSDL: classicmodels
-- ============================================

USE classicmodels;

-- ============================================
-- 1. TẠO VIEW
-- ============================================
DROP VIEW IF EXISTS customer_views;

CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM customers;

-- Truy vấn view
SELECT * FROM customer_views;

-- Xem định nghĩa view
SHOW CREATE VIEW customer_views;

-- ============================================
-- 2. CẬP NHẬT VIEW
-- ============================================
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

-- Truy vấn view sau khi cập nhật
SELECT * FROM customer_views;

-- ============================================
-- 3. XÓA VIEW
-- ============================================
DROP VIEW customer_views;

-- Kiểm tra view đã bị xóa
SHOW FULL TABLES WHERE Table_type = 'VIEW';