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

INSERT INTO Customer
(id, fname,lname, area, Ph_no)
VALUES
('A01', 'Allan', 'Border', 'SA', '723622'),
('A02', 'Tina', 'Shields', 'MO', '23784'),
('A03', 'Ravi', 'Kumar', 'BI', '545621'),
('A04', 'Sunita', 'Rai', 'CH', '983724'),
('A05', 'James', 'Smith', 'WA', '634672');

INSERT INTO Invoice
(Inv_no, Cust_id)
VALUES
(101, 'A01'),
(102, 'A02'),
(103, 'A03'),
(104, 'A04'),
(105, 'A05');

SELECT * FROM Customer;

SELECT fname, area FROM Customer;

SELECT *
FROM Customer
WHERE fname LIKE '_a%';

SELECT * 
FROM Customer 
WHERE area IN ('SA', 'BI', 'CH');

SELECT fname
FROM Customer
WHERE id = 'A03';

SELECT area
FROM customer
WHERE id = 'A05';

ALTER TABLE Customer
ADD COLUMN age INT;
