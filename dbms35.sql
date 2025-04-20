CREATE TABLE  IF NOT EXISTS dept(
id INT PRIMARY KEY,
name VARCHAR(20)
);

INSERT INTO dept
(id, name)
VALUES
(101, 'English'),
(102, 'IT');

SELECT * FROM dept;

UPDATE dept
SET id = 103
WHERE id = 102;

UPDATE dept
SET id = 111
WHERE id = 101;

CREATE TABLE teacher(	-- foreign key concept
id INT PRIMARY KEY,
name VARCHAR(20),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES dept(id)
ON UPDATE CASCADE		-- cascade 
ON DELETE CASCADE
);

INSERT INTO teacher
(id, name, dept_id)
VALUES
(101, 'Adam', 101),
(102, 'Eve', 102);

SELECT * FROM teacher;

