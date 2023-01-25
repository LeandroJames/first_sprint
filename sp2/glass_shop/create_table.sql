CREATE SCHEMA IF NOT EXISTS `Ulleres_cul_ampolla` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Customers` (
  `CustomerID` SMALLINT UNSIGNED NOT NULL,
  `Full name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Postcode` VARCHAR(45) NULL,
  `Town` VARCHAR(45) NULL,
  `Phone no` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Sign-up date` VARCHAR(45) NULL,
  `Referred by` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Suppliers` (
  `SupplierID` INT NOT NULL AUTO_INCREMENT,
  `Supplier name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Telephone no.` INT NULL,
  `Fax` INT NULL,
  `NIF` VARCHAR(45) NULL,
  `Brands supplied` VARCHAR(45) NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE INDEX `SupplierID_UNIQUE` (`SupplierID` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Glasses` (
  `GlassesID` SMALLINT UNSIGNED NOT NULL,
  `Brand` VARCHAR(45) NULL,
  `Frame type` VARCHAR(45) NULL,
  `Graduation Left` DECIMAL(4,2) NULL,
  `Graduation Right` DECIMAL(4,2) NULL,
  `Frame colour` VARCHAR(45) NULL,
  `Glass colour` VARCHAR(45) NULL,
  `Price` DECIMAL(6,2) NULL,
  `SupplierID` INT NULL,
  PRIMARY KEY (`GlassesID`),
  INDEX `SupplierID_idx` (`SupplierID` ASC) VISIBLE,
  CONSTRAINT `SupplierID`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `Ulleres_cul_ampolla`.`Suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Sales` (
  `Sale no` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `CustomerID` SMALLINT UNSIGNED NULL,
  `GlassesID` SMALLINT UNSIGNED NULL,
  `Sold by` VARCHAR(45) NULL,
  PRIMARY KEY (`Sale no`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `GlassesID_idx` (`GlassesID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Ulleres_cul_ampolla`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `GlassesID`
    FOREIGN KEY (`GlassesID`)
    REFERENCES `Ulleres_cul_ampolla`.`Glasses` (`GlassesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;