USE MASTER;

IF NOT EXISTS (
  SELECT
    name
  FROM
    sys.databases
  WHERE
    name = N 'QLNhanSu'
) CREATE DATABASE QLNhanSu;

USE QLNhanSu;

-- Tao bang
CREATE TABLE NhanVien (
  MaNV INT IDENTITY(1, 1) PRIMARY KEY,
  TenNV NVARCHAR(50) NOT NULL,
  BangCap NVARCHAR(50) NOT NULL,
  NamSinh INT NOT NULL,
  ChucVu NVARCHAR(50) NOT NULL,
  DiaChi NVARCHAR (100) NOT NULL
);

CREATE TABLE DuAn (
  MaDA CHAR(10) PRIMARY KEY,
  TenDA NVARCHAR(50) NOT NULL,
  NgayDuKienBatDau DATE NOT NULL,
  NgayBatDau DATE NOT NULL,
  NgayDuKienKetThuc DATE NOT NULL,
  NgayKetThuc DATE NOT NULL,
);

CREATE TABLE ThamGiaDuAn (
  MaNV INT,
  MaDA CHAR(10),
  NgayThamGia DATE NOT NULL,
  NgayKetThuc DATE NOT NULL,
  NhiemVu NVARCHAR(50) NOT NULL,
  DanhGia NVARCHAR(50) NOT NULL,
  PRIMARY KEY (MaNV, MaDA, NgayThamGia),
  CONSTRAINT Fk_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  CONSTRAINT Fk_MaDA FOREIGN KEY (MaDA) REFERENCES DuAn(MaDA)
);

-- Them records
-- Them NhanVien
INSERT INTO
  NhanVien
VALUES
  (
    'Nguyen Van A',
    'Cu nhan',
    2000,
    'Nhan vien',
    'TPHCM'
  );

INSERT INTO
  NhanVien
VALUES
  (
    'Tran Van B',
    'Tien si',
    2000,
    'Truong phong',
    'Ha Noi'
  );

INSERT INTO
  NhanVien
VALUES
  (
    'Nguyen Van C',
    'Thac si',
    2003,
    'Nhan vien',
    'Ha Noi'
  );

-- Them DuAn
INSERT INTO
  DuAn
VALUES
  (
    'PROJECT001',
    'Phan mem PowerSoft',
    '2025-02-01',
    '2025-02-03',
    '2025-02-12',
    '2025-02-11'
  );

INSERT INTO
  DuAn
VALUES
  (
    'PROJECT002',
    'Bao tri phan mem',
    '2025-01-01',
    '2025-01-01',
    '2025-02-01',
    '2025-02-01'
  );

INSERT INTO
  DuAn
VALUES
  (
    'PROJECT003',
    'Nang cap phan mem',
    '2025-02-10',
    '2025-02-10',
    '2025-02-20',
    '2025-02-20'
  );

-- Them ThamGiaDuAn
INSERT INTO
  ThamGiaDuAn
VALUES
  (
    1,
    'PROJECT001',
    '2025-02-01',
    '2025-02-12',
    'Lam viec',
    'Hoan thanh nhiem vu'
  );

INSERT INTO
  ThamGiaDuAn
VALUES
  (
    3,
    'PROJECT001',
    '2025-02-01',
    '2025-02-12',
    'Quan ly',
    'Hoan thanh nhiem vu'
  );

INSERT INTO
  ThamGiaDuAn
VALUES
  (
    2,
    'PROJECT002',
    '2025-01-01',
    '2025-02-01',
    'Lam viec',
    'Hoan thanh nhiem vu'
  );