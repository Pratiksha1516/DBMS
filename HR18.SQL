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
