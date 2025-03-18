--22.	Từ Table Product, đếm số sản phẩm, đơn giá cao nhất, 
--thấp nhất và đơn giá trung bình cuả tất cả sản phẩm 
use Northwind;

select count(*) as SoLuongSP, max(UnitPrice) as DonGiaCaoNhat, min(UnitPrice) as DonGiaThapNhat,
avg(UnitPrice) as DonGiaTrungBinh
from Products;

--23.	Như câu 22 nhưng được nhóm theo loại sản phẩm (Category ID) 
select CategoryID, count(*) as SoLuongSP, max(UnitPrice) as DonGiaCaoNhat,
min(UnitPrice) as DonGiaThapNhat, avg(UnitPrice) as DonGiaTrungBinh
from Products
group by CategoryID;

--24.	Đếm số đơn đặt hàng cuả các Order có Ship Country là Belgium, Canada, UK 
select count(*)
from Orders
where ShipCountry in ('Belgium', 'Canada', 'UK')
group by ShipCountry;

--25.	Lập danh sách các loại sản phẩm có đơn giá trung bình lớn hơn 30 
select *
from Categories
where CategoryID in (select CategoryID
						from Products
						group by CategoryID
						having AVG(UnitPrice) > 30);


--26.	Tính đơn giá trung bình cuả các sản phẩm có đơn giá lớn hơn 30,
-- nhóm theo loại sản phẩm
select p.CategoryID, c.CategoryName, AVG(UnitPrice)
from Products p, Categories c
where p.CategoryID = c.CategoryID and UnitPrice > 30
group by p.CategoryID, c.CategoryName;


--27.	Thiết kế query tính doanh số của từng loại sản phẩm (Category)
-- trong năm 1996. Danh sách gồm 2 cột: Category Name, Sales;
-- trong đó SalesTotal = UnitPrice*Quantity*(1-Discount) 
select CategoryName, 'SalesTotal' = SUM(p.UnitPrice*Quantity*(1-Discount))
from Products p, Categories c, [Order Details] od, Orders o
where p.CategoryID = c.CategoryID and od.ProductID = p.ProductID and od.OrderID = o.OrderID
and year(o.OrderDate) = 1996
group by CategoryName;


--28.	Thiết kế query tính tỉ lệ tiền cước mua hàng (Freight) của từng khách hàng trong năm 1997.
-- Danh sách gồm các cột: Company Name (của Customer), Freight,
-- SalesTotal = UnitPrice * Quantity*(1-Discount), Percent= Freight/SalesTotal
select CompanyName, Freight, 'SalesTotal' = SUM(p.UnitPrice * Quantity*(1-Discount)),
'Percent' = Freight/SUM(p.UnitPrice * Quantity*(1-Discount))
from Customers c, Products p, [Order Details] od, Orders o
where c.CustomerID = o.CustomerID and od.OrderID = o.OrderID
and od.ProductID = p.ProductID and YEAR(OrderDate) = 1997
group by CompanyName, Freight;


--29.	Lập danh sách Customer có Company Name bắt đầu là 1 chữ nào đó được nhập từ bàn phím.
-- Danh sách gồm: Customer ID, CompanyName, ContactName, Address, City, Country, Phone, Fax



--30.	Lập danh sách các Order có Order Date trong 1 khoảng thời gian nào đó.
-- Tham số nhập: “From date:” và “To:”. Danh sách gồm: Order ID, Customer, ShipCountry, OrderDate
declare @NgayBD datetime, @NgayKT datetime;
set dateformat dmy;
set @NgayBD = '1/1/1996';
set @NgayKT = '1/1/2000';
select OrderID, CustomerID, ShipCountry, OrderDate
from Orders
where OrderDate between @NgayBD and @NgayKT;


--31.	Người ta muốn có danh sách các Order của một quốc gia nào đó của khách hàng
-- trong một năm mua hàng nào đó được nhập từ bàn phím. Anh chị hãy thực hiện Query này.
-- Danh sách gồm các cột như trên. 
--32.	Tạo danh sách các Product thuộc một loại nào đó khi nhập Category ID từ bàn phím. Danh sách gồm: Product Name, Unit Price, Supplier 

-- 33.	Người ta muốn biết trong một ngày nào đó có số lượng đơn đặt hàng theo từng khách hàng 
-- cần phải hoàn tất hay không? (theo Required Date). Anh Chị hãy tạo query để thực hiện điều này. 
-- Thí dụ nhập ngày 28/9/95 thì ra kết quả sau:
set dateformat dmy;
declare @Ngay datetime;
set @Ngay = '18/9/1996';
select CompanyName as Customer, COUNT(o.OrderID) as CountOfOrderID
from Customers c, Orders o
where c.CustomerID = o.CustomerID and @Ngay = RequiredDate
group by CompanyName;

-- 36.	Người ta muốn biết trong một ngày nào đó (nếu chỉ Enter là ngày hiện tại) 
-- tổng số đơn đặt hàng và doanh số cuả các đơn hàng đó là bao nhiêu. 
-- Thí dụ nhập 7 thang 4 nam 1998 thì kết quả sẽ là: 
set dateformat dmy;
declare @NgayNaoDo datetime;
set @NgayNaoDo = '1/1/1997';
if @NgayNaoDo is null
	set @NgayNaoDo = getdate();
select COUNT(o.OrderID) as Customer, SUM(p.UnitPrice*Quantity*(1-Discount)) as 'Doanh So'
from [Order Details] od, Products p, Orders o
where o.OrderID = od.OrderID and p.ProductID = od.ProductID and OrderDate = @NgayNaoDo;