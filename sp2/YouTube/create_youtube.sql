CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `YouTube`.`Users` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NULL,
  `gender` SET("M", "F", "X") NULL,
  `Country` VARCHAR(25) NULL,
  `Postcode` VARCHAR(45) NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Channels` (
  `idChannel` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(140) NULL,
  `since` DATE NULL,
  `created_by` VARCHAR(45) NULL,
  PRIMARY KEY (`idChannel`),
  INDEX `username_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `channeluser`
    FOREIGN KEY (`created_by`)
    REFERENCES `YouTube`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Subscriptions` (
  `idSubscription` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `channel` INT NULL,
  PRIMARY KEY (`idSubscription`),
  INDEX `username_idx` (`username` ASC) VISIBLE,
  INDEX `channel_idx` (`channel` ASC) VISIBLE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `YouTube`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `channel`
    FOREIGN KEY (`channel`)
    REFERENCES `YouTube`.`Channels` (`idChannel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Videos` (
  `idVideo` BIGINT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(140) NULL,
  `size` INT NULL,
  `file_name` VARCHAR(45) NULL,
  `legth` INT NULL,
  `times_played` INT NULL,
  `status` SET("Public", "Hidden", "Private") NULL,
  `published_by` VARCHAR(45) NULL,
  `published_on` DATE NULL,
  PRIMARY KEY (`idVideo`),
  INDEX `username_idx` (`published_by` ASC) VISIBLE,
  CONSTRAINT `published_by`
    FOREIGN KEY (`published_by`)
    REFERENCES `YouTube`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Likes` (
  `idLike` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `idVideo` BIGINT NULL,
  `idComment` INT NULL,
  `liked` SET("Yes", "No") NULL,
  `disliked` SET("Yes", "No") NULL,
  `date` DATE NULL,
  PRIMARY KEY (`idLike`),
  INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
  INDEX `username_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `idVideo`
    FOREIGN KEY (`idVideo`)
    REFERENCES `YouTube`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `liked_by`
    FOREIGN KEY (`username`)
    REFERENCES `YouTube`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Comments` (
  `idComment` INT NOT NULL,
  `idVideo` BIGINT NULL,
  `content` VARCHAR(120) NULL,
  `date` DATE NULL,
  `written_by` VARCHAR(45) NULL,
  PRIMARY KEY (`idComment`),
  INDEX `username_idx` (`written_by` ASC) VISIBLE,
  INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
  CONSTRAINT `written_by`
    FOREIGN KEY (`written_by`)
    REFERENCES `YouTube`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `commented_video`
    FOREIGN KEY (`idVideo`)
    REFERENCES `YouTube`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Playlists` (
  `idPlaylist` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `created_on` DATE NULL,
  `status` SET("Public", "Private") NULL,
  `created_by` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlaylist`),
  INDEX `username_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `YouTube`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Playlist_contents` (
  `idPlaylist_content` INT NOT NULL,
  `idPlaylist` INT NULL,
  `idVideo` BIGINT NULL,
  PRIMARY KEY (`idPlaylist_content`),
  INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
  INDEX `idPlaylist_idx` (`idPlaylist` ASC) VISIBLE,
  CONSTRAINT `included_video`
    FOREIGN KEY (`idVideo`)
    REFERENCES `YouTube`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPlaylist`
    FOREIGN KEY (`idPlaylist`)
    REFERENCES `YouTube`.`Playlists` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YouTube`.`Tags` (
  `tag_name` VARCHAR(45) NOT NULL,
  `idVideo` BIGINT NULL,
  PRIMARY KEY (`tag_name`),
  INDEX `idVideos_idx` (`idVideo` ASC) VISIBLE,
  CONSTRAINT `tagged_video`
    FOREIGN KEY (`idVideo`)
    REFERENCES `YouTube`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;