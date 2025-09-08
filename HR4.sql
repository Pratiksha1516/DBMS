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
