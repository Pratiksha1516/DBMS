CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
	published_year INT,
    author_id INT REFERENCES Authors(author_id)
);

INSERT INTO Authors (name)
VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('Agatha Christie'),
('J.R.R. Tolkien'),
('Stephen King');

INSERT INTO Books (title, published_year, author_id)
VALUES 
('Harry Potter and the Philosopher Stone', 1997, 1),
('A Game of Thrones', 1996, 2),
('Murder on the Orient Express', 1934, 3),
('The Hobbit', 1937, 4),
('The Shining', 1977, 5),
('Harry Potter and the Chamber of Secrets', 1998, 1),
('A Clash of Kings', 1998, 2),
('And Then There Were None', 1939, 3),
('The Lord of the Rings', 1954, 4),
('Carrie', 1974, 5);

SELECT * FROM Authors;

SELECT * FROM Books;

SELECT title, published_year
FROM Books
WHERE published_year > 1950;

SELECT B.title, B.published_year
FROM Books B
JOIN Authors A ON B.author_id = A.author_id
WHERE A.name = 'J.K. Rowling';

SELECT A.name, COUNT(B.book_id) AS total_books
FROM Authors A
LEFT JOIN Books B ON A.author_id = B.author_id
GROUP BY A.name;

SELECT title
FROM Books
WHERE published_year = 1998;

UPDATE Authors
SET name = 'Stephen Edwin King'
WHERE name = 'Stephen King';

SELECT *
FROM Books
WHERE published_year < 2000;

SELECT title
FROM Books
WHERE title LIKE 'A%';

SELECT title
FROM Books
WHERE title LIKE '%Harry%';

SELECT name
FROM Authors
WHERE name LIKE '%R.R%';

SELECT B.title 
FROM Books B
JOIN Authors A ON B.Author_id = A.Author_id
WHERE A.name LIKE '%King%';

SELECT *
FROM Books
ORDER BY published_year ASC
LIMIT 1;

SELECT *
FROM Books
ORDER BY published_year DESC
LIMIT 1;

SELECT published_year, COUNT(*) AS book_count
FROM Books
GROUP BY published_year
ORDER BY published_year;

SELECT COUNT(*)
FROM Books;

SELECT AVG(published_year) AS Aavg_year
FROM Books;

SELECT B.title, A.name
FROM Books B
JOIN Authors A ON B.author_id = A.author_id;

SELECT A.name, COUNT(B.book_id) AS book_count
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
GROUP BY A.name
HAVING COUNT(B.book_id) > 1;

SELECT A.name
FROM Authors A
LEFT JOIN Books B ON A.author_id = B.author_id
WHERE B.book_id IS NULL;

SELECT *
FROM Books
ORDER BY published_year DESC
LIMIT 3;

SELECT *
FROM Books
JOIN Authors A ON Books.author_id = A.author_id
WHERE A.name = 'Agatha Christie'
ORDER BY published_year;

--
SELECT title 
FROM Books 
WHERE published_year = (
    SELECT published_year 
    FROM Books 
    WHERE title = 'The Hobbit'
);

SELECT A.name 
FROM Authors A 
JOIN Books B ON A.author_id = B.author_id 
GROUP BY A.name 
HAVING COUNT(B.book_id) = 1;

SELECT A.name, B.title, B.published_year
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
WHERE (A.author_id, B.published_year) IN (
    SELECT author_id, MAX(published_year)
    FROM Books
    GROUP BY author_id
);

SELECT 
    CASE 
        WHEN published_year < 2000 THEN 'Before 2000'
        ELSE '2000 or Later'
    END AS Period,
    COUNT(*) AS book_count
FROM Books
GROUP BY Period;

SELECT title 
FROM Books 
WHERE LENGTH(title) > 25;

SELECT A.name, B.published_year
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
ORDER BY A.name, B.published_year;

SELECT A.name, COUNT(B.book_id) AS book_count, MIN(B.published_year) AS first_published
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
GROUP BY A.name;

SELECT B.title, A.name
FROM Books B
JOIN Authors A ON B.author_id = A.author_id
WHERE A.name LIKE 'J%';

SELECT A.name, COUNT(B.book_id) AS book_count
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
GROUP BY A.name
ORDER BY book_count DESC
LIMIT 1;

SELECT title
FROM Books
WHERE LENGTH(title) - LENGTH(REPLACE(title, ' ', '')) + 1 > 3;

SELECT DISTINCT published_year 
FROM Books 
ORDER BY published_year;

SELECT DISTINCT published_year 
FROM Books 
ORDER BY published_year;

SELECT title
FROM Books
WHERE title LIKE '%s';

SELECT DISTINCT A.name
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
WHERE B.published_year < 1980;
