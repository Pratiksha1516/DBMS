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

INSERT INTO Customer VALUES('A01', 'Allan', 'Border', 'SA', '723622');
INSERT INTO Customer VALUES('A02', 'Tina', 'Shields', 'MO', '23784');
INSERT INTO Customer VALUES('A03', 'Ravi', 'Kumar', 'BI', '545621');
INSERT INTO Customer VALUES('A04', 'Sunita', 'Rai', 'CH', '983724');
INSERT INTO Customer VALUES('A05', 'James', 'Smith', 'WA', '634672');

INSERT INTO Invoice VALUES(101, 'A01');
INSERT INTO Invoice VALUES(102, 'A02');
INSERT INTO Invoice VALUES(103, 'A03');
INSERT INTO Invoice VALUES(104, 'A04');
INSERT INTO Invoice VALUES(105, 'A05');

SELECT * FROM Customer;

SELECT fname, area FROM Customer;

SELECT * FROM Customer WHERE fname LIKE '_a%';

SELECT * FROM Customer WHERE area IN ('SA', 'BI', 'CH');

SELECT fname
FROM Customer
WHERE id = 'A03';
