-- MySQL Script generated by MySQL Workbench
-- qua 22 ago 2018 07:29:14 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema llldc21_data_form
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema llldc21_data_form
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `llldc21_data_form` ;
USE `llldc21_data_form` ;

-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_USUARIO` (
  `CD_USUARIO` INT NULL AUTO_INCREMENT,
  `NM_USUARIO` VARCHAR(100) NOT NULL,
  `DS_EMAIL` VARCHAR(45) NOT NULL,
  `DT_NASCIMENTO` DATE NOT NULL,
  `DS_SENHA` VARCHAR(20) NOT NULL,
  `DS_EMAIL_RECUPERACAO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CD_USUARIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_CATEGORIA` (
  `CD_CATEGORIA` INT NULL AUTO_INCREMENT,
  `NM_CATEGORIA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CD_CATEGORIA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;


-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_USER_FORM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_USER_FORM` (
  `CD_USER_FORM` INT NULL AUTO_INCREMENT,
  `NM_USER_FORM` VARCHAR(45) NOT NULL,
  `ID_USUARIO(FK)` INT NOT NULL,
  `ID_CATEGORIA(FK)` INT NOT NULL,
  PRIMARY KEY (`CD_USER_FORM`),
  INDEX `fk_TB_USER_FORM_TB_USUARIO_idx` (`ID_USUARIO(FK)` ASC) VISIBLE,
  INDEX `fk_TB_USER_FORM_TB_CATEGORIA1_idx` (`ID_CATEGORIA(FK)` ASC) VISIBLE,
  CONSTRAINT `fk_TB_USER_FORM_TB_USUARIO`
    FOREIGN KEY (`ID_USUARIO(FK)`)
    REFERENCES `llldc21_data_form`.`TB_USUARIO` (`CD_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_USER_FORM_TB_CATEGORIA1`
    FOREIGN KEY (`ID_CATEGORIA(FK)`)
    REFERENCES `llldc21_data_form`.`TB_CATEGORIA` (`CD_CATEGORIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_TIPO_PERGUNTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_TIPO_PERGUNTA` (
  `CD_TIPO_PERGUNTA` INT NULL AUTO_INCREMENT,
  `NM_TIPO_PERGUNTA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CD_TIPO_PERGUNTA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_PERGUNTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_PERGUNTA` (
  `CD_PERGUNTA` INT NULL AUTO_INCREMENT,
  `NM_PERGUNTA` VARCHAR(45) NOT NULL,
  `ID_TIPO_PERGUNTA(FK)` INT NOT NULL,
  `ID_USER_FORM(FK)` INT NOT NULL,
  PRIMARY KEY (`CD_PERGUNTA`),
  INDEX `fk_TB_PERGUNTA_TB_TIPO_PERGUNTA1_idx` (`ID_TIPO_PERGUNTA(FK)` ASC) VISIBLE,
  INDEX `fk_TB_PERGUNTA_TB_USER_FORM1_idx` (`ID_USER_FORM(FK)` ASC) VISIBLE,
  CONSTRAINT `fk_TB_PERGUNTA_TB_TIPO_PERGUNTA1`
    FOREIGN KEY (`ID_TIPO_PERGUNTA(FK)`)
    REFERENCES `llldc21_data_form`.`TB_TIPO_PERGUNTA` (`CD_TIPO_PERGUNTA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_PERGUNTA_TB_USER_FORM1`
    FOREIGN KEY (`ID_USER_FORM(FK)`)
    REFERENCES `llldc21_data_form`.`TB_USER_FORM` (`CD_USER_FORM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'TB_USER_FORM_TB_USUARIO_CD_USUARIO';


-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_ALTERNATIVA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_ALTERNATIVA` (
  `CD_ALTERNATIVA` INT NULL AUTO_INCREMENT,
  `NM_ALTERNATIVA` VARCHAR(100) NOT NULL,
  `ID_PERGUNTA(FK)` INT NOT NULL,
  PRIMARY KEY (`CD_ALTERNATIVA`),
  INDEX `fk_TB_ALTERNATIVA_TB_PERGUNTA1_idx` (`ID_PERGUNTA(FK)` ASC) VISIBLE,
  CONSTRAINT `fk_TB_ALTERNATIVA_TB_PERGUNTA1`
    FOREIGN KEY (`ID_PERGUNTA(FK)`)
    REFERENCES `llldc21_data_form`.`TB_PERGUNTA` (`CD_PERGUNTA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llldc21_data_form`.`TB_RESPOSTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llldc21_data_form`.`TB_RESPOSTA` (
  `CD_RESPOSTA` INT NULL AUTO_INCREMENT,
  `TB_ALTERNATIVA_CD_ALTERNATIVA` INT NOT NULL,
  PRIMARY KEY (`CD_RESPOSTA`),
  INDEX `fk_TB_RESPOSTA_TB_ALTERNATIVA1_idx` (`TB_ALTERNATIVA_CD_ALTERNATIVA` ASC) VISIBLE,
  CONSTRAINT `fk_TB_RESPOSTA_TB_ALTERNATIVA1`
    FOREIGN KEY (`TB_ALTERNATIVA_CD_ALTERNATIVA`)
    REFERENCES `llldc21_data_form`.`TB_ALTERNATIVA` (`CD_ALTERNATIVA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;