CREATE SCHEMA IF NOT EXISTS `Ulleres_cul_ampolla` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Customers` (
  `idCustomer` SMALLINT UNSIGNED NOT NULL,
  `Full name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Postcode` VARCHAR(45) NULL,
  `Town` VARCHAR(45) NULL,
  `Phone no` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Sign-up date` VARCHAR(45) NULL,
  `Referred by` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Suppliers` (
  `idSuppliers` INT NOT NULL AUTO_INCREMENT,
  `Supplier name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Telephone no.` INT NULL,
  `Fax` INT NULL,
  `NIF` VARCHAR(45) NULL,
  PRIMARY KEY (`idSuppliers`),
  UNIQUE INDEX `idSuppliers_UNIQUE` (`idSuppliers` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Brand suppliers` (
  `Brand` VARCHAR(45) NOT NULL,
  `idSuppliers` INT NULL,
  PRIMARY KEY (`Brand`),
  INDEX `idSuppliers_idx` (`idSuppliers` ASC) VISIBLE,
  CONSTRAINT `idSuppliers`
    FOREIGN KEY (`idSuppliers`)
    REFERENCES `Ulleres_cul_ampolla`.`Suppliers` (`idSuppliers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Glasses` (
  `idGlasses` SMALLINT UNSIGNED NOT NULL,
  `Brand` VARCHAR(45) NULL,
  `Frame type` SET('Wire', 'Thick', 'Rimless') NULL,
  `Graduation Left` DECIMAL(4,2) NULL,
  `Graduation Right` DECIMAL(4,2) NULL,
  `Frame colour` VARCHAR(45) NULL,
  `Glass colour` VARCHAR(45) NULL,
  `Price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `Brand_idx` (`Brand` ASC) VISIBLE,
  CONSTRAINT `Brand`
    FOREIGN KEY (`Brand`)
    REFERENCES `Ulleres_cul_ampolla`.`Brand suppliers` (`Brand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Sales` (
  `Sale no` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `idCustomer` SMALLINT UNSIGNED NULL,
  `idGlasses` SMALLINT UNSIGNED NULL,
  `Sold by` VARCHAR(45) NULL,
  PRIMARY KEY (`Sale no`),
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idGlasses_idx` (`idGlasses` ASC) VISIBLE,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `Ulleres_cul_ampolla`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGlasses`
    FOREIGN KEY (`idGlasses`)
    REFERENCES `Ulleres_cul_ampolla`.`Glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;