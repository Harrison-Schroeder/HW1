-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!
-- - Note rubric explanation for appropriate use of external resources.

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- Done

-- Create new tables, according to your domain model
-- Done

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- Done

-- The SQL statement for the movies output
-- Done

-- The SQL statement for the cast output
-- Done


-- Drops existing tables, so we start fresh with each
-- run of this script
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS characters;

-- CREATE TABLES
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released TEXT,
  MPAA_rating TEXT,
  studio_id INTEGER
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT,
  movie_id INTEGER,
  actor_id INTEGER
);

INSERT INTO movies (
    title,
    year_released,
    MPAA_rating,
    studio_id
) VALUES 
    ("Batman Begins", "2005", "PG-13", 1),
    ("The Dark Knight", "2008", "PG-13", 1),
    ("The Dark Knight Rises", "2012", "PG-13", 1)
;

INSERT INTO actors (
    first_name,
    last_name
) VALUES
    ("Christian", "Bale"),
    ("Michael", "Caine"),
    ("Liam", "Neeson"),
    ("Katie", "Holmes"),
    ("Gary", "Oldman"),
    ("Heath", "Ledger"),
    ("Aaron", "Eckhart"),
    ("Maggie", "Gyllenhall"),
    ("Tom", "Hardy"),
    ("Joseph", "Gordon-Levitt"),
    ("Anne", "Hathaway")
;

INSERT INTO studios (
    name
) VALUES 
    ("Warner Bros.")
;

INSERT INTO characters (
  first_name,
  last_name,
  movie_id,
  actor_id
) VALUES 
    ("Bruce", "Wayne", 1, 1),
    ("Alfred", "", 1, 2),
    ("Ra's", "Al Ghul", 1, 3),
    ("Rachel", "Dawes", 1, 4),
    ("Commissioner", "Gordon", 1, 5),
    ("Bruce", "Wayne", 2, 1),
    ("Joker", "", 2, 6),
    ("Harvey", "Dent", 2, 7),
    ("Alfred", "", 2, 2),
    ("Rachel", "Dawes", 2, 8),
    ("Bruce", "Wayne", 3, 1),
    ("Commissioner", "Gordon", 3, 5),
    ("Bane", "", 3, 9),
    ("John", "Blake", 3, 10),
    ("Selina", "Kyle", 3, 11)
;

-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
.print "List of Movies"
.print "======"
.print ""
SELECT movies.title, movies.year_released, movies.MPAA_rating, studios.name
FROM movies INNER JOIN studios ON studios.id = movies.studio_id
;

-- - As a guest, I want to see the movies which a single studio has produced.
.print ""
.print "Movies from a Single Studio"
.print "======"
.print ""
SELECT studios.name, movies.title
FROM movies INNER JOIN studios ON studios.id = movies.studio_id
WHERE movies.studio_id = 1
;

-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
.print ""
.print "Top Cast"
.print "========"
.print ""
SELECT movies.title, actors.first_name, actors.last_name, characters.first_name, characters.last_name
FROM movies INNER JOIN characters ON movies.id = characters.movie_id
INNER JOIN actors ON actors.id = characters.actor_id
;

-- - As a guest, I want to see the movies which a single actor has acted in. 
--In this case the actor is Michael Caine but can be replaced by another WHERE/AND statement
-- Removing the WHERE/AND statement will give all actors sorted by first name
.print ""
.print "Movies with Actor Michael Caine"
.print "======"
.print ""
SELECT actors.first_name, actors.last_name, movies.title
FROM movies INNER JOIN characters ON movies.id = characters.movie_id
INNER JOIN actors ON actors.id = characters.actor_id
WHERE actors.first_name = "Michael" and actors.last_name = "Caine"
ORDER BY actors.first_name ASC
;