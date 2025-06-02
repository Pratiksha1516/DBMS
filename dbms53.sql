
CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE Supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_info VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE "Order" (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE OrderDetails (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES "Order"(order_id),
    product_id INT REFERENCES Product(product_id),
    quantity INT,
    price_at_purchase DECIMAL(10, 2)
);

CREATE TABLE ProductSupplier (
    product_id INT REFERENCES Product(product_id),
    supplier_id INT REFERENCES Supplier(supplier_id),
    supply_date DATE,
    quantity_supplied INT,
    PRIMARY KEY (product_id, supplier_id, supply_date)
);

INSERT INTO Product (product_name, category, price, stock_quantity)
VALUES ('Laptop', 'Electronics', 50000, 10),
       ('Smartphone', 'Electronics', 30000, 20),
       ('Tablet', 'Electronics', 20000, 15);

INSERT INTO Supplier (supplier_name, contact_info)
VALUES ('Tech Supplier Co.', 'techsupplier@example.com'),
       ('Gadgets Supplier Ltd.', 'gadgetsupplier@example.com');

INSERT INTO Customer (name, phone, email)
VALUES ('Alice', '9876543210', 'alice@example.com'),
       ('Bob', '9876543211', 'bob@example.com');

INSERT INTO "Order" (customer_id, order_date, total_amount)
VALUES (1, '2025-03-18', 80000),
       (2, '2025-03-19', 30000);

INSERT INTO OrderDetails (order_id, product_id, quantity, price_at_purchase)
VALUES (1, 1, 1, 50000),
       (1, 2, 1, 30000),
       (2, 2, 1, 30000);

INSERT INTO ProductSupplier (product_id, supplier_id, supply_date, quantity_supplied)
VALUES (1, 1, '2025-03-15', 5),
       (2, 2, '2025-03-16', 10),
       (3, 1, '2025-03-17', 7);

--DISPLAYING ALL THE TABLES
SELECT * FROM Product;
  
SELECT * FROM Supplier;

SELECT * FROM Customer;

SELECT * FROM "Order";

SELECT * FROM OrderDetails;

SELECT * FROM ProductSupplier;

--Aggregation function
SELECT COUNT(product_name)
FROM Product;

SELECT MAX(price)
FROM Product;

SELECT MIN(price)
FROM Product;

SELECT SUM(price)
FROM Product;

SELECT AVG(price)
FROM Product;

SELECT MAX(stock_quantity)
FROM Product;

SELECT MIN(stock_quantity)
FROM Product;

SELECT SUM(stock_quantity)
FROM Product;

SELECT AVG(stock_quantity)
FROM Product;

SELECT MAX(total_amount)
FROM "Order";

SELECT MIN(total_amount)
FROM "Order";

SELECT SUM(total_amount)
FROM "Order";

SELECT AVG(total_amount)
FROM "Order";

SELECT MAX(price_at_purchase)
FROM OrderDetails;

SELECT MIN(price_at_purchase)
FROM OrderDetails;

SELECT SUM(price_at_purchase)
FROM OrderDetails;

SELECT AVG(price_at_purchase)
FROM OrderDetails;

SELECT COUNT(product_id)
FROM ProductSupplier;

SELECT MAX(quantity_supplied)
FROM ProductSupplier;

SELECT MIN(quantity_supplied)
FROM ProductSupplier;

SELECT SUM(quantity_supplied)
FROM ProductSupplier;

SELECT AVG(quantity_supplied)
FROM ProductSupplier;


SELECT product_id, product_name, category, price, stock_quantity
FROM Product;

SELECT o.order_id, c.name AS customer_name, o.order_date, o.total_amount
FROM "Order" o
JOIN Customer c ON o.customer_id = c.customer_id;

SELECT od.order_detail_id, o.order_id, p.product_name, od.quantity, od.price_at_purchase
FROM OrderDetails od
JOIN "Order" o ON od.order_id = o.order_id
JOIN Product p ON od.product_id = p.product_id;

SELECT p.product_name, SUM(ps.quantity_supplied) AS total_supplied
FROM ProductSupplier ps
JOIN Product p ON ps.product_id = p.product_id
GROUP BY p.product_name;
	   
SELECT p.product_name, SUM(od.quantity) AS total_sold, SUM(od.price_at_purchase * od.quantity) AS total_sales
FROM OrderDetails od
JOIN Product p ON od.product_id = p.product_id
GROUP BY p.product_name;
