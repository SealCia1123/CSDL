USE MASTER;

IF NOT EXISTS (
  SELECT
    name
  FROM
    sys.databases
  WHERE
    name = N'QLThueBang'
) CREATE DATABASE QLThueBang;

USE QLThueBang;

-- Tao bang
CREATE TABLE BANG (
  MaBang char(10) PRIMARY KEY,
  TenBang NVARCHAR (50) NOT NULL,
  TheLoai NVARCHAR (20) NOT NULL,
  NuocSanXuat NVARCHAR (20) NOT NULL,
  GiaMua DECIMAL(8, 2) NOT NULL,
  GhiChu NVARCHAR (MAX)
);

CREATE TABLE KHACHHANG (
  MaKhach INT IDENTITY (1, 1) PRIMARY KEY,
  TenKhach NVARCHAR (50) NOT NULL,
  DiaChi NVARCHAR (100) NOT NULL,
  SDT NVARCHAR (12) NOT NULL,
  TheLoaiYeuThich NVARCHAR (20),
  GhiChu NVARCHAR (MAX)
);

CREATE TABLE THUEBANG (
  MaKhach INT,
  MaBang char(10),
  NgayThue date,
  NgayTra date,
  TienThu DECIMAL(8, 2) NOT NULL,
  GhiChu NVARCHAR (MAX),
  PRIMARY KEY (MaKhach, MaBang, NgayThue),
  CONSTRAINT FK_MaKhach FOREIGN KEY (MaKhach) REFERENCES KHACHHANG(MaKhach),
  CONSTRAINT FK_MaBang FOREIGN KEY (MaBang) REFERENCES BANG(MaBang)
);

-- Them records
-- Them bang BANG
INSERT INTO
  BANG (MaBang, TenBang, TheLoai, NuocSanXuat, GiaMua)
VALUES
  (
    'BANG000001',
    'Tiem an cua quy',
    'Kinh di',
    'Viet Nam',
    299.99
  );

INSERT INTO
  BANG (MaBang, TenBang, TheLoai, NuocSanXuat, GiaMua)
VALUES
  (
    'BANG000002',
    'Doubt',
    'Trinh tham, Dieu tra',
    'Han Quoc',
    199.99
  );

INSERT INTO
  BANG
VALUES
  (
    'BANG000003',
    'Silo',
    'Gia tuong',
    'My',
    399.99,
    '8.0 IMDB'
  );

-- Them bang KHACHHANG
INSERT INTO
  KHACHHANG (TenKhach, DiaChi, SDT, TheLoaiYeuThich)
VALUES
  (
    'Nguyen Van A',
    'TPHCM',
    '0987654321',
    'Trinh tham'
  );

INSERT INTO
  KHACHHANG (TenKhach, DiaChi, SDT, TheLoaiYeuThich)
VALUES
  ('Tran Thi B', 'Ha Noi', '0123456789', 'Giat gan');

INSERT INTO
  KHACHHANG
VALUES
  (
    'Huy Bui',
    'Da Nang',
    '01234599123',
    'Kinh di',
    'Khach VIP'
  );

-- Them bang THUEBANG
INSERT INTO
  THUEBANG (MaKhach, MaBang, NgayThue, NgayTra, TienThu)
VALUES
  (
    1,
    'BANG000001',
    '2024-12-25',
    '2025-01-07',
    100.99
  );

INSERT INTO
  THUEBANG (MaKhach, MaBang, NgayThue, NgayTra, TienThu)
VALUES
  (3, 'BANG000002', '2024-10-28', '2024-11-28', 500);

INSERT INTO
  THUEBANG
VALUES
  (
    2,
    'BANG000003',
    '2025-01-30',
    '2024-02-28',
    200,
    'ABC'
  );

SELECT
  *
FROM
  KHACHHANG;

SELECT
  *
FROM
  BANG;

SELECT
  *
FROM
  THUEBANG;