CREATE TABLE item (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres (id)
);

CREATE TABLE book (
  id  INT,
  publisher VARCHAR(150),
  cover_state VARCHAR(150),
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(50),
  color VARCHAR(50),
);
