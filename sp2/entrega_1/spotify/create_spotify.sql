CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `Spotify`.`Card_details` (
  `idCard` INT UNIQUE,
  `Card_no` INT NULL,
  `Expiry_date` DATE NULL,
  `CVV` INT(3) UNSIGNED NULL,
  PRIMARY KEY (`idCard`),
  UNIQUE INDEX `idCard_details_UNIQUE` (`idCard` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Subscriptions` (
  `idSubscription` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `payment_method` SET("Card", "PayPal") NULL,
  `idCard` INT NULL,
  `idPayPal` INT NULL,
  UNIQUE INDEX `idCard_UNIQUE` (`idCard` ASC) VISIBLE,
  UNIQUE INDEX `idPayPal_UNIQUE` (`idPayPal` ASC) VISIBLE,
  UNIQUE INDEX `idSubscription_UNIQUE` (`idSubscription` ASC) VISIBLE,
  CONSTRAINT `pay_by_card`
    FOREIGN KEY (`idCard`)
    REFERENCES `Spotify`.`Card_details` (`idCard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Past_payments` (
  `order_number` INT NOT NULL AUTO_INCREMENT,
  `idSubscription` INT NULL,
  `payment_method` SET("Card", "PayPal") NULL,
  `date` DATE NULL,
  `total` INT NULL,
  PRIMARY KEY (`order_number`),
  UNIQUE INDEX `idPast_payments_UNIQUE` (`order_number` ASC) VISIBLE,
  INDEX `subscription number_idx` (`idSubscription` ASC) VISIBLE,
  CONSTRAINT `subscription number`
    FOREIGN KEY (`idSubscription`)
    REFERENCES `Spotify`.`Subscriptions` (`idSubscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Users` (
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `gender` SET("M", "F", "X") NULL,
  `country` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `type` SET("Free", "Premium") NULL,
  `subscription_no` INT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `Subscription no_UNIQUE` (`subscription_no` ASC) VISIBLE,
  CONSTRAINT `user subscription number`
    FOREIGN KEY (`subscription_no`)
    REFERENCES `Spotify`.`Subscriptions` (`idSubscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Artists` (
  `idArtists` INT UNIQUE,
  `name` VARCHAR(45) NOT NULL,
  `picture` BLOB NULL,
  `related_artists` INT NULL,
  PRIMARY KEY (`idArtists`),
  UNIQUE INDEX `idArtists_UNIQUE` (`idArtists` ASC) VISIBLE,
  UNIQUE INDEX `related_artists_UNIQUE` (`related_artists` ASC) VISIBLE,
  CONSTRAINT `similar_artists`
    FOREIGN KEY (`related_artists`)
    REFERENCES `Spotify`.`Artists` (`idArtists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Following` (
  `idfollowing` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `idArtists` INT NULL,
  PRIMARY KEY (`idfollowing`),
  INDEX `username_idx` (`username` ASC) VISIBLE,
  INDEX `followed_artist_idx` (`idArtists` ASC) VISIBLE,
  CONSTRAINT `following_username`
    FOREIGN KEY (`username`)
    REFERENCES `Spotify`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `followed_artist`
    FOREIGN KEY (`idArtists`)
    REFERENCES `Spotify`.`Artists` (`idArtists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Albums` (
  `idAlbums` INT UNIQUE,
  `name` VARCHAR(45),
  `idArtist` INT NULL,
  `Year` INT(4) UNSIGNED NULL,
  `Cover` BLOB NULL,
  PRIMARY KEY (`idAlbums`),
  INDEX `album_artist_idx` (`idArtist` ASC) VISIBLE,
  UNIQUE INDEX `idAlbums_UNIQUE` (`idAlbums` ASC) VISIBLE,
  CONSTRAINT `album_artist`
    FOREIGN KEY (`idArtist`)
    REFERENCES `Spotify`.`Artists` (`idArtists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Songs` (
  `idSong` INT UNIQUE,
  `name` VARCHAR(45),
  `idArtist` INT NOT NULL,
  `idAlbum` INT NOT NULL,
  `length` INT NULL,
  `times_played` INT NULL,
  PRIMARY KEY (`idSong`),
  INDEX `song_artist_idx` (`idArtist` ASC) VISIBLE,
  INDEX `song_album_idx` (`idAlbum` ASC) VISIBLE,
  UNIQUE INDEX `idSong_UNIQUE` (`idSong` ASC) VISIBLE,
  CONSTRAINT `song_artist`
    FOREIGN KEY (`idArtist`)
    REFERENCES `Spotify`.`Artists` (`idArtists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `song_album`
    FOREIGN KEY (`idAlbum`)
    REFERENCES `Spotify`.`Albums` (`idAlbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Favourites` (
  `idFavourites` INT NOT NULL,
  `idSong` INT NULL,
  `idAlbum` INT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFavourites`),
  UNIQUE INDEX `idSong_UNIQUE` (`idSong` ASC) VISIBLE,
  UNIQUE INDEX `idAlbum_UNIQUE` (`idAlbum` ASC) VISIBLE,
  INDEX `added_by_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `favourite_song`
    FOREIGN KEY (`idSong`)
    REFERENCES `Spotify`.`Songs` (`idSong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `favourite_album`
    FOREIGN KEY (`idAlbum`)
    REFERENCES `Spotify`.`Albums` (`idAlbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `added_by`
    FOREIGN KEY (`username`)
    REFERENCES `Spotify`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Playlists` (
  `idPlaylist` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `created_on` DATE NULL,
  `created_by` VARCHAR(45) NULL,
  `status` SET("Active", "Inactive") NULL,
  PRIMARY KEY (`idPlaylist`),
  INDEX `playlist_author_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `playlist_author`
    FOREIGN KEY (`created_by`)
    REFERENCES `Spotify`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Spotify`.`Playlist_contents` (
  `idPlaylist_contents` INT NOT NULL,
  `idPlaylist` INT NOT NULL,
  `idSong` INT NOT NULL,
  `added_by` VARCHAR(45) NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`idPlaylist_contents`),
  INDEX `added_to_playlist_by_idx` (`added_by` ASC) VISIBLE,
  INDEX `playlist_referenced_idx` (`idPlaylist` ASC) VISIBLE,
  INDEX `songs_added_idx` (`idSong` ASC) VISIBLE,
  CONSTRAINT `added_to_playlist_by`
    FOREIGN KEY (`added_by`)
    REFERENCES `Spotify`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `playlist_referenced`
    FOREIGN KEY (`idPlaylist`)
    REFERENCES `Spotify`.`Playlists` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `songs_added`
    FOREIGN KEY (`idSong`)
    REFERENCES `Spotify`.`Songs` (`idSong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
