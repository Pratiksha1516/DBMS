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

--find the total payment according to each payment method
SELECT mode, COUNT(customer_id) -- we can use anything here means customer also or custome_id also
FROM payment
GROUP BY mode;