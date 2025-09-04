CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
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

UPDATE Employees
SET Salary = 75000.00
WHERE EmployeeID = 3;

DELETE FROM Employees
WHERE EmployeeID = 1;

--
SELECT * 
FROM Employees 
WHERE Department = 'IT';

SELECT *
FROM Employees 
WHERE Salary > 60000;

SELECT *
FROM Employees 
WHERE Age < 30;

SELECT Name, Salary 
FROM Employees;

SELECT * 
FROM Employees 
ORDER BY Salary DESC;

SELECT * 
FROM Employees 
ORDER BY Salary DESC 
LIMIT 2;

SELECT DISTINCT Department 
FROM Employees;

SELECT AVG(Salary) AS Avg_Salary 
FROM Employees;

SELECT COUNT(*) AS Total_Employees 
FROM Employees;

SELECT MAX(Salary) AS Highest_Salary 
FROM Employees;

SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department;

SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department;

SELECT Department, COUNT(*) AS Emp_Count
FROM Employees
GROUP BY Department;

SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
ORDER BY Avg_Salary DESC
LIMIT 1;

SELECT *
FROM Employees
WHERE Name LIKE 'A%';

SELECT * 
FROM Employees 
WHERE Name LIKE '%e';

SELECT *
FROM Employees
WHERE Salary BETWEEN 55000 AND 80000;
