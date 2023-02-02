DROP DATABASE IF EXISTS `Ulleres_cul_ampolla`;

CREATE SCHEMA `Ulleres_cul_ampolla` DEFAULT CHARACTER SET utf8;

CREATE TABLE
    `Ulleres_cul_ampolla`.`Customers` (
        `idCustomer` SMALLINT UNSIGNED NOT NULL,
        `Full name` VARCHAR(45) NULL,
        `Address` VARCHAR(45) NULL,
        `Postcode` VARCHAR(45) NULL,
        `Town` VARCHAR(45) NULL,
        `Phone no` VARCHAR(45) NULL,
        `Email` VARCHAR(45) NULL,
        `Sign-up date` VARCHAR(45) NULL,
        `Referred by` VARCHAR(45) NULL,
        PRIMARY KEY (`idCustomer`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `Ulleres_cul_ampolla`.`Suppliers` (
        `idSuppliers` INT NOT NULL AUTO_INCREMENT,
        `Supplier name` VARCHAR(45) NULL,
        `Address` VARCHAR(45) NULL,
        `Telephone no.` INT NULL,
        `Fax` INT NULL,
        `NIF` VARCHAR(45) NULL,
        PRIMARY KEY (`idSuppliers`),
        UNIQUE INDEX `idSuppliers_UNIQUE` (`idSuppliers` ASC) VISIBLE
    ) ENGINE = InnoDB;

CREATE TABLE
    `Ulleres_cul_ampolla`.`Brand suppliers` (
        `Brand` VARCHAR(45) NOT NULL,
        `idSuppliers` INT NULL,
        PRIMARY KEY (`Brand`),
        INDEX `idSuppliers_idx` (`idSuppliers` ASC) VISIBLE,
        CONSTRAINT `idSuppliers` FOREIGN KEY (`idSuppliers`) REFERENCES `Ulleres_cul_ampolla`.`Suppliers` (`idSuppliers`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Ulleres_cul_ampolla`.`Glasses` (
        `idGlasses` SMALLINT UNSIGNED NOT NULL,
        `Brand` VARCHAR(45) NULL,
        `Frame type` SET('Wire', 'Thick', 'Rimless') NULL,
        `Graduation Left` DECIMAL(4, 2) NULL,
        `Graduation Right` DECIMAL(4, 2) NULL,
        `Frame colour` VARCHAR(45) NULL,
        `Glass colour` VARCHAR(45) NULL,
        `Price` DECIMAL(6, 2) NULL,
        PRIMARY KEY (`idGlasses`),
        INDEX `Brand_idx` (`Brand` ASC) VISIBLE,
        CONSTRAINT `Brand` FOREIGN KEY (`Brand`) REFERENCES `Ulleres_cul_ampolla`.`Brand suppliers` (`Brand`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE
    `Ulleres_cul_ampolla`.`Sales` (
        `Sale no` INT NOT NULL AUTO_INCREMENT,
        `Date` DATE NOT NULL,
        `idCustomer` SMALLINT UNSIGNED NULL,
        `idGlasses` SMALLINT UNSIGNED NULL,
        `Sold by` VARCHAR(45) NULL,
        PRIMARY KEY (`Sale no`),
        INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
        INDEX `idGlasses_idx` (`idGlasses` ASC) VISIBLE,
        CONSTRAINT `idCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `Ulleres_cul_ampolla`.`Customers` (`idCustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `idGlasses` FOREIGN KEY (`idGlasses`) REFERENCES `Ulleres_cul_ampolla`.`Glasses` (`idGlasses`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

INSERT INTO
    `ulleres_cul_ampolla`.`customers` (
        `idCustomer`,
        `Full name`,
        `Address`,
        `Postcode`,
        `Town`,
        `Phone no`,
        `Email`,
        `Sign-up date`,
        `Referred by`
    )
VALUES (
        1,
        "Juan Pérez",
        "C/ Mallorca 221, 3B",
        "08015",
        "Barcelona",
        "689487556",
        "juanperez@email.com",
        "2022-10-2",
        ""
    ), (
        2,
        "Alba Álvarez",
        "C/ València 228, 4B",
        "08020",
        "Barcelona",
        "698874126",
        "albalvarez@email.com",
        "2022-08-20",
        ""
    ), (
        3,
        "Paula Fernández",
        "C/ Còrsega 10, 4A",
        "08014",
        "Barcelona",
        "674411283",
        "paulafernandez@email.com",
        "2022-10-12",
        ""
    ), (
        4,
        "Eusebio de la Gran",
        "C/ Diputació 140, Principal",
        "08010",
        "Barcelona",
        "931566648",
        "",
        "2023-01-09",
        ""
    ), (
        5,
        "Jordi Coromines",
        "C/ Girona 10, 6C",
        "08021",
        "Barcelona",
        "689547887",
        "coromines_jordi@email.com",
        "2022-07-05",
        ""
    );

INSERT INTO
    `ulleres_cul_ampolla`.`suppliers`(
        `idSuppliers`,
        `Supplier name`,
        `Address`,
        `Telephone no.`,
        `Fax`,
        `NIF`
    )
VALUES (
        1,
        "Gafas molongas",
        "C/ València 189, 6A, 08020 Barcelona",
        "559684268",
        "559684268",
        "PO89549516"
    ), (
        2,
        "Lunettes Lunaires",
        "C/ de França 15, 16020 Figueres",
        "984775214",
        "984775214",
        "8989962224"
    );

INSERT INTO
    ulleres_cul_ampolla.`brand suppliers` (`Brand`, `idSuppliers`)
VALUES ("Police", 2), ("RayBan", 1), ("Sting", 1);

INSERT INTO
    `ulleres_cul_ampolla`.`glasses` (
        `idGlasses`,
        `Brand`,
        `Frame type`,
        `Graduation Left`,
        `Graduation Right`,
        `Frame colour`,
        `Glass colour`,
        `Price`
    )
VALUES (
        1,
        'RayBan',
        'Wire',
        '2',
        '1',
        'Silver',
        'none',
        160
    ), (
        2,
        'Police',
        'Rimless',
        '1',
        '1',
        'Gold',
        'none',
        140
    ), (
        3,
        "RayBan",
        "Rimless",
        2,
        1,
        "Black",
        "none",
        150
    ), (
        4,
        'Sting',
        'Thick',
        3,
        3,
        'Black',
        'none',
        120
    ), (
        5,
        'Sting',
        'Rimless',
        7,
        6,
        'Blue',
        'none',
        90
    );

INSERT INTO
    `ulleres_cul_ampolla`.`sales` (
        `Sale no`,
        `Date`,
        `idCustomer`,
        `idGlasses`,
        `Sold by`
    )
VALUES (
        1,
        "2023-01-24",
        1,
        1,
        "Aethelbert"
    ), (
        2,
        "2022-12-27",
        2,
        1,
        "Aethelbert"
    ), (
        3,
        "2022-12-22",
        1,
        1,
        "Aethelbert"
    ), (
        4,
        "2023-01-24",
        3,
        5,
        "Cuthbert"
    ), (
        5,
        "2023-01-24",
        4,
        2,
        "Cuthbert"
    );