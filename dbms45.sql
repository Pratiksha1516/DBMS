CREATE TABLE STUD(
rollno INT PRIMARY KEY,
name VARCHAR(20),
marks INT 
);

INSERT INTO STUD
(rollno, name, marks)
VALUES
(101, 'anil', 78),
(102, 'bhumika', 93),
(103, 'chetan', 85),
(104, 'dhruv', 96),
(105, 'emanuel', 92),
(106, 'farah', 82);

-- SUB QUERIES
--displaying names who took marks more than avg of that table
--step 1
SELECT AVG(marks)
FROM STUD;

--step 2
SELECT name
FROM STUD
WHERE marks > 87.6667;

SELECT name			--this this sub query thi is dynamic in nature
FROM STUD
WHERE marks >(SELECT AVG(marks) FROM STUD);

--display the names of those who has even roll no.
--step 1
SELECT rollno		-- checking for even number
FROM STUD
WHERE rollno % 2 = 0;

--step2
SELECT name
FROM STUD
WHERE rollno IN(102, 104, 106);		--this is static code

--combination of those two
SELECT name, rollno
FROM STUD
WHERE rollno IN(
	SELECT rollno		-- This is dynamic code
	FROM STUD
	WHERE rollno % 2 = 0);		

