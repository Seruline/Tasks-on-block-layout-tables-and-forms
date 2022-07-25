
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema online_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_store` DEFAULT CHARACTER SET utf8 ;
USE `online_store` ;

-- -----------------------------------------------------
-- Table `online_store`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`product` (
  `id_product` INT NOT NULL,
  `product_name` VARCHAR(50) NULL,
  `quantity` INT NULL,
  `current_price` INT NULL,
  `old_price` INT NULL,
  `promo_price` INT NULL,
  `description` TEXT NULL,
  `main_catalog` INT NOT NULL,
  PRIMARY KEY (`id_product`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`catalog` (
  `id_catalog` INT NOT NULL,
  `catalog_name` VARCHAR(45) NULL,
  `catalog_description` TEXT NULL,
  PRIMARY KEY (`id_catalog`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`catalog_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`catalog_has_product` (
  `catalog_id_catalog` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  PRIMARY KEY (`catalog_id_catalog`, `product_id_product`),
  INDEX `fk_catalog_has_product_product1_idx` (`product_id_product` ASC) VISIBLE,
  INDEX `fk_catalog_has_product_catalog_idx` (`catalog_id_catalog` ASC) VISIBLE,
  CONSTRAINT `fk_catalog_has_product_catalog`
    FOREIGN KEY (`catalog_id_catalog`)
    REFERENCES `online_store`.`catalog` (`id_catalog`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_catalog_has_product_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `online_store`.`product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`image` (
  `id_img` INT NOT NULL,
  `img_name` VARCHAR(70) NOT NULL,
  `alt` VARCHAR(80) NOT NULL,
  `url_img` VARCHAR(210) NOT NULL,
  PRIMARY KEY (`id_img`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`product_has_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`product_has_image` (
  `product_id_product` INT NOT NULL,
  `image_id_img` INT NOT NULL,
  PRIMARY KEY (`product_id_product`, `image_id_img`),
  INDEX `fk_product_has_image_image1_idx` (`image_id_img` ASC) VISIBLE,
  INDEX `fk_product_has_image_product1_idx` (`product_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_image_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `online_store`.`product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_has_image_image1`
    FOREIGN KEY (`image_id_img`)
    REFERENCES `online_store`.`image` (`id_img`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`product_mainImg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`product_mainImg` (
  `id_prod` INT NOT NULL,
  `id_img` INT NOT NULL,
  PRIMARY KEY (`id_prod`, `id_img`),
  INDEX `fk_product_mainImg_image1_idx` (`id_img` ASC) VISIBLE,
  UNIQUE INDEX `id_prod_UNIQUE` (`id_prod` ASC) VISIBLE,
  CONSTRAINT `fk_product_mainImg_image1`
    FOREIGN KEY (`id_img`)
    REFERENCES `online_store`.`image` (`id_img`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_mainImg_product1`
    FOREIGN KEY (`id_prod`)
    REFERENCES `online_store`.`product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Adding data to a table `online_store`.`catalog`
-- -----------------------------------------------------
INSERT INTO `catalog` (`id_catalog`, `catalog_name`, `catalog_description`) VALUES
(1, 'Новинки', 'Лучшие новинки этого сезона!'),
(2, 'Платья', 'Волшебные платья. Огромный выбор и расцветок для вашего настроения.'),
(3, 'Одежда', 'Описание одежда'),
(4, 'Пиджаки и костюмы', 'Большой выбор пиджаков и костюмов!'),
(5, 'Бренды', 'Бренды'),
(6, 'Спорт', 'Большой выбор спортивных костюмов'),
(7, 'Красота', 'Красота'),
(8, 'Детям', 'Лучшее детям'),
(9, 'Мужчинам', 'Для мужчин '),
(10, 'Женщинам', 'Для женщин'),
(11, 'Обувь', 'Описание обувь'),
(12, 'Аксессуары', 'Описание аксессуары '),
(13, 'Рубашки', 'Описание рубашки'),
(14, 'Штаны', 'Описание штаны'),
(15, 'Майки', 'Описание майки'),
(16, 'Сумки', 'Описание сумки'),
(17, 'Джинсы', 'Описание джинсы'),
(18, 'Брюки', 'Описание брюк'),
(19, 'Комбинезоны', 'Описание комбинезоны '),
(20, 'Костюмы', 'Описание костюмы'),
(21, 'Юбки', 'Описание юбок');

-- -----------------------------------------------------
-- Adding data to a table `online_store`.`product`
-- -----------------------------------------------------
INSERT INTO `product` (`id_product`, `product_name`, `quantity`, `current_price`, `old_price`, `promo_price`, `description`, `main_catalog`) VALUES
(1, 'Пиджак Zarina', 50, 3999, 4800, 3599, 'Описание Пиджак Zarina', 4),
(2, 'Джинсы Springfield', 100, 8000, 8599, 7899, 'Описание Джинсы Springfield', 17),
(3, 'Юбка Milano', 54, 5799, 6999, 5099, 'Описание Юбка Milano', 21),
(4, 'Платье Jimmy Sanders', 40, 3999, 4800, 3599, 'Описание Платье Jimmy Sanders', 2),
(5, 'Сумка Guess', 50, 2399, 4000, 1999, 'Описание Сумка Guess', 12),
(6, 'Платье Trends Brands', 67, 13260, 13999, 13000, 'Описание Платье Trends Brands', 2),
(7, 'Пиджак Jimmy Sanders', 90, 5000, 7800, 4399, 'Описание Пиджак Jimmy Sanders', 4),
(8, 'Майка Lime', 150, 1200, 1500, 999, 'Описание Майка Lime', 15),
(9, 'Джинсы Zarina', 50, 3699, 5000, 3199, 'Описание Джинсы Zarina', 17),
(10, 'Сумка Karl Lagerfeld', 24, 16999, 21000, 16199, 'Описание Сумка Karl Lagerfeld', 12),
(11, 'Майка My Choice', 15, 2600, 6000, 2100, 'Описание майки', 15),
(12, 'Костюм 2Mood', 23, 12300, 16599, 12000, 'Описание зеленого костюма', 4),
(13, 'Платье Plutocrat', 39, 14250, 28400, 13999, 'Описание платья', 2);

-- -----------------------------------------------------
-- Adding data to a table `online_store`.`image`
-- -----------------------------------------------------
INSERT INTO `image` (`id_img`, `img_name`, `alt`, `url_img`) 
VALUES ('001', 'Джинсы Springfield', 'Джинсы Springfield 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673572_1_v1_2x.jpg'),
('002', 'Пиджаки Zarina', '90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599658_1_v1_2x.jpeg'),
('003', 'Юбка Milano', 'Джинсы Springfield 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673572_1_v1_2x.jpg'),
('004', 'Юбка Milano фото в полный рост', 'Полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg'),
('005', 'Юбка Milano фото сзади', 'Юбка Milano вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
('006', 'Платье Jimmy Sanders', '90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg'),
('007', 'Сумка Guess', 'Вид на модели', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg'),
('008', 'Майка Lime', 'На модели 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JZ94_17622507_1_v1.jpeg'),
('009', 'Майка Lime', 'Вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(10, 'Майка My Choice', 'Майка 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABK003801_16994331_1_v1_2x.jpg'),
(11, 'Сумка Karl Lagerfeld', 'Сумка', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599658_1_v1_2x.jpeg'),
(12, 'Платье Plutocrat', 'Джинсы Springfield 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW07K5Z_14571987_1_v1_2x.jpg'),
(13, 'Костюм 2Mood', 'Полный рост', '//a.lmcdn.ru/img600x866/M/P/MP002XW0D4KX_17094325_1_v1_2x.jpeg'),
(14, 'Платье Trends Brands', 'Платье вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(15, 'Джинсы Springfield', '90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg'),
(16, 'Сумка Guess', 'Вид на модели', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg'),
(17, 'Пиджак Jimmy Sanders', 'На модели 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JZ94_17622507_1_v1.jpeg'),
(18, 'Пиджак Jimmy Sanders', 'Вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg');

-- -----------------------------------------------------
-- Adding data to a table `online_store`.`catalog_has_product`
-- -----------------------------------------------------
INSERT INTO `catalog_has_product` (`catalog_id_catalog`, `product_id_product`) VALUES
(3, 1), (4, 1), (10, 1),
(3, 2), (9, 2), (10, 2), (17, 2),
(3, 3), (10, 3), (21, 3),
(1, 4), (2, 4), (3, 4), (10, 4),
(10, 5), (12, 5),
(2, 6), (3, 6), (10, 6),
(3, 7), (4, 7), (9, 7), (10, 7),
(1, 8), (10, 8), (15, 8),
(3, 9), (9, 9), (10, 9), (17, 9),
(10, 10), (12, 10),
(1, 11), (10, 11), (15, 11),
(1, 12), (4, 12), (5, 12), (10, 12),
(2, 13), (10, 13);


-- -----------------------------------------------------
-- Adding data to a table `online_store`.`product_has_image`
-- -----------------------------------------------------
INSERT INTO `product_has_image` (`product_id_product`, `image_id_img`) 
VALUES ('1', '2'), ('1', '12'),
('2', '1'), ('2', '15'),
('3', '3'), ('3', '4'), ('3', '5'), 
('8', '8'), ('8', '9'), ('8', '10'),
('7', '2'), ('7', '17');

-- -----------------------------------------------------
-- Adding data to a table `online_store`.`product_mainimg`
-- -----------------------------------------------------
INSERT INTO `product_mainimg` (`id_prod`, `id_img`) 
VALUES ('1', '2'),
('2', '1'),
('3', '3'),
('4', '6'),
('5', '16'),
('6', '14'),
('7', '17'),
('8', '8'),
('9', '1'),
('10', '7'),
('11', '10'),
('12', '13'),
('13', '12');