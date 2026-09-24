-- ============================================
-- BÀI THỰC HÀNH: TRIGGER TRONG MYSQL
-- CSDL: company
-- ============================================

-- ============================================
-- BƯỚC 1: TẠO CSDL VÀ BẢNG
-- ============================================
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

-- ============================================
-- BƯỚC 2: TẠO TRIGGER
-- ============================================
DROP TRIGGER IF EXISTS update_department;

DELIMITER //
CREATE TRIGGER update_department
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary >= 5000 THEN
        SET NEW.department = 'Management';
    ELSEIF NEW.salary >= 3000 THEN
        SET NEW.department = 'Sales';
    ELSE
        SET NEW.department = 'Support';
    END IF;
END //
DELIMITER ;

-- ============================================
-- BƯỚC 3: DEMO SỬ DỤNG TRIGGER
-- ============================================
INSERT INTO employees (name, department, salary)
VALUES ('John Doe', 'A', 3500),
       ('Jane Smith', 'A', 2000),
       ('David Johnson', 'A', 6000);

-- Kiểm tra kết quả
SELECT * FROM employees;
-- Kết quả mong đợi:
-- | 1 | John Doe      | Sales      | 3500.00 |
-- | 2 | Jane Smith    | Support    | 2000.00 |
-- | 3 | David Johnson | Management | 6000.00 |

-- ============================================
-- KIỂM TRA TRIGGER
-- ============================================
SHOW TRIGGERS FROM company;

-- ============================================
-- XÓA TRIGGER (nếu cần)
-- ============================================
-- DROP TRIGGER IF EXISTS update_department;