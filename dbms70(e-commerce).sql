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


