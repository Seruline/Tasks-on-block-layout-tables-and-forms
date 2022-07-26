CREATE DATABASE Store;
USE Store;

-- -----------------------------------------------------
-- Table `Store`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`image` (
  `id_img` INT NOT NULL,
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



-- -----------------------------------------------------
-- Adding data to a table `on_store`.`catalog`
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
-- Adding data to a table `on_store`.`image`
-- -----------------------------------------------------
INSERT INTO `image` (`id_img`, `alt`, `url_img`) VALUES
(1, 'Джинсы Springfield 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673572_1_v1_2x.jpg'),
(2, 'Пиджаки Zarina', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599658_1_v1_2x.jpeg'),
(3, 'Юбка Milano 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673572_1_v1_2x.jpg'),
(4, 'Юбка Milano фото в полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg'),
(5, 'Юбка Milano вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(6, 'Платье Jimmy Sanders', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg'),
(7, 'Сумка Guess', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg'),
(8, 'Майка Lime 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JZ94_17622507_1_v1.jpeg'),
(9, 'Майка Lime Вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(10, 'Майка My Choice', '//a.lmcdn.ru/img600x866/R/T/RTLABK003801_16994331_1_v1_2x.jpg'),
(11, 'Сумка Karl Lagerfeld', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599658_1_v1_2x.jpeg'),
(12, 'Платье Plutocrat', '//a.lmcdn.ru/img600x866/M/P/MP002XW07K5Z_14571987_1_v1_2x.jpg'),
(13, 'Костюм 2Mood', '//a.lmcdn.ru/img600x866/M/P/MP002XW0D4KX_17094325_1_v1_2x.jpeg'),
(14, 'Платье Trends Brands', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(15, 'Джинсы Springfield', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg'),
(16, 'Сумка Guess', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg'),
(17, 'Пиджак Jimmy Sanders на модели 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JZ94_17622507_1_v1.jpeg'),
(18, 'Пиджак Jimmy Sanders Вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg');


-- -----------------------------------------------------
-- Adding data to a table `on_store`.`product`
-- -----------------------------------------------------
INSERT INTO `product` (`id_product`, `product_name`, `quantity`, `current_price`, `old_price`, `promo_price`, `description`, `main_catalog`, `main_img`) VALUES
(1, 'Пиджак Zarina', 50, 3999, 4800, 3599, 'Описание Пиджак Zarina', 4, 2),
(2, 'Джинсы Springfield', 100, 8000, 8599, 7899, 'Описание Джинсы Springfield', 17, 1),
(3, 'Юбка Milano', 54, 5799, 6999, 5099, 'Описание Юбка Milano', 21, 3),
(4, 'Платье Jimmy Sanders', 40, 3999, 4800, 3599, 'Описание Платье Jimmy Sanders', 2, 6),
(5, 'Сумка Guess', 50, 2399, 4000, 1999, 'Описание Сумка Guess', 12, 16),
(6, 'Платье Trends Brands', 67, 13260, 13999, 13000, 'Описание Платье Trends Brands', 2, 14),
(7, 'Пиджак Jimmy Sanders', 90, 5000, 7800, 4399, 'Описание Пиджак Jimmy Sanders', 4, 17),
(8, 'Майка Lime', 150, 1200, 1500, 999, 'Описание Майка Lime', 15, 8),
(9, 'Джинсы Zarina', 50, 3699, 5000, 3199, 'Описание Джинсы Zarina', 17, 1),
(10, 'Сумка Karl Lagerfeld', 24, 16999, 21000, 16199, 'Описание Сумка Karl Lagerfeld', 12, 7),
(11, 'Майка My Choice', 15, 2600, 6000, 2100, 'Описание майки', 15, 10),
(12, 'Костюм 2Mood', 23, 12300, 16599, 12000, 'Описание зеленого костюма', 4, 13),
(13, 'Платье Plutocrat', 39, 14250, 28400, 13999, 'Описание платья', 2, 12);

-- -----------------------------------------------------
-- Adding data to a table `on_store`.`catalog_has_product`
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
-- Adding data to a table `on_store`.`product_has_image`
-- -----------------------------------------------------
INSERT INTO `product_has_image` (`product_id_product`, `image_id_img`) VALUES
(2, 1),
(1, 2),
(7, 2),
(3, 3),
(3, 4),
(3, 5),
(8, 8),
(8, 9),
(8, 10),
(1, 12),
(2, 15),
(7, 17);

