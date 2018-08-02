DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;



CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  genre VARCHAR
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR
);

CREATE TABLE castings (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
  fee INT
);
