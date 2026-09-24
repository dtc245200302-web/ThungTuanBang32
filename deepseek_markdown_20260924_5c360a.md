# QuickFeed Index Optimization — Báo cáo Tối ưu hóa Index

**Học viên:** ThungTuanBang32  
**Vai trò:** Database Administrator (DBA)  
**Ngày thực hiện:** 2026-09-24  
**CSDL:** quickfeed_db  
**Bảng:** Posts

---

## PHẦN 1: SCRIPT SQL TỐI ƯU HÓA

### 1.1. Đo lường dung lượng TRƯỚC khi tối ưu

```sql
USE quickfeed_db;

-- Cách 1: Dùng SHOW TABLE STATUS
SHOW TABLE STATUS LIKE 'Posts';

-- Cách 2: Dùng information_schema (chi tiết hơn, đơn vị MB)
SELECT 
    TABLE_NAME,
    ROUND(DATA_LENGTH / 1024 / 1024, 2)  AS Data_MB,
    ROUND(INDEX_LENGTH / 1024 / 1024, 2) AS Index_MB,
    ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024, 2) AS Total_MB,
    ROUND(INDEX_LENGTH / NULLIF(DATA_LENGTH, 0), 2) AS Index_vs_Data_Ratio
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'quickfeed_db'
  AND TABLE_NAME = 'Posts';