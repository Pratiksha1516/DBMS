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


SELECT 
    MIN(BorrowDate) AS FirstBorrowed,
    MAX(BorrowDate) AS LastBorrowed
FROM Borrow;

SELECT SUM(Price) AS TotalBookValue 
FROM Book;

SELECT m.Name, COUNT(b.BorrowID) AS BooksBorrowed
FROM Member m
JOIN Borrow b ON m.MemberID = b.MemberID
GROUP BY m.Name;

CREATE VIEW BookBorrowCount AS			-- here i have used view, aggregate function and join as well
SELECT bk.Title, COUNT(b.BorrowID) AS TimesBorrowed
FROM Book bk
JOIN Borrow b ON bk.BookID = b.BookID
GROUP BY bk.Title;

select * from BookBorrowCount;


--
SELECT DISTINCT m.Name
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
WHERE EXTRACT(MONTH FROM br.BorrowDate) = 3 AND EXTRACT(YEAR FROM br.BorrowDate) = 2024;

SELECT b.Title, m.Name, br.BorrowDate
FROM Borrow br
JOIN Book b ON br.BookID = b.BookID
JOIN Member m ON br.MemberID = m.MemberID
WHERE br.ReturnDate IS NULL;

SELECT Name
FROM Member
WHERE JoinDate < '2023-01-01';

SELECT MemberID, BookID, COUNT(*) AS TimesBorrowed
FROM Borrow
GROUP BY MemberID, BookID
HAVING COUNT(*) > 1;

SELECT b.Title, 
       CASE 
           WHEN br.BookID IS NOT NULL THEN 'Yes'
           ELSE 'No'
       END AS IsBorrowed
FROM Book b
LEFT JOIN Borrow br ON b.BookID = br.BookID
GROUP BY b.BookID, b.Title, br.BookID;

SELECT DISTINCT m.Name, m.Email
FROM Member m
JOIN Borrow br ON m.MemberID = br.MemberID
JOIN Book b ON br.BookID = b.BookID
WHERE b.Price > 15.00;

SELECT b.Author, COUNT(br.BorrowID) AS TimesBorrowed
FROM Book b
JOIN Borrow br ON b.BookID = br.BookID
GROUP BY b.Author;

SELECT AVG(ReturnDate - BorrowDate) AS AvgBorrowDuration
FROM Borrow
WHERE ReturnDate IS NOT NULL;

SELECT * FROM Member
ORDER BY Name ASC;

SELECT DISTINCT b.Title
FROM Borrow br
JOIN Book b ON br.BookID = b.BookID
WHERE br.BorrowDate >= CURRENT_DATE - INTERVAL '60 days';

SELECT m.Name
FROM Member m
LEFT JOIN Borrow br ON m.MemberID = br.MemberID
WHERE br.BorrowID IS NULL;

SELECT DISTINCT Publisher
FROM Book;

SELECT * FROM Book
WHERE Title ILIKE '%Great%';

SELECT SUM(bk.Price) AS TotalBorrowedValue
FROM Borrow br
JOIN Book bk ON br.BookID = bk.BookID;

SELECT m.Name, COUNT(br.BorrowID) AS Total
FROM Member m
JOIN Borrow br ON m.MemberID = br.MemberID
GROUP BY m.Name
ORDER BY Total DESC
LIMIT 1;

SELECT DISTINCT m.Name
FROM Member m
JOIN Borrow br ON m.MemberID = br.MemberID
WHERE EXTRACT(YEAR FROM m.JoinDate) = 2023
  AND EXTRACT(YEAR FROM br.BorrowDate) = 2023;

SELECT b.Title, COUNT(br.BorrowID) AS TimesBorrowed
FROM Book b
JOIN Borrow br ON b.BookID = br.BookID
GROUP BY b.Title
HAVING COUNT(br.BorrowID) > 1;

SELECT EXTRACT(MONTH FROM BorrowDate) AS Month, COUNT(*) AS Total
FROM Borrow
WHERE EXTRACT(YEAR FROM BorrowDate) = 2024
GROUP BY Month
ORDER BY Month;

SELECT DISTINCT m.Name
FROM Member m
JOIN Borrow br ON m.MemberID = br.MemberID
JOIN Book b ON br.BookID = b.BookID
WHERE b.Publisher = 'Scribner';

CREATE VIEW MemberBorrowSummary AS
SELECT m.Name, COUNT(br.BorrowID) AS BorrowCount
FROM Member m
LEFT JOIN Borrow br ON m.MemberID = br.MemberID
GROUP BY m.Name;

-- To view it
SELECT * FROM MemberBorrowSummary;
