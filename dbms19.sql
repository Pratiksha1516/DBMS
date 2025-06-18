CREATE TABLE Customer1 (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customer1(CustomerID),
    Amount DECIMAL(10,2),
    OrderDate DATE
);

INSERT INTO Customer1 (Name, Email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO Orders (CustomerID, Amount, OrderDate) VALUES
(1, 2000, '2025-03-01'),
(2, 1500, '2025-03-05'),
(3, 3000, '2025-03-10');

SELECT Amount
FROM Orders
WHERE CustomerID = 2;

SELECT OrderDate
FROM Orders
WHERE ustomerID = 3

SELECT * FROM Orders WHERE CustomerID = (SELECT CustomerID FROM Customer1 WHERE Name = 'Alice');

SELECT CustomerID, SUM(Amount) AS TotalSpent FROM Orders GROUP BY CustomerID;

SELECT CustomerID FROM Orders GROUP BY CustomerID HAVING SUM(Amount) > 2500;

DELETE FROM Orders WHERE OrderDate < '2025-03-05';

select * from Orders;

SELECT Email
FROM Customer1
WHERE Name = 'Bob';

--

SELECT DISTINCT c.CustomerID, C.Name
FROM Customer1 c
JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT *
FROM Orders
ORDER BY OrderDate DESC
LIMIT 1;

SELECT AVG(Amount)
FROM Orders;

SELECT *
from Orders
WHERE Amount >
(SELECT AVG(Amount) FROM Orders);

SELECT CustomerID, COUNT(*) AS Totalorders
FROM Orders
GROUP BY CustomerID;
