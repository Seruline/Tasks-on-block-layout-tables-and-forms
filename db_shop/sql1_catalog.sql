-- -----------------------------------------------------
-- Отсортированный каталог с количеством товаров внутри
-- -----------------------------------------------------


SELECT `catalog`.`catalog_name`, COUNT(*) AS `count_product_in_catalog` FROM `catalog_has_product` JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog`=`catalog`.`id_catalog` 
WHERE `catalog`.`id_catalog`=`catalog_has_product`.`catalog_id_catalog` 
GROUP BY `catalog_has_product`.`catalog_id_catalog` 
ORDER BY `count_product_in_catalog` DESC;