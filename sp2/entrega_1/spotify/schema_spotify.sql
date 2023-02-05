DROP DATABASE IF EXISTS `Spotify`;

CREATE SCHEMA `spotify` DEFAULT CHARACTER SET utf8;

CREATE TABLE
    `Spotify`.`Card_details` (
        `idCard` INT UNIQUE,
        `Card_no` INT NULL,
        `Expiry_date` DATE NULL,
        `CVV` INT(3) UNSIGNED NULL,
        PRIMARY KEY (`idCard`),
        UNIQUE INDEX `idCard_details_UNIQUE` (`idCard` ASC) VISIBLE
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Subscriptions` (
        `idSubscription` INT NULL,
        `start_date` DATE NULL,
        `end_date` DATE NULL,
        `payment_method` SET("Card", "PayPal") NULL,
        `idCard` INT NULL,
        `idPayPal` INT NULL,
        UNIQUE INDEX `idCard_UNIQUE` (`idCard` ASC) VISIBLE,
        UNIQUE INDEX `idPayPal_UNIQUE` (`idPayPal` ASC) VISIBLE,
        UNIQUE INDEX `idSubscription_UNIQUE` (`idSubscription` ASC) VISIBLE,
        CONSTRAINT `pay_by_card` FOREIGN KEY (`idCard`) REFERENCES `Spotify`.`Card_details` (`idCard`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Past_payments` (
        `order_number` INT NOT NULL AUTO_INCREMENT,
        `idSubscription` INT NULL,
        `payment_method` SET("Card", "PayPal") NULL,
        `date` DATE NULL,
        `total` INT NULL,
        PRIMARY KEY (`order_number`),
        UNIQUE INDEX `idPast_payments_UNIQUE` (`order_number` ASC) VISIBLE,
        INDEX `subscription number_idx` (`idSubscription` ASC) VISIBLE,
        CONSTRAINT `subscription number` FOREIGN KEY (`idSubscription`) REFERENCES `Spotify`.`Subscriptions` (`idSubscription`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Users` (
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
        CONSTRAINT `user subscription number` FOREIGN KEY (`subscription_no`) REFERENCES `Spotify`.`Subscriptions` (`idSubscription`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Artists` (
        `idArtists` INT UNIQUE,
        `name` VARCHAR(45) NOT NULL,
        `picture` BLOB NULL,
        `related_artists` INT NULL,
        PRIMARY KEY (`idArtists`),
        UNIQUE INDEX `idArtists_UNIQUE` (`idArtists` ASC) VISIBLE,
        UNIQUE INDEX `related_artists_UNIQUE` (`related_artists` ASC) VISIBLE,
        CONSTRAINT `similar_artists` FOREIGN KEY (`related_artists`) REFERENCES `Spotify`.`Artists` (`idArtists`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Following` (
        `idfollowing` INT NOT NULL,
        `username` VARCHAR(45) NULL,
        `idArtists` INT NULL,
        PRIMARY KEY (`idfollowing`),
        INDEX `username_idx` (`username` ASC) VISIBLE,
        INDEX `followed_artist_idx` (`idArtists` ASC) VISIBLE,
        CONSTRAINT `following_username` FOREIGN KEY (`username`) REFERENCES `Spotify`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `followed_artist` FOREIGN KEY (`idArtists`) REFERENCES `Spotify`.`Artists` (`idArtists`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Albums` (
        `idAlbums` INT UNIQUE,
        `name` VARCHAR(45),
        `idArtist` INT NULL,
        `Year` INT(4) UNSIGNED NULL,
        `Cover` BLOB NULL,
        PRIMARY KEY (`idAlbums`),
        INDEX `album_artist_idx` (`idArtist` ASC) VISIBLE,
        UNIQUE INDEX `idAlbums_UNIQUE` (`idAlbums` ASC) VISIBLE,
        CONSTRAINT `album_artist` FOREIGN KEY (`idArtist`) REFERENCES `Spotify`.`Artists` (`idArtists`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Songs` (
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
        CONSTRAINT `song_artist` FOREIGN KEY (`idArtist`) REFERENCES `Spotify`.`Artists` (`idArtists`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `song_album` FOREIGN KEY (`idAlbum`) REFERENCES `Spotify`.`Albums` (`idAlbums`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Favourites` (
        `idFavourites` INT NOT NULL,
        `idSong` INT NULL,
        `idAlbum` INT NULL,
        `username` VARCHAR(45) NOT NULL,
        PRIMARY KEY (`idFavourites`),
        UNIQUE INDEX `idSong_UNIQUE` (`idSong` ASC) VISIBLE,
        UNIQUE INDEX `idAlbum_UNIQUE` (`idAlbum` ASC) VISIBLE,
        INDEX `added_by_idx` (`username` ASC) VISIBLE,
        CONSTRAINT `favourite_song` FOREIGN KEY (`idSong`) REFERENCES `Spotify`.`Songs` (`idSong`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `favourite_album` FOREIGN KEY (`idAlbum`) REFERENCES `Spotify`.`Albums` (`idAlbums`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `added_by` FOREIGN KEY (`username`) REFERENCES `Spotify`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Playlists` (
        `idPlaylist` INT NOT NULL,
        `name` VARCHAR(45) NULL,
        `created_on` DATE NULL,
        `created_by` VARCHAR(45) NULL,
        `status` SET("Active", "Inactive") NULL,
        PRIMARY KEY (`idPlaylist`),
        INDEX `playlist_author_idx` (`created_by` ASC) VISIBLE,
        CONSTRAINT `playlist_author` FOREIGN KEY (`created_by`) REFERENCES `Spotify`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Spotify`.`Playlist_contents` (
        `idPlaylist_contents` INT NOT NULL,
        `idPlaylist` INT NOT NULL,
        `idSong` INT NOT NULL,
        `added_by` VARCHAR(45) NOT NULL,
        `date` DATE NULL,
        PRIMARY KEY (`idPlaylist_contents`),
        INDEX `added_to_playlist_by_idx` (`added_by` ASC) VISIBLE,
        INDEX `playlist_referenced_idx` (`idPlaylist` ASC) VISIBLE,
        INDEX `songs_added_idx` (`idSong` ASC) VISIBLE,
        CONSTRAINT `added_to_playlist_by` FOREIGN KEY (`added_by`) REFERENCES `Spotify`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `playlist_referenced` FOREIGN KEY (`idPlaylist`) REFERENCES `Spotify`.`Playlists` (`idPlaylist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `songs_added` FOREIGN KEY (`idSong`) REFERENCES `Spotify`.`Songs` (`idSong`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

INSERT INTO
    spotify.card_details
VALUES (1, 487863678, "2024-01-30", 666), (2, 123456789, "2025-01-01", 998);

INSERT INTO
    spotify.subscriptions
VALUES (
        1,
        "2023-01-15",
        "2023-02-15",
        "Card",
        1,
        NULL
    ), (
        2,
        "2023-01-20",
        "2023-02-20",
        "PayPal",
        NULL,
        12345678
    ), (
        3,
        "2023-01-28",
        "2023-02-28",
        "Card",
        2,
        NULL
    );

INSERT INTO
    spotify.past_payments
VALUES (1, 1, "Card", "2022-12-15", 9.95), (2, 1, "Card", "2023-01-15", 9.95), (
        3,
        2,
        "PayPal",
        "2023-01-20",
        9.95
    ), (4, 3, "Card", "2023-01-28", 9.95);

INSERT INTO spotify.users
VALUES (
        "juani",
        "juaniperez@email.com",
        "1234",
        "1980-07-03",
        "F",
        "Spain",
        "22191",
        "Free",
        NULL
    ), (
        "pepe",
        "pepevazquez@email.com",
        "2345",
        "1985-01-02",
        "M",
        "Spain",
        "15009",
        "Premium",
        1
    ), (
        "eritreo",
        "pacogarcia@email.com",
        "5555",
        "1995-05-20",
        "M",
        "Spain",
        "18008",
        "Premium",
        2
    ), (
        "albita",
        "albarodriguez@email.com",
        "9876",
        "1999-12-31",
        "F",
        "Spain",
        "37002",
        "Premium",
        3
    ), (
        "pierrot",
        "pierrelegrand@email.com",
        "7777",
        "1983-10-08",
        "M",
        "France",
        "31100",
        "Free",
        NULL
    );

INSERT INTO spotify.artists
VALUES (1, "Charanga", "IMAGEN", NULL), (2, "Bananarama", "IMAGEN", NULL), (3, "Covers covers", "IMAGEN", 1);

UPDATE spotify.artists SET `related_artists`=3 WHERE idArtists =1;

INSERT INTO spotify.following
VALUES (1, "pierrot", 3), (2, "pierrot", 1), (3, "pepe", 2);

INSERT INTO spotify.albums
VALUES (
        1,
        "Éxitos charangueros",
        1,
        2011,
        "cover_image"
    ), (
        2,
        "Fruity",
        2,
        1978,
        "cover_image"
    ), (
        3,
        "Éxitos de ayer y hoy",
        3,
        2015,
        "cover_image"
    ), (
        4,
        "Más éxitos charangueros",
        1,
        2018,
        "cover_image"
    );

INSERT INTO spotify.songs
VALUES (
        1,
        "Paquito el chocolatero",
        1,
        1,
        170,
        25
    ), (
        2,
        "Pintxo de tortilla",
        1,
        1,
        154,
        36
    ), (
        3,
        "Bragas amarillas",
        1,
        1,
        123,
        31
    ), (4, "Blueberries", 2, 2, 189, 68), (5, "Plums", 2, 2, 210, 24), (6, "Peaches", 2, 2, 300, 12), (
        7,
        "Final countdown de Europe",
        3,
        3,
        230,
        98
    ), (
        8,
        "Highway to Hell de los ACDC",
        3,
        3,
        280,
        63
    ), (
        9,
        "A la pared my senyor",
        1,
        4,
        134,
        94
    ), (
        10,
        "Me han dicho que te diga",
        1,
        4,
        154,
        123
    );

INSERT INTO spotify.favourites
VALUES (1, 1, NULL, "pierrot"), (2, 9, NULL, "pierrot"), (3, 3, NULL, "pierrot"), (4, NULL, 2, "albita");

INSERT INTO spotify.playlists
VALUES (
        1,
        "Pachangueo del güeno",
        "2023-01-16",
        "juani",
        "Active"
    ), (
        2,
        "Cositas",
        "2023-01-28",
        "eritreo",
        "Inactive"
    );

INSERT INTO
    spotify.playlist_contents
VALUES (1, 1, 2, "juani", "2023-01-16"), (2, 1, 7, "juani", "2023-01-16"), (3, 1, 3, "juani", "2023-01-16"), (4, 1, 9, "juani", "2023-01-22"), (5, 2, 5, "eritreo", "2023-01-28");