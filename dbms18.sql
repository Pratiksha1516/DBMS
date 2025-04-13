CREATE TABLE Employee1 (
    EmpID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee1 (Name, Age, Department, Salary) VALUES
('abc', 30, 'HR', 50000),
('def', 28, 'IT', 70000),
('hij', 35, 'Finance', 60000),
('klm', 32, 'IT', 75000);

SELECT * FROM Employee1 WHERE Department = 'IT';

UPDATE Employee1 SET Salary = Salary * 1.10 WHERE Department = 'Finance';

SELECT MAX(Salary) FROM Employee1;

DELETE FROM Employee1 WHERE Name = 'hij';

select * from Employee1;

SELECT Name
FROM Employee1
WHERE EmpID = 'klm';
