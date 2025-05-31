
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
  
