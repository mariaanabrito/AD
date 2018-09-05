-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------
-- Schema ad_dw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ad_dw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ad_dw` DEFAULT CHARACTER SET utf8 ;
USE `ad_dw` ;

-- -----------------------------------------------------
-- Table `ad_dw`.`client_dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_dw`.`client_dim` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `age` INT NOT NULL,
  `education` VARCHAR(45) NOT NULL,
  `credit_default` VARCHAR(45) NOT NULL,
  `housing_loan` VARCHAR(45) NOT NULL,
  `personal_loan` VARCHAR(45) NOT NULL,
  `job_type` VARCHAR(45) NOT NULL,
  `marital_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ad_dw`.`previousCampaign_dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_dw`.`previousCampaign_dim` (
  `idPrevCamp` INT NOT NULL AUTO_INCREMENT,
  `previous_contacts` INT NOT NULL,
  `previous_outcome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPrevCamp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ad_dw`.`currentCampaign_dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_dw`.`currentCampaign_dim` (
  `idCurCamp` INT NOT NULL AUTO_INCREMENT,
  `passed_days` INT NULL,
  `contact_type` VARCHAR(45) NOT NULL,
  `month` INT NOT NULL,
  `day_of_week` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `current_contacts` INT NOT NULL,
  PRIMARY KEY (`idCurCamp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ad_dw`.`sec_dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_dw`.`sec_dim` (
  `idSec` INT NOT NULL AUTO_INCREMENT,
  `employment_rate` FLOAT NOT NULL,
  `consumer_price_index` FLOAT NOT NULL,
  `consumer_confidence` FLOAT NOT NULL,
  `number_employees` FLOAT NOT NULL,
  `euribor` FLOAT NOT NULL,
  PRIMARY KEY (`idSec`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ad_dw`.`deposit_dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_dw`.`deposit_dim` (
  `idDeposit` INT NOT NULL AUTO_INCREMENT,
  `deposit` VARCHAR(5) NOT NULL,
  `idClient` INT NOT NULL,
  `idSec` INT NOT NULL,
  `idPrevCamp` INT NOT NULL,
  `idCurCamp` INT NOT NULL,
  PRIMARY KEY (`idDeposit`, `idClient`, `idSec`, `idPrevCamp`, `idCurCamp`),
  INDEX `fk_deposit_dim_client_dim_idx` (`idClient` ASC),
  INDEX `fk_deposit_dim_sec_dim1_idx` (`idSec` ASC),
  INDEX `fk_deposit_dim_previousCampaign_dim1_idx` (`idPrevCamp` ASC),
  INDEX `fk_deposit_dim_currentCampaign_dim1_idx` (`idCurCamp` ASC),
  CONSTRAINT `fk_deposit_dim_client_dim`
    FOREIGN KEY (`idClient`)
    REFERENCES `ad_dw`.`client_dim` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deposit_dim_sec_dim1`
    FOREIGN KEY (`idSec`)
    REFERENCES `ad_dw`.`sec_dim` (`idSec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deposit_dim_previousCampaign_dim1`
    FOREIGN KEY (`idPrevCamp`)
    REFERENCES `ad_dw`.`previousCampaign_dim` (`idPrevCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deposit_dim_currentCampaign_dim1`
    FOREIGN KEY (`idCurCamp`)
    REFERENCES `ad_dw`.`currentCampaign_dim` (`idCurCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
