-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sql_alejandro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_alejandro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_alejandro` DEFAULT CHARACTER SET utf8mb4 ;
-- -----------------------------------------------------
-- Schema examensql_alejandro
-- -----------------------------------------------------
USE `sql_alejandro` ;

-- -----------------------------------------------------
-- Table `sql_alejandro`.`PROPIETARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_alejandro`.`PROPIETARIOS` (
  `id_propietarios` INT(42) NOT NULL,
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
  `id_casa` INT(42) NOT NULL,
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

INSERT INTO `PROPIETARIOS` (`nombre`, `email`, `apellidos`) VALUES
('Costas', 'Costas.Mitsotakis@proton.me', 'Mitsotakis'),
('Roy', 'R.Sull@gmx.com', 'Sullivan'),
('Frane', 'FR.EAK@amazon.de', 'Selak'),
('Isaac', 'movisana@xerox.kong', 'Asimov'),
('Mohammed', 'Salammalikum@haram.com', 'Smith');

INSERT INTO `CASAS` (`direccion`, `precio`, `anyo_construccion`) VALUES
('CL Gallagher 13', '1250665', '1975'),
('Av Susanita 146', '255855', '2001'),
('Paseo de las penas 55, 1º, 1ª', '125300', '1991'),
('CL Pedro Ruiz 106', '327475', '2023'),
('CL Cangrejo 7, 4º, 1ª', '1250665', '1975');

-- -----------------------------------------------------
-- CONSULTAS SOLICITADAS PROPIETARIOS
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
-- CONSULTAS SOLICITADAS CASAS
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
-- CONSULTAS SOLICITADAS JOIN
-- -----------------------------------------------------

SELECT l.direccion, l.anyo, l.precio, c.nombre, c.apellido AS hogares
FROM CASAS l
INNER JOIN propietarios c ON l.id_propietarios = c.id_propietarios;

SELECT l.precio, c.nombre AS duenyo
FROM CASAS l
INNER JOIN propietarios c ON l.id_propietarios = c.id_propietarios
WHERE precio > '180000';