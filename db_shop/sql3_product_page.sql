-- -----------------------------------------------------
-- Страница товара с изображениями и списком разделов
-- -----------------------------------------------------


SELECT `product`.`product_name`, `catalog`.`catalog_name`, `product`.`quantity`, `product`.`current_price`, `product`.`old_price`, `product`.`promo_price`, `product`.`description`, `product_image`.`main_alt`, `product_image`.`main_url`, `product_image`.`img01_alt`,`product_image`.`img01_url`, `product_image`.`img02_alt`, `product_image`.`img02_url`, `product_image`.`img03_alt`, `product_image`.`img03_url` FROM `catalog_has_product` 
JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog` = `catalog`.`id_catalog` 
JOIN `product` ON `catalog_has_product`.`product_id_product` = `product`.`id_product` 
JOIN `product_image` ON `product`.`name_group_img` =`product_image`.`id_img` 
WHERE `product`.`product_name`='Пиджак Zarina';