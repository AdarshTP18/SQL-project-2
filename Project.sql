
-- view all records in the Customers table
select*from mintclassics.customers;

-- view all records in the employees table
select*from mintclassics.employees;

-- view all records in the offices table
select*from mintclassics.offices;

-- view all records in the order details  table
select*from mintclassics.orderdetails;

-- view all records in the order table
select*from mintclassics.orders;

-- view all records in the payments table
select*from mintclassics.payments;

-- view all records in the productlines table
select*from mintclassics.productlines;

-- view all records in the products table
SELECT * FROM mintclassics.products;

-- view all records in the products table
SELECT * FROM mintclassics.warehouses;

-- View all product and its inventory details
select pr.productcode,pr.productname,pr.quantityinstock,wh.warehousename from mintclassics.products as pr join mintclassics.warehouses wh on pr.warehousecode=wh.warehousecode;

-- Query to get relevant data from orders and order_details tables
SELECT o.orderNumber, o.orderDate, o.status, od.productCode, od.quantityOrdered, od.priceEach FROM mintclassics.orders o INNER JOIN mintclassics.orderdetails od ON o.orderNumber = od.orderNumber;

-- Query to get relevant data from products table
SELECT productCode, productName, buyPrice,quantityInStock FROM mintclassics.products;

-- Query to find top-selling products based on quantity ordered
select p.productCode,p.productName,p.quantityInStock,sum(o.quantityordered) as total_quantity_ordered from mintclassics.products as p join mintclassics.orderdetails as o on p.productcode=o.productcode group by p.productCode,p.productName order by total_quantity_ordered DESC;

--  Sales Figures and Inventory Counts

select p.productCode,p.productName,sum(od.quantityordered)as TotalSales from mintclassics.products p join mintclassics.orderdetails od group by p.productCode,p.productName order by TotalSales desc;

-- Identify Slow-Moving Inventory

SELECT p.productCode, p.productName, p.quantityInStock, MAX(o.orderDate) AS lastOrderDate FROM mintclassics.products p LEFT JOIN mintclassics.orderdetails od ON p.productCode = od.productCode LEFT JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber GROUP BY p.productCode, p.productName, p.quantityInStock HAVING lastOrderDate IS NULL OR lastOrderDate <= DATE_SUB(NOW(), INTERVAL 6 MONTH) ORDER BY lastOrderDate;

-- Determine the Most Profitable Products
 select p.productCode,p.productName,p.quantityInStock,sum(od.priceeach*od.quantityordered)as TotalRevenue from mintclassics.products p inner join mintclassics.orderdetails od group by p.productCode,p.productName,p.quantityinstock order by TotalRevenue Desc;
 
 -- Based on the  analysis of the Mint Classics database, here are some key conclusions and findings:

-- Top-Selling Products:

-- The top-selling products based on the quantity ordered are as follows:
-- Product Code:S18_3232, Product Name: 1992 Ferrari 360 Spider red, Total Quantity Ordered: 1808

-- Sales Figures and Inventory Counts:

-- Highest Selling Product: Pont yacht- Sales: 105516

-- Slow-Moving Inventory: 1985 Toyota Supra, 1992 porsche Cayenne turbo Silver


-- Most Profitable Products:

-- The most profitable products were determined based on the total revenue generated from each product's sales. The top profitable products are:
-- Product Code: S72_3212, Product Name: Pont Yacht, Quantity in Stock: 414, Total Revenue: 9604190.61
-- Inventory Details by Warehouse:

-- A view of the products with their inventory details along with the respective warehouse names was provided. 
 