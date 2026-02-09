-- Paul Fralix CSD430 Assignment 5&6 - Working with CRUD-READ,JDBC, & JavaBeans
-- SQL script to create a database, a table, and insert records for movie data

-- Create the database
CREATE DATABASE IF NOT EXISTS CSD430;

-- Use the database
USE CSD430;

-- Create the table
CREATE TABLE paul_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    director VARCHAR(100),
    release_year INT,
    rating DECIMAL(2,1)
);

-- Insert records
INSERT INTO paul_movies_data (title, genre, director, release_year, rating) VALUES
('The Shawshank Redemption', 'Drama', 'Frank Darabont', 1994, 9.3),
('The Godfather', 'Crime', 'Francis Ford Coppola', 1972, 9.2),
('The Dark Knight', 'Action', 'Christopher Nolan', 2008, 9.0),
('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 8.9),
('Forrest Gump', 'Drama', 'Robert Zemeckis', 1994, 8.8),
('Inception', 'Sci-Fi', 'Christopher Nolan', 2010, 8.8),
('Fight Club', 'Drama', 'David Fincher', 1999, 8.8),
('Interstellar', 'Sci-Fi', 'Christopher Nolan', 2014, 8.7),
('The Matrix', 'Sci-Fi', 'Lana Wachowski', 1999, 8.7),
('Gladiator', 'Action', 'Ridley Scott', 2000, 8.5);
