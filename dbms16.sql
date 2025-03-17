CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
DROP TABLE IF EXISTS Authors CASCADE;

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
	published_year INT,
    author_id INT REFERENCES Authors(author_id)
);
DROP TABLE IF EXISTS Books CASCADE;

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


