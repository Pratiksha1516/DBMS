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
