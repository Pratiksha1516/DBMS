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

select count(element)
from(
	select element from setA
	UNION
	select element from setB
) AS UnionResult;

--
SELECT element FROM setA
UNION
SELECT element FROM setB;

SELECT element FROM setA
UNION ALL
SELECT element FROM setB;

SELECT element FROM setA
INTERSECT
SELECT element FROM setB;

SELECT element FROM setA
EXCEPT
SELECT element FROM setB;

SELECT element FROM setB
EXCEPT
SELECT element FROM setA;

SELECT element FROM setA
EXCEPT
SELECT element FROM setB
UNION
SELECT element FROM setB
EXCEPT
SELECT element FROM setA;
