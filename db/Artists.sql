DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  list_albums VARCHAR
);



CREATE TABLE albums(
id SERIAL PRIMARY KEY,
  title VARCHAR,
  genre VARCHAR,
  artist_id INT REFERENCES artists(id)
);
