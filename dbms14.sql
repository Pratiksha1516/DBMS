-- 1. Create Customer Table and Invoice Table
CREATE TABLE Customer (
    id VARCHAR(5) PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    area VARCHAR(5),
    Ph_no VARCHAR(10)
);

CREATE TABLE Invoice (
    Inv_no INT PRIMARY KEY,
    Cust_id VARCHAR(5),
    FOREIGN KEY (Cust_id) REFERENCES Customer(id)
);

-- Insert values into Customer Table
INSERT INTO Customer VALUES('A01', 'Allan', 'Border', 'SA', '723622');
INSERT INTO Customer VALUES('A02', 'Tina', 'Shields', 'MO', '23784');
INSERT INTO Customer VALUES('A03', 'Ravi', 'Kumar', 'BI', '545621');
INSERT INTO Customer VALUES('A04', 'Sunita', 'Rai', 'CH', '983724');
INSERT INTO Customer VALUES('A05', 'James', 'Smith', 'WA', '634672');

-- Insert values into Invoice Table
INSERT INTO Invoice VALUES(101, 'A01');
INSERT INTO Invoice VALUES(102, 'A02');
INSERT INTO Invoice VALUES(103, 'A03');
INSERT INTO Invoice VALUES(104, 'A04');
INSERT INTO Invoice VALUES(105, 'A05');

-- 2. Print entire Customer table
SELECT * FROM Customer;

-- 3. List of fname and area of all customers
SELECT fname, area FROM Customer;

-- 4. Find customers having 'a' as the second letter in fname
SELECT * FROM Customer WHERE fname LIKE '_a%';

-- 5. Find customers staying in area SA, BI, or CH
SELECT * FROM Customer WHERE area IN ('SA', 'BI', 'CH');

-- 6. Count total number of customers
SELECT COUNT(*) AS Total_Customers FROM Customer;

-- 7. Find customer name with invoice no 104
SELECT fname, lname FROM Customer WHERE id = (SELECT Cust_id FROM Invoice WHERE Inv_no = 104);

-- 8. Update phone number of Ravi to 546120
UPDATE Customer SET Ph_no = '546120' WHERE fname = 'Ravi';

-- 9. Delete the record with invoice no 105
DELETE FROM Invoice WHERE Inv_no = 105;

ALTER TABLE Invoice
ADD COLUMN E-mail VARCHAR(30);

ALTER TABLE Customer
ADD COLUMN age INT NOT NULL DEFAULT 22;

DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Customer;

