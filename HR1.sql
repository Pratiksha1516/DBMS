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

SELECT AVG(element) FROM setA 
WHERE element < 5;

SELECT MAX(element) FROM setB
WHERE element > 5;


--
SELECT element FROM setA
INTERSECT
SELECT element FROM setB;

SELECT element FROM setA
EXCEPT
SELECT element FROM setB;

SELECT element FROM setB
EXCEPT
SELECT element FROM setA;

--Symmetric Difference (elements in either set, but not in both)
SELECT element FROM setA
EXCEPT
SELECT element FROM setB
UNION
SELECT element FROM setB
EXCEPT
SELECT element FROM setA;

SELECT element FROM setA
WHERE element > 3;

SELECT element FROM setB 
WHERE element <= 5;

--SELECT EXISTS (SELECT 1 FROM setA WHERE element = 7);
SELECT EXISTS (SELECT 1 FROM setA 
WHERE element = 7);

SELECT COUNT(*) FROM setA 
WHERE element % 2 = 0;

SELECT element FROM setB
WHERE element % 2 <> 0;

SELECT setA.element
FROM setA
INNER JOIN setB ON setA.element = setB.element;

SELECT setA.element, setB.element AS B_element
FROM setA
LEFT JOIN setB ON setA.element = setB.element;

SELECT setA.element AS A_element, setB.element
FROM setA
RIGHT JOIN setB ON setA.element = setB.element;

--
SELECT element FROM setA
WHERE element NOT IN (SELECT element FROM setB);

SELECT element FROM setB
WHERE element IN (SELECT element FROM setA);


--
SELECT element FROM setB
ORDER BY element DESC
LIMIT 3;

SELECT element FROM setA
ORDER BY element ASC
LIMIT 2;
