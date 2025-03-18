-- 1. Viết tích Đề-các giữa 2 bảng Customers và Orders, nhận xét số hàng kết quả.
-- Thêm điều kiện kết, nhận xét số hàng kết quả. 
select * from Customers, Orders;
-- số hàng của tích đề các bảng Customers và Orders: 75530


-- 2. Lập danh sách các Customer ở thành phố London hoặc ở nước Pháp (France).
-- Danh sách gồm: Customer ID, Company Name, Contact Name, Address, City 
select CustomerID, CompanyName, ContactName, Address, City 
from Customers
where City = 'London' or Country = 'France';


-- 3. Lập danh sách các Customer là Sales Manager của nước Mỹ (USA) hoặc là Owner của Mexico.
-- Danh sách gồm như trên, thêm cột Contact Title
select CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from Customers
where ContactTitle = 'Sales Manager' and Country = 'USA' or ContactTitle = 'Owner' and Country = 'Mexico';


-- 4. Lập danh sách các Customer là Manager của nước Mỹ (USA) hoặc:
-- không phải là Owner của Mexico. Danh sách gồm các fields như trên
select CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from Customers
where ContactTitle = 'Manager' and Country = 'USA' or ContactTitle != 'Owner' and Country = 'Mexico';


-- 5.	Lập danh sách các Order có ngày đặt hàng trong 6 tháng đầu năm 1997. Danh sách gồm: Order ID,
-- Order Date, Customer, Employee trong đó Customer là Company Name của khách hàng, Employee lấy Last Name
set dateformat ymd;
select  OrderId, OrderDate, CustomerID, EmployeeID
from Orders
where OrderDate >= '1997-01-01' and OrderDate <= '1997-06-30';


-- 6. Lập danh sách các Order có ngày đặt hàng trong tháng 2 năm 1997.
-- Danh sách gồm: Order ID, Order Date, CustomerID, EmployeeID
select OrderId, OrderDate, CustomerID, EmployeeID
from Orders
where YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 2;


-- 7.	Danh sách các Order có Ship Country là UK do nhân viên có mã là 2 phụ trách trong năm 1997.
-- Danh sách gồm: Order ID, Order Date, Freight
select OrderID, OrderDate, Freight
from Orders
where ShipCountry = 'UK' and EmployeeID = 2;


-- 8.	Người ta muốn biết danh sách các sản phẩm có tên bắt đầu là Ch.
-- Anh chi hãy lập danh sách này, gồm các cột: Product ID, Product Name.
select ProductID, ProductName
from Products
where ProductName like 'Ch%';


-- 9. Lập danh sách các sản phẩm không còn tiếp tục cung cấp nữa (trường Discontinued)
-- và có số lượng tồn kho (trường Unit In stock) lớn hơn không.
-- Danh sách gồm: Product ID, Unit Price, Unit In Stock.
select ProductID, UnitPrice, UnitsInStock
from Products
where Discontinued = 1 and UnitsInStock > 0;


--10. Lập danh sách các khách hàng không thuộc nước Mỹ.
-- Danh sách gồm: Company Name, Contact Name, Country, Phone, Fax 
select CompanyName, ContactName, Country, Phone, Fax
from Customers
where Country != 'USA';


-- 11. Lập danh sách các khách hàng không thuộc các nước Brazil, Italy, Spain, Venezuela và UK.
-- Danh sách gồm: Company Name, Contact Name, Country, Phone, Fax 
select CompanyName, ContactName, Country, Phone, Fax
from Customers
where Country not in ('Brazil', 'Italy', 'Spain', 'Venezuela', 'UK');


-- 12. Lập danh sách các đơn đặt hàng có Ship country là USA và có Freight > 300
-- hoặc các đơn có Ship Country là Argentina và Freight <5.
-- Danh sách gồm: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight 
select OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry, ShippedDate, Freight
from Orders
where ShipCountry = 'USA' and Freight > 300 or ShipCountry = 'Argentina' and Freight < 5;


-- 13.	Lập danh sách các đơn đặt hàng có Ship country là USA và có Freight > 300 hoặc các đơn có
-- ShipCountry là Argentina và Freight <5.
-- Danh sách gồm: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight 
select OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry, ShippedDate, Freight
from Orders
where ShipCountry = 'USA' and Freight > 300 or ShipCountry = 'Argentina' and Freight < 5;


-- 14.	Lập danh sách các đơn hàng trong tháng 4/97 gồm các thông tin sau:
-- Order ID, Order Date, Customer, Employee, Freight, New-Freight trong đó New-Freight =110% Freight. 
select OrderId, OrderDate, CustomerId, EmployeeID, Freight, Freight *1.1 as NewFreight
from Orders
where YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 4;


-- 15.	Lập danh sách trị giá tồn kho các Product không còn tiếp tục cung cấp nữa (trường 
-- Discontinued là Yes). Danh sách gồm: Product ID, Product Name, Supplier Name, 
-- UnitPrice, 	UintsInStock, 	Total, 	Supplier 	Fax, 	trong 	đó 	Total 	= UnitPrice*UnitsInStock 
select ProductID, ProductName, CompanyName, UnitPrice, UnitsInStock, Total = UnitPrice * UnitsInStock, Fax
from Products p, Suppliers s
where p.SupplierID = s.SupplierID and Discontinued = 1;


-- 16.	Lập danh sách nhân viên (Table Employee) có hire date từ năm 1993 trở về trước.
-- Danh sách gồm: Name, Hire date, Title, BirthDate, Home Phone,
-- trong đó trường Name ghép từ các trường: TitleOfCourstesy, chữ đầu trường LastName và trường FirstName 
select Name = TitleOfCourtesy + LEFT(LastName, 1) + FirstName, HireDate, Title, BirthDate, HomePhone
from Employees
where YEAR(HireDate) < 1993;


-- 17. Lập danh sách các Order có ngày đặt hàng trong tháng 4 hàng năm.
-- Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer
-- là Company Name của khách hàng, Employee lấy Last Name 
select OrderId, OrderDate, CompanyName, LastName
from Orders o, Customers c, Employees e
where o.CustomerID = c.CustomerID and o.EmployeeID = e.EmployeeID and MONTH(OrderDate) = 4;


--18.	Lập danh sách các Order có ngày đặt hàng các năm chẳn.
--Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer là
--Company Name của khách hàng, Employee lấy Last Name
select OrderID, OrderDate, CompanyName, LastName
from Orders o, Customers c, Employees e
where o.CustomerID = c.CustomerID and o.EmployeeID = e.EmployeeID and YEAR(OrderDate) % 2 = 0;


--19.	Lập danh sách các Order có ngày đặt hàng là 5, 13, 14, 23.
--Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer là
--Company Name của khách hàng, Employee lấy Last Name 
select OrderID, OrderDate,  CompanyName, LastName
from Orders o, Customers c, Employees e
where o.CustomerID = c.CustomerID and o.EmployeeID = e.EmployeeID and DAY(OrderDate) in (5, 13, 14, 23);


--20.	Người ta muốn có danh sách chi tiết các hoá đơn (Order Details) trong năm 1997.
-- Danh sách gồm các thông tin: Order ID, ProductName, Unit Price,
-- Quantity, ThanhTien, Discount, TienGiamGia, TienPhaiTra trong đó: ThanhTien = UnitPrice*Quantity,
-- TienGiamGia = ThanhTien *Discount, TienPhaiTra = ThanhTien – TienGiamGia 
select o.OrderID, ProductName, p.UnitPrice, Quantity, ThanhTien = p.UnitPrice * Quantity,
Discount, TienGiamGia = p.UnitPrice * Quantity * Discount, TienPhaiTra = p.UnitPrice * Quantity - p.UnitPrice * Quantity * Discount
from Orders o, [Order Details] od, Products p
where o.OrderID = od.OrderID and od.ProductID = p.ProductID and YEAR(OrderDate) = 1997;


-- 21. Tương tự như câu 20 nhưng chỉ lấy các record có Discount >0 và có TienPhaiTra <50 
select o.OrderID, ProductName, p.UnitPrice, Quantity, ThanhTien = p.UnitPrice * Quantity,
Discount, TienGiamGia = p.UnitPrice * Quantity * Discount, TienPhaiTra = p.UnitPrice * Quantity - p.UnitPrice * Quantity * Discount
from Orders o, [Order Details] od, Products p
where o.OrderID = od.OrderID and od.ProductID = p.ProductID and Discount > 0 and p.UnitPrice * Quantity - p.UnitPrice * Quantity * Discount < 50;
