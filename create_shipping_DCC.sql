CREATE SCHEMA IF NOT EXISTS `shipping_data_DCC`;
USE `shipping_data_DCC` ;

CREATE TABLE IF NOT EXISTS `shipping_data_DCC`.`port` (
  `portName` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`portName`),
  UNIQUE INDEX `portName_UNIQUE` (`portName` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `shipping_data_DCC`.`ship` (
  `shipName` VARCHAR(45) NOT NULL,
  `displace` INT NOT NULL,
  `captain` VARCHAR(45) NOT NULL,
  `crewNo` INT NOT NULL,
  `buildYear` INT(4) NOT NULL,
  `portName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`shipName`, `portName`),
  UNIQUE INDEX `shipName_UNIQUE` (`shipName` ASC) VISIBLE,
  INDEX `fk_ship_port1_idx` (`portName` ASC) VISIBLE,
  CONSTRAINT `fk_ship_port1`
    FOREIGN KEY (`portName`)
    REFERENCES `shipping_data_DCC`.`port` (`portName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `shipping_data_DCC`.`container` (
  `containerID` INT NOT NULL,
  `height` INT NOT NULL,
  `width` INT NOT NULL,
  `length` INT NOT NULL,
  `weight` INT NOT NULL,
  `shipName` VARCHAR(45) NULL,
  PRIMARY KEY (`containerID`),
  UNIQUE INDEX `containerID_UNIQUE` (`containerID` ASC) VISIBLE,
  INDEX `fk_container_ship1_idx` (`shipName` ASC) VISIBLE,
  CONSTRAINT `fk_container_ship1`
    FOREIGN KEY (`shipName`)
    REFERENCES `shipping_data_DCC`.`ship` (`shipName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);