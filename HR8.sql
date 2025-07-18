CREATE TABLE CITY (
    ID INT primary key,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(20),
    POPULATION INT
);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (1, 'New York', 'USA', 'New York', 8008278);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (2, 'Los Angeles', 'USA', 'California', 3694820);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (3, 'Chicago', 'USA', 'Illinois', 2896016);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (4, 'Houston', 'USA', 'Texas', 1953631);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (5, 'Miami', 'USA', 'Florida', 362470);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (6, 'Dallas', 'USA', 'Texas', 1188580);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (7, 'San Francisco', 'USA', 'California', 776733);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (8, 'Austin', 'USA', 'Texas', 656562);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (9, 'Denver', 'USA', 'Colorado', 554636);
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (10, 'Boston', 'USA', 'Massachusetts', 589141);

SELECT * 
FROM CITY
WHERE CountryCode = 'USA' AND Population > 100000;

select NAME
from CITY
WHERE CountryCode = 'USA' and population > 120000;

SELECT DISTRICT
FROM CITY
WHERE POPULATION > 100000;

--
SELECT * 
FROM CITY
WHERE DISTRICT = 'Texas';

SELECT NAME 
FROM CITY 
WHERE POPULATION < 1000000;

SELECT DISTINCT DISTRICT FROM CITY;

SELECT NAME, POPULATION 
FROM CITY 
ORDER BY POPULATION DESC;

SELECT COUNT(*) AS total_cities FROM CITY;

SELECT NAME, POPULATION
FROM CITY 
ORDER BY POPULATION DESC LIMIT 1;

SELECT NAME, POPULATION
FROM CITY 
ORDER BY POPULATION ASC LIMIT 1;

SELECT SUM(POPULATION) AS total_population FROM CITY;

SELECT AVG(POPULATION) AS average_population FROM CITY;

SELECT DISTRICT, COUNT(*) AS city_count 
FROM CITY GROUP BY DISTRICT;

SELECT NAME 
FROM CITY
WHERE NAME LIKE 'S%';

SELECT NAME
FROM CITY
WHERE NAME LIKE '%n';

SELECT *
FROM CITY 
WHERE POPULATION BETWEEN 500000 AND 2000000;

SELECT * 
FROM CITY 
WHERE DISTRICT <> 'California';

SELECT NAME, POPULATION 
FROM CITY ORDER BY POPULATION DESC LIMIT 3;

SELECT DISTRICT, SUM(POPULATION) AS district_population 
FROM CITY GROUP BY DISTRICT;

SELECT DISTRICT, AVG(POPULATION) AS avg_pop 
FROM CITY GROUP BY DISTRICT;

SELECT DISTRICT F
ROM CITY GROUP BY DISTRICT HAVING COUNT(*) > 1;

SELECT NAME, POPULATION FROM CITY
WHERE POPULATION > (SELECT AVG(POPULATION) FROM CITY);
