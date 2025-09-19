# Design Document

By YOUR NAME HERE

Video overview: <[watch here](https://youtu.be/l4v_HKqE8HU)>

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
The goal of my database is to keep track of movies, their genres, the actors who starred in them, and reviews from users. Basically, it’s a way to organize movie information so that people can ask questions like “Which actors starred in this movie?” or “What are the top-rated movies?”

* Which people, places, things, etc. are you including in the scope of your database?
- Movies, along with their titles, release years, genres, and ratings.
- Genres, to categorize movies.
- Actors (people) and which movies they starred in.
- Reviews written by users for movies, including review scores.

* Which people, places, things, etc. are *outside* the scope of your database?
- Detailed production information (e.g., directors, writers, budgets).
- Box office data.
- Streaming platforms or availability.
- User authentication or account systems (users are represented by text only, not as separate entities).

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
- List all movies and their genres.
- Find which actors starred in a specific movie.
- View average ratings per genre and compare them.
- See which movie has the highest rating.
- Identify the actor who has starred in the most movies.
- Retrieve the top movies by review scores.

* What's beyond the scope of what a user should be able to do with your database?
- Editing or deleting user data.
- Supporting collaborative editing of reviews.
- Handling multimedia (e.g., posters, trailers).
- Complex recommendation systems.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
I chose to represent genres, movies, people (actors), the stars relationship (which connects movies and actors), and reviews. These cover the    main aspects of a movie database: what the movie is, who acted in it, what type of movie it is, and how people rated it.

* What attributes will those entities have?
- Genres have an id and a genre name.
- Movies have an id, title, genre_id, year, and rating.
- People (actors) have an id, name, and birth_year.
- Stars has a movie_id and person_id, which link movies to actors.
- Reviews have an id, movie_id, user, and score.

* Why did you choose the types you did?
I used integers for IDs because they’re easy to auto-increment and efficient for joins. Text is used for names and titles since they can vary in length. Years are stored as numeric because they’re numbers but not ones you need to calculate with. Ratings and scores are numeric so that you can filter or sort movies based on them.

* Why did you choose the constraints you did?
I added primary keys to make sure each row is unique and foreign keys to connect tables in a consistent way. I used NOT NULL on required fields like movie titles and genre names, so important data can’t be left blank. For reviews, I added a CHECK constraint to keep scores between 1 and 10, which prevents invalid ratings. These constraints make sure the database stays accurate and avoids messy data.

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.
![ER Diagram](diagram.png)

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
- An index on genre_id in the movies table, so filtering by genre is quicker.
- An index on the stars table for person_id, so you can easily look up all the movies an actor has been in.
- A view called top_movies that automatically lists all movies with ratings higher than 8.5, which saves time if you want to find the “best of the best.”

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
The main limitations are that each movie can only have one genre, so multi-genre movies aren’t fully represented. Reviews are basic and only include a username and score, without timestamps or comments. The database doesn’t store information about directors, producers, or other crew members. It also doesn’t track box office data, awards, or streaming availability.

* What might your database not be able to represent very well?
Because of its simplified design, the database struggles with complex real-world scenarios. For example, it can’t easily represent movies that belong to multiple genres, track detailed user review histories, or include collaborative work by multiple crew members. It also cannot handle dynamic or multimedia information like trailers, posters, or streaming links.
