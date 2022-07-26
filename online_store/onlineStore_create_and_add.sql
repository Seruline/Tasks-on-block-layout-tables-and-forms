CREATE DATABASE Store;
USE Store;

-- -----------------------------------------------------
-- Table `Store`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`image` (
  `id_img` INT NOT NULL,
  `img_name` VARCHAR(70) NOT NULL,
  `alt` VARCHAR(80) NOT NULL,
  `url_img` VARCHAR(210) NOT NULL,
  PRIMARY KEY (`id_img`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`catalog` (
  `id_catalog` INT NOT NULL,
  `catalog_name` VARCHAR(45) NULL,
  `catalog_description` TEXT NULL,
  PRIMARY KEY (`id_catalog`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`product` (
  `id_product` INT NOT NULL,
  `product_name` VARCHAR(50) NULL,
  `quantity` INT NULL,
  `current_price` INT NULL,
  `old_price` INT NULL,
  `promo_price` INT NULL,
  `description` TEXT NULL,
  `main_catalog` INT NOT NULL,
  `main_img` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_product_image1_idx` (`main_img` ASC) VISIBLE,
  INDEX `fk2_idx` (`main_catalog` ASC) VISIBLE,
  CONSTRAINT `fk_product_image1`
    FOREIGN KEY (`main_img`)
    REFERENCES `Store`.`image` (`id_img`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk2`
    FOREIGN KEY (`main_catalog`)
    REFERENCES `Store`.`catalog` (`id_catalog`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`catalog_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`catalog_has_product` (
  `catalog_id_catalog` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  PRIMARY KEY (`catalog_id_catalog`, `product_id_product`),
  INDEX `fk_catalog_has_product_product1_idx` (`product_id_product` ASC) VISIBLE,
  INDEX `fk_catalog_has_product_catalog_idx` (`catalog_id_catalog` ASC) VISIBLE,
  CONSTRAINT `fk_catalog_has_product_catalog`
    FOREIGN KEY (`catalog_id_catalog`)
    REFERENCES `Store`.`catalog` (`id_catalog`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_catalog_has_product_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `Store`.`product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`product_has_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`product_has_image` (
  `product_id_product` INT NOT NULL,
  `image_id_img` INT NOT NULL,
  PRIMARY KEY (`product_id_product`, `image_id_img`),
  INDEX `fk_product_has_image_image1_idx` (`image_id_img` ASC) VISIBLE,
  INDEX `fk_product_has_image_product1_idx` (`product_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_image_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `Store`.`product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_has_image_image1`
    FOREIGN KEY (`image_id_img`)
    REFERENCES `Store`.`image` (`id_img`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


