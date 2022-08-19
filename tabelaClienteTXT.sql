-- MySQL Script generated by MySQL Workbench
-- Fri Aug 19 09:07:18 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `enrdereco` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` DECIMAL(9) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `dataTrabalho` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `qtdProduto` DECIMAL(3) NOT NULL,
  PRIMARY KEY (`idProdutos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `nomeEmpresa` VARCHAR(45) NOT NULL,
  `contatoEmpresa` DECIMAL(9) NOT NULL,
  `fkVendedor` INT NOT NULL,
  `fkProdutos` INT NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  INDEX `fkVendedor_idx` (`fkVendedor` ASC) VISIBLE,
  INDEX `fkProdutos_idx` (`fkProdutos` ASC) VISIBLE,
  CONSTRAINT `fkVendedor`
    FOREIGN KEY (`fkVendedor`)
    REFERENCES `mydb`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkProdutos`
    FOREIGN KEY (`fkProdutos`)
    REFERENCES `mydb`.`Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'mpr';


-- -----------------------------------------------------
-- Table `mydb`.`Informacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Informacoes` (
  `idInformacoes` INT NOT NULL AUTO_INCREMENT,
  `valorIngredientes` FLOAT NOT NULL,
  `valorProduto` FLOAT NOT NULL,
  `horarioAtendimento` DATETIME NOT NULL,
  `maiorDemanda` VARCHAR(45) NOT NULL,
  `desconto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInformacoes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Atendimento` (
  `idAtendimento` INT NOT NULL AUTO_INCREMENT,
  `fkEmpresa` INT NOT NULL,
  `fkCliente` INT NOT NULL,
  `fkInformacoes` INT NOT NULL,
  `cancelamento` CHAR(3) NULL,
  `reembolso` CHAR(3) NULL,
  PRIMARY KEY (`idAtendimento`),
  INDEX `fkCliente_idx` (`fkCliente` ASC) VISIBLE,
  INDEX `fkInformacoes_idx` (`fkInformacoes` ASC) VISIBLE,
  INDEX `fkEmpresa_idx` (`fkEmpresa` ASC) VISIBLE,
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkInformacoes`
    FOREIGN KEY (`fkInformacoes`)
    REFERENCES `mydb`.`Informacoes` (`idInformacoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkEmpresa`
    FOREIGN KEY (`fkEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vendasFeitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vendasFeitas` (
  `idvendasFeitas` INT NOT NULL AUTO_INCREMENT,
  `valorTotal` FLOAT NOT NULL,
  `diaVenda` DATETIME NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idvendasFeitas`),
  INDEX `fkCliente_idx` (`fkCliente` ASC) VISIBLE,
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
