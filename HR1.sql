create table setA(
element int
);

create table setB(
element int
);

insert into setA(element) values
(1), (2), (3), (4), (5), (6);

insert into setB(element) values
(2), (3), (4), (5), (6), (7), (8);

select * from setA;

select * from setB;

select count(element)
from(
	select element from setA
	UNION
	select element from setB
) AS UnionResult;

--aggregate functions
SELECT MAX(element)
FROM setA;

SELECT MIN(element)
FROM setA;

SELECT COUNT(element)
FROM setA;

SELECT AVG(element)
FROM setA;

SELECT MAX(element)
FROM setB;

SELECT MIN(element)
FROM setB;

SELECT AVG(element)
FROM setB;

SELECT COUNT(element)
FROM setB;


TRUNCATE TABLE setA;

TRUNCATE TABLE setB;

drop table setA;

drop table setB;
