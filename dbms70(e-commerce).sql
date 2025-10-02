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


