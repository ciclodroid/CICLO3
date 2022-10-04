CREATE SCHEMA IF NOT EXISTS `elcondor` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `elcondor`.`CarritoCompra` (
  `idCarritoCompra` INT NOT NULL AUTO_INCREMENT,
  `idProducto` INT NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `idCliente` INT NOT NULL,
  `fechaVencimiento` DATE NOT NULL,
  `fechaPago` DATE NULL,
  `valorPago` INT NULL,
  PRIMARY KEY (`idCarritoCompra`, `idProducto`, `fechaCreacion`, `idCliente`),


CREATE TABLE IF NOT EXISTS `elcondor`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(120) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Natural1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `elcondor`.`Natural` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Juridico1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `elcondor`.`Juridico` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `elcondor`.`Juridico` (
  `idCliente` INT NOT NULL,
  `nit` VARCHAR(45) NOT NULL,
  `razonSocial` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idCliente`, `nit`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `elcondor`.`Mora` (
  `idMora` INT NOT NULL AUTO_INCREMENT,
  `idCarritoCompra` INT NOT NULL,
  `diasMora` INT NOT NULL,
  `fechaVencimiento` VARCHAR(45) NULL,
  `seguimiento` VARCHAR(4500) NULL,
  PRIMARY KEY (`idMora`, `idCarritoCompra`),
  INDEX `fk_Mora_CarritoCompra1_idx` (`idCarritoCompra` ASC) VISIBLE,
  CONSTRAINT `fk_Mora_CarritoCompra1`
    FOREIGN KEY (`idCarritoCompra`)
    REFERENCES `elcondor`.`CarritoCompra` (`idCarritoCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `elcondor`.`Natural` (
  `tipoDocumento` VARCHAR(45) NOT NULL,
  `idCliente` INT NOT NULL,
  `numeroDocumento` VARCHAR(45) NOT NULL,
  `nombre1` VARCHAR(100) NOT NULL,
  `nombre2` VARCHAR(100) NULL,
  `apellido1` VARCHAR(100) NOT NULL,
  `apellido2` VARCHAR(100) NULL,
  PRIMARY KEY (`idCliente`, `numeroDocumento`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `elcondor`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombreServicio` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `fk_Producto_CarritoCompra1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `elcondor`.`CarritoCompra` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;