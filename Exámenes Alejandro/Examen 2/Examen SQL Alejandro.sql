-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql_alejandro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_alejandro` DEFAULT CHARACTER SET utf8mb4 ;
USE `sql_alejandro` ;

-- -----------------------------------------------------
-- Table `sql_alejandro`.`PROPIETARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_alejandro`.`PROPIETARIOS` (
  `id_propietarios` INT(42) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(42) NOT NULL,
  `email` VARCHAR(42) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_propietarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `sql_alejandro`.`CASAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_alejandro`.`CASAS` (
  `id_casa` INT(42) NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(42) NOT NULL,
  `anyo_construccion` YEAR(4) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `PROPIETARIOS_id_propietarios` INT(42) NOT NULL,
  PRIMARY KEY (`id_casa`),
  INDEX `fk_CASAS_PROPIETARIOS_idx` (`PROPIETARIOS_id_propietarios` ASC),
  CONSTRAINT `fk_CASAS_PROPIETARIOS`
    FOREIGN KEY (`PROPIETARIOS_id_propietarios`)
    REFERENCES `sql_alejandro`.`PROPIETARIOS` (`id_propietarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERCIÓN DE DATOS
-- -----------------------------------------------------

INSERT INTO `PROPIETARIOS` (`id_propietarios`, `nombre`, `email`, `apellidos`) VALUES
(1, 'Costas', 'Costas.Mitsotakis@proton.me', 'Mitsotakis'),
(2, 'Roy', 'R.Sull@gmx.com', 'Sullivan'),
(3, 'Frane', 'FR.EAK@amazon.de', 'Selak'),
(4, 'Isaac', 'movisana@xerox.kong', 'Asimov'),
(5, 'Mohammed', 'Salammalikum@haram.com', 'Smith');

INSERT INTO `CASAS` (`id_casa`, `direccion`, `precio`, `anyo_construccion`, `PROPIETARIOS_id_propietarios`) VALUES
(1, 'CL Gallagher 13', 1250665, 1975, 1),
(2, 'Av Susanita 146', 255855, 2001, 2),
(3, 'Paseo de las penas 55, 1º, 1ª', 125300, 1991, 3),
(4, 'CL Pedro Ruiz 106', 327475, 2023, 4),
(5, 'CL Cangrejo 7, 4º, 1ª', 1250665, 1975, 5);

-- -----------------------------------------------------
-- CONSULTAS PROPIETARIOS
-- -----------------------------------------------------

SELECT COUNT(*)
FROM PROPIETARIOS;

SELECT *
FROM PROPIETARIOS
WHERE apellidos LIKE 'JUAREZ';

SELECT email
FROM PROPIETARIOS;

SELECT *
FROM PROPIETARIOS
WHERE apellidos LIKE 'F%';

-- -----------------------------------------------------
-- CONSULTAS CASAS
-- -----------------------------------------------------

SELECT *
FROM CASAS
WHERE anyo_construccion BETWEEN '1990' AND '2020';

SELECT *
FROM CASAS
ORDER BY precio DESC;

SELECT *
FROM CASAS
WHERE precio > (SELECT AVG(precio) FROM CASAS);

SELECT *
FROM CASAS
WHERE precio = (SELECT MIN(precio) FROM CASAS);

-- -----------------------------------------------------
-- CONSULTAS JOIN
-- -----------------------------------------------------

SELECT c.direccion, c.anyo_construccion, c.precio, p.nombre, p.apellidos AS hogares
FROM CASAS c
INNER JOIN PROPIETARIOS p ON c.PROPIETARIOS_id_propietarios = p.id_propietarios;

SELECT c.precio, p.nombre AS duenyo
FROM CASAS c
INNER JOIN PROPIETARIOS p ON c.PROPIETARIOS_id_propietarios = p.id_propietarios
WHERE c.precio > 180000;