CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    registration_date DATE
);

INSERT INTO customers
(customer_id, name, email, phone, city, registration_date)
VALUES 
(1, 'abc', 'abc@gmail.com', '1234567890', 'New York', TO_DATE('2022-01-15', 'YYYY-MM-DD')),
(2, 'def', 'def@gmail.com', '0987654321', 'Los Angeles', TO_DATE('2021-11-20', 'YYYY-MM-DD')),
(3, 'ghi', 'ghi@gmail.com', '1122334455', 'Chicago', TO_DATE('2023-02-10', 'YYYY-MM-DD'));

SELECT * FROM customers 

--Aggregate functions
SELECT COUNT(name)
FROM customers;

SELECT MAX(registration_date)
FROM customers;

SELECT MIN(registration_date)
FROM customers;

SELECT COUNT(registration_date)
FROM customers;

SELECT MAX(city)
FROM customers;
 
SELECT MIN(city)
FROM customers;
   
SELECT * FROM  customers
WHERE city = 'Chicago';

SELECT * FROM custmoers
WHERE name = 'abc';

SELECT CITY 
FROM customer
WHERE customer_id = 2;

SELECT stration_date
FROM customers
WHERE name = 'def';

SELECT NAME
FROM customers 
WHERE customer_id = 3;

SELECT phone
FROM customers
WHERE name = 'abc';

SELECT name
FROM customers
WHERE city = 'Chicago';

SELECT registration_date
FROM customers
WHERE customer_id = 2;

SELECT city
FROM customers
WHERE name = 'ghi';

SELECT phone
FROM customers
WHERE name = 'abc';

--UPDATE
UPDATE customers
SET name = 'pratiksha'
WHERE customer_id = 1;

UPDATE customers
SET city = 'Blegav'
WHERE customer_id = 1;

--
SELECT * FROM customers
WHERE registration_date > TO_DATE('2022-01-01', 'YYYY-MM-DD');

SELECT * FROM customers
WHERE LOWER(city) = 'new york';

SELECT * FROM customers
WHERE phone LIKE '123%';

SELECT name FROM customers
ORDER BY name ASC;

SELECT * FROM customers
WHERE EXTRACT(YEAR FROM registration_date) = 2023;

SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

SELECT city, MIN(registration_date) AS first_registration
FROM customers
GROUP BY city;

SELECT COUNT(DISTINCT city) AS unique_cities
FROM customers;

UPDATE customers
SET phone = '9999999999'
WHERE customer_id = 3;

DELETE FROM customers
WHERE city = 'Los Angeles';

DELETE FROM customers
WHERE registration_date < TO_DATE('2022-01-01', 'YYYY-MM-DD');

SELECT * FROM customers
ORDER BY registration_date DESC
FETCH FIRST 2 ROWS ONLY;

SELECT city, COUNT(*) AS total
FROM customers
GROUP BY city
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

SELECT * FROM customers
WHERE email LIKE '%@gmail.com';

SELECT * FROM customers
WHERE name LIKE 'g%';
