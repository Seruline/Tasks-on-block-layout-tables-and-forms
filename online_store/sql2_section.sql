-- -----------------------------------------------------
-- Страница раздела с постстраничной навигацией товаров
-- -----------------------------------------------------


SELECT `catalog`.`catalog_name`, `catalog`.`catalog_description`, `product`.`product_name`, `image`.`alt`, `image`.`url_img` 
FROM `catalog_has_product` 
JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog` = `catalog`.`id_catalog` 
JOIN `product` ON `catalog_has_product`.`product_id_product` = `product`.`id_product` 
JOIN `product_mainimg` ON `product_mainimg`.`id_prod`=`product`.`id_product` 
JOIN `image` ON `image`.`id_img`=`product_mainimg`.`id_img` 
WHERE `product`.`main_catalog`=`catalog`.`id_catalog` AND `catalog`.`catalog_name`= 'Майки' LIMIT 0,12;