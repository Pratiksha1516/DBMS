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

SELECT * FROM Invoice;

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

--Agrregate functions
SELECT COUNT(id)
FROM Customer;

SELECT MAX(Ph_no)
FROM Customer;

SELECT COUNT(Ph_no)
FROM Customer
WHERE id = 'A02';

SELECT MIN(Ph_no)
FROM Customer;

SELECT area, COUNT(*) AS total_customers
FROM Customer
GROUP BY area;

SELECT COUNT( distinct area) AS unique_area 
FROM Customer;

SELECT AVG(LENGth(Ph_no)) AS avg_lenght
FROM Customer;

SELECT MIN(id) AS min_id, MAX(id) AS max_id 
FROM Customer;


--
SELECT fname || ' '|| lname AS fullname 
FROM Customer;

SELECT fname,Ph_no
FROM Customer 
WHERE Ph_no LIKE '7%';

SELECT *
FROM Customer
WHERE area  <> 'MO';

SELECT *
FROM Customer
WHERE Ph_no > '500000';

SELECT fname,lname
FROM Customer
ORDER BY fname DESC;

SELECT DISTINCT fname, lname
FROM Customer
WHERE id IN(SELECT Cust_id FROM Invoice);

SELECT *
FROM Customer
WHERE id NOT IN(SELECT Cust_id FROM Invoice);

--
SELECT I.Inv_no, C.fname, C.lname
FROM Invoice I
JOIN Customer C ON I.Cust_id = C.id;

--
SELECT *
FROM Customer
ORDER BY Ph_no DESC
LIMIT 3;

SELECT *
FROM Customer
ORDER BY lname ASC
LIMIT 2;

UPDATE Customer 
SET area = 'NY'
WHERE id = 'A02';
