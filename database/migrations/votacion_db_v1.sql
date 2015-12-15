-- MySQL Script generated by MySQL Workbench
-- 12/15/15 01:13:31
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vch_usuario` VARCHAR(45) NULL,
  `vch_nombres` VARCHAR(100) NULL,
  `vch_apellidos` VARCHAR(100) NULL,
  `vch_email` VARCHAR(40) NULL,
  `vch_pass` VARCHAR(90) NULL,
  `int_tipo` INT NULL,
  `vch_pais` VARCHAR(45) NULL,
  `int_sexo` INT NULL,
  `vch_img` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_votacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_votacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vch_nombre` VARCHAR(100) NOT NULL,
  `int_admin` INT NOT NULL,
  `int_estado` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_votacion_tbl_usuario_idx` (`int_admin` ASC),
  CONSTRAINT `fk_tbl_votacion_tbl_usuario`
    FOREIGN KEY (`int_admin`)
    REFERENCES `mydb`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_partido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vch_nombre` VARCHAR(100) NOT NULL,
  `int_representante` INT NOT NULL,
  `vch_img` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_partido_tbl_usuario1_idx` (`int_representante` ASC),
  CONSTRAINT `fk_tbl_partido_tbl_usuario1`
    FOREIGN KEY (`int_representante`)
    REFERENCES `mydb`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_integrantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_integrantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `int_usuario` INT NOT NULL,
  `int_grupo` INT NOT NULL,
  `int_voto` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_integrantes_tbl_usuario1_idx` (`int_usuario` ASC),
  INDEX `fk_tbl_integrantes_tbl_votacion1_idx` (`int_grupo` ASC),
  INDEX `fk_tbl_integrantes_tbl_partido1_idx` (`int_voto` ASC),
  CONSTRAINT `fk_tbl_integrantes_tbl_usuario1`
    FOREIGN KEY (`int_usuario`)
    REFERENCES `mydb`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_integrantes_tbl_votacion1`
    FOREIGN KEY (`int_grupo`)
    REFERENCES `mydb`.`tbl_votacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_integrantes_tbl_partido1`
    FOREIGN KEY (`int_voto`)
    REFERENCES `mydb`.`tbl_partido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;