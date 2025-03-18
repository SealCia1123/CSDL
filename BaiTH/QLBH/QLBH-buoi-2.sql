use QuanLyBanHang;
--16.v	Lấy ra các thông tin gồm mã hóa đơn, mã vật tư, tên vật tư, đơn vị tính,
--giá bán, giá mua, số lượng, trị giá mua (giá mua * số lượng), trị giá bán (giá bán * số lượng)
--và cột khuyến mãi với khuyến mãi 10% cho những mặt hàng bán trong một hóa đơn lớn hơn 100. 
select MAHD, v.MAVT, TENVT, DVT, GIABAN, GIAMUA, SL, 'TriGiaMua' = GIAMUA * SL,
'TriGiaBan' = GIABAN * SL, KHUYENMAI = IIF(SL>100, 0.1*SL*GIABAN,0)
from VatTu v, CTHD c
where v.MAVT = c.MAVT;


--17.v	Tìm ra những mặt hàng chưa bán được.
select *
from VatTu
where MAVT not in (
					select distinct MAVT
					from CTHD);


--18.	Tạo bảng tổng hợp gồm các thông tin: mã hóa đơn, ngày hóa đơn, tên khách hàng, địa chỉ, số điện thoại, tên vật tư, đơn vị tính, giá mua, giá bán, số lượng, trị giá mua, trị giá bán.  
--19.	Tạo bảng tổng hợp tháng 5/2010 gồm các thông tin: mã hóa đơn, ngày hóa đơn, tên khách hàng, địa chỉ, số điện thoại, tên vật tư, đơn vị tính, giá mua, giá bán, số lượng, trị giá mua, trị giá bán.  

--20.v	Tạo bảng tổng hợp quý 1 – 2010 gồm các thông tin: mã hóa đơn,
-- ngày hóa đơn, tên khách hàng, địa chỉ, số điện thoại, tên vật tư, đơn vị tính,
-- giá mua, giá bán, số lượng, trị giá mua, trị giá bán.
set dateformat dmy;
select c.MAHD, NGAY, TENKH, DIACHI, DT, TENVT, DVT, GIAMUA, GIABAN, SL,
'TriGiaMua' = GIAMUA * SL, 'TriGiaBan' = GIABAN * SL into TONGHOPQ2
from KhachHang k, HoaDon h, VatTu v, CTHD c
where k.MAKH = h.MAKH and h.MAHD = c.MAHD and c.MAVT = v.MAVT
and DATEPART(Q, NGAY)=2;
select * from TONGHOPQ2;


--21.	Lấy ra danh sách các hóa đơn gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn. 


--22.v	Lấy ra hóa đơn có tổng trị giá lớn nhất gồm các thông tin:
-- Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn. 
select MAHD, NGAY, TENKH, DIACHI
from HoaDon h, KhachHang k
where h.MAKH = k.MAKH;


--23.v	Lấy ra hóa đơn có tổng trị giá lớn nhất trong tháng 5/2010 gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn. 
--24.	Đếm xem mỗi khách hàng có bao nhiêu hóa đơn. 
