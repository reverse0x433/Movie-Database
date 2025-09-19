-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Insert genres
INSERT INTO "genres" ("id", "genre") VALUES
(1, 'Sci-Fi'),
(2, 'Fantasy'),
(3, 'Drama'),
(4, 'Action'),
(5, 'Comedy');

-- Insert movies
INSERT INTO "movies" ("id", "title", "genre_id", "year", "rating") VALUES
(1, 'Inception', 1, 2010, 8.8),
(2, 'The Matrix', 1, 1999, 8.7),
(3, 'Interstellar', 1, 2014, 8.6),
(4, 'Harry Potter and the Sorcerer''s Stone', 2, 2001, 7.6),
(5, 'The Dark Knight', 4, 2008, 9.0),
(6, 'Forrest Gump', 3, 1994, 8.8),
(7, 'The Hangover', 5, 2009, 7.7);

-- Insert people (actors + directors)
INSERT INTO "people" ("id","name", "birth_year") VALUES
(1, 'Leonardo DiCaprio', 1974),
(2, 'Joseph Gordon-Levitt', 1981),
(3, 'Elliot Page', 1987),
(4, 'Christopher Nolan', 1970),
(5, 'Keanu Reeves', 1964),
(6, 'Carrie-Anne Moss', 1967),
(7, 'Laurence Fishburne', 1961),
(8, 'Lana Wachowski', 1965),
(9, 'Matthew McConaughey', 1969),
(10, 'Anne Hathaway', 1982),
(11, 'Daniel Radcliffe', 1989),
(12, 'Emma Watson', 1990),
(13, 'Rupert Grint', 1988),
(14, 'Tom Hanks', 1956),
(15, 'Morgan Freeman', 1937),
(16, 'Christian Bale', 1974),
(17, 'Bradley Cooper', 1975),
(18, 'Ed Helms', 1974),
(19, 'Zach Galifianakis', 1969);

-- Insert stars (actor → movie relationships)
INSERT INTO "stars" ("movie_id", "person_id") VALUES
-- Inception
(1, 1), (1, 2), (1, 3),
-- Matrix
(2, 5), (2, 6), (2, 7),
-- Interstellar
(3, 9), (3, 10),
-- Harry Potter
(4, 11), (4, 12), (4, 13),
-- Dark Knight
(5, 16), (5, 15),
-- Forrest Gump
(6, 14),
-- Hangover
(7, 17), (7, 18), (7, 19);

-- Insert reviews
INSERT INTO "reviews" ("id", "movie_id", "user", "score") VALUES
(1, 1, 'Alice', 9),
(2, 1, 'Bob', 8),
(3, 2, 'Charlie', 10),
(4, 2, 'David', 9),
(5, 3, 'Emma', 9),
(6, 4, 'Frank', 7),
(7, 5, 'Grace', 10),
(8, 6, 'Henry', 9),
(9, 7, 'Isla', 8);

-- List all movies and their genres.
SELECT "movies"."title","genres"."genre" FROM "movies" JOIN "genres"
ON "movies"."genre_id" = "genres"."id";

-- Find all actors who starred in Inception.
SELECT "people"."name" FROM "stars" JOIN "movies"
ON "stars"."movie_id" = "movies"."id"
JOIN "people"
ON "stars"."person_id" = "people"."id"
WHERE "movies"."title" = 'Inception';

-- Show the average rating of each genre, ordered from highest to lowest.
SELECT "genres"."genre",ROUND(AVG("movies"."rating"),2) AS "average_rating" FROM "genres" JOIN "movies"
ON "genres"."id" = "movies"."genre_id"
GROUP BY "genres"."genre" ORDER BY "average_rating" DESC;

-- Find the highest-rated movie and its rating.
SELECT "title","rating" FROM "movies"
WHERE "rating" = (
    SELECT MAX("rating") FROM "movies");

-- Find the actor who has starred in the most movies.
SELECT "people"."name",COUNT("stars"."movie_id") AS "movie_count" FROM "stars" JOIN "movies"
ON "stars"."movie_id" = "movies"."id"
JOIN "people"
ON "stars"."person_id" = "people"."id"
GROUP BY "people"."id"
ORDER BY "movie_count" DESC,"people"."name" LIMIT 1;

-- Show the top 3 movies by average review score.
SELECT "movies"."title",ROUND(AVG("reviews"."score"),2) AS "average_score" FROM "movies" JOIN "reviews"
ON "movies"."id" = "reviews"."movie_id"
GROUP BY "movies"."id"
ORDER BY "average_score" DESC LIMIT 3;
