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
    INTERSECT
    SELECT element FROM setB
) AS IntersectionResult;

--aggregate functions

SELECT COUNT(element)
FROM setA;

SELECT MAX(element)
FROM setA;

SELECT MIN(element)
FROM setA;

SELECT AVG(element)
FROM setA;

SELECT COUNT(element)
FROM setB;

SELECT MIN(element)
FROM setB;

SELECT MAX(element)
FROM setB;

SELECT AVG(element)
FROM setB;

SELECT COUNT(element)
FROM (
    SELECT element FROM setA
    EXCEPT
    SELECT element FROM setB
) AS DifferenceResult;

SELECT MIN(element)
FROM(
	SELECT element FROM setA
	UNION ALL
	SELECT element FROM setB
)AS combined;

--JOINS
SELECT setA.element
FROM setA
LEFT JOIN setB ON setA.element = setB.element
WHERE setB.element IS NOT NULL;

SELECT setA.element
FROM setA
INNER JOIN setB ON setA.element = setB.element;

SELECT setA.element
FROM setA
RIGHT JOIN setB ON setA.element = setB.element
WHERE setB.element IS NOT NULL;



TRUNCATE TABLE setA;

TRUNCATE TABLE setB;
