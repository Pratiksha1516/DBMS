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

SELECT Department
FROM Employee1
WHERE Salary < 60000;

SELECT Name
FROM Employee1
WHERE EmpID = 'klm';

SELECT Age
FROM Employee1
WHERE Salary < 50000;

SELECT Salary
FROM Employee1
WHERE Name = 'def';

SELECT Department
FROM Employee1
WHERE Age > 30;

SELECT Salary
FROM Employee1
WHERE Age < 33;

SELECT Name
FROM Employee1
WHERE Age = 30;

--

SELECT *
FROM Employee1
ORDER BY Salary DESC;

SELECT AVG(Salary) AS avg_salary
FROM Employee1;

SELECT Department, COUNT(EmpID) AS Emp_count
from Employee1
GROUP BY Department;

SELECT *
FROM Employee1
WHERE Name LIKE '%e%';

SELECT Department, SUM(Salary) AS total_salary
FROM Employee1
GROUP BY Department;

SELECT Name, Salary
FROM Employee1
ORDER BY Salary DESC
LIMIT 1;

SELECT *
FROM Employee1
WHERE Age BETWEEN 28 AND 32;

UPDATE Employee1
SET Department = 'Admin'
WHERE Name = 'abc';

SELECT *
FROM Employee1
WHERE Department <> 'HR';

SELECT DISTINCT Department 
FROM Employee1;
