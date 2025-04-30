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
WHERE registration_date >= TO_DATE('2022-01-01', 'YYYY-MM-DD');

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

truncate table customers;

drop table customers;
