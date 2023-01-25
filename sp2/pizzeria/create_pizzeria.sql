CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Branches` (
  `idBranches` INT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Postcode` INT NULL,
  `City` VARCHAR(45) NULL,
  `Province` VARCHAR(15) NULL,
  PRIMARY KEY (`idBranches`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Employees` (
  `idEmployees` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `ID no` INT NULL,
  `Phone no` INT NULL,
  `Position` VARCHAR(45) NULL,
  `Branch` INT NULL,
  PRIMARY KEY (`idEmployees`),
  INDEX `Branch_idx` (`Branch` ASC) VISIBLE,
  CONSTRAINT `Branch`
    FOREIGN KEY (`Branch`)
    REFERENCES `Pizzeria`.`Branches` (`idBranches`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Customers` (
  `idCustomers` INT NOT NULL,
  `Name` VARCHAR(25) NULL,
  `Surname` VARCHAR(30) NULL,
  `Address` VARCHAR(45) NULL,
  `Postcode` INT NULL,
  `City` VARCHAR(45) NULL,
  `Province` VARCHAR(45) NULL,
  `Phone no` INT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Products` (
  `idProducts` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Image` BLOB,
  `Category (pizzas only)` VARCHAR(45) NULL,
  `Price` DECIMAL(5,2) NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Order Item` (
  `idOrder Item` INT NOT NULL,
  `idOrder` INT NULL,
  `idProduct` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`idOrder Item`),
  INDEX `idProduct_idx` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `idProduct`
    FOREIGN KEY (`idProduct`)
    REFERENCES `Pizzeria`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `idCustomer` INT NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `Type` SET("Delivery", "Collect") NULL,
  `IdOrder Item` INT NULL,
  `Total` INT NULL,
  `Delivered by` INT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `idOrder Item_idx` (`IdOrder Item` ASC) VISIBLE,
  INDEX `Delivered by_idx` (`Delivered by` ASC) VISIBLE,
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `idOrder Item`
    FOREIGN KEY (`IdOrder Item`)
    REFERENCES `Pizzeria`.`Order Item` (`idOrder Item`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Delivered by`
    FOREIGN KEY (`Delivered by`)
    REFERENCES `Pizzeria`.`Employees` (`idEmployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `Pizzeria`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;