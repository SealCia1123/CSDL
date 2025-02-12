-- CREATE TABLE SACH (
--   MaSach CHAR(10) PRIMARY KEY,
--   TenSach NVARCHAR(50) NOT NULL,
--   TacGia NVARCHAR(50) NOT NULL,
--   NhaXuatBan NVARCHAR(50) NOT NULL,
--   GiaMua DECIMAL(8, 2) NOT NULL,
--   GhiChu NVARCHAR(MAX)
-- );
-- CREATE TABLE KHACHHANG (
--   MaKhachHang INT IDENTITY(1, 1) PRIMARY KEY,
--   TenKhachHang NVARCHAR(50) NOT NULL,
--   DiaChi NVARCHAR(100) NOT NULL,
--   SDT NVARCHAR(12) NOT NULL,
--   TheLoaiYeuThich NVARCHAR(50),
--   GhiChu NVARCHAR(MAX)
-- );
-- CREATE TABLE THUESACH (
--   MaKhachHang INT,
--   MaSach char(10),
--   NgayMuon date,
--   NgayTra date NOT NULL,
--   SoTien DECIMAL(8, 2) NOT NULL,
--   GhiChu NVARCHAR(MAX),
--   PRIMARY KEY (MaKhachHang, MaSach, NgayMuon),
--   CONSTRAINT FK_KhachHang FOREIGN KEY (MaKhachHang) REFERENCES KHACHHANG(MaKhachHang),
--   CONSTRAINT FK_Sach FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
-- );
SELECT
  *
FROM
  SACH;

INSERT INTO
  Sach(MaSach, TenSach, TacGia, NhaXuatBan, GiaMua)
VALUES
  (
    'SACH000003',
    'Lap trinh giao dien C#',
    'Dinh Van C',
    'OU',
    98.90
  );

SELECT
  *
FROM
  KHACHHANG;

INSERT INTO
  KhachHang (TenKhachHang, DiaChi, SDT, TheLoaiYeuThich)
VALUES
  (
    'Anh Long',
    'Ha Noi',
    '0988880888',
    'Ky Nang'
  );

SELECT
  *
FROM
  THUESACH;

INSERT INTO
  ThueSach (MaKhachHang, MaSach, NgayMuon, NgayTra, SoTien)
VALUES
  (
    3,
    'SACH000003',
    '2025-01-30',
    '2025-02-23',
    24.99
  );