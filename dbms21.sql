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

--Aggregate functions
SELECT COUNT(name)
FROM Fav;

SELECT COUNT(*) AS TotalPeople
FROM Fav;

SELECT COUNT(DISTINCT fav_thing) AS DistinctFav
FROM Fav;

truncate table Fav;

drop table Fav;
