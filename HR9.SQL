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

SELECT * FROM STATION;

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

SELECT CITY
FROM STATION
WHERE LONG_W < 80.00;

--
SELECT CITY FROM STATION
WHERE STATE = 'CA';

SELECT DISTINCT STATE 
FROM STATION;

SELECT * FROM STATION
WHERE LAT_N > 35;

SELECT * FROM STATION 
WHERE LONG_W > 100;

SELECT STATE, COUNT(*) AS CityCount 
FROM STATION 
GROUP BY STATE;
