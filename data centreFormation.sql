-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema centreFormation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema centreFormation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `centreFormation` DEFAULT CHARACTER SET utf8 ;
USE `centreFormation` ;

-- -----------------------------------------------------
-- Table `centreFormation`.`etudiant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centreFormation`.`etudiant` (
  `numCINEtu` VARCHAR(10) NOT NULL,
  `nomEtu` VARCHAR(45) NULL,
  `prenomEtu` VARCHAR(45) NULL,
  `dateNaissanceEtu` DATE NULL,
  PRIMARY KEY (`numCINEtu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `centreFormation`.`Formation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centreFormation`.`Formation` (
  `codeForm` INT NOT NULL,
  `titreForm` VARCHAR(45) NULL,
  `dureeForm` VARCHAR(45) NULL,
  PRIMARY KEY (`codeForm`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `centreFormation`.`session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centreFormation`.`session` (
  `codeSess` INT NOT NULL,
  `numSess` VARCHAR(45) NULL,
  `dateDebut` DATE NULL,
  `Formation_codeForm` INT NOT NULL,
  PRIMARY KEY (`codeSess`),
  INDEX `fk_session_Formation1_idx` (`Formation_codeForm` ASC) VISIBLE,
  CONSTRAINT `fk_session_Formation1`
    FOREIGN KEY (`Formation_codeForm`)
    REFERENCES `centreFormation`.`Formation` (`codeForm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `centreFormation`.`Specialité`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centreFormation`.`Specialité` (
  `codeSpec` INT NOT NULL,
  `nomSpec` VARCHAR(45) NULL,
  PRIMARY KEY (`codeSpec`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `centreFormation`.`Inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centreFormation`.`Inscription` (
  `numCINEtu` VARCHAR(10) NOT NULL,
  `codeSess` INT NOT NULL,
  `typeCours` VARCHAR(45) NULL,
  PRIMARY KEY (`numCINEtu`, `codeSess`),
  INDEX `fk_etudiant_has_session_session1_idx` (`codeSess` ASC) VISIBLE,
  INDEX `fk_etudiant_has_session_etudiant_idx` (`numCINEtu` ASC) VISIBLE,
  CONSTRAINT `fk_etudiant_has_session_etudiant`
    FOREIGN KEY (`numCINEtu`)
    REFERENCES `centreFormation`.`etudiant` (`numCINEtu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_etudiant_has_session_session1`
    FOREIGN KEY (`codeSess`)
    REFERENCES `centreFormation`.`session` (`codeSess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `centreFormation`.`Combinaison`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centreFormation`.`Combinaison` (
  `Specialité_codeSpec` INT NOT NULL,
  `Formation_codeForm` INT NOT NULL,
  PRIMARY KEY (`Specialité_codeSpec`, `Formation_codeForm`),
  CONSTRAINT `fk_Specialité_has_Formation_Specialité1`
    FOREIGN KEY (`Specialité_codeSpec`)
    REFERENCES `centreFormation`.`Specialité` (`codeSpec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Specialité_has_Formation_Formation1`
    FOREIGN KEY (`Formation_codeForm`)
    REFERENCES `centreFormation`.`Formation` (`codeForm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
