CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    city VARCHAR(30),
    contact VARCHAR(15)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(30),
    phone VARCHAR(15)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    orderdetail_id INT PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Product(product_id),
    quantity INT,
    subtotal DECIMAL(10,2)
);

CREATE TABLE ProductSupplier (
    ps_id INT PRIMARY KEY,
    product_id INT REFERENCES Product(product_id),
    supplier_id INT REFERENCES Supplier(supplier_id)
);

INSERT INTO Product (product_id, product_name, category, price, stock) VALUES
(1, 'iPhone 15', 'Electronics', 75000, 10),
(2, 'Samsung Galaxy S23', 'Electronics', 65000, 8),
(3, 'HP Laptop', 'Electronics', 55000, 5),
(4, 'Nike Shoes', 'Fashion', 6000, 20),
(5, 'Levi’s Jeans', 'Fashion', 3500, 30),
(6, 'Mixer Grinder', 'Home Appliances', 4500, 15),
(7, 'LED TV', 'Electronics', 40000, 6),
(8, 'Wooden Chair', 'Furniture', 2500, 12);

INSERT INTO Supplier (supplier_id, supplier_name, city, contact) VALUES
(1, 'TechWorld Pvt Ltd', 'Mumbai', '9876543210'),
(2, 'FashionHub Ltd', 'Delhi', '9123456780'),
(3, 'HomeMakers Appliances', 'Bangalore', '9988776655'),
(4, 'FurniCraft', 'Pune', '9090909090');

INSERT INTO Customer (customer_id, customer_name, email, city, phone) VALUES
(1, 'Ranveer', 'ranveer@gmail.com', 'Mumbai', '9991112222'),
(2, 'Sahil', 'sahil@gmail.com', 'Delhi', '8882223333'),
(3, 'Pratiksha', 'pratiksha@gmail.com', 'Pune', '7773334444'),
(4, 'Jenny', 'jenny@gmail.com', 'Bangalore', '6664445555'),
(5, 'Shree', 'shree@gmail.com', 'Hyderabad', '9998887777');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-09-01', 75000),   -- Ranveer bought iPhone
(2, 2, '2025-09-05', 98500),   -- Sahil bought Samsung + Jeans
(3, 3, '2025-09-10', 19500),   -- Pratiksha bought Shoes + Mixer
(4, 4, '2025-09-15', 40000),   -- Jenny bought LED TV
(5, 5, '2025-09-20', 8500),    -- Shree bought Chair + Jeans
(6, 1, '2025-09-25', 115000);  -- Ranveer bought Laptop + Samsung

INSERT INTO OrderDetails (orderdetail_id, order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 1, 75000),  -- iPhone
(2, 2, 2, 1, 65000),  -- Samsung
(3, 2, 5, 1, 3500),   -- Jeans
(4, 3, 4, 2, 12000),  -- Shoes (2 qty)
(5, 3, 6, 1, 4500),   -- Mixer
(6, 4, 7, 1, 40000),  -- LED TV
(7, 5, 8, 2, 5000),   -- 2 Chairs
(8, 5, 5, 1, 3500),   -- Jeans
(9, 6, 3, 1, 55000),  -- Laptop
(10, 6, 2, 1, 65000); -- Samsung

INSERT INTO ProductSupplier (ps_id, product_id, supplier_id) VALUES
(1, 1, 1),  -- iPhone by TechWorld
(2, 2, 1),  -- Samsung by TechWorld
(3, 3, 1),  -- HP Laptop by TechWorld
(4, 7, 1),  -- LED TV by TechWorld
(5, 4, 2),  -- Nike Shoes by FashionHub
(6, 5, 2),  -- Jeans by FashionHub
(7, 6, 3),  -- Mixer by HomeMakers
(8, 8, 4);  -- Wooden Chair by FurniCraft

SELECT * FROM Customer;

SELECT product_name, price 
FROM Product 
WHERE category = 'Electronics';

SELECT o.order_id, o.order_date, o.total_amount
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
WHERE c.customer_name = 'Ranveer';

SELECT p.product_name, SUM(od.quantity) AS total_sold, SUM(od.subtotal) AS total_revenue
FROM OrderDetails od
JOIN Product p ON od.product_id = p.product_id
GROUP BY p.product_name;

SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;

SELECT s.supplier_name, COUNT(ps.product_id) AS product_count
FROM Supplier s
JOIN ProductSupplier ps ON s.supplier_id = ps.supplier_id
GROUP BY s.supplier_name
HAVING COUNT(ps.product_id) > 2;

SELECT p.product_name
FROM Product p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

--
SELECT product_name, stock
FROM Product
WHERE stock < 10;

SELECT customer_name, email, phone
FROM Customer
WHERE city = 'Mumbai';

SELECT product_name, price
FROM Product
ORDER BY price DESC
LIMIT 1;

SELECT order_id, customer_id, order_date, total_amount
FROM Orders
WHERE order_date BETWEEN '2025-09-01' AND '2025-09-30';

SELECT category, product_name, price
FROM Product p
WHERE price = (
    SELECT MIN(price) 
    FROM Product 
    WHERE category = p.category
);

SELECT city, COUNT(*) AS total_customers
FROM Customer
GROUP BY city;





