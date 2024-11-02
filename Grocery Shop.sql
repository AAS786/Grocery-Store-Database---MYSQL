Create database Kirana_store;
use Kirana_store;

-- 1 Create Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 2 Create Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    address TEXT,
    email VARCHAR(100)
);

-- 3 Create Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category int,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    supplier_id INT,
    stock INT DEFAULT 0,
    FOREIGN KEY (category) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 4 Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);

-- 5 Create Sales Table
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    sale_date DATETIME NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    discount DECIMAL(10, 2) DEFAULT 0,
    final_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6 Create SalesDetails Table
CREATE TABLE SalesDetails (
    sale_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 7 Create Inventory Table
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    stock_in INT DEFAULT 0,
    stock_out INT DEFAULT 0,
    current_stock INT DEFAULT 0,
    last_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 8 Create Purchase Table
CREATE TABLE Purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    purchase_date DATE NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 9 Create PurchaseDetails Table
CREATE TABLE PurchaseDetails (
    purchase_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    product_id INT,
    quantity INT NOT NULL,
    cost_per_unit DECIMAL(10, 2) NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 10 Create Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    purchase_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id)
);

-- Insert Values

INSERT INTO Products (product_id, product_name, category, price_per_unit, unit, supplier_id, stock) VALUES
(1, 'Rice', 1, 50, 'kg', 1, 100),
(2, 'Sugar', 1, 45, 'kg', 2, 150),
(3, 'Milk', 2, 25, 'liter', 3, 200),
(4, 'Biscuits', 3, 10, 'piece', 4, 500),
(5, 'Tea', 4, 200, 'kg', 5, 50),
(6, 'Wheat Flour', 1, 40, 'kg', 1, 200),
(7, 'Butter', 2, 50, 'piece', 3, 120),
(8, 'Chips', 3, 20, 'packet', 4, 300),
(9, 'Green Tea', 4, 250, 'kg', 5, 40),
(10, 'Dish Soap', 5, 30, 'bottle', 6, 150);


INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, address, email) VALUES
(1, 'ABC Grains', '1234567890', 'Street 1, City A', 'abcgrains@example.com'),
(2, 'XYZ Sugars', '0987654321', 'Street 2, City B', 'xyzsugars@example.com'),
(3, 'Dairy Farm', '1122334455', 'Street 3, City C', 'dairyfarm@example.com'),
(4, 'Snack Foods Ltd.', '2233445566', 'Street 4, City D', 'snackfoods@example.com'),
(5, 'Tea House', '3344556677', 'Street 5, City E', 'teahouse@example.com'),
(6, 'Home Essentials', '4455667788', 'Street 6, City F', 'homeessentials@example.com'),
(7, 'Green Grocers', '5566778899', 'Street 7, City G', 'greengrocers@example.com'),
(8, 'SnackHub', '6677889900', 'Street 8, City H', 'snackhub@example.com'),
(9, 'Daily Needs', '7788990011', 'Street 9, City I', 'dailyneeds@example.com'),
(10, 'Fresh Foods', '8899001122', 'Street 10, City J', 'freshfoods@example.com');


INSERT INTO Customers (customer_id, customer_name, contact_number, email, address) VALUES
(1, 'John Doe', '9990011223', 'john@example.com', 'Area 51, City F'),
(2, 'Jane Smith', '8881122334', 'jane@example.com', 'Area 52, City G'),
(3, 'Bob Johnson', '7772233445', 'bob@example.com', 'Area 53, City H'),
(4, 'Alice Williams', '6663344556', 'alice@example.com', 'Area 54, City I'),
(5, 'Mike Brown', '5554455667', 'mike@example.com', 'Area 55, City J'),
(6, 'Sam Taylor', '1112233445', 'sam@example.com', 'Area 56, City K'),
(7, 'Linda Brown', '2223344556', 'linda@example.com', 'Area 57, City L'),
(8, 'Tom Harris', '3334455667', 'tom@example.com', 'Area 58, City M'),
(9, 'Emily Clark', '4445566778', 'emily@example.com', 'Area 59, City N'),
(10, 'Michael Lee', '5556677889', 'michael@example.com', 'Area 60, City O');


INSERT INTO Sales (sale_id, customer_id, total_amount, sale_date, payment_method, discount, final_amount) VALUES
(1, 1, 500, '2024-10-01', 'Cash', 0, 500),
(2, 2, 750, '2024-10-02', 'UPI', 50, 700),
(3, 3, 300, '2024-10-03', 'Credit Card', 20, 280),
(4, 4, 450, '2024-10-04', 'Cash', 0, 450),
(5, 5, 1200, '2024-10-05', 'Debit Card', 100, 1100),
(6, 6, 650, '2024-10-06', 'Cash', 0, 650),
(7, 7, 500, '2024-10-07', 'Credit Card', 25, 475),
(8, 8, 800, '2024-10-08', 'UPI', 50, 750),
(9, 9, 1000, '2024-10-09', 'Debit Card', 0, 1000),
(10, 10, 350, '2024-10-10', 'Cash', 0, 350);


INSERT INTO SalesDetails (sale_detail_id, sale_id, product_id, quantity, price, total_price) VALUES
(1, 1, 1, 5, 50, 250),
(2, 1, 3, 2, 25, 50),
(3, 2, 2, 10, 45, 450),
(4, 2, 4, 5, 10, 50),
(5, 3, 5, 1, 200, 200),
(6, 4, 3, 5, 25, 125),
(7, 5, 1, 10, 50, 500),
(8, 6, 6, 5, 40, 200),
(9, 6, 7, 3, 50, 150),
(10, 7, 8, 10, 20, 200),
(11, 7, 2, 5, 45, 225),
(12, 8, 9, 2, 250, 500),
(13, 8, 4, 5, 10, 50),
(14, 9, 3, 15, 25, 375),
(15, 9, 10, 10, 30, 300);


INSERT INTO Inventory (inventory_id, product_id, stock_in, stock_out, current_stock, last_updated) VALUES
(1, 1, 50, 10, 90, '2024-10-01'),
(2, 2, 100, 20, 130, '2024-10-02'),
(3, 3, 200, 50, 150, '2024-10-03'),
(4, 4, 500, 100, 400, '2024-10-04'),
(5, 5, 60, 10, 50, '2024-10-05'),
(6, 6, 200, 20, 180, '2024-10-06'),
(7, 7, 150, 30, 120, '2024-10-07'),
(8, 8, 300, 50, 250, '2024-10-08'),
(9, 9, 40, 10, 30, '2024-10-09'),
(10, 10, 150, 50, 100, '2024-10-10');


INSERT INTO Purchase (purchase_id, supplier_id, total_amount, purchase_date, payment_status) VALUES
(1, 1, 2500, '2024-09-01', 'Paid'),
(2, 2, 4000, '2024-09-02', 'Unpaid'),
(3, 3, 5000, '2024-09-03', 'Paid'),
(4, 4, 600, '2024-09-04', 'Pending'),
(5, 5, 1200, '2024-09-05', 'Paid'),
(6, 6, 1800, '2024-09-06', 'Paid'),
(7, 7, 2500, '2024-09-07', 'Unpaid'),
(8, 8, 6000, '2024-09-08', 'Paid'),
(9, 9, 900, '2024-09-09', 'Pending'),
(10, 10, 3500, '2024-09-10', 'Paid');


INSERT INTO PurchaseDetails (purchase_detail_id, purchase_id, product_id, quantity, cost_per_unit, total_cost) VALUES
(1, 1, 1, 50, 50, 2500),
(2, 2, 2, 100, 40, 4000),
(3, 3, 3, 200, 25, 5000),
(4, 4, 4, 60, 10, 600),
(5, 5, 5, 30, 40, 1200),
(6, 6, 6, 45, 40, 1800),
(7, 7, 8, 125, 20, 2500),
(8, 8, 9, 24, 250, 6000),
(9, 9, 10, 30, 30, 900),
(10, 10, 4, 350, 10, 3500);


INSERT INTO Payments (payment_id, sale_id, purchase_id, amount, payment_date, payment_method, status) VALUES
(1, 1, NULL, 500, '2024-10-01', 'Cash', 'Completed'),
(2, NULL, 2, 4000, '2024-09-02', 'Bank Transfer', 'Pending'),
(3, 2, NULL, 700, '2024-10-02', 'UPI', 'Completed'),
(4, NULL, 4, 600, '2024-09-04', 'Credit Card', 'Pending'),
(5, 5, NULL, 1100, '2024-10-05', 'Debit Card', 'Completed'),
(6, 6, NULL, 650, '2024-10-06', 'Cash', 'Completed'),
(7, NULL, 7, 2500, '2024-09-07', 'Bank Transfer', 'Unpaid'),
(8, 8, NULL, 750, '2024-10-08', 'UPI', 'Completed'),
(9, NULL, 9, 900, '2024-09-09', 'Credit Card', 'Pending'),
(10, 10, NULL, 350, '2024-10-10', 'Cash', 'Completed');


INSERT INTO Categories (category_id, category_name, description) VALUES
(1, 'Grains', 'Includes rice, wheat, and other grains'),
(2, 'Dairy', 'Includes milk, cheese, and other dairy products'),
(3, 'Snacks', 'Includes biscuits, chips, and other snacks'),
(4, 'Beverages', 'Includes tea, coffee, and other beverages'),
(5, 'Household', 'Household essentials like soap, detergent'),
(6, 'Condiments', 'Spices, sauces, and other flavoring agents'),
(7, 'Bakery', 'Includes bread, biscuits, and pastries'),
(8, 'Fruits', 'Fresh fruits of various types'),
(9, 'Vegetables', 'Fresh vegetables of various types'),
(10, 'Personal Care', 'Toiletries and other personal care items');


-- SELECT & desc

Select *  from Categories ;
select * from Suppliers ;
select * from Products ;
select * from Payments ;
select * from PurchaseDetails ;
select * from Purchase ;
select * from Inventory ;
select * from SalesDetails ;
select * from sales ;
select * from Customers ;

desc Categories ;
desc Suppliers ;
desc Products ;
desc Payments ;
desc PurchaseDetails ;
desc Purchase ;
desc Inventory ;
desc SalesDetails ;
desc Sales ;
desc Customers ;


-- Fetch all products in the "Snacks" category.
SELECT product_name, price_per_unit, unit
FROM Products
WHERE category = 3;

-- Retrieve all products and their categories
SELECT p.product_name, c.category_name
FROM Products p
JOIN Categories c ON p.category = c.category_id;

-- List all suppliers with their contact information
SELECT supplier_name, contact_number, email
FROM Suppliers;

-- Get all customers who have made purchases
SELECT DISTINCT c.customer_name, c.contact_number
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id;

-- Find total sales made in a specific month (October 2024)
SELECT SUM(total_amount) AS total_sales
FROM Sales
WHERE sale_date BETWEEN '2024-10-01' AND '2024-10-31';

-- Show all sales details along with the product names
SELECT sd.sale_detail_id, s.sale_id, p.product_name, sd.quantity, sd.price, sd.total_price
FROM SalesDetails sd
JOIN Sales s ON sd.sale_id = s.sale_id
JOIN Products p ON sd.product_id = p.product_id;

-- Count the number of products in stock
SELECT SUM(stock) AS total_products_in_stock
FROM Products;

-- List all purchases along with supplier names
SELECT p.purchase_id, s.supplier_name, p.total_amount, p.purchase_date
FROM Purchase p
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- Retrieve inventory details for all products
SELECT p.product_name, i.current_stock, i.stock_in, i.stock_out
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id;

-- Get the total number of sales for each customer
SELECT c.customer_name, COUNT(s.sale_id) AS total_sales
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name;

-- Find products that have low stock (less than 100 units)
SELECT product_name, stock
FROM Products
WHERE stock < 100;

-- Calculate the average price of products per category
SELECT c.category_name, AVG(p.price_per_unit) AS average_price
FROM Products p
JOIN Categories c ON p.category = c.category_id
GROUP BY c.category_name;

-- Find the highest sales amount:
SELECT MAX(total_amount) AS highest_sales
FROM Sales;


-- Show all payments made for sales
SELECT p.payment_id, s.sale_id, p.amount, p.payment_date
FROM Payments p
LEFT JOIN Sales s ON p.sale_id = s.sale_id;

-- Retrieve all sales with applied discounts
SELECT s.sale_id, s.total_amount, s.discount, s.final_amount
FROM Sales s
WHERE s.discount > 0;

-- Find the total number of customers
SELECT COUNT(customer_id) AS total_customers
FROM Customers;

-- Get the latest inventory updates for each product
SELECT p.product_name, i.last_updated
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
ORDER BY i.last_updated DESC;

-- List all purchases that are pending payment:
SELECT * FROM Purchase
WHERE payment_status = 'Pending';

-- Get the details of sales, including product name and quantity sold:
SELECT s.sale_id, p.product_name, sd.quantity
FROM Sales s
JOIN SalesDetails sd ON s.sale_id = sd.sale_id
JOIN Products p ON sd.product_id = p.product_id;

-- Calculate the total cost of purchases made on a specific date
SELECT SUM(total_amount) AS total_purchase_amount
FROM Purchase
WHERE purchase_date = '2024-09-05';

-- Find the second highest sales amount:
SELECT MAX(total_amount) AS second_highest_sales
FROM Sales
WHERE total_amount < (SELECT MAX(total_amount) FROM Sales);

--  -- Find the 3 highest sales amount:
SELECT MAX(total_amount) AS second_highest_sales
FROM Sales
WHERE total_amount < (SELECT MAX(total_amount) FROM Sales)
AND total_amount < (SELECT MAX(total_amount) FROM Sales WHERE total_amount < (SELECT MAX(total_amount) FROM Sales));

-- Find 1,2,3 highest sales
SELECT
    (SELECT MAX(total_amount) FROM Sales) AS First_Highest_sales,
    (SELECT MAX(total_amount) FROM Sales WHERE total_amount < (SELECT MAX(total_amount) FROM Sales)) AS Second_highest_sales,
    (SELECT MAX(total_amount) FROM Sales WHERE total_amount < (SELECT MAX(total_amount) FROM Sales WHERE 
    total_amount < (SELECT MAX(total_amount) FROM Sales))) AS Third_highest_sales;

-- find all products whose name start with 'b'
SELECT * 
FROM Products 
WHERE product_name LIKE 'B%';

-- find all products with a price per unit greater than 50?
SELECT product_name, price_per_unit 
FROM Products 
WHERE price_per_unit > 50;

-- retrieve all customers who have either a contact number starting with '9' or an email address ending with 'example.com'?
SELECT customer_name, contact_number, email 
FROM Customers 
WHERE contact_number LIKE '9%' OR email LIKE '%example.com';

-- find products where the current stock is less than 50 or the stock out exceeds 100
SELECT p.product_name, i.current_stock, i.stock_out 
FROM Products p 
JOIN Inventory i ON p.product_id = i.product_id 
WHERE i.current_stock < 50 OR i.stock_out > 100;

-- retrieve all purchases that are either 'Paid' or 'Pending'?
SELECT purchase_id, supplier_id, total_amount, purchase_date, payment_status 
FROM Purchase 
WHERE payment_status IN ('Paid', 'Pending');

-- to find all sales made using 'Cash' or 'Debit Card'.
SELECT sale_id, customer_id, total_amount, sale_date 
FROM Sales 
WHERE payment_method IN ('Cash', 'Debit Card');


--  find out whose sales is greater than 600 ?
SELECT customer_id, SUM(total_amount) AS total_sales 
FROM Sales 
GROUP BY customer_id 
HAVING total_sales > 600;