DROP TABLE albums;
DROP TABLE artists;
DROP TABLE inventory;


CREATE TABLE artists (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255),
  price_buying INT4,
  price_selling INT4,
  quantity INT4,
  profit INT4
);

CREATE TABLE inventory (
  id serial4 PRIMARY KEY,
  artist_id INT4 references artists(id),
  album_id INT4 references albums(id)
);