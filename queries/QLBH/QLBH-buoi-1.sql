use QuanLyBanHang;
-- 1. Hiển thị danh sách các khách hàng có địa chỉ là “Tân Bình” gồm mã khách hàng,
-- tên khách hàng, địa chỉ, điện thoại, và địa chỉ E-mail.

select TENKH, DIACHI, DT, EMAIL
from KhachHang
where DIACHI=N'Tân Bình';

-- 2. Hiển thị danh sách các khách hàng gồm các thông tin mã khách hàng, tên khách hàng,
-- địa chỉ và địa chỉ E-mail của những khách hàng chưa có số điện thoại. 
select MAKH, TENKH, DIACHI, EMAIL
from KhachHang
where DT is null;

--3.	Hiển thị danh sách các khách hàng chưa có số điện thoại và cũng chưa có địa chỉ Email
-- gồm mã khách hàng, tên khách hàng, địa chỉ. 
select MAKH, TENKH, DIACHI
from KhachHang
where DT is null and email is null;

--4.	Hiển thị danh sách các khách hàng đã có số điện thoại và địa chỉ E-mail gồm mã khách hàng,
-- tên khách hàng, địa chỉ, điện thoại, và địa chỉ E-mail. 
select MAKH, TENKH, DIACHI, DT, EMAIL
from KhachHang
where DT is not null and EMAIL is not null;


--5.	Hiển thị danh sách các vật tư có đơn vị tính là “Cái” gồm mã vật tư, tên vật tư và giá mua. 
select MAVT, TENVT, GIAMUA
from VatTu
where DVT = N'Cái';

--6.	Hiển thị danh sách các vật tư gồm mã vật tư, tên vật tư, đơn vị tính và giá mua mà có giá mua trên 25000. 
select MAVT, TENVT, DVT, GIAMUA
from VatTu
where GIAMUA > 25000;


--7.	Hiển thị danh sách các vật tư là “Gạch” (bao gồm các loại gạch) gồm mã vật tư, tên vật tư,
-- đơn vị tính và giá mua. 
select MAVT, TENVT, DVT, GIAMUA
from VatTu
where TENVT like N'%Gạch%';


--8.	Hiển thị danh sách các vật tư gồm mã vật tư, tên vật tư, đơn vị tính
-- và giá mua mà có giá mua nằm trong khoảng từ 20000 đến 40000. 
select MAVT, TENVT, DVT, GIAMUA
from VatTu
where GIAMUA between 20000 and 40000;


--9.	Lấy ra các thông tin gồm Mã hóa đơn, ngày lập hóa đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại. 
--10.	Lấy ra các thông tin gồm Mã hóa đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại của ngày 25/5/2010. 

