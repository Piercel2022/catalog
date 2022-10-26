CREATE TABLE item (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres (id),
);

CREATE TABLE movie (
  id  INT,
  silent BOOLEAN,
	date_published Date,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE source (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255),
);