DROP TABLE IF EXISTS PlayerMatchScore;
DROP TABLE IF EXISTS Match;
DROP TABLE IF EXISTS Tournament;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

CREATE TABLE Player (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

CREATE TABLE Game (
    game_id SERIAL PRIMARY KEY,
    game_name VARCHAR(50),
    genre VARCHAR(30)
);

CREATE TABLE Tournament (
    tournament_id SERIAL PRIMARY KEY,
    tournament_name VARCHAR(50),
    location VARCHAR(50),
    date DATE
);

CREATE TABLE Match (
    match_id SERIAL PRIMARY KEY,
    tournament_id INT REFERENCES Tournament(tournament_id),
    game_id INT REFERENCES Game(game_id),
    match_date DATE
);

CREATE TABLE PlayerMatchScore (
    match_id INT REFERENCES Match(match_id),
    player_id INT REFERENCES Player(player_id),
    score INT,
    PRIMARY KEY (match_id, player_id)
);

INSERT INTO Player (name, age, country)
VALUES ('Alice', 25, 'USA'),
       ('Bob', 30, 'UK'),
       ('Charlie', 22, 'India'),
       ('Dave', 28, 'Canada');

INSERT INTO Game (game_name, genre)
VALUES ('Chess', 'Strategy'),
       ('Monopoly', 'Economic'),
       ('Scrabble', 'Word Game');

INSERT INTO Tournament (tournament_name, location, date)
VALUES ('World Chess Championship', 'New York', '2025-04-10'),
       ('Global Monopoly Tournament', 'London', '2025-05-20'),
       ('Scrabble Open', 'Mumbai', '2025-06-15');

INSERT INTO Match (tournament_id, game_id, match_date)
VALUES (1, 1, '2025-04-10'),
       (2, 2, '2025-05-20'),
       (3, 3, '2025-06-15');

INSERT INTO PlayerMatchScore (match_id, player_id, score)
VALUES (1, 1, 3),
       (1, 2, 5),
       (2, 3, 7),
       (2, 4, 6),
       (3, 1, 8),
       (3, 3, 9);

SELECT p.name
FROM Player p
JOIN PlayerMatchScore pms ON p.player_id = pms.player_id
JOIN Match m ON m.match_id = pms.match_id
JOIN Tournament t ON t.tournament_id = m.tournament_id
WHERE t.tournament_name = 'World Chess Championship';

SELECT t.tournament_name, p.name AS top_scorer, MAX(pms.score) AS highest_score
FROM Tournament t
JOIN Match m ON t.tournament_id = m.tournament_id
JOIN PlayerMatchScore pms ON m.match_id = pms.match_id
JOIN Player p ON pms.player_id = p.player_id
GROUP BY t.tournament_name, p.name
ORDER BY t.tournament_name;

SELECT p.name, AVG(pms.score) AS average_score
FROM Player p
JOIN PlayerMatchScore pms ON p.player_id = pms.player_id
GROUP BY p.name;

SELECT g.game_name
FROM Player p
JOIN PlayerMatchScore pms ON p.player_id = pms.player_id
JOIN Match m ON m.match_id = pms.match_id
JOIN Game g ON m.game_id = g.game_id
WHERE p.name = 'Alice';
