DROP DATABASE IF EXISTS `youtube`;

CREATE SCHEMA `youtube` DEFAULT CHARACTER SET utf8;

CREATE TABLE
    `YouTube`.`Users` (
        `username` VARCHAR(45) NOT NULL,
        `password` VARCHAR(45) NOT NULL,
        `email` VARCHAR(45) NOT NULL,
        `date_of_birth` DATE NULL,
        `gender` SET("M", "F", "X") NULL,
        `country` VARCHAR(25) NULL,
        `postcode` VARCHAR(45) NULL,
        PRIMARY KEY (`username`)
    );

CREATE TABLE
    `YouTube`.`Channels` (
        `idChannel` INT NOT NULL,
        `name` VARCHAR(45) NULL,
        `description` VARCHAR(140) NULL,
        `since` DATE NULL,
        `created_by` VARCHAR(45) NULL,
        PRIMARY KEY (`idChannel`),
        INDEX `username_idx` (`created_by` ASC) VISIBLE,
        CONSTRAINT `channeluser` FOREIGN KEY (`created_by`) REFERENCES `YouTube`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE
    `YouTube`.`Subscriptions` (
        `idSubscription` INT NOT NULL,
        `username` VARCHAR(45) NULL,
        `channel` INT NULL,
        PRIMARY KEY (`idSubscription`),
        INDEX `username_idx` (`username` ASC) VISIBLE,
        INDEX `channel_idx` (`channel` ASC) VISIBLE,
        CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `YouTube`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `channel` FOREIGN KEY (`channel`) REFERENCES `YouTube`.`Channels` (`idChannel`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Videos` (
        `idVideo` BIGINT UNIQUE,
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
        CONSTRAINT `published_by` FOREIGN KEY (`published_by`) REFERENCES `YouTube`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Comments` (
        `idComment` INT UNIQUE,
        `idVideo` BIGINT NULL,
        `content` VARCHAR(120) NULL,
        `date` DATE NULL,
        `written_by` VARCHAR(45) NULL,
        PRIMARY KEY (`idComment`),
        INDEX `username_idx` (`written_by` ASC) VISIBLE,
        INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
        CONSTRAINT `written_by` FOREIGN KEY (`written_by`) REFERENCES `YouTube`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `commented_video` FOREIGN KEY (`idVideo`) REFERENCES `YouTube`.`Videos` (`idVideo`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Likes` (
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
        INDEX `comment_idx` (`idComment` ASC) VISIBLE,
        CONSTRAINT `idVideo` FOREIGN KEY (`idVideo`) REFERENCES `YouTube`.`Videos` (`idVideo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `like_by` FOREIGN KEY (`username`) REFERENCES `YouTube`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `comment` FOREIGN KEY (`idComment`) REFERENCES `YouTube`.`Comments` (`idComment`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Playlists` (
        `idPlaylist` INT NOT NULL,
        `name` VARCHAR(45) NULL,
        `created_on` DATE NULL,
        `status` SET("Public", "Private") NULL,
        `created_by` VARCHAR(45) NULL,
        PRIMARY KEY (`idPlaylist`),
        INDEX `username_idx` (`created_by` ASC) VISIBLE,
        CONSTRAINT `created_by` FOREIGN KEY (`created_by`) REFERENCES `YouTube`.`Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Playlist_contents` (
        `idPlaylist_content` INT NOT NULL,
        `idPlaylist` INT NULL,
        `idVideo` BIGINT NULL,
        PRIMARY KEY (`idPlaylist_content`),
        INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
        INDEX `idPlaylist_idx` (`idPlaylist` ASC) VISIBLE,
        CONSTRAINT `included_video` FOREIGN KEY (`idVideo`) REFERENCES `YouTube`.`Videos` (`idVideo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (`idPlaylist`) REFERENCES `YouTube`.`Playlists` (`idPlaylist`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Tags` (
        `idTag` INT NOT NULL,
        `tag_name` VARCHAR(45) NULL,
        `idVideo` BIGINT NULL,
        PRIMARY KEY (`idTag`),
        INDEX `idVideos_idx` (`idVideo` ASC) VISIBLE,
        CONSTRAINT `idVideos` FOREIGN KEY (`idVideo`) REFERENCES `YouTube`.`Videos` (`idVideo`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `YouTube`.`Channel_contents` (
        `idChannel_contents` INT NOT NULL,
        `idChannel` INT NULL,
        `idVideo` BIGINT NULL,
        PRIMARY KEY (`idChannel_contents`),
        INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
        INDEX `Channel_idx` (`idChannel` ASC) VISIBLE,
        CONSTRAINT `Channel videos` FOREIGN KEY (`idVideo`) REFERENCES `YouTube`.`Videos` (`idVideo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `ChannelContents` FOREIGN KEY (`idChannel`) REFERENCES `YouTube`.`Channels` (`idChannel`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

INSERT INTO youtube.users
VALUES (
        "queen_elisabeth",
        "dieu_et_mon_droit",
        "ellie@buckingham.co.uk",
        "1926-04-21",
        "F",
        "United Kingdom",
        "SW1A 1AA"
    ), (
        "coletas_pablo",
        "PODEMOS",
        "piglesiasturrion@universidad.es",
        "1978-10-17",
        "M",
        "Spain",
        "28031"
    ), (
        "aYusItaMaddrizz",
        "pecas_el_perro",
        "isabelayuso@comunidaddemadrid.es",
        "1978-10-17",
        "F",
        "Spain",
        "28001"
    ), (
        "pamangoelmio",
        "motosmotos",
        "isacifu@email.es",
        "1964-07-01",
        "F",
        "Spain",
        "28001"
    );

SELECT * FROM youtube.users;

INSERT INTO youtube.videos
VALUES (
        1,
        "Yo de pinchos en pandemia",
        "Madrid siempre contra el comunismo",
        15687,
        "bar_manolo",
        165,
        2,
        "Public",
        "aYusItaMaddrizz",
        "2020-05-22"
    ), (
        2,
        "Yo y mis cremitas pal pelo",
        "Este supermercado es baratísimo",
        190007,
        "no_publicar_peligro",
        244,
        7890,
        "Hidden",
        "pamangoelmio",
        "2020-05-22"
    ), (
        3,
        "Dialéctica Kantiana de la coleta",
        "Exposición eterna sobre por qué me necesitáis, nunca me equivoqué y me rogaréis que vuelva cuando os deis cuenta de vuestro error",
        8954878,
        "horatoria",
        370,
        0,
        "Public",
        "coletas_pablo",
        "2022-01-26"
    ), (
        4,
        "España es Madrid",
        "Ya lo sabías. Y muerte al comunismo",
        1489,
        "ole_y_ole",
        199,
        320,
        "Public",
        "aYusItaMaddrizz",
        "2021-03-15"
    ), (
        5,
        "Mascarillas para todos",
        "No es corrupción porque las comprara mi hermano, ¡malpensados!",
        630,
        "buena_tajada",
        263,
        890,
        "Public",
        "aYusItaMaddrizz",
        "2022-08-09"
    );

SELECT * FROM youtube.videos;

INSERT INTO youtube.channels
VALUES (
        1,
        "Dead but not gone",
        "Royal news from beyond the grave",
        "2022-09-08",
        "queen_elisabeth"
    ), (
        2,
        "ElTornillo",
        "Entrevistas con agenda",
        "2008-07-05",
        "coletas_pablo"
    );

SELECT * FROM youtube.channels;

INSERT INTO youtube.`channel_contents` VALUES (1, 2, 3);

SELECT * FROM youtube.`channel_contents`;

INSERT INTO
    youtube.subscriptions
VALUES (1, "aYusItaMaddrizz", 1), (2, "aYusItaMaddrizz", 1), (3, "coletas_pablo", 1), (4, "pamangoelmio", 1);

SELECT * FROM youtube.subscriptions;

INSERT INTO youtube.comments
VALUES (
        1,
        5,
        "¡Ladrona!",
        "2022-08-09",
        "coletas_pablo"
    ), (
        2,
        3,
        "Rojo flipao",
        "2022-08-09",
        "aYusItaMaddrizz"
    );

SELECT * FROM youtube.`channel_contents`;

INSERT INTO youtube.likes
VALUES (
        1,
        "pamangoelmio",
        1,
        null,
        "Yes",
        "No",
        "2020-05-22"
    ), (
        2,
        "aYusItaMaddrizz",
        3,
        null,
        "No",
        "Yes",
        "2022-01-26"
    ), (
        3,
        "pamangoelmio",
        null,
        1,
        "No",
        "Yes",
        "2022-08-09"
    ), (
        4,
        "pamangoelmio",
        null,
        2,
        "Yes",
        "No",
        "2022-08-09"
    );

SELECT * FROM youtube.likes;

INSERT INTO youtube.tags
VALUES (1, "canyas", 1), (2, "mascarillas", 2), (3, "madrid", 1), (4, "pelo", 3), (5, "mascarillas", 5), (6, "pelo", 2);

SELECT * FROM youtube.tags;

INSERT INTO youtube.playlists
VALUES (
        1,
        "random_stuff",
        "2023-01-25",
        "Private",
        "queen_elisabeth"
    ), (
        2,
        "cosas",
        "2023-01-27",
        "Public",
        "pamangoelmio"
    );

SELECT * FROM youtube.playlists;

INSERT INTO
    youtube.playlist_contents
VALUES (1, 1, 1), (2, 2, 1), (3, 1, 2), (4, 1, 4), (5, 1, 5), (6, 2, 5);

SELECT * FROM youtube.playlist_contents;