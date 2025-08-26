CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    registration_date DATE
);

INSERT INTO customers VALUES (1, 'abc', 'abc@gmail.com', '1234567890', 'New York', TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO customers VALUES (2, 'def', 'def@gmail.com', '0987654321', 'Los Angeles', TO_DATE('2021-11-20', 'YYYY-MM-DD'));
INSERT INTO customers VALUES (3, 'ghi', 'ghi@gmail.com', '1122334455', 'Chicago', TO_DATE('2023-02-10', 'YYYY-MM-DD'));

SELECT * FROM customers 
WHERE registration_date >= TO_DATE('2022-01-01', 'YYYY-MM-DD');

SELECT * 
FROM customers 
WHERE city = 'New York';

SELECT DISTINCT city 
FROM customers;

SELECT * 
FROM customers 
WHERE registration_date BETWEEN TO_DATE('2021-01-01','YYYY-MM-DD') AND TO_DATE('2022-12-31','YYYY-MM-DD');

SELECT * 
FROM customers 
WHERE name LIKE '%a%';

SELECT *
FROM customers
WHERE customer_id > 1 AND city = 'Chicago';

SELECT *
FROM customers 
ORDER BY name ASC;

SELECT city, COUNT(*) AS total 
FROM customers 
GROUP BY city HAVING COUNT(*) > 1;

SELECT city, MIN(registration_date) AS first_registered 
FROM customers
GROUP BY city;

SELECT city, COUNT(DISTINCT email) AS unique_emails 
FROM customers
GROUP BY city;

SELECT * 
FROM customers
WHERE registration_date < (SELECT AVG(registration_date) FROM customers);

SELECT * 
FROM customers
WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM customers);

SELECT customer_id, name, city, registration_date,
       RANK() OVER (ORDER BY registration_date ASC) AS reg_rank
FROM customers;

SELECT customer_id, name, city, registration_date
FROM (
    SELECT c.*, 
           RANK() OVER (PARTITION BY city ORDER BY registration_date DESC) AS rnk
    FROM customers c
) sub
WHERE rnk = 1;

SELECT * 
FROM customers 
WHERE city IN (
    SELECT city FROM customers GROUP BY city HAVING COUNT(*) > 1
);

SELECT customer_id, name, city, EXTRACT(YEAR FROM registration_date) AS reg_year
FROM customers
ORDER BY reg_year;

SELECT EXTRACT(YEAR FROM registration_date) AS reg_year, COUNT(*) AS total_customers
FROM customers
GROUP BY EXTRACT(YEAR FROM registration_date)
ORDER BY reg_year;

SELECT * 
FROM customers
WHERE LENGTH(phone) <> 10;
