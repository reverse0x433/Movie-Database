                                                                                                                                                   
  ---                                                                                                                                                
  # Movie Database — SQLite                                                                                                                          
                                                                                                                                                     
  A relational database for managing movies, genres, actors, and user reviews.                                                                     
  Built as the final project for Harvard's CS50 SQL course.                                                                                          
                                                                                                                                                     
  ## Schema

  - `genres` — movie genre categories
  - `movies` — titles with release year, rating, and genre reference
  - `people` — actors with birth year
  - `stars` — junction table linking actors to movies (many-to-many)
  - `reviews` — user scores (1–10) per movie

  ## Sample Queries

  - List all movies with their genres
  - Find all actors who starred in a specific movie
  - Average rating per genre, ordered highest to lowest
  - Highest-rated movie
  - Actor with the most movie appearances
  - Top 3 movies by average user review score

  ## Design Decisions

  - Each movie has one genre (multi-genre not supported)
  - Review scores constrained to 1–10 via CHECK constraint
  - Indexes on `genre_id`, `person_id`, and `expires_at` for query performance
  - Foreign keys enforce referential integrity across all tables

  ## Tech

  SQLite · SQL

  ---
