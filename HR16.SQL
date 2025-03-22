CREATE TABLE Hackers(
	hacker_id int primary key,
	name varchar(30)
);

drop table hackers cascade;
CREATE TABLE Difficulty(
	difficulty_level int primary key,
	score int not null
);
drop table Difficulty cascade;

CREATE TABLE Challenges(
	challenge_id int primary key,
	hacker_id int references Hackers(hacker_id),
	difficulty_level int references Difficulty(difficulty_level)
);
drop table Challenges cascade;

CREATE TABLE Submissions(
	submission_id int primary key,
	hacker_id int references Hackers(hacker_id),
	challenge_id int references Challenges(challenge_id),
	score int
);
drop table Submissions cascade;

ALTER TABLE Submissions DROP CONSTRAINT submissions_score_fkey;



INSERT INTO Hackers(hacker_id, name)
VALUES
(5580, 'Rose'),
(8439, 'Angela'),
(27205, 'Frank'),
(52243, 'Patrick'),
(52348, 'Lisa'),
(57645, 'Kimberly'),
(77726, 'Bonnie'),
(83082, 'michael'),
(86870, 'Todd'),
(90411, 'Joe');

INSERT INTO Difficulty(difficulty_level, score)
VALUES
(1, 20),
(2, 30),
(3, 40),
(4, 60),
(5, 80),
(6, 100),
(7, 120);

INSERT INTO Challenges (challenge_id, hacker_id, difficulty_level)
VALUES
(4810, 77726, 4),
(21089, 27205, 1),
(36566, 5580, 7),
(66730, 52243, 6),
(71055, 52243, 2);

select * from Challenges;

INSERT INTO Submissions(submission_id, hacker_id, challenge_id, score)
VALUES
(68628, 77726, 36566, 30),
(65300, 77726, 21089, 10),
(40326, 52243, 36566, 77),
(8941, 27205, 4810, 4),
(83554, 77726, 66730, 30),
(43533, 52243, 66730, 20),
(55385, 52348, 71055, 20),
(39784, 27205, 71055, 23),
(94613, 86870, 71055, 30),
(45788, 52348, 36566, 0),
(93058, 86870, 36566, 30),
(7344, 8439, 66730, 92),
(2721, 8439, 4810, 36),
(523, 5580, 71055, 4),
(49105, 52348, 66730, 0),
(55877, 57645, 66730, 80),
(38355, 27205, 66730, 35),
(3924, 8439, 36566, 80),
(97397, 90411, 66730, 100),
(84162, 83082, 4810, 40),
(97431, 90411, 71055, 30);

SELECT h.hacker_id, h.name
FROM Hackers h
JOIN (
    SELECT hacker_id
    FROM Submissions
    WHERE score = 100
    GROUP BY hacker_id
    HAVING COUNT(DISTINCT challenge_id) > 1
) s ON h.hacker_id = s.hacker_id
ORDER BY (
    SELECT COUNT(DISTINCT challenge_id)
    FROM Submissions
    WHERE score = 100 AND hacker_id = h.hacker_id
) DESC, h.hacker_id;

SELECT h.hacker_id, h.name
FROM Hackers h
JOIN (
    SELECT DISTINCT hacker_id
    FROM Submissions
    WHERE score = 100
) s ON h.hacker_id = s.hacker_id
ORDER BY h.hacker_id;


