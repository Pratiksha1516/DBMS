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
