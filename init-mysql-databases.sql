-- ============================================================
-- Script khởi tạo 3 database cho CRS Microservices
-- Chạy file này trong MySQL Workbench trước khi start service
-- Username: root | Password: 123 | Host: localhost:3306
-- ============================================================

-- 1. Tạo database cho auth-service
CREATE DATABASE IF NOT EXISTS auth_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- 2. Tạo database cho course-service
CREATE DATABASE IF NOT EXISTS course_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- 3. Tạo database cho registration-service
CREATE DATABASE IF NOT EXISTS registration_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- ============================================================
-- Tạo bảng course và insert 4 môn học demo
-- ============================================================
USE course_db;

CREATE TABLE IF NOT EXISTS course (
    id BIGINT NOT NULL AUTO_INCREMENT,
    ten_mon_hoc VARCHAR(255) NOT NULL,
    so_tin_chi INT NOT NULL,
    so_cho_toi_da INT NOT NULL,
    so_cho_con_lai INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert 4 môn học demo (chỉ insert nếu bảng rỗng)
INSERT INTO course (ten_mon_hoc, so_tin_chi, so_cho_toi_da, so_cho_con_lai)
SELECT * FROM (
    SELECT 'Lập Trình Java' AS ten_mon_hoc, 3 AS so_tin_chi, 30 AS so_cho_toi_da, 30 AS so_cho_con_lai
    UNION ALL SELECT 'Cơ Sở Dữ Liệu', 3, 25, 25
    UNION ALL SELECT 'Mạng Máy Tính', 3, 30, 30
    UNION ALL SELECT 'Trí Tuệ Nhân Tạo', 3, 20, 20
) AS tmp
WHERE NOT EXISTS (SELECT 1 FROM course LIMIT 1);

-- Kiểm tra kết quả
SHOW DATABASES;
SELECT * FROM course_db.course;
