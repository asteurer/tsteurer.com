CREATE TABLE memes (
    id SERIAL PRIMARY KEY,
    url TEXT NOT NULL UNIQUE
);