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


--
SELECT element FROM setA
UNION
SELECT element FROM setB;

SELECT element FROM setA
INTERSECT
SELECT element FROM setB;

SELECT element FROM setB
EXCEPT
SELECT element FROM setA;

SELECT a.element AS A_element, b.element AS B_element
FROM setA a
CROSS JOIN setB b;
