# JWBD 2023 — Using Stored Procedure in MySQL

## 📌 Giới thiệu

Bài thực hành này luyện tập sử dụng **Stored Procedure** trong MySQL trên cơ sở dữ liệu mẫu `classicmodels`. Nội dung bao gồm: tạo, gọi, sửa, xóa procedure — và mở rộng với procedure có tham số `IN`, `OUT`.

- **Môn học:** JWBD 2023
- **Chủ đề:** Stored Procedure trong MySQL
- **CSDL sử dụng:** `classicmodels`
- **Công cụ:** MySQL 8.0, MySQL Workbench / phpMyAdmin / Command Line
- **Ngày hoàn thành:** 2026-09-24

---

## 🎯 Mục tiêu

- Hiểu khái niệm Stored Procedure và lợi ích của nó.
- Biết cú pháp tạo procedure với `DELIMITER`, `CREATE PROCEDURE`, `BEGIN ... END`.
- Biết cách gọi procedure bằng `CALL`.
- Biết cách sửa procedure (MySQL không hỗ trợ `ALTER PROCEDURE` → phải `DROP` + `CREATE`).
- Biết cách xóa procedure bằng `DROP PROCEDURE`.
- (Mở rộng) Biết truyền tham số `IN`, `OUT`, `INOUT` cho procedure.

---

## 🗄️ Cơ sở dữ liệu

CSDL `classicmodels` được tải từ:
👉 http://www.mysqltutorial.org/mysql-sample-database.aspx

Bảng chính sử dụng: **`customers`**

Cấu trúc bảng `customers` (rút gọn):

| Cột | Kiểu | Mô tả |
|-----|------|-------|
| customerNumber | INT (PK) | Mã khách hàng |
| customerName | VARCHAR(50) | Tên khách hàng |
| contactLastName | VARCHAR(50) | Họ người liên hệ |
| contactFirstName | VARCHAR(50) | Tên người liên hệ |
| phone | VARCHAR(50) | Số điện thoại |
| city | VARCHAR(50) | Thành phố |
| country | VARCHAR(50) | Quốc gia |
| creditLimit | DECIMAL(10,2) | Hạn mức tín dụng |

---

##  Cấu trúc repo

---

## 🛠️ Các Stored Procedure đã tạo

### 1️⃣ `findAllCustomers()` — Lấy tất cả khách hàng

```sql
DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //
DELIMITER ;
