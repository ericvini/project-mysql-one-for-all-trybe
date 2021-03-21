DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `paymentplans`(
    `PaymentPlanID`INT PRIMARY KEY AUTO_INCREMENT,
    `PaymentPlanName` VARCHAR(255) NOT NULL,
    `PaymentPlanPrice`DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE `users`(
    `UserID`INT PRIMARY KEY AUTO_INCREMENT,
    `UserName` VARCHAR(255) NOT NULL,
    `UserAge` INT NOT NULL,
    `PaymentPlanID`INT NOT NULL,
    CONSTRAINT `fk_users_PaymentPlans`
    FOREIGN KEY(`PaymentPlanID`)
        REFERENCES `paymentplans`(`PaymentPlanID`)        
) engine = InnoDB;
CREATE TABLE `artists`(
    `ArtistID`INT PRIMARY KEY AUTO_INCREMENT,
    `ArtistName` VARCHAR(255) NOT NULL
) engine = InnoDB;

CREATE TABLE `albums`(
    `AlbumID`INT PRIMARY KEY AUTO_INCREMENT,
    `AlbumName`VARCHAR(255) NOT NULL,
    `ArtistID`INT NOT NULL,
    CONSTRAINT `fk_albums_artists`
    FOREIGN KEY(`ArtistID`)
        REFERENCES `artists`(`ArtistID`)    
) engine = InnoDB;

CREATE TABLE `songs`(
    `SongID` INT PRIMARY KEY AUTO_INCREMENT,
    `SongName`VARCHAR(255) NOT NULL,
    `AlbumID`INT NOT NULL,
    CONSTRAINT `fk_songs_albums`
    FOREIGN KEY(`AlbumID`)
        REFERENCES `albums`(`AlbumID`)    
) engine = InnoDB;



CREATE TABLE `followartists`(
    `UserID`INT NOT NULL,
    `ArtistID` INT NOT NULL,
    PRIMARY KEY (`UserID`, `ArtistID`),
    CONSTRAINT `fk_follow_users`
    FOREIGN KEY(`UserID`)
    REFERENCES `users`(`UserID`),
    CONSTRAINT `fk_follow_artists`
    FOREIGN KEY(`ArtistID`)
    REFERENCES `artists`(`ArtistID`)    
) engine = InnoDB;

CREATE TABLE `histsongs`(
    `UserID`INT NOT NULL,
    `SongID` INT NOT NULL,
    PRIMARY KEY (`UserID`, `SongID`),
    CONSTRAINT `fk_hist_users`
    FOREIGN KEY(`UserID`)
    REFERENCES `users`(`UserID`),
    CONSTRAINT `fk_hist_songs`
    FOREIGN KEY(`SongID`)
    REFERENCES `songs`(`SongID`)
) engine = InnoDB;

INSERT INTO `paymentplans` (`PaymentPlanName`, `PaymentPlanPrice`) VALUES 
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO `users` (`UserName`, `UserAge`, `PaymentPlanID`) VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO `artists` (`ArtistName`) VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO `albums` (`AlbumName`, `ArtistID`) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO `songs` (`SongName`, `AlbumID`) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO `followartists` ( `UserID`, `ArtistID`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO `histsongs` (`UserID`, `SongID`) VALUES 
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
