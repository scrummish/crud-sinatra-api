CREATE DATABASE videogame;

\c videogame

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  developer VARCHAR(255),
  genre VARCHAR(60)
);