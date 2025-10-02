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
