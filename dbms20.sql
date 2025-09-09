CREATE TABLE Book (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Publisher VARCHAR(255),
    Price DECIMAL(10,2)
);

CREATE TABLE Member (
    MemberID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    JoinDate DATE
);

CREATE TABLE Borrow (
    BorrowID SERIAL PRIMARY KEY,
    MemberID INT REFERENCES Member(MemberID),
    BookID INT REFERENCES Book(BookID),
    BorrowDate DATE,
    ReturnDate DATE
);

INSERT INTO Book (Title, Author, Publisher, Price) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 15.99),
('1984', 'George Orwell', 'Secker & Warburg', 12.50),
('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 18.75);

INSERT INTO Member (Name, Email, JoinDate) VALUES
('Pratiksha', 'pratiksha@example.com', '2023-05-10'),
('Ranveer', 'ranveer@example.com', '2022-08-15'),
('Shree', 'shree@example.com', '2024-01-20');

INSERT INTO Borrow (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 2, '2024-03-01', '2024-03-10'),  
(2, 1, '2024-03-05', '2024-03-15'),  
(3, 3, '2024-03-10', NULL);         


SELECT b.Title, b.Author, br.BorrowDate, br.ReturnDate  
FROM Borrow br  
JOIN Book b ON br.BookID = b.BookID  
JOIN Member m ON br.MemberID = m.MemberID  
WHERE m.Name = 'Pratiksha';

SELECT m.Name, COUNT(br.BookID) AS TotalBooksBorrowed  
FROM Borrow br  
JOIN Member m ON br.MemberID = m.MemberID  
GROUP BY m.Name;

SELECT * FROM Book  
WHERE BookID NOT IN (SELECT DISTINCT BookID FROM Borrow);

SELECT b.Title, COUNT(br.BookID) AS BorrowCount  
FROM Borrow br  
JOIN Book b ON br.BookID = b.BookID  
GROUP BY b.Title  
ORDER BY BorrowCount DESC  
LIMIT 1;

DELETE FROM Member  
WHERE MemberID NOT IN (SELECT DISTINCT MemberID FROM Borrow);

--
SELECT * FROM Member
WHERE JoinDate > '2023-01-01';

SELECT Title, Price
FROM Book
ORDER BY Price DESC
LIMIT 1;

SELECT DISTINCT m.Name
FROM Member m
JOIN Borrow br ON m.MemberID = br.MemberID
WHERE br.ReturnDate IS NULL;

SELECT AVG(Price) AS AverageBookPrice
FROM Book;

SELECT Title, Price
FROM Book
WHERE Publisher = 'Scribner'
ORDER BY Price ASC
LIMIT 1;

SELECT m.Name, b.Title, br.BorrowDate
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
JOIN Book b ON br.BookID = b.BookID;

SELECT COUNT(DISTINCT MemberID) AS ActiveMembers
FROM Borrow;

SELECT DISTINCT b.Title
FROM Borrow br
JOIN Book b ON br.BookID = b.BookID
WHERE br.BorrowDate BETWEEN '2024-03-01' AND '2024-03-31';

UPDATE Book
SET Price = Price * 1.10;

SELECT m.Name, MIN(br.BorrowDate) AS FirstBorrow
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
GROUP BY m.Name
ORDER BY FirstBorrow ASC
LIMIT 1;

SELECT b.Title,
       CASE 
           WHEN br.BookID IS NOT NULL THEN 'Borrowed'
           ELSE 'Available'
       END AS Status
FROM Book b
LEFT JOIN Borrow br ON b.BookID = br.BookID AND br.ReturnDate IS NULL;

SELECT SUM(b.Price) AS TotalRevenue
FROM Borrow br
JOIN Book b ON br.BookID = b.BookID;

DELETE FROM Book
WHERE Price < 13;

SELECT Publisher, COUNT(*) AS TotalBooks
FROM Book
GROUP BY Publisher;

SELECT m.Name, COUNT(br.BookID) AS BorrowedCount
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
GROUP BY m.Name
HAVING COUNT(br.BookID) > 1;

SELECT COUNT(*) AS CurrentlyBorrowed
FROM Borrow
WHERE ReturnDate IS NULL;

SELECT m.Name, b.Title
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
JOIN Book b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;

SELECT b.Title
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
JOIN Book b ON br.BookID = b.BookID
WHERE m.Name = 'Ranveer';
