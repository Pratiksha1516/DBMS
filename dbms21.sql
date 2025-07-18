create database Fav;

create table Fav(
	name varchar(50),
	fav_thing varchar(50)
);

insert into Fav(name, fav_thing)
values
('Prati', 'Travelling'),
('Ranveer', 'Gaming,Travelling,Designing,drivingcars'),
('Shree', 'Painting, Cooking,Drawing,Travelling');

select * from Fav;

select Fav_thing
from Fav
where name = ' Prati';

select Fav_thing
from Fav
where name = 'Shree';

select name 
from Fav
where Fav_thing > 2;

select Fav_thing
from Fav
where name = 'Ranveer';

select name
from Fav
where Fav_thing = 'Travelling';

SELECT *
FROM Fav
WHERE name LIKE '%e';

SELECT *
FROM Fav
WHERE name LIKE '%r';

SELECT name
FROM Fav
WHERE name LIKE '%i';

SELECT *
FROM Fav
WHERE fav_thing LIKE '%g';

SELECT fav_thing
FROM Fav
WHERE fav_thing LIKE 'g%';

SELECT fav_thing
FROM Fav
WHERE fav_thing LIKE 'T%';

SELECT *
FROM Fav
ORDER BY fav_thing DESC;


--Aggregate functions
SELECT COUNT(name)
FROM Fav;

SELECT COUNT(*) AS TotalPeople
FROM Fav;

SELECT COUNT(DISTINCT fav_thing) AS DistinctFav
FROM Fav;

SELECT 
    MAX(array_length(string_to_array(fav_thing, ','), 1)) AS MaxFavItems
FROM Fav;

SELECT 
    name,
    array_length(string_to_array(fav_thing, ','), 1) AS FavCount
FROM Fav;

--Bitwise operation
SELECT *
FROM Fav
WHERE fav_thing = 'Cooking' OR name ='Ranveer';

--

SELECT name
FROM Fav
ORDER BY name ASC;

SELECT DISTINCT fav_thing
FROM Fav
ORDER BY fav_thing ASC;

SELECT *
FROM Fav
WHERE name LIKE 'P%';

SELECT name
FROM Fav
WHERE LENGTH(name) = 5;

SELECT name
FROM Fav
WHERE name ILIKE '%a%';

SELECT UPPER(fav_thing) AS UPPER_FAV
FROM Fav;

SELECT LOWER(name) AS Lower_name
FROM Fav;

SELECT name, REPLACE(fav_thing, ',', ' | ') AS formatted_fav
FROM fav;

SELECT TRIM(name) as_trimmed_name
FROM Fav;

SELECT name, split_part(fav_thing, ',', 1) AS first_fav 
FROM Fav;

SELECT name
FROM Fav
WHERE array_length(string_to_array(fav_thing, ','), 1) > 3;

SELECT name FROM Fav
WHERE fav_thing ILIKE '%Travelling%' AND fav_thing ILIKE '%Gaming%';

SELECT name FROM Fav
WHERE fav_thing ILIKE '%Cooking%';

SELECT name FROM Fav
WHERE name NOT LIKE '%e%';

SELECT name FROM Fav
WHERE name LIKE '%i';

SELECT name FROM Fav
WHERE array_length(string_to_array(fav_thing, ','),1) = 2;

SELECT name, unnest(string_to_array(fav_thing, ',')) AS individual_fav
FROM Fav;

SELECT COUNT(*) 
FROM Fav
WHERE fav_thing ILIKE '%Travelling%';

SELECT name, LENGTH(fav_thing) AS fav_length
FROM Fav;

SELECT name
FROM Fav
ORDER BY array_length(string_to_array(fav_thing,','),1) DESC
LIMIT 1;
