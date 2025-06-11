CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Customer (CustomerID, Name, Email)
VALUES 
(1, 'Ranveer', 'ran@example.com'),
(2, 'pratiksha', 'prati@example.com'),
(3, 'shiri', 'shiri@example.com');

INSERT INTO Product (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1500.00),
(2, 'Phone', 800.00),
(3, 'Tablet', 500.00),
(4, 'Headphones', 200.00);

select * from customer
    
select * from product
    
SELECT * FROM Customer 
WHERE Name LIKE 'p%';

select * from Customer
where name like 'R%';

select * from Product
where Price > 1000;

select * from Product 
where Price = (select max(Price) from Product);

select * from Product
where Price = (select min(Price) from Product);

select count(*) as TotalCustomers
from Customer;

select Price
from Product 
where ProductName = 'Laptop';

select ProductName
from Product
where ProductID = 4;

select ProductName
from Product
where ProductID = 2;

select Price
from Product 
where ProductID = 3 ;

--
SELECT ProductName, Price 
FROM Product;

SELECT *
FROM Customer
WHERE Email LIKE '%@example.com';

SELECT ProductName 
FROM Product
WHERE Price < 1000;

SELECT * 
FROM Customer 
WHERE Name LIKE '%a%';

SELECT ProductID, Price
FROM Product 
ORDER BY Price ASC;

SELECT COUNT(*) AS ExpensiveProducts 
FROM Product
WHERE Price > 500;

SELECT * FROM Product
ORDER BY Price DESC
OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;  -- Use LIMIT 1 OFFSET 1 if using MySQL

SELECT SUM(Price) AS TotalValue 
FROM Product;

SELECT *
FROM Product 
WHERE ProductName LIKE '%Phone%';
