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

SELECT CONCAT(Name, '(', SUBSTR(Occupation, 1, 1), ')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;

SELECT Name, COUNT(*) AS cnt
FROM OCCUPATIONS
GROUP BY Name
HAVING COUNT(*) > 1;

--
SELECT * 
FROM OCCUPATIONS;

SELECT DISTINCT Occupation 
FROM OCCUPATIONS;

SELECT COUNT(*) AS total_people 
FROM OCCUPATIONS;

SELECT COUNT(DISTINCT Occupation) AS unique_occupations 
FROM OCCUPATIONS;

SELECT Name
FROM OCCUPATIONS 
WHERE Occupation = 'Doctor';

SELECT Name
FROM OCCUPATIONS 
WHERE Occupation = 'Actor' ORDER BY Name DESC;

SELECT COUNT(*) AS total_actors 
FROM OCCUPATIONS 
WHERE Occupation = 'Actor';

SELECT Occupation, COUNT(*) AS total
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY total DESC
LIMIT 1;

SELECT Occupation, COUNT(*) AS total
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY total ASC
LIMIT 1;

SELECT Name 
FROM OCCUPATIONS 
WHERE Name LIKE 'J%';

SELECT Name 
FROM OCCUPATIONS 
WHERE Name LIKE '%a';

SELECT Name, LENGTH(Name) AS name_length 
FROM OCCUPATIONS;

SELECT SUBSTR(Name, 1, 1) AS first_letter, COUNT(*) AS total
FROM OCCUPATIONS
GROUP BY first_letter
ORDER BY first_letter;

SELECT UPPER(Name) AS upper_name 
FROM OCCUPATIONS;

SELECT LOWER(Occupation) AS lower_occupation 
FROM OCCUPATIONS;

SELECT Name, SUBSTR(Occupation,1,3) AS occupation_code 
FROM OCCUPATIONS;

SELECT Occupation, COUNT(*) AS total
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY Occupation;

SELECT CONCAT(Name, ' is a ', Occupation) AS description 
FROM OCCUPATIONS;

SELECT Occupation, COUNT(*) AS total
FROM OCCUPATIONS
GROUP BY Occupation
HAVING COUNT(*) > 2;


--
SELECT Name, Occupation
FROM OCCUPATIONS
WHERE LENGTH(Occupation) > 6;

SELECT SUM(LENGTH(Name)) AS total_name_characters
FROM OCCUPATIONS;
