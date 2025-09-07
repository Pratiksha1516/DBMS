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

SELECT element
FROM setA
WHERE element = 5
AND element IN (SELECT element FROM setB);

SELECT 'SetA' AS SetName, COUNT(*) AS Count FROM setA
UNION
SELECT 'SetB', COUNT(*) FROM setB;

SELECT element FROM setA
UNION
SELECT element FROM setB
EXCEPT
SELECT element FROM setA
INTERSECT
SELECT element FROM setB;

SELECT a.element, b.element AS B_match
FROM setA a
LEFT JOIN setB b ON a.element = b.element;

SELECT a.element AS A_match, b.element
FROM setA a
RIGHT JOIN setB b ON a.element = b.element;

SELECT COUNT(*) AS CommonCount
FROM setA
WHERE element IN (SELECT element FROM setB);

SELECT 'SetA' AS SetName, MAX(element) AS MaxElement FROM setA
UNION
SELECT 'SetB', MAX(element) FROM setB;

SELECT 'SetA' AS SetName, MIN(element) AS MinElement FROM setA
UNION
SELECT 'SetB', MIN(element) FROM setB;

SELECT 'SetA' AS SetName, SUM(element) AS SumElements FROM setA
UNION
SELECT 'SetB', SUM(element) FROM setB;

SELECT 'SetA' AS SetName, AVG(element) AS AvgElement FROM setA
UNION
SELECT 'SetB', AVG(element) FROM setB;

SELECT DISTINCT element 
FROM (
    SELECT element FROM setA
    UNION
    SELECT element FROM setB
) AS AllElements
WHERE element % 2 = 0;

SELECT DISTINCT element 
FROM (
    SELECT element FROM setA
    UNION
    SELECT element FROM setB
) AS AllElements
WHERE element % 2 <> 0;
