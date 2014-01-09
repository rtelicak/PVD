SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `CK` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `CK` ;

-- -----------------------------------------------------
-- Table `CK`.`staty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`staty` ;

CREATE  TABLE IF NOT EXISTS `CK`.`staty` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  `hlavne_mesto` VARCHAR(45) NULL ,
  `rozloha` VARCHAR(45) NULL ,
  `pocet_obyvatelov` INT NULL ,
  `mena` VARCHAR(15) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`dodavatelia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`dodavatelia` ;

CREATE  TABLE IF NOT EXISTS `CK`.`dodavatelia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  `telefon` VARCHAR(13) NULL ,
  `email` VARCHAR(45) NULL ,
  `ico` INT(7) NULL ,
  `kontaktna_osoba` VARCHAR(45) NULL ,
  `ulica` VARCHAR(45) NULL ,
  `mesto` INT(2) NULL ,
  `id_stat` INT(2) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stat_idx` (`id_stat` ASC) ,
  CONSTRAINT `fk_stat`
    FOREIGN KEY (`id_stat` )
    REFERENCES `CK`.`staty` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`destinacie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`destinacie` ;

CREATE  TABLE IF NOT EXISTS `CK`.`destinacie` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(60) NULL ,
  `id_stat` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`doprava`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`doprava` ;

CREATE  TABLE IF NOT EXISTS `CK`.`doprava` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`typy_zajazdov`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`typy_zajazdov` ;

CREATE  TABLE IF NOT EXISTS `CK`.`typy_zajazdov` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`strava`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`strava` ;

CREATE  TABLE IF NOT EXISTS `CK`.`strava` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`typy_ubytovania`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`typy_ubytovania` ;

CREATE  TABLE IF NOT EXISTS `CK`.`typy_ubytovania` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`ponuka_zajazdov`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`ponuka_zajazdov` ;

CREATE  TABLE IF NOT EXISTS `CK`.`ponuka_zajazdov` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  `popis` VARCHAR(200) NULL ,
  `odchod` DATE NULL ,
  `prichod` DATE NULL ,
  `pocet_dni` INT(2) NULL ,
  `cena` FLOAT(4,2) NULL ,
  `id_dodavatel` INT(2) NULL ,
  `id_destinacia` INT(2) NULL ,
  `id_doprava` INT(2) NULL ,
  `id_typ_zajazdu` INT(2) NULL ,
  `id_strava` INT(2) NULL ,
  `id_ubytovanie` INT(2) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_dodavatel_idx` (`id_dodavatel` ASC) ,
  INDEX `fk_destinacia_idx` (`id_destinacia` ASC) ,
  INDEX `fk_doprava_idx` (`id_doprava` ASC) ,
  INDEX `fk_typ_zajazdu_idx` (`id_typ_zajazdu` ASC) ,
  INDEX `fk_strava_idx` (`id_strava` ASC) ,
  INDEX `id_ubytovanie_idx` (`id_ubytovanie` ASC) ,
  CONSTRAINT `fk_dodavatel`
    FOREIGN KEY (`id_dodavatel` )
    REFERENCES `CK`.`dodavatelia` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_destinacia`
    FOREIGN KEY (`id_destinacia` )
    REFERENCES `CK`.`destinacie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doprava`
    FOREIGN KEY (`id_doprava` )
    REFERENCES `CK`.`doprava` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_typ_zajazdu`
    FOREIGN KEY (`id_typ_zajazdu` )
    REFERENCES `CK`.`typy_zajazdov` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_strava`
    FOREIGN KEY (`id_strava` )
    REFERENCES `CK`.`strava` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_ubytovanie`
    FOREIGN KEY (`id_ubytovanie` )
    REFERENCES `CK`.`typy_ubytovania` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`poistovna`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`poistovna` ;

CREATE  TABLE IF NOT EXISTS `CK`.`poistovna` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  `sidlo` VARCHAR(200) NULL ,
  `ico` INT(9) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`klienti`
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Table `CK`.`typy_platieb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`typy_platieb` ;

CREATE  TABLE IF NOT EXISTS `CK`.`typy_platieb` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`typy_izieb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`typy_izieb` ;

CREATE  TABLE IF NOT EXISTS `CK`.`typy_izieb` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nazov` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`predane_zajazdy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`predane_zajazdy` ;

CREATE  TABLE IF NOT EXISTS `CK`.`predane_zajazdy` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `id_zajazd` INT(5) NULL ,
  `id_klient` INT(2) NULL ,
  `id_platba` INT(2) NULL ,
  `id_poistovna` INT(2) NULL ,
  `id_typ_izby` INT(2) NULL ,
  `poistenie` TINYINT(1) NULL ,
  `poschodie` VARCHAR(45) NULL ,
  `cislo_izby` VARCHAR(45) NULL ,
  `predany_dna` DATE NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_zajazd_idx` (`id_zajazd` ASC) ,
  INDEX `fk_klient_idx` (`id_klient` ASC) ,
  INDEX `fk_platba_idx` (`id_platba` ASC) ,
  INDEX `fk_izba_idx` (`id_typ_izby` ASC) ,
  INDEX `fk_poistovna_idx` (`id_poistovna` ASC) ,
  CONSTRAINT `fk_zajazd`
    FOREIGN KEY (`id_zajazd` )
    REFERENCES `CK`.`ponuka_zajazdov` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_klient`
    FOREIGN KEY (`id_klient` )
    REFERENCES `CK`.`klienti` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_platba`
    FOREIGN KEY (`id_platba` )
    REFERENCES `CK`.`typy_platieb` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_izba`
    FOREIGN KEY (`id_typ_izby` )
    REFERENCES `CK`.`typy_izieb` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poistovna`
    FOREIGN KEY (`id_poistovna` )
    REFERENCES `CK`.`poistovna` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CK`.`reklamacie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CK`.`reklamacie` ;

CREATE  TABLE IF NOT EXISTS `CK`.`reklamacie` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `id_zajazd` INT(5) NULL ,
  `popis` VARCHAR(200) NULL ,
  `rozhodnutie` VARCHAR(200) NULL ,
  `vratena_suma` FLOAT(6,2) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_zajazd_idx` (`id_zajazd` ASC) ,
  CONSTRAINT `fk_zajazd`
    FOREIGN KEY (`id_zajazd` )
    REFERENCES `CK`.`predane_zajazdy` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `CK` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
