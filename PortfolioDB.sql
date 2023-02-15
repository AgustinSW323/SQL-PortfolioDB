-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PortfolioDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PortfolioDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PortfolioDB` DEFAULT CHARACTER SET utf8 ;
USE `PortfolioDB` ;

-- -----------------------------------------------------
-- Table `PortfolioDB`.`userData`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioDB`.`userData` (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioDB`.`educations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioDB`.`educations` (
  `id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `place` VARCHAR(255) NULL,
  `certification` VARCHAR(255) NULL,
  `description` VARCHAR(999) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioDB`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioDB`.`skills` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioDB`.`userData_has_educations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioDB`.`userData_has_educations` (
  `userData_id` INT NOT NULL,
  `educations_id` INT NOT NULL,
  `educations_user_id` INT NOT NULL,
  PRIMARY KEY (`userData_id`, `educations_id`, `educations_user_id`),
  INDEX `fk_userData_has_educations_educations1_idx` (`educations_id` ASC, `educations_user_id` ASC) VISIBLE,
  INDEX `fk_userData_has_educations_userData_idx` (`userData_id` ASC) VISIBLE,
  CONSTRAINT `fk_userData_has_educations_userData`
    FOREIGN KEY (`userData_id`)
    REFERENCES `PortfolioDB`.`userData` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userData_has_educations_educations1`
    FOREIGN KEY (`educations_id` , `educations_user_id`)
    REFERENCES `PortfolioDB`.`educations` (`id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioDB`.`userData_has_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioDB`.`userData_has_skills` (
  `userData_id` INT NOT NULL,
  `skills_id` INT NOT NULL,
  `skills_user_id` INT NOT NULL,
  PRIMARY KEY (`userData_id`, `skills_id`, `skills_user_id`),
  INDEX `fk_userData_has_skills_skills1_idx` (`skills_id` ASC, `skills_user_id` ASC) VISIBLE,
  INDEX `fk_userData_has_skills_userData1_idx` (`userData_id` ASC) VISIBLE,
  CONSTRAINT `fk_userData_has_skills_userData1`
    FOREIGN KEY (`userData_id`)
    REFERENCES `PortfolioDB`.`userData` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userData_has_skills_skills1`
    FOREIGN KEY (`skills_id` , `skills_user_id`)
    REFERENCES `PortfolioDB`.`skills` (`id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
