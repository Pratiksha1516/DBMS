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

SELECT COUNT(*)
FROM setA
cross join setB;

--
SELECT element FROM setA
UNION
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

SELECT setA.element AS A, setB.element AS B
FROM setA CROSS JOIN setB;

SELECT setA.element
FROM setA
INNER JOIN setB ON setA.element = setB.element;

SELECT setA.element AS A, setB.element AS B
FROM setA LEFT JOIN setB ON setA.element = setB.element;

SELECT setA.element AS A, setB.element AS B
FROM setA RIGHT JOIN setB ON setA.element = setB.element;

SELECT setA.element AS A, setB.element AS B
FROM setA FULL OUTER JOIN setB ON setA.element = setB.element;

SELECT COUNT(*) AS OnlyInA
FROM setA
WHERE element NOT IN (SELECT element FROM setB);

SELECT COUNT(*) AS OnlyInB
FROM setB
WHERE element NOT IN (SELECT element FROM setA);

SELECT COUNT(*) AS CommonCount
FROM setA
WHERE element IN (SELECT element FROM setB);

SELECT MAX(element) AS MaxA
FROM setA;

SELECT MIN(element) AS MinB
FROM setB;

SELECT AVG(element) AS AvgA 
FROM setA;

SELECT AVG(element) AS AvgB 
FROM setB;
