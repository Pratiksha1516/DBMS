-- 1. Create type name_ty
CREATE TYPE name_ty AS OBJECT (
    Fname VARCHAR2(50),
    Lname VARCHAR2(50)
);

-- 2. Create type salary_ty
CREATE TYPE salary_ty AS OBJECT (
    Emp_id VARCHAR2(5),
    Inv_no NUMBER,
    Salary_amount NUMBER
);

-- 3. Create Employee table
CREATE TABLE Employee (
    Emp_id VARCHAR2(5) PRIMARY KEY,
    Name name_ty,
    Location VARCHAR2(5),
    Ph_no NUMBER
);

-- 4. Create Invoice table
CREATE TABLE Invoice (
    Emp_id VARCHAR2(5),
    Inv_no NUMBER,
    Salary_amount NUMBER,
    FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id)
);

-- 5. Insert data into Employee table
INSERT INTO Employee VALUES('a01', name_ty('allan', 'border'), 'sa', 723622);
INSERT INTO Employee VALUES('a02', name_ty('tina', 'shields'), 'mo', 23784);
INSERT INTO Employee VALUES('a03', name_ty('ravi', 'kumar'), 'bi', 545621);
INSERT INTO Employee VALUES('a04', name_ty('sunita', 'rai'), 'ch', 983724);
INSERT INTO Employee VALUES('a05', name_ty('james', 'smith'), 'wa', 634672);

-- 6. Insert data into Invoice table
INSERT INTO Invoice VALUES('a01', 1, 10000);
INSERT INTO Invoice VALUES('a02', 2, 20000);
INSERT INTO Invoice VALUES('a03', 3, 4500);
INSERT INTO Invoice VALUES('a04', 4, 15200);
INSERT INTO Invoice VALUES('a05', 5, 14800);

-- 7. Print both Employee and Invoice tables
SELECT Emp_id, Name.Fname AS First_Name, Name.Lname AS Last_Name, Location, Ph_no FROM Employee;

SELECT * FROM Invoice;

-- 8. Retrieve Fname and Location of all employees
SELECT e.Name.Fname, e.Location FROM Employee e;

-- 9. Find employees having 'a' as the second letter in Fname
SELECT * FROM Employee e WHERE e.Name.Fname LIKE '_a%';

-- 10. Find employees located in sa, bi, or ch
SELECT * FROM Employee WHERE Location IN ('sa', 'bi', 'ch');

-- 11. Count the total number of employees
SELECT COUNT(*) AS Total_Employees FROM Employee;

-- 12. Find employees whose salary is less than 20000
SELECT * FROM Invoice WHERE Salary_amount < 20000;

-- 13. Change Ravi's phone number to 546120
UPDATE Employee SET Ph_no = 546120 WHERE Name.Fname = 'ravi';

-- 14. Delete the record with Inv_no = 4
DELETE FROM Invoice WHERE Inv_no = 4;

-- 15. Arrange Employee table in decreasing order of Emp_id
SELECT * FROM Employee ORDER BY Emp_id DESC;

-- 16. Select Location, Ph_no, and Salary of employee with Emp_id = 'a03'
SELECT e.Location, e.Ph_no, i.Salary_amount
FROM Employee e JOIN Invoice i ON e.Emp_id = i.Emp_id
WHERE e.Emp_id = 'a03';

-- 17. Delete all records from tables Employee and Invoice
DELETE FROM Employee;
DELETE FROM Invoice;

drop table Invoice;
