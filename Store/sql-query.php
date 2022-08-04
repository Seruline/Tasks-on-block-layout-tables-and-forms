<?php
include 'config.php';

// --page catalog-- //
// Получение каталога с выводом кол-ва товаров внутри в обратном порядке
function getCatalog($db)
{
    $query = $db->prepare("SELECT `catalog`.`id_catalog`, `catalog`.`catalog_name`, COUNT(*) AS `count_product_in_catalog` FROM `catalog_has_product` JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog`=`catalog`.`id_catalog` 
    WHERE `catalog`.`id_catalog`=`catalog_has_product`.`catalog_id_catalog` 
    GROUP BY `catalog_has_product`.`catalog_id_catalog` 
    ORDER BY `count_product_in_catalog` DESC;");
    $query->execute();
    $c = $query->fetchAll();
    return $c;
}
// Получение кол-ва товара внутри данного каталога
function getCountActiveProduct($db, $cat_id)
{
    $active_entries = $db->prepare("SELECT COUNT(`product`.`id_product`) activ_e FROM `catalog_has_product`
    JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog` = `catalog`.`id_catalog`
    JOIN `product`ON `catalog_has_product`.`product_id_product` = `product`.`id_product`
    WHERE `catalog`.`id_catalog` = $cat_id;");
    $active_entries->execute();
    $active_e = $active_entries->fetchAll();
    return $active_e;
}
// Получение товаров данного катлога, пагинация
function productInCatalog($db, $cat_id, $limit, $offset)
{
    $query_section = $db->prepare("SELECT `product`.`old_price`, `product`.`current_price`, `product`.`id_product`,`catalog`.`catalog_name`, `catalog`.`catalog_description`, `product`.`product_name`, `image`.`alt`, `image`.`url_img` FROM `catalog_has_product` 
        JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog` = `catalog`.`id_catalog` 
        JOIN `product` ON `catalog_has_product`.`product_id_product` = `product`.`id_product` 
        JOIN `image` ON `image`.`id_img`=`product`.`main_img` 
        WHERE `catalog`.`id_catalog`= $cat_id LIMIT $limit OFFSET $offset;");
    $query_section->execute();
    $q = $query_section->fetchAll();
    return $q;
}
// Получение главного каталога данного товара (используется дважды)
function getMainCatalog($db, $prod_id)
{
    $main_catalog = $db->prepare("SELECT `catalog`.`catalog_name`, `catalog`.`id_catalog` FROM `catalog` 
        JOIN `product` ON `catalog`.`id_catalog` = `product`.`main_catalog` 
        WHERE `product`.`id_product`= $prod_id; ");
    $main_catalog->execute();
    $main_cat = $main_catalog->fetchAll();
    return $main_cat;
}


// --page product-- //
// Получение информации о товаре, главной картинки
function getInfoProduct($db, $id)
{
    $info_prod = $db->prepare("SELECT DISTINCT `product`.`product_name`, `catalog`.`catalog_name`, `product`.`current_price`, `product`.`old_price`, `product`.`promo_price`,`product`.`description`, `image`.`alt`, `image`.`url_img`, `catalog`.`id_catalog`
FROM `catalog_has_product` JOIN `catalog` ON `catalog_has_product`.`catalog_id_catalog` = `catalog`.`id_catalog` 
    JOIN `product` ON `catalog_has_product`.`product_id_product` = `product`.`id_product` 
    JOIN `image` ON `image`.`id_img`=`product`.`main_img` 
    JOIN `product_has_image` ON `product_has_image`.`product_id_product`=`product`.`id_product` 
WHERE `product`.`id_product`=$id;");
    $info_prod->execute();
    $product_info = $info_prod->fetchAll();
    return $product_info;
}

// Получение изображений товара
function getImage($db, $id)
{
    $image = $db->prepare("SELECT DISTINCT `image`.`url_img`, `image`.`alt` FROM `product` 
JOIN `product_has_image` ON `product_has_image`.`product_id_product`=`product`.`id_product` 
JOIN `image` ON `image`.`id_img`=`product_has_image`.`image_id_img`
WHERE `product`.`id_product`= $id;");
    $image->execute();
    $im = $image->fetchAll();
    return $im;
}