-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- This is the schema of my database
-- genres table to identify the genre of a movie
CREATE TABLE "genres"(
    "id" INTEGER,
    "genre" TEXT NOT NULL,
    PRIMARY KEY("id")
);
-- movies table
CREATE TABLE "movies"(
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "genre_id" INTEGER,
    "year" NUMERIC NOT NULL,
    "rating" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("genre_id") REFERENCES "genres"("id")
);
-- people table to store the name of the actors
CREATE TABLE "people"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "birth_year" NUMERIC,
    PRIMARY KEY("id")
);
-- stars table to know which actor starred in which movies
CREATE TABLE "stars"(
    "movie_id" INTEGER,
    "person_id" INTEGER,
    PRIMARY KEY("movie_id","person_id"),
    FOREIGN KEY("movie_id") REFERENCES "movies"("id"),
    FOREIGN KEY("person_id") REFERENCES "people"("id")
);
-- reviews table
CREATE TABLE "reviews"(
    "id" INTEGER,
    "movie_id" INTEGER,
    "user" TEXT NOT NULL,
    "score" INTEGER CHECK(score BETWEEN 1 AND 10),
    FOREIGN KEY("movie_id") REFERENCES "movies"("id")
);
-- lists only movies with rating > 8.5.
CREATE VIEW "top_movies" AS
SELECT "title" FROM "movies" WHERE "rating" > 8.5;

CREATE INDEX "idx_movies_genre" ON "movies"("genre_id");
CREATE INDEX "idx_stars_person" ON "stars"("person_id");
