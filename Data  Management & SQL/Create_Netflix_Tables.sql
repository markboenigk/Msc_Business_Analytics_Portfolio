
USE l_netflix;
CREATE TABLE IF NOT EXISTS ratings (
	rating_id int NOT NULL ,
    rating_code varchar(5) NULL,
    disclaimer varchar(255) NULL,
    PRIMARY KEY(rating_id)
	); 

CREATE TABLE IF NOT EXISTS shows_types (
	show_type_id int,
    shwo_type_code varchar(5),
    show_type varchar(100));
    
CREATE TABLE IF NOT EXISTS genres (
	genre_id int NOT NULL,
    genre_code varchar(5),
    genre varchar(100),
    PRIMARY KEY(genre_id));
    
CREATE TABLE IF NOT EXISTS show_genres (
	show_type_id int NOT NULL,
    show_type_code varchar(5),
    show_type varchar(100),
    PRIMARY KEY(show_type_id));
    
CREATE TABLE IF NOT EXISTS countries (
	country_id int NOT NULL,
    country_code varchar(5),
    country varchar(100),
    PRIMARY KEY(country_id));

CREATE TABLE IF NOT EXISTS show_countries (
	show_id int,
    country_id int);
    
CREATE TABLE IF NOT EXISTS roles (
	role_id int NOT NULL,
    role_code varchar(5),
    role varchar(100),
    PRIMARY KEY(role_id));

CREATE TABLE IF NOT EXISTS artists (
	artist_id int NOT NULL,
    artist_name varchar(255),
    PRIMARY KEY(artist_id));
    
CREATE TABLE IF NOT EXISTS shows_artists_roles (
	show_id int,
    role_id int,
    arist_id int);

CREATE TABLE IF NOT EXISTS shows (
	show_id int,
    show_type_id int,
    rating_id int,
    show_title varchar(255),
    date_added datetime,
    release_year int,
    desription varchar(255),
    PRIMARY KEY(show_id)
    
    );

