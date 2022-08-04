CREATE DATABASE store;
USE store;


CREATE TABLE `catalog` (
  `id_catalog` int NOT NULL,
  `catalog_name` varchar(45) DEFAULT NULL,
  `catalog_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
(10, 'Женщинам', 'Лучшие предложения раздела «Женщинам»'),
(11, 'Обувь', 'Описание обувь'),
(12, 'Аксессуары', 'Описание аксессуары '),
(13, 'Рубашки', 'Описание рубашки'),
(14, 'Штаны', 'Описание штаны'),
(15, 'Майки', 'Лучшие предложения раздела «Майки»'),
(16, 'Сумки', 'Описание сумки'),
(17, 'Джинсы', 'Описание джинсы'),
(18, 'Брюки', 'Описание брюк'),
(19, 'Комбинезоны', 'Описание комбинезоны '),
(20, 'Костюмы', 'Описание костюмы'),
(21, 'Юбки', 'Описание юбок');


CREATE TABLE `catalog_has_product` (
  `catalog_id_catalog` int NOT NULL,
  `product_id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `catalog_has_product` (`catalog_id_catalog`, `product_id_product`) VALUES
(3, 1),
(4, 1),
(10, 1),
(3, 2),
(9, 2),
(10, 2),
(17, 2),
(3, 3),
(10, 3),
(21, 3),
(1, 4),
(2, 4),
(3, 4),
(10, 4),
(10, 5),
(12, 5),
(2, 6),
(3, 6),
(10, 6),
(3, 7),
(4, 7),
(9, 7),
(10, 7),
(1, 8),
(10, 8),
(15, 8),
(3, 9),
(9, 9),
(10, 9),
(17, 9),
(10, 10),
(12, 10),
(1, 11),
(10, 11),
(15, 11),
(1, 12),
(4, 12),
(5, 12),
(10, 12),
(2, 13),
(10, 13);


CREATE TABLE `image` (
  `id_img` int NOT NULL,
  `alt` varchar(80) NOT NULL,
  `url_img` varchar(210) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `image` (`id_img`, `alt`, `url_img`) VALUES
(1, 'Джинсы Springfield 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0FGOA_17549344_1_v1_2x.jpeg'),
(2, 'Пиджаки Zarina', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599658_1_v1_2x.jpeg'),
(3, 'Юбка Milano 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLAAS913401_15386742_1_v1_2x.jpg'),
(4, 'Юбка Milano фото в полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg'),
(5, 'Юбка Milano вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(6, 'Платье Jimmy Sanders', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg'),
(7, 'Сумка Guess', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg'),
(8, 'Майка Lime 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JZ94_17622507_1_v1.jpeg'),
(9, 'Майка Lime Вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(10, 'Майка My Choice', '//a.lmcdn.ru/img600x866/R/T/RTLABK003801_16994331_1_v1_2x.jpg'),
(11, 'Сумка Karl Lagerfeld', '//a.lmcdn.ru/img600x866/R/T/RTLAAM460301_14660483_1_v2_2x.jpg\"'),
(12, 'Платье Plutocrat', '//a.lmcdn.ru/img600x866/M/P/MP002XW07K5Z_14571987_1_v1_2x.jpg'),
(13, 'Костюм 2Mood', '//a.lmcdn.ru/img600x866/M/P/MP002XW0D4KX_17094325_1_v1_2x.jpeg'),
(14, 'Платье Trends Brands', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(15, 'Джинсы Springfield', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg'),
(16, 'Сумка Guess', '//a.lmcdn.ru/img600x866/R/T/RTLABP367301_17678465_1_v1.jpg'),
(17, 'Пиджак Jimmy Sanders на модели 90/60/90', 'https://a.lmcdn.ru/img600x866/R/T/RTLABP380401_17679806_1_v1_2x.jpg'),
(18, 'Пиджак Jimmy Sanders Вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
(19, 'Пиджак Zarina вид сзади', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599660_3_v1_2x.jpeg'),
(20, 'Пиджак Zarina вид сзади', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599660_3_v1_2x.jpeg'),
(21, 'Пиджак Zarina в полный рост', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599659_2_v1_2x.jpeg');


CREATE TABLE `product` (
  `id_product` int NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `current_price` int DEFAULT NULL,
  `old_price` int DEFAULT NULL,
  `promo_price` int DEFAULT NULL,
  `description` text,
  `main_catalog` int NOT NULL,
  `main_img` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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


CREATE TABLE `product_has_image` (
  `product_id_product` int NOT NULL,
  `image_id_img` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
(2, 15),
(7, 17),
(1, 20),
(1, 21);


ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id_catalog`);

ALTER TABLE `catalog_has_product`
  ADD PRIMARY KEY (`catalog_id_catalog`,`product_id_product`),
  ADD KEY `fk_catalog_has_product_product1_idx` (`product_id_product`),
  ADD KEY `fk_catalog_has_product_catalog_idx` (`catalog_id_catalog`);


ALTER TABLE `image`
  ADD PRIMARY KEY (`id_img`);


ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_product_image1_idx` (`main_img`),
  ADD KEY `fk2_idx` (`main_catalog`);


ALTER TABLE `product_has_image`
  ADD PRIMARY KEY (`product_id_product`,`image_id_img`),
  ADD KEY `fk_product_has_image_image1_idx` (`image_id_img`),
  ADD KEY `fk_product_has_image_product1_idx` (`product_id_product`);


ALTER TABLE `catalog_has_product`
  ADD CONSTRAINT `fk_catalog_has_product_catalog` FOREIGN KEY (`catalog_id_catalog`) REFERENCES `catalog` (`id_catalog`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_has_product_product1` FOREIGN KEY (`product_id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `product`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`main_catalog`) REFERENCES `catalog` (`id_catalog`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_image1` FOREIGN KEY (`main_img`) REFERENCES `image` (`id_img`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `product_has_image`
  ADD CONSTRAINT `fk_product_has_image_image1` FOREIGN KEY (`image_id_img`) REFERENCES `image` (`id_img`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_has_image_product1` FOREIGN KEY (`product_id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

