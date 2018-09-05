-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ad_tp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ad_tp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ad_tp` DEFAULT CHARACTER SET utf8 ;
USE `ad_tp` ;

-- -----------------------------------------------------
-- Table `ad_tp`.`social_economic_context`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_tp`.`social_economic_context` (
  `idSec` INT NOT NULL AUTO_INCREMENT,
  `employment_rate` FLOAT NOT NULL,
  `consumer_price_index` FLOAT NOT NULL,
  `consumer_confidence` FLOAT NOT NULL,
  `number_employees` FLOAT NOT NULL,
  `euribor` FLOAT NOT NULL,
  PRIMARY KEY (`idSec`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ad_tp`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ad_tp`.`Client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `age` INT NOT NULL,
  `education` VARCHAR(45) NOT NULL,
  `credit_default` VARCHAR(45) NOT NULL,
  `housing_loan` VARCHAR(45) NOT NULL,
  `personal_loan` VARCHAR(45) NOT NULL,
  `job_type` VARCHAR(45) NOT NULL,
  `marital_status` VARCHAR(45) NOT NULL,
  `deposit` VARCHAR(5) NOT NULL,
  `previous_contact` INT NOT NULL,
  `previous_outcome` VARCHAR(45) NOT NULL,
  `current_contacts` INT NOT NULL,
  `passed_days` INT NOT NULL,
  `contact_type` VARCHAR(45) NOT NULL,
  `month` INT NOT NULL,
  `day_of_week` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `idSec` INT NOT NULL,
  PRIMARY KEY (`idClient`, `idSec`),
  INDEX `fk_Client_social_economic_context_idx` (`idSec` ASC),
  CONSTRAINT `fk_Client_social_economic_context`
    FOREIGN KEY (`idSec`)
    REFERENCES `ad_tp`.`social_economic_context` (`idSec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
