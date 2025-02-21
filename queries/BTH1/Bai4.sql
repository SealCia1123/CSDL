USE MASTER;

IF NOT EXISTS (
  SELECT
    name
  FROM
    sys.databases
  WHERE
    name = N'QLThuePhong'
) CREATE DATABASE QLThuePhong;

USE QLThuePhong;

-- Tao table
CREATE TABLE PHONG (
  MaPhong CHAR(10) PRIMARY KEY,
  SoGiuong INT NOT NULL,
  NVPhuTrach NVARCHAR(50) NOT NULL,
  GiaTien DECIMAL(8, 2) NOT NULL,
  GhiChu NVARCHAR(MAX)
);

CREATE TABLE KHACHHANG(
  MaKH INT IDENTITY(1, 1) PRIMARY KEY,
  TenKH NVARCHAR(50) NOT NULL,
  DiaChi NVARCHAR(100) NOT NULL,
  SDT NVARCHAR(12) NOT NULL,
  GhiChu NVARCHAR(MAX)
);

CREATE TABLE THUEPHONG(
  MaKH INT,
  MaPhong CHAR(10),
  NgayLayPhong DATE,
  NgayTraPhong DATE NOT NULL,
  TienDaTra DECIMAL(8, 2) NOT NULL,
  GhiChu NVARCHAR(MAX),
  PRIMARY KEY (MaKH, MaPhong, NgayLayPhong),
  CONSTRAINT FK_MaKH FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
  CONSTRAINT FK_MaPhong FOREIGN KEY (MaPhong) REFERENCES PHONG(MaPhong),
);

-- Them records
-- Them PHONG
INSERT INTO
  PHONG (MaPhong, SoGiuong, NVPhuTrach, GiaTien)
VALUES
  ('PHONG00001', 1, 'Nguyen Van A', 100.0);

INSERT INTO
  PHONG (MaPhong, SoGiuong, NVPhuTrach, GiaTien)
VALUES
  ('PHONG00002', 2, 'Tran Thi B', 200);

INSERT INTO
  PHONG (MaPhong, SoGiuong, NVPhuTrach, GiaTien)
VALUES
  ('PHONG00003', 1, 'Tran Thi B', 150);

-- Them KHACHHANG
INSERT INTO
  KHACHHANG(TenKH, DiaChi, SDT)
VALUES
  ('Nguyen Van An', 'TPHCM', 0123456789);

INSERT INTO
  KHACHHANG(TenKH, DiaChi, SDT)
VALUES
  ('Tran Thi B', 'Ha Noi', 0987654321);

INSERT INTO
  KHACHHANG(TenKH, DiaChi, SDT)
VALUES
  ('Dinh Van C', 'Da Nang', 0985554321);

-- Them THUEPHONG
INSERT INTO
  THUEPHONG (
    MaKH,
    MaPhong,
    NgayLayPhong,
    NgayTraPhong,
    TienDaTra
  )
VALUES
  (1, 'PHONG00001', '2024-10-10', '2024-10-11', 120);

INSERT INTO
  THUEPHONG (
    MaKH,
    MaPhong,
    NgayLayPhong,
    NgayTraPhong,
    TienDaTra
  )
VALUES
  (
    1,
    'PHONG00002',
    '2024-12-10',
    '2024-12-15',
    1000
  );

INSERT INTO
  THUEPHONG (
    MaKH,
    MaPhong,
    NgayLayPhong,
    NgayTraPhong,
    TienDaTra
  )
VALUES
  (
    3,
    'PHONG00003',
    '2025-02-03',
    '2025-02-05',
    250
  );