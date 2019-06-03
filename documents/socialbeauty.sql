DROP DATABASE IF EXISTS socialbeauty;
CREATE DATABASE IF NOT EXISTS socialbeauty;
USE socialbeauty;

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'S0C14LB34UTY';
GRANT ALL PRIVILEGES ON socialbeauty.* TO 'admin'@'localhost';

-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------
CREATE TABLE users (
	userId INT NOT NULL AUTO_INCREMENT,
	userName VARCHAR(80) UNIQUE NOT NULL,
	userEmail VARCHAR(80) UNIQUE NOT NULL,
	userPassword TEXT NOT NULL,
	PRIMARY KEY (userId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table profiles
-- -----------------------------------------------------
CREATE TABLE profiles (
	profileId INT NOT NULL AUTO_INCREMENT,
	profileName VARCHAR(80) NOT NULL,
	profileBirthDate VARCHAR(80) NOT NULL,
	profileLocation VARCHAR(80) NOT NULL,
	profileBio TEXT,
	profileWebsite VARCHAR(255),
	profilePicture VARCHAR(80) NOT NULL,
	userId INT,
	PRIMARY KEY (profileId),
	CONSTRAINT FK_UserProfile FOREIGN KEY (userId)
	REFERENCES users(userId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table articles
-- -----------------------------------------------------
CREATE TABLE articles (
	articleId INT NOT NULL AUTO_INCREMENT,
	articleTitle VARCHAR(255) NOT NULL,
	articleAuthor VARCHAR(80) NOT NULL,
	articleCategory VARCHAR(80) NOT NULL,
	articleContent TEXT NOT NULL,
	articleAddDate VARCHAR(80) NOT NULL,
	PRIMARY KEY (articleId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table articlecomments
-- -----------------------------------------------------
CREATE TABLE articlecomments (
	artcommentId INT NOT NULL AUTO_INCREMENT,
	artcommentAuthor VARCHAR(80) NOT NULL,
	artcommentContent TEXT NOT NULL,
	artcommentAddDate VARCHAR(80) NOT NULL,
	articleId INT NOT NULL,
	PRIMARY KEY (artcommentId),
	CONSTRAINT FK_ArticleComment FOREIGN KEY (articleId)
	REFERENCES articles(articleId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table articlemedias
-- -----------------------------------------------------
CREATE TABLE articlemedias (
	artmediaId INT NOT NULL AUTO_INCREMENT,
	artmediaFileName VARCHAR(80) UNIQUE NOT NULL,
	artmediaDate VARCHAR(80) NOT NULL,
	articleId INT NOT NULL,
	PRIMARY KEY (artmediaId),
	CONSTRAINT FK_ArticleMedia FOREIGN KEY (articleId)
	REFERENCES articles(articleId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table gallery
-- -----------------------------------------------------
CREATE TABLE galleries (
	galleryId INT NOT NULL AUTO_INCREMENT,
	galleryAuthor VARCHAR(80) NOT NULL,
	galleryCategory VARCHAR(80) NOT NULL,
	galleryAddDate VARCHAR(80) NOT NULL,
	galleryDescription TEXT,
	PRIMARY KEY (galleryId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table gallerycomments
-- -----------------------------------------------------
CREATE TABLE gallerycomments (
	gallcommentId INT NOT NULL AUTO_INCREMENT,
	gallcommentAuthor VARCHAR(80) NOT NULL,
	gallcommentContent TEXT NOT NULL,
	gallcommentAddDate VARCHAR(80) NOT NULL,
	galleryId INT NOT NULL,
	PRIMARY KEY (gallcommentId),
	CONSTRAINT FK_GalleryComment FOREIGN KEY (galleryId)
	REFERENCES galleries(galleryId)
	)
Engine = InnoDB;

-- -----------------------------------------------------
-- Table gallerymedias
-- -----------------------------------------------------
CREATE TABLE gallerymedias (
	gallmediaId INT NOT NULL AUTO_INCREMENT,
	gallmediaFileName VARCHAR(80) UNIQUE NOT NULL,
	gallmediaDate VARCHAR(80) NOT NULL,
	galleryId INT NOT NULL,
	PRIMARY KEY (gallmediaId),
	CONSTRAINT FK_GalleryMedia FOREIGN KEY (galleryId)
	REFERENCES galleries(galleryId)
	)
Engine = InnoDB;










