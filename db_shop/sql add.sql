-- -----------------------------------------------------
-- Table `shop`.`catalog`
-- -----------------------------------------------------
INSERT INTO `catalog` (`id_catalog`, `catalog_name`, `catalog_description`)
VALUES ('1', 'Новинки', 'Лучшие новинки этого сезона!'),
('2', 'Платья', 'Волшебные платья. Огромный выбор и расцветок для вашего настроения.'),
('3', 'Одежда', ''),
('4', 'Пиджаки и костюмы', 'Новинки этого сезона'),
('5', 'Бренды', 'Новинки этого сезона'),
('6', 'Спорт', 'Новинки этого сезона'),
('7', 'Красота', 'Новинки этого сезона'),
('8', 'Детям', 'Новинки этого сезона'),
('9', 'Мужчинам', 'Новинки этого сезона'),
('10', 'Женщинам', 'Новинки этого сезона'),
('11', 'Обувь', 'Новинки этого сезона'),
('12', 'Аксессуары', 'Новинки этого сезона'),
('13', 'Рубашки', 'Новинки этого сезона'),
('14', 'Штаны', 'Новинки этого сезона'),
('15', 'Майки', 'Новинки этого сезона'),
('16', 'Сумки', 'Новинки этого сезона'),
('17', 'Джинсы', 'Новинки этого сезона'),
('18', 'Брюки', 'Новинки этого сезона'),
('19', 'Комбинезоны', 'Новинки этого сезона'),
('20', 'Костюмы', 'Новинки этого сезона'),
('21', 'Юбки', 'Новинки этого сезона');



-- -----------------------------------------------------
-- Table `shop`.`product`
-- -----------------------------------------------------
INSERT INTO `product` (`id_product`, `product_name`, `quantity`, `current_price`, `old_price`, `promo_price`, `description`, `main_catalog`) 
VALUES ('1', 'Пиджак Zarina', '50', '3999', '4800', '3599', 'Описание', '2'),
('2', 'Джинсы Springfield', '100', '8000', '8599', '7899', 'Описание', '1'),
('3', 'Юбка Milano', '54', '5799', '6999', '5099', 'Описание', '3'),
('4', 'Платье Jimmy Sanders', '40', '3999', '4800', '3599', 'Описание', '4'),
('5', 'Сумка Guess', '50', '2399', '4000', '1999', 'Описание', '5'),
('6', 'Платье Trends Brands', '67', '13260', '13999', '13000', 'Описание', '6'),
('7', 'Пиджак Jimmy Sanders', '90', '5000', '7800', '4399', 'Описание', '7'),
('8', 'Майка Lime', '150', '1200', '1500', '999', 'Описание', '8'),
('9', 'Джинсы Zarina', '50', '3699', '5000', '3199', 'Описание', '9'),
('10', 'Сумка Karl Lagerfeld', '24', '16999', '21000', '16199', 'Описание', '10'),
('11', 'Майка My Choice', '15', '2600', '6000', '2100', 'Описание майки', '15'),
('12', 'Костюм 2Mood', '23', '12300', '16599', '12000', 'Описание зеленого костюма', '4'),
('13', 'Платье Plutocrat', '39', '14250', '28400', '13999', 'Описание платья', '2');



-- -----------------------------------------------------
-- Table `shop`.`product_image`
-- -----------------------------------------------------
INSERT INTO `product_image` (`id_img`, `name_group_img`, `main_alt`, `main_url`, `img01_alt`, `img01_url`, `img02_alt`, `img02_url`, `img03_alt`, `img03_url`) 
VALUES ('001', 'Джинсы Springfield', 'Джинсы 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673572_1_v1_2x.jpg', 'Джинсы  полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673573_2_v1_2x.jpg', 'Джинсы вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673574_3_v1_2x.jpg', 'Джинсы Springfield ткань', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673575_4_v1_2x.jpg'),
('002', 'Пиджаки Zarina', 'Пиджак Zarina 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599658_1_v1_2x.jpeg', 'Пиджак Zarina полный рост', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599659_2_v1_2x.jpeg', 'Пиджак Zarina вид сзади', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599660_3_v1_2x.jpeg', 'Пиджак Zarina воротник', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599661_4_v1_2x.jpeg'),
('003', 'Юбка Milano', 'Юбка Milano 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg', 'Юбка Milano полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg', 'Юбка Milano вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg', 'Юбка Milano', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
('004', 'Платье Jimmy Sanders', 'Платье Jimmy Sanders 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP386301_17679831_1_v1_2x.jpg', 'Платье Jimmy Sanders полный рост', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599659_2_v1_2x.jpeg', 'Платье Jimmy Sanders вид сзади', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599660_3_v1_2x.jpeg', 'Платье Jimmy Sanders воротник', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599661_4_v1_2x.jpeg'),
('005', 'Сумка Guess', 'Сумка Guess 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679896_1_v1_2x.jpg', 'Сумка Guess полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg', 'Сумка Guess вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg', 'Сумка Guess', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
('006', 'Платье Trends Brands', 'Джинсы 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JYY9_17648280_1_v1_2x.jpg', 'Платье Trends Brands полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673573_2_v1_2x.jpg', 'Платье Trends Brands', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673574_3_v1_2x.jpg', 'Платье Trends Brands', '//a.lmcdn.ru/img600x866/R/T/RTLABQ149001_17673575_4_v1_2x.jpg'),
('007', 'Пиджак Jimmy Sanders', 'Пиджак 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP380401_17679806_1_v1_2x.jpg', 'Пиджак полный рост', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599659_2_v1_2x.jpeg', 'Пиджак вид сзади', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599660_3_v1_2x.jpeg', 'Zarina ткань', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599661_4_v1_2x.jpeg'),
('008', 'Майка Lime', 'Майка 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JZ94_17622507_1_v1.jpeg', 'Майка Lime полный рост', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg', 'Майка Lime вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg', 'Майка Lime ткань', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg'),
('009', 'Джинсы Zarina', 'Джинсы Zarina 90/60/90', '//a.lmcdn.ru/img600x866/M/P/MP002XW0K0YA_17650682_1_v1_2x.jpeg', 'Джинсы Zarina', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599659_2_v1_2x.jpeg', 'Джинсы Zarina вид сзади', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599660_3_v1_2x.jpeg', 'Джинсы Zarina ткань', '//a.lmcdn.ru/img600x866/M/P/MP002XW0JXKB_17599661_4_v1_2x.jpeg'),
('010', 'Сумка Karl Lagerfeld', 'Сумка Karl Lagerfeld 90/60/90', '//a.lmcdn.ru/img600x866/R/T/RTLABP530501_17598145_1_v1_2x.jpg', 'Сумка Karl Lagerfeld на модели', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679897_2_v1_2x.jpg', 'Сумка Karl Lagerfeld вид сзади', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg', 'Сумка Karl Lagerfeld', '//a.lmcdn.ru/img600x866/R/T/RTLABP056001_17679898_3_v1_2x.jpg');



-- -----------------------------------------------------
-- Table `shop`.`catalog_has_product`
-- -----------------------------------------------------
INSERT INTO `catalog_has_product` (`catalog_id_catalog`, `product_id_product`) 
VALUES ('10', '1'), ('3', '1'), ('4', '1'),
('9', '2'), ('10', '2'), ('3', '2'), ('17', '2'),
('21', '3'), ('10', '3'), ('3', '3'),
('1', '4'), ('10', '4'), ('3', '4'), ('2', '4'),
('12', '5'), ('10', '5'),
('10', '6'), ('3', '6'), ('2', '6'),
('9', '7'), ('10', '7'), ('3', '7'), ('4', '7'),
('15', '8'), ('10', '8'), ('1', '8'),
('9', '9'), ('10', '9'), ('3', '9'), ('17', '9'),
('12', '10'), ('10', '10'),
('15', '11'), ('10', '11'), ('1', '11'),
('4', '12'), ('10', '12'), ('5', '12'), ('1', '12'),
('10', '13'), ('2', '13');