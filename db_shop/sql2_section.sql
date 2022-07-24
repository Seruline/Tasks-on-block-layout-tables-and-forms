-- -----------------------------------------------------
-- Страница раздела с постстраничной навигацией товаров
-- -----------------------------------------------------


SELECT `catalog`.`catalog_name`, `catalog`.`catalog_description`, `product`.`product_name`, `product_image`.`main_alt`, `product_image`.`main_url` FROM `catalog_has_product` 
JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog` = `catalog`.`id_catalog` 
JOIN `product` ON `catalog_has_product`.`product_id_product` = `product`.`id_product` 
JOIN `product_image` ON `product`.`name_group_img` =`product_image`.`id_img` 
WHERE `catalog`.`catalog_name`= 'Женщинам' LIMIT 0,12;