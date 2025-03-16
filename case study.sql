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


CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
DROP TABLE IF EXISTS Members CASCADE;


CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES Books(book_id),
    member_id INT REFERENCES Members(member_id),
    loan_date DATE,
    return_date DATE
);
DROP TABLE IF EXISTS Loans CASCADE;


INSERT INTO Authors (author_id,name)
VALUES
    (1,'C.J. Date'),
    (2,'Abraham Silberschatz'),
    (3,'Ramez Elmasri'),
    (4,'Raghu Ramakrishnan'),
    (5,'Korth & Sudarshan');

INSERT INTO Books (title, author_id, published_year)
VALUES
    ('An Introduction to Database Systems', 1, 2019),
    ('Database System Concepts', 2, 2020),
    ('Fundamentals of Database Systems', 3, 2021),
    ('Database Management Systems', 4, 2018),
    ('Database Systems: The Complete Book', 5, 2022);

INSERT INTO Members (name, email)
VALUES
    ('Pratiksha', 'pratiksha@email.com'),
    ('Shabdshree', 'shabdshree@email.com'),
    ('Ranveer', 'ranveer@email.com'),
    ('Riddhi', 'riddhi@email.com'),
    ('Gaurav', 'gaurav@email.com');
	
INSERT INTO Members (member_id,name, email)
VALUES
    (1,'Pratiksha', 'pratiksha@email.com'),
    (2,'Shabdshree', 'shabdshree@email.com'),
    (3,'Ranveer', 'ranveer@email.com'),
    (4,'Riddhi', 'riddhi@email.com'),
    (5,'Gaurav', 'gaurav@email.com');

INSERT INTO Loans (book_id, member_id, loan_date, return_date)
VALUES
    (1, 1, '2025-03-10', '2025-03-17'),
    (2, 2, '2025-03-11', '2025-03-18'),
    (3, 3, '2025-03-12', '2025-03-19'),
    (4, 4, '2025-03-13', '2025-03-20'),
    (5, 5, '2025-03-14', NULL);  

UPDATE Members SET name = 'Rita' WHERE member_id = 1;
select * from Members order by member_id;

DELETE FROM Books WHERE book_id = 5 cascade;
select * from Books;

ALTER TABLE Books DROP COLUMN IF EXISTS published_year;

DROP TABLE Loans;

SELECT COUNT(*) AS total_books FROM Books;

SELECT AVG(LENGTH(title)) AS average_title_length
FROM Books;
SELECT AVG(LENGTH(name)) AS average_name_length
FROM Members;

SELECT Books.title, Authors.name
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.author_id;

SELECT Members.name, Loans.loan_date 
FROM Members
LEFT JOIN Loans ON Members.member_id = Loans.member_id;

SELECT Books.title, Loans.loan_date 
FROM Books
RIGHT JOIN Loans ON Books.book_id = Loans.book_id;

SELECT 
    Authors.name AS author_name,
    Books.title AS book_title
FROM Authors
FULL JOIN Books
ON Authors.author_id = Books.author_id;

SELECT 
    Authors.author_id,
    Authors.name AS author_name,
    Books.book_id,
    Books.title AS book_title,
    Members.member_id,
    Members.name AS member_name,
    Loans.loan_id,
    Loans.loan_date,
    Loans.return_date
FROM Authors
FULL JOIN Books 
    ON Authors.author_id = Books.author_id
FULL JOIN Loans 
    ON Books.book_id = Loans.book_id
FULL JOIN Members 
    ON Loans.member_id = Members.member_id;



CREATE TABLE BookDetails (
    book_id SERIAL PRIMARY KEY,
    book_info JSONB
);

INSERT INTO BookDetails (book_info)
VALUES 
    ('{
        "title": "An Introduction to Database Systems",
        "author": "C.J. Date",
        "published_year": 2019,
        "genres": ["Database", "Theory"],
        "ratings": {"average": 4.5, "reviews": 100}
    }'),
    ('{
        "title": "Database System Concepts",
        "author": "Abraham Silberschatz",
        "published_year": 2020,
        "genres": ["Database", "Systems"],
        "ratings": {"average": 4.7, "reviews": 120}
    }'),
    ('{
        "title": "Fundamentals of Database Systems",
        "author": "Ramez Elmasri",
        "published_year": 2021,
        "genres": ["Database", "Design", "Implementation"],
        "ratings": {"average": 4.6, "reviews": 90}
    }'),
    ('{
        "title": "Database Management Systems",
        "author": "Raghu Ramakrishnan",
        "published_year": 2018,
        "genres": ["Database", "Theory", "Practice"],
        "ratings": {"average": 4.4, "reviews": 85}
    }'),
    ('{
        "title": "Database Systems: The Complete Book",
        "author": "Korth & Sudarshan",
        "published_year": 2022,
        "genres": ["Database", "Comprehensive"],
        "ratings": {"average": 4.8, "reviews": 200}
    }');
select * from BookDetails;

SELECT book_info->>'title' AS title FROM BookDetails;

SELECT book_info->'ratings'->>'average' AS average_rating FROM BookDetails;

SELECT book_info->'genres' AS genres FROM BookDetails;
