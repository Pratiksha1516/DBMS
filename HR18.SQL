CREATE TABLE OCCUPATIONS (
    Name VARCHAR(50),
    Occupation VARCHAR(50)
);

INSERT INTO OCCUPATIONS (Name, Occupation)
VALUES
('Samantha', 'Doctor'),
('Julia', 'Actor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashely', 'Professor'),
('Ketty', 'Professor'),
('Christeen', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer');

SELECT Name
FROM OCCUPATIONS
WHERE Occupation = 'Singer';

SELECT Occupation
FROM OCCUPATIONS
WHERE Name = 'Jane';

SELECT CONCAT(Name, '(', SUBSTR(Occupation, 1, 1), ')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;

SELECT Occupation 
FROM OCCUPATIONS
WHERE Name = 'Julia';

SELECT Name 
FROM OCCUPATIONS
ORDER BY NAME DESC;

SELECT Name
FROM OCCUPATIONS
WHERE Occupation = 'Actor';


SELECT Occupation
FROM OCCUPATIONS
WHERE Name LIKE '%a';

SELECT *
FROM OCCUPATIONS
WHERE Occupation LIKE 'D%';

SELECT *
FROM OCCUPATIONS
WHERE Occupation LIKE '%r';

SELECT DISTINCT Occupation
FROM OCCUPATIONS
WHERE Occupation LIKE '%r';

SELECT *
FROM OCCUPATIONS
WHERE Occupation = 'Professor';

--Aggregation functons
SELECT COUNT(Name)
from OCCUPATIONS;

SELECT COUNT(Name)
from OCCUPATIONS
WHERE Name LIKE '%a';

--
SELECT Occupation, COUNT(*) AS Total
FROM OCCUPATIONS
GROUP BY Occupation;

SELECT Name, Occupation
FROM OCCUPATIONS
ORDER BY Occupation, Name;

SELECT COUNT(DISTINCT Occupation) AS Unique_Occupations
FROM OCCUPATIONS;

SELECT Name
FROM OCCUPATIONS
WHERE Name LIKE 'J%';

SELECT Name
FROM OCCUPATIONS
WHERE LENGTH(Name) = 5;

SELECT Name
FROM OCCUPATIONS
WHERE Name LIKE '%y';

SELECT Name
FROM OCCUPATIONS
WHERE LENGTH(Name) = (
    SELECT MAX(LENGTH(Name)) FROM OCCUPATIONS
);

SELECT SUBSTR(Name, 1, 3) AS Short_Name
FROM OCCUPATIONS;

SELECT Name, LENGTH(Name) AS Name_Length
FROM OCCUPATIONS;

SELECT RIGHT(Name, 1) AS Last_Char, COUNT(*) AS Count
FROM OCCUPATIONS
GROUP BY RIGHT(Name, 1)
ORDER BY Count DESC;

SELECT Name
FROM OCCUPATIONS
WHERE Name LIKE '%e%';

SELECT DISTINCT Occupation
FROM OCCUPATIONS
ORDER BY Occupation;

SELECT Name
FROM OCCUPATIONS
WHERE Occupation = 'Actor'
ORDER BY Name DESC;

SELECT Name, SUBSTR(Occupation, 1, 1) AS First_Letter
FROM OCCUPATIONS;

SELECT COUNT(*)
FROM OCCUPATIONS
WHERE Name LIKE '%a';
