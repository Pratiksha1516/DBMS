CREATE TABLE TRIANGLES(
	A INT,
	B INT,
	C INT
);

INSERT INTO TRIANGLES(A, B, C) 
VALUES
(20, 20, 23),
(20, 20, 20),
(20, 21, 22),
(13, 14, 30);

SELECT * FROM TRIANGLES;

SELECT * 
FROM TRIANGLES
WHERE A = B OR B = C OR A = C;

SELECT *
FROM TRIANGLES
WHERE A = B AND B = C;

SELECT *
FROM TRIANGLES
WHERE A<>B AND B<>C AND A<>C;

SELECT * 
FROM TRIANGLES
WHERE A + B > C 
  AND A + C > B 
  AND B + C > A;

SELECT 
    CASE 
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS Triangle_Type
FROM TRIANGLES;

--
SELECT *, GREATEST(A, B, C) AS Max_Side
FROM TRIANGLES;

SELECT *, (A + B + C) AS Perimeter
FROM TRIANGLES
WHERE A + B + C > 50;

SELECT *
FROM TRIANGLES
WHERE A % 2 = 0 AND B % 2 = 0 AND C % 2 = 0;

SELECT *
FROM TRIANGLES
WHERE A % 2 = 1 AND B % 2 = 1 AND C % 2 = 1;

SELECT *
FROM TRIANGLES
WHERE (A % 2 = 0 AND B % 2 = 1 AND C % 2 = 1)
   OR (B % 2 = 0 AND A % 2 = 1 AND C % 2 = 1)
   OR (C % 2 = 0 AND A % 2 = 1 AND B % 2 = 1);

SELECT *
FROM TRIANGLES
WHERE A + B = C OR A + C = B OR B + C = A;

SELECT A, B, C
FROM TRIANGLES
ORDER BY A, B, C;

SELECT *
FROM TRIANGLES
WHERE A*A + B*B = C*C
   OR A*A + C*C = B*B
   OR B*B + C*C = A*A;

SELECT *
FROM TRIANGLES
WHERE C*C > A*A + B*B
   OR B*B > A*A + C*C
   OR A*A > B*B + C*C;

SELECT *
FROM TRIANGLES
WHERE A*A + B*B > C*C
  AND A*A + C*C > B*B
  AND B*B + C*C > A*A;

SELECT *
FROM TRIANGLES
WHERE (A + B + C) % 5 = 0;

SELECT A, B, C,
    ROUND(SQRT(((A+B+C)/2.0) * 
               (((A+B+C)/2.0) - A) *
               (((A+B+C)/2.0) - B) *
               (((A+B+C)/2.0) - C)), 2) AS Area
FROM TRIANGLES
WHERE A + B > C AND A + C > B AND B + C > A;

SELECT *, (A + B + C) AS Perimeter
FROM TRIANGLES
ORDER BY Perimeter DESC;

SELECT *
FROM TRIANGLES
WHERE LEAST(A, B, C) > 15;

SELECT *
FROM TRIANGLES
WHERE (A = B OR B = C OR A = C) AND NOT (A = B AND B = C);

SELECT 
    CASE 
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS Triangle_Type,
    COUNT(*) AS Count
FROM TRIANGLES
GROUP BY Triangle_Type;

SELECT MAX(GREATEST(A, B, C)) AS Longest_Side
FROM TRIANGLES;

SELECT *, (A + B + C) AS Perimeter
FROM TRIANGLES
ORDER BY Perimeter ASC
LIMIT 1;

SELECT *
FROM TRIANGLES
WHERE ABS(A - B) <= 2 OR ABS(B - C) <= 2 OR ABS(A - C) <= 2;

SELECT AVG(A + B + C) AS Avg_Perimeter
FROM TRIANGLES
WHERE A + B > C AND A + C > B AND B + C > A;
