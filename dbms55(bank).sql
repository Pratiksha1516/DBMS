CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Account (
    AccountNo INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(12, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Transaction (
    TransID INT PRIMARY KEY,
    AccountNo INT,
    TransType VARCHAR(10), -- 'Deposit' or 'Withdraw'
    Amount DECIMAL(10, 2),
    TransDate DATE,
    FOREIGN KEY (AccountNo) REFERENCES Account(AccountNo)
);

INSERT INTO Customer VALUES 
(1, 'Ranveer', 'Mumbai', '9999911111'),
(2, 'Shree', 'Pune', '9999922222'),
(3, 'Pratiksha', 'Delhi', '9999933333'),
(4, 'Sahil', 'Chennai', '9999944444'),
(5, 'Jenny', 'Kolkata', '9999955555'),
(6, 'Gaurav', 'Bangalore', '9999966666'),
(7, 'Riddhi', 'Hyderabad', '9999977777'),
(8, 'Adam', 'Ahmedabad', '9999988888'),
(9, 'Bob', 'Jaipur', '9999999999'),
(10, 'Casey', 'Surat', '8888811111');

INSERT INTO Account VALUES
(1001, 1, 'Savings', 25000.00),
(1002, 2, 'Current', 15000.00),
(1003, 3, 'Savings', 40000.00),
(1004, 4, 'Current', 8000.00),
(1005, 5, 'Savings', 55000.00),
(1006, 6, 'Savings', 12000.00),
(1007, 7, 'Current', 30000.00),
(1008, 8, 'Savings', 16000.00),
(1009, 9, 'Savings', 7000.00),
(1010, 10, 'Current', 5000.00);

INSERT INTO Transaction VALUES
(1, 1001, 'Deposit', 5000.00, '2025-06-01'),
(2, 1002, 'Withdraw', 2000.00, '2025-06-02'),
(3, 1003, 'Deposit', 10000.00, '2025-06-03'),
(4, 1004, 'Withdraw', 1000.00, '2025-06-04'),
(5, 1005, 'Deposit', 7000.00, '2025-06-05'),
(6, 1006, 'Withdraw', 1500.00, '2025-06-06'),
(7, 1007, 'Deposit', 3000.00, '2025-06-07'),
(8, 1008, 'Withdraw', 500.00, '2025-06-08'),
(9, 1009, 'Deposit', 8000.00, '2025-06-09'),
(10, 1010, 'Withdraw', 2500.00, '2025-06-10');

SELECT * FROM Customer;

SELECT * FROM Account;

SELECT * FROM Transaction;

SELECT Name 
FROM Customer
WHERE City = 'Delhi';

SELECT c.Name
FROM Customer c
JOIN Account a ON a.CustomerID = c.CustomerID
WHERE a.AccountType = 'Savings';

SELECT c.Name
FROM Customer c
JOIN Account a ON a.CustomerID = c.CustomerID
WHERE Balance > 20000;

SELECT * 
FROM Transaction
WHERE AccountNo = 1001;

SELECT SUM(Balance) AS Total_balance
FROM Account;

SELECT COUNT(*)
FROM Transaction 
WHERE TransDate = '2025-06-05';

SELECT C.Name
FROM Customer c
JOIN Account a ON c.CustomerID = a.CustomerID
JOIN Transaction t ON a.AccountNo = t.AccountNo
WHERE TransType = 'Withdraw';

SELECT *
FROM Account
ORDER BY Balance DESC
LIMIT 1;

SELECT AccountNo, SUM(Amount) AS Total_deposit
FROM Transaction
WHERE TransType = 'Deposit'
GROUP BY AccountNo;

SELECT * FROM Account
WHERE Balance < 10000;

SELECT AccountType, COUNT(*) AS TotalAccounts
FROM Account
GROUP BY AccountType;

SELECT c.Name, SUM(t.Amount) AS TotalWithdraw
FROM Customer c
JOIN Account a ON a.CustomerID = c.CustomerID
JOIN Transaction t ON t.AccountNo = a. AccountNo
WHERE TransType = 'Withdraw'
GROUP BY c.Name;

SELECT c.Name
FROM Customer c
JOIN Account a ON c.CustomerID = a.CustomerID
JOIN Transaction t ON a.AccountNo = t.AccountNo
GROUP BY c.Name
HAVING COUNT(t.TransID) > 1;

--
SELECT * FROM Customer 
WHERE City = 'Pune';

SELECT a.* 
FROM Account a 
JOIN Customer c ON a.CustomerID = c.CustomerID 
WHERE c.Name = 'Jenny';

SELECT * FROM Transaction 
WHERE TransType = 'Deposit';
