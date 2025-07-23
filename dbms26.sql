CREATE TABLE IF NOT EXISTS city1(
pin INT PRIMARY KEY,
name VARCHAR(20) CHECK (name = 'Sangli')
);

INSERT INTO city1(pin, name)
VALUES
(123456, 'BELAGAV');  -- above there is check constraint where i have used that for name of the city if i have used city name rather than Sangli then it will throw an 

INSERT INTO city1(pin, name)
VALUES
(234567, 'Sangli');  -- here data is inserted successfully

select * from city1;

select count(*)
from city1;

ALTER TABLE city1
ADD f_name varchar(20);

--
UPDATE city1
SET f_name = 'Pratiksha'
WHERE pin = 234567;

SELECT *
FROM city1
WHERE f_name IS NOT NULL;

DELETE FROM city1
WHERE pin = 123456;

ALTER TABLE city1
RENAME TO city_details;

ALTER TABLE city1
ADD state VARCHAR(20) DEFAULT 'Maharashtra';

INSERT INTO city1(pin, name, f_name)
VALUES (345678, 'Sangli', 'Shree');

SELECT *
FROM city1
WHERE f_name LIKE 'P%';

SELECT pin, f_name
FROM city1;

SELECT *
FROM city1
ORDER BY f_name DESC;

SELECT COUNT(*)
FROM city1
WHERE f_name IS NOT NULL;
