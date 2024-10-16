-- Жанры
CREATE TABLE IF NOT EXISTS Genres(
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

-- Артисты
CREATE TABLE IF NOT EXISTS Artists(
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL 
);

-- Альбомы
CREATE TABLE IF NOT EXISTS Albums(
id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
release_year INT NOT NULL 
);

-- Песни
CREATE TABLE IF NOT EXISTS Tracks(
id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
album_id INT REFERENCES Albums(id),
duration INTERVAL NOT NULL
);

-- Сборники

CREATE TABLE IF NOT EXISTS Collections(
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
release_year INT NOT NULL
);

-- Жанры артистов
CREATE TABLE IF NOT EXISTS Artist_genres(
genre_id INT REFERENCES Genres(id),
artist_id INT REFERENCES Artists(id),
PRIMARY KEY (genre_id, artist_id)
);

-- Альбомы артистов
CREATE TABLE IF NOT EXISTS Artist_albums(
album_id INT REFERENCES Albums(id),
artist_id INT REFERENCES Artists(id),
PRIMARY KEY (album_id, artist_id)
);

-- Песни в сборниках
CREATE TABLE IF NOT EXISTS Collection_tracks(
track_id INT REFERENCES Tracks(id),
collection_id INT REFERENCES Collections(id),
PRIMARY KEY (track_id, collection_id)
);
