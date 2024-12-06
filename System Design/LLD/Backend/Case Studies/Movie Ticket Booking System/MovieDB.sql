
CREATE DATABASE movieDB;

USE movieDB;

CREATE TABLE movie (
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(20),
    release_date DATE,
    duration TIME
);

INSERT INTO movie (title, genre, release_date, duration)
VALUES
	('Inception', 'Sci-Fi', '2010-07-16', '02:28:00'),
    ('The Shawshank Redemption', 'Drama', '1994-09-23', '02:22:00'),
    ('The Dark Knight', 'Action', '2008-07-18', '02:32:00'),
    ('Forrest Gump', 'Drama', '1994-07-06', '02:22:00'),
    ('Interstellar', 'Sci-Fi', '2014-11-07', '02:49:00'),
    ('The Godfather', 'Crime', '1972-03-24', '02:55:00'),
    ('Pulp Fiction', 'Crime', '1994-10-14', '02:34:00'),
    ('The Matrix', 'Sci-Fi', '1999-03-31', '02:16:00'),
    ('Avengers: Endgame', 'Action', '2019-04-26', '03:01:00'),
    ('Titanic', 'Romance', '1997-12-19', '03:14:00');
    
SELECT * FROM movie;

CREATE TABLE theatre (
	theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    postal_code VARCHAR(10)
);

INSERT INTO theatre (street, city, state, country, postal_code) 
VALUES
	('1234 Broadway St', 'New York', 'NY', 'USA', '10001'),
    ('5678 Sunset Blvd', 'Los Angeles', 'CA', 'USA', '90001'),
    ('9 Elm Street', 'Chicago', 'IL', 'USA', '60601');
    
SELECT * FROM theatre;

CREATE TABLE screen (
	screen_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_name VARCHAR(20) NOT NULL,
    theatre_id INT NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES theatre (theatre_id) ON DELETE CASCADE
);

INSERT INTO screen (screen_name, theatre_id) 
VALUES 
		('A', 1),
        ('B', 1),
        ('A', 2),
        ('A', 3),
        ('B', 3);
        
SELECT * FROM screen;

CREATE TABLE movie_show (
	show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    theatre_id INT NOT NULL,
    screen_id INT NOT NULL,
    show_time TIME NULL,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE,
    FOREIGN KEY (theatre_id) REFERENCES theatre (theatre_id) ON DELETE CASCADE,
    FOREIGN KEY (screen_id) REFERENCES screen (screen_id) ON DELETE CASCADE
);

INSERT INTO movie_show (movie_id, theatre_id, screen_id, show_time)
VALUES 
	(1, 1, 1, '10:00:00'),
    (1, 2, 3, '10:00:00'), 
    (2, 2, 3, '14:00:00'),
    (3, 1, 1, '05:00:00');
    
SELECT * FROM movie_show;
