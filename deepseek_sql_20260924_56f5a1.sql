-- ============================================
-- BÀI THỰC HÀNH: TRUYỀN THAM SỐ VÀO STORED PROCEDURE
-- CSDL: classicmodels
-- ============================================

USE classicmodels;

-- ============================================
-- 1. THAM SỐ IN
-- ============================================
DROP PROCEDURE IF EXISTS getCusById;

DELIMITER //
CREATE PROCEDURE getCusById(IN cusNum INT(11))
BEGIN
    SELECT * FROM customers WHERE customerNumber = cusNum;
END //
DELIMITER ;

-- Gọi procedure
CALL getCusById(175);

-- ============================================
-- 2. THAM SỐ OUT
-- ============================================
DROP PROCEDURE IF EXISTS GetCustomersCountByCity;

DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(
    IN  in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END //
DELIMITER ;

-- Gọi procedure
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total AS SoKhachHangLyon;

-- ============================================
-- 3. THAM SỐ INOUT
-- ============================================
DROP PROCEDURE IF EXISTS SetCounter;

DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END //
DELIMITER ;

-- Gọi procedure nhiều lần
SET @counter = 1;
CALL SetCounter(@counter, 1);  -- 2
CALL SetCounter(@counter, 1);  -- 3
CALL SetCounter(@counter, 5);  -- 8
SELECT @counter AS KetQuaCuoiCung;  -- 8