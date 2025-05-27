CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N INT,
    LONG_W INT
);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES 
(1, 'New York', 'NY', 40.7128, 74.0060),
(2, 'Los Angeles', 'CA', 34.0522, 118.2437),
(3, 'Chicago', 'IL', 41.8781, 87.6298),
(4, 'Houston', 'TX', 29.7604, 95.3698),
(5, 'Phoenix', 'AZ', 33.4484, 112.0740),
(6, 'Philadelphia', 'PA', 39.9526, 75.1652),
(7, 'San Antonio', 'TX', 29.4241, 98.4936),
(8, 'San Diego', 'CA', 32.7157, 117.1611),
(9, 'Dallas', 'TX', 32.7767, 96.7970),
(10, 'San Jose', 'CA', 37.3382, 121.8863);

SELECT CITY, STATE
FROM STATION;

SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

SELECT 
    (COUNT(CITY) - COUNT(DISTINCT CITY)) AS Difference
FROM STATION;

select CITY, length(CITY) as Citylenght
from Station
order by length(CITY) asc, CITY asc
fetch first 1 row only;

select city, length(city) as Citylenght
from Station
order by length(city)desc, city desc
fetch first 1 row only;

(SELECT CITY, LENGTH(CITY) AS NameLength
 FROM STATION
 ORDER BY LENGTH(CITY) ASC, CITY ASC
 FETCH FIRST 1 ROW ONLY)
UNION ALL
(SELECT CITY, LENGTH(CITY) AS NameLength
 FROM STATION
 ORDER BY LENGTH(CITY) DESC, CITY ASC
 FETCH FIRST 1 ROW ONLY);

select distinct city
from Station
where upper(substr(city, 1,1)) in ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY
FROM STATION
WHERE CITY ~* '^[AEIOU]';

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, -1, 1)) IN ('A', 'E', 'I', 'O', 'U');

SELECT DISTINCT CITY
FROM STATION
WHERE CITY = 'New York';

SELECT STATE
FROM STATION 
WHERE ID = 6;

SELECT LAT_N
FROM STATION 
WHERE ID = 9;

SELECT CITY
FROM STATION 
WHERE LONG_W = 98.4936;

--Aggregate functions
SELECT COUNT(ID)
FROM STATION;

SELECT MIN(ID)
FROM STATION;

SELECT MAX(ID)
FROM STATION;
