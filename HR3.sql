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


SELECT COUNT(DISTINCT element)
FROM (
    SELECT element FROM setA
    UNION
    SELECT element FROM setB
) AS union_result;


SELECT NOT EXISTS (
    SELECT element FROM setA
    EXCEPT
    SELECT element FROM setB
) AS is_subset;


SELECT A.element
FROM setA A
INNER JOIN setB B ON A.element = B.element;


SELECT A.element, B.element AS exists_in_B
FROM setA A
LEFT JOIN setB B ON A.element = B.element;


SELECT B.element, A.element AS exists_in_A
FROM setB B
LEFT JOIN setA A ON A.element = B.element;


SELECT element FROM setA
UNION
SELECT element FROM setB;


SELECT COUNT(*)
FROM (
    SELECT element FROM setA
    INTERSECT
    SELECT element FROM setB
) AS common;


SELECT element, COUNT(*) AS occurrences
FROM (
    SELECT element FROM setA
    UNION ALL
    SELECT element FROM setB
) AS combined
GROUP BY element
HAVING COUNT(*) > 1;


SELECT element
FROM (
    SELECT element FROM setA
    UNION ALL
    SELECT element FROM setB
) AS combined
GROUP BY element
HAVING COUNT(*) = 1;


SELECT COUNT(*) AS total_elements
FROM (
    SELECT element FROM setA
    UNION ALL
    SELECT element FROM setB
) AS combined;


SELECT 'setA' AS set_name, COUNT(*) AS count FROM setA
UNION ALL
SELECT 'setB', COUNT(*) FROM setB;


SELECT DISTINCT element
FROM (
    SELECT element FROM setA WHERE element > 4
    UNION
    SELECT element FROM setB WHERE element > 4
) AS filtered;
