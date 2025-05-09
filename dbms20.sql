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

INSERT INTO Book (Title, Title, Publisher, Price) VALUES
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

SELECT * FROM Book;

SELECT * FROM Member;

SELECT * FROM Borrow;

SELECT Price
FROM Book
WHERE BookID = 3;

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

SELECT BorrowDate
FROM Borrow
WHERE BorrowID = 3;

SELECT Title
FROM Book 
WHERE Publisher = 'Harper Lee';

SELECT Email
FROM Member
WHERE Name = 'Ranveer';

DELETE FROM Member  
WHERE MemberID NOT IN (SELECT DISTINCT MemberID FROM Borrow);

--Aggregation function

SELECT COUNT(Title)
FROM Book;

SELECT MAX(Price)
FROM Book;

SELECT MIN(Price)
FROM Book;

SELECT COUNT(*) AS TotalBorrow 
FROM Borrow;

SELECT MemberID, COUNT(*) AS BookBorrowed
FROM Borrow
GROUP BY MemberID;

SELECT 
	COUNT(CASE WHEN ReturnDate IS NOT NULL THEN 1 END) AS Returned,
	COUNT(CASE WHEN ReturnDate IS NULL THEN 1 END) AS NotReturned
FROM Borrow;


SELECT 
	MAX(ReturnDate - BorrowDate) AS MaxBorrowDays
FROM Borrow
WHERE ReturnDate IS NOT NULL;
