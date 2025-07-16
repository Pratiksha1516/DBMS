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

SELECT COUNT(element)
FROM (
    SELECT element FROM setA
    EXCEPT
    SELECT element FROM setB
) AS DifferenceResult;

SELECT COUNT(element)
FROM(
	SELECT element FROM setA
	UNION ALL
	SELECT element FROM setB
)AS combined;

SELECT MAX(element)
FROM(
	SELECT element FROM setA
	UNION ALL
	SELECT element FROM setB
)AS combined;

SELECT SUM(element)
FROM(
	SELECT element FROM setA
	UNION ALL
	SELECT element FROM setB
)AS combined;

SELECT AVG(element)
FROM(
	SELECT element FROM setA
	UNION ALL
	SELECT element FROM setB
)AS combined;

SELECT MIN(element)
FROM(
	SELECT element FROM setA
	UNION ALL
	SELECT element FROM setB
)AS combined;

--
SELECT element FROM setA
INTERSECT
SELECT element FROM setB;

