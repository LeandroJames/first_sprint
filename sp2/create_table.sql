CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Customers` (
  `idCustomers` SMALLINT UNSIGNED NOT NULL,
  `Full name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Postcode` VARCHAR(45) NULL,
  `Town` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Sign-up date` VARCHAR(45) NULL,
  `Referred by` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Suppliers` (
  `idSuppliers` INT NOT NULL AUTO_INCREMENT,
  `Supplier name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Telephone no.` INT NULL,
  `Fax` INT NULL,
  `NIF` VARCHAR(45) NULL,
  `Brands supplied` VARCHAR(45) NULL,
  PRIMARY KEY (`idSuppliers`),
  UNIQUE INDEX `idSuppliers_UNIQUE` (`idSuppliers` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Glasses` (
  `idGlasses` SMALLINT UNSIGNED NOT NULL,
  `Brand` VARCHAR(45) NULL,
  `Frame type` VARCHAR(45) NULL,
  `Graduation Left` DECIMAL(4,2) NULL,
  `Graduation Right` DECIMAL(4,2) NULL,
  `Frame colour` VARCHAR(45) NULL,
  `Glass colour` VARCHAR(45) NULL,
  `Price` DECIMAL(6,2) NULL,
  `Supplier_ID` INT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `Supplier_id_idx` (`Supplier_ID` ASC) VISIBLE,
  CONSTRAINT `Supplier_id`
    FOREIGN KEY (`Supplier_ID`)
    REFERENCES `Ulleres_cul_ampolla`.`Suppliers` (`idSuppliers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ulleres_cul_ampolla`.`Sales` (
  `Sale no` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `CustomerID` SMALLINT UNSIGNED NULL,
  `idGlasses` SMALLINT UNSIGNED NULL,
  `Sold by` VARCHAR(45) NULL,
  PRIMARY KEY (`Sale no`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `idGlasses_idx` (`idGlasses` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Ulleres_cul_ampolla`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGlasses`
    FOREIGN KEY (`idGlasses`)
    REFERENCES `Ulleres_cul_ampolla`.`Glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;