CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary)
VALUES (1, 'Alice', 30, 'HR', 50000.00),
       (2, 'Bob', 25, 'IT', 60000.00),
       (3, 'Charlie', 28, 'Finance', 70000.00);

SELECT * FROM Employees;

--agrregate functions
SELECT COUNT(EmployeeID)
FROM Employees;

SELECT AVG(Age)
FROM Employees;

SELECT MAX(Salary)
FROM Employees;

SELECT MAX(Name)
FROM Employees;

SELECT MIN(Name)
FROM Employees;

SELECT MIN(Salary)
FROM Employees;

SELECT AVG(Salary)
FROM Employees;

--update operations
UPDATE Employees
SET Age= 38
where EmployeeID = 3;

UPDATE Employees
SET Salary = 75000.00
WHERE EmployeeID = 3;

--
SELECT Name, Department 
FROM Employees;

SELECT * 
FROM Employees 
WHERE Age > 27;

SELECT * 
FROM Employees
WHERE Department = 'IT';

SELECT *
FROM Employees
WHERE Salary BETWEEN 55000 AND 70000;

SELECT * 
FROM Employees
WHERE Name LIKE 'A%';

SELECT * 
FROM Employees 
WHERE Name LIKE '%e';

SELECT *
FROM Employees 
WHERE Department != 'HR';

SELECT * 
FROM Employees
ORDER BY Age ASC;

SELECT * 
FROM Employees ORDER BY Salary DESC;

SELECT Department, COUNT(*) AS Total
FROM Employees
GROUP BY Department;

SELECT Department, AVG(Salary) AS AvgSalary 
FROM Employees
GROUP BY Department;

SELECT Department, MAX(Age) AS MaxAge
FROM Employees 
GROUP BY Department;

UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'IT';

UPDATE Employees
SET Department = 'Marketing'
WHERE Name = 'Charlie';

DELETE FROM Employees 
WHERE EmployeeID = 2;

DELETE FROM Employees 
WHERE Department = 'Finance';

INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary)
VALUES (4, 'prati', 26, 'IT', 58000.00);

INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary)
VALUES (5, 'Ranveer', 35, 'HR', 62000.00);

SELECT * FROM Employees 
WHERE Department = 'IT' OR Salary > 65000;

SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35 AND Department = 'HR';

--
SELECT * 
FROM Employees
WHERE LOWER(Name) LIKE '%r%';

SELECT * 
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary) 
    FROM Employees 
    WHERE Salary < (SELECT MAX(Salary) FROM Employees)
);

SELECT * 
FROM Employees
ORDER BY Department ASC, Age ASC;

SELECT Department, COUNT(*) AS TotalEmployees, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

SELECT * 
FROM Employees
WHERE Age NOT BETWEEN 20 AND 29;

SELECT AVG(Salary) AS AvgSalaryOver30
FROM Employees
WHERE Age > 30;

SELECT * 
FROM Employees
WHERE Age = (SELECT MIN(Age) FROM Employees);

SELECT Department, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 1;

SELECT * 
FROM Employees
WHERE LENGTH(Name) = 5;

ALTER TABLE Employees
ADD Bonus DECIMAL(10,2);

UPDATE Employees
SET Bonus = Salary * 0.05;

SELECT Name, Salary, Bonus
FROM Employees;
