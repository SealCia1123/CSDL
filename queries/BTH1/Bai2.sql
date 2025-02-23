-- Tao database
USE MASTER;

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'QLThueSach')
CREATE DATABASE QLThueSach;

USE QLThueSach;

-- Tao bang
CREATE TABLE SACH (
  MaSach CHAR(10) PRIMARY KEY,
  TenSach NVARCHAR (50) NOT NULL,
  TacGia NVARCHAR (50) NOT NULL,
  NhaXuatBan NVARCHAR (50) NOT NULL,
  GiaMua DECIMAL(8, 2) NOT NULL,
  GhiChu NVARCHAR (MAX)
);

CREATE TABLE KHACHHANG (
  MaKhachHang INT IDENTITY (1, 1) PRIMARY KEY,
  TenKhachHang NVARCHAR (50) NOT NULL,
  DiaChi NVARCHAR (100) NOT NULL,
  SDT NVARCHAR (12) NOT NULL,
  TheLoaiYeuThich NVARCHAR (50),
  GhiChu NVARCHAR (MAX)
);

CREATE TABLE THUESACH (
  MaKhachHang INT,
  MaSach char(10),
  NgayMuon date,
  NgayTra date NOT NULL,
  SoTien DECIMAL(8, 2) NOT NULL,
  GhiChu NVARCHAR (MAX),
  PRIMARY KEY (MaKhachHang, MaSach, NgayMuon),
  CONSTRAINT FK_KhachHang FOREIGN KEY (MaKhachHang) REFERENCES KHACHHANG (MaKhachHang),
  CONSTRAINT FK_Sach FOREIGN KEY (MaSach) REFERENCES SACH (MaSach)
);

-- Them records
-- Them bang SACH
INSERT INTO
  Sach (MaSach, TenSach, TacGia, NhaXuatBan, GiaMua)
VALUES
  ('SACH000001', 'Ngon Ngu Java', 'Nguyen Van A', 'Nha Nam', 45.99);

INSERT INTO
  Sach
VALUES
  ('SACH000002', 'CSDL', 'Tran Thi B', 'Kim Dong', 99.99, 'Hang moi');

INSERT INTO
  Sach (MaSach, TenSach, TacGia, NhaXuatBan, GiaMua)
VALUES
  ('SACH000003', 'Lap trinh giao dien C#', 'Dinh Van C', 'OU', 98.90);

-- Them bang KHACHHANG
INSERT INTO
  KhachHang (TenKhachHang, DiaChi, SDT, TheLoaiYeuThich)
VALUES
  ('Anh Long', 'Ha Noi', '0988880888', 'Ky Nang');

INSERT INTO
  KhachHang
VALUES
  ('Huy Bui', 'TPHCM', '0987654321', 'Self Help', 'ABC');

INSERT INTO
  KhachHang (TenKhachHang, DiaChi, SDT, TheLoaiYeuThich)
VALUES
  ('Nguyen An', 'Ha Noi', '09888812388', 'Trinh Tham');

-- Them bang THUESACH
INSERT INTO
  ThueSach (MaKhachHang, MaSach, NgayMuon, NgayTra, SoTien)
VALUES
  (3, 'SACH000003', '2025-01-30', '2025-02-23', 24.99);

INSERT INTO
  ThueSach
VALUES
  (1, 'SACH000001', '2025-01-01', '2025-01-08', 9.99, 'Thue 1 tuan');

INSERT INTO
  ThueSach (MaKhachHang, MaSach, NgayMuon, NgayTra, SoTien)
VALUES
  (2, 'SACH000002', '2025-02-01', '2025-02-08', 19.99);