CREATE TABLE payment(
customer_id INT PRIMARY KEY,
customer VARCHAR(30),
mode VARCHAR(20),
city VARCHAR(15)
);

INSERT INTO payment
(customer_id, customer, mode, city)
VALUES
(101, 'Olivia', 'Netbanking', 'pune'),
(102, 'Ethan', 'Credit Card', 'Mumbai'),
(103, 'Maya', 'Credit Card', 'Belagav'),
(104, 'Liam', 'Netbanking', 'Jaipur'),
(105, 'Sophia', 'Credit Card', 'pune'),
(106, 'Caleb', 'Debit Card', 'Kolkata'),
(107, 'Ava', 'Debit Card', 'Lonavla'),
(108, 'Jack', 'Credit Card', 'Boston');

SELECT * FROM payment;

--find the total payment according to each payment method
SELECT mode, COUNT(customer_id) -- we can use anything here means customer also or custome_id also
FROM payment
GROUP BY mode;

SELECT * 
FROM payment
WHERE mode = 'Credit Card';

SELECT * 
FROM payment
WHERE city IN ('pune', 'Mumbai'); 

SELECT customer
FROM payment
WHERE customer LIKE '%a';

SELECT city
FROM payment
WHERE city LIKE 'B%';

SELECT customer
FROM payment
WHERE mode LIKE 'N%';

SELECT customer,city
FROM payment
WHERE city LIKE '__l%';

SELECT LENgTH(customer)
FROM payment;

SELECT LENgTH(city)
FROM payment;

SELECT LENgTH(mode)
FROM payment;

--Aggregate function
SELECT MAX(customer_id)
FROM payment;

SELECT COUNT(customer_id)
FROM payment;

SELECT SUM(customer_id)
FROM payment;

SELECT AVG(customer_id)
FROM payment;

--
SELECT * FROM payment
WHERE city LIKE '%a';

SELECT * FROM payment
WHERE customer ~* '^[aeiou]';

SELECT * FROM payment
WHERE mode IN ('Netbanking', 'Debit Card');

SELECT city, COUNT(*) AS customer_count
FROM payment
GROUP BY city;

SELECT city, COUNT(*) AS num_customers
FROM payment
GROUP BY city
HAVING COUNT(*) > 1;

SELECT mode, COUNT(*) AS total
FROM payment
GROUP BY mode
HAVING COUNT(*) > 2;

SELECT * FROM payment
ORDER BY customer;

SELECT * FROM payment
ORDER BY city DESC;

SELECT * FROM payment
ORDER BY customer_id DESC
LIMIT 3;

SELECT UPPER(customer) AS customer_upper
FROM payment;

SELECT REPLACE(mode, 'Card', 'Pay') AS updated_mode
FROM payment;

SELECT customer_id, customer, customer_id % 2 AS is_even
FROM payment;

SELECT ROUND(AVG(customer_id), 2) AS rounded_avg
FROM payment;

SELECT customer, mode,
    CASE 
        WHEN mode LIKE '%Credit%' THEN 'Credit Type'
        WHEN mode LIKE '%Debit%' THEN 'Debit Type'
        ELSE 'Online Banking'
    END AS mode_type
FROM payment;

SELECT customer
FROM payment
WHERE LENGTH(customer) = 4;

SELECT DISTINCT mode FROM payment;

SELECT DISTINCT city FROM payment;

--
SELECT customer 
FROM payment 
WHERE LOWER(LEFT(customer, 1)) = LOWER(RIGHT(customer, 1));

SELECT mode, city, COUNT(*) AS total 
FROM payment 
GROUP BY mode, city;

SELECT customer 
FROM payment 
WHERE customer ~* '[aeiou].*[aeiou]';

SELECT customer 
FROM payment 
WHERE customer LIKE '% %';

SELECT * 
FROM payment 
WHERE customer_id % 2 = 1;

SELECT customer, city 
FROM payment 
WHERE LENGTH(city) < 6;

SELECT * 
FROM payment 
WHERE mode LIKE '%Card%';

SELECT * 
FROM payment 
ORDER BY customer DESC 
LIMIT 5;

SELECT * 
FROM payment 
WHERE customer_id = (SELECT MIN(customer_id) FROM payment);

SELECT * 
FROM payment 
WHERE LENGTH(customer) = (SELECT MAX(LENGTH(customer)) FROM payment);

SELECT customer_id, customer_id * customer_id AS square 
FROM payment;

SELECT city, SUBSTRING(city FROM 1 FOR 3) AS short_city 
FROM payment;

SELECT LOWER(city) AS city_lower 
FROM payment;

SELECT customer || ' - ' || mode AS details 
FROM payment;

SELECT RPAD(city, 10, '*') AS padded_city 
FROM payment;

SELECT customer 
FROM payment 
WHERE LENGTH(customer) = 5;

SELECT LENGTH(customer) AS name_length, COUNT(*) 
FROM payment 
GROUP BY LENGTH(customer);

SELECT COUNT(*) 
FROM payment 
WHERE mode LIKE 'D%';
