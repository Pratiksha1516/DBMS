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
--Aggregate function
SELECT MAX(customer_id)
FROM payment;

SELECT COUNT(customer_id)
FROM payment;

SELECT SUM(customer_id)
FROM payment;

SELECT AVG(customer_id)
FROM payment;
