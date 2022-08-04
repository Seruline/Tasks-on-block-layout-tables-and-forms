<title>Catalog</title>
<?php
include 'sql-query.php';

$c = getCatalog($db); // получение каталога
$cat_id = intval($_GET['cat_id']);
if ($cat_id){ // если сущствует
    $active_e = getCountActiveProduct($db, $cat_id); //получаем кол-во товаров внутри каталога, для послед. получ. кол-ва страниц
} else{
    header('Location: error/404.php');
}
$page = isset($_GET['page']) ? $_GET['page']: 1; //начальоне значение страницы
$page = intval($page); //page целое число

// Выбросит на 404 неккоретные данные
if (isset($_GET['page'])) {
    if ($page < 1) {
        header('Location: error/404.php');
    }
}
$limit = 12;
$act_e_in_cat = $active_e[0][0]; //кол-во товаров внутри каталога
$count_pages = ceil($act_e_in_cat / $limit); // кол-во страниц
$offset = $limit * ($page - 1);

// Выбросит на 404 неккоретные данные
if ($page > $count_pages ){
    $page = $count_pages;
}
$q = productInCatalog($db, $cat_id, $limit, $offset); // постраничный вывод товара, данного каталога
if (!$q) { // 404, если введен не известный cat_id
    header('Location: error/404.php');
}

?>
<div class="page">
    <div class="widget">
        <h3 class="widget-title">Категории</h3>
    <?php foreach ($c as $value) { ?>
        <div class="widget_catalog">
            <a class="widget_category" href="catalog.php?cat_id=<?=$value['id_catalog']?>"><?=$value['catalog_name'] ?></a>
            <div class="widget_category-count triangle"><?=$value['count_product_in_catalog'] ?><br></div>
        </div> <?php } ?>
    </div>
    <div class="main-info">
    <div>
        <h2 class="preview_main-catalog">Главная/ <?=$q[0][3] ?></h2>
        <a class="callback" href="products.php">&#8592; Главная страница</a>
        <div class="preview-catalog_description"><?=$q[0][4] ?></div>
    </div>
        <div class="pagination">
            <div class="str">стр.</div>
            <?php
            for ($i = 1; $i <= $count_pages; $i++){
                echo "<a class='pagination-link' href='?cat_id={$cat_id}&page={$i}'>$i</a>";
            }
            ?>
        </div>
    <div class="section">
        <?php
         foreach ($q as $value) {
            $prod_id = $value['id_product'];
            $main_cat = getMainCatalog($db, $prod_id); ?>
            <a class="preview" href="product.php?id=<?=$value['id_product']?>">
                <img class="preview-img" src=<?=$value['url_img'] ?> alt=<?=$value['alt'] ?>>
                <div class="preview-name"><?=$value['product_name'] ?></div>
                <div class="preview-main_cat"><?=$main_cat[0][0] ?> </div>
                <div class="preview_price">
                    <div class="preview_current-price"><?=$value['current_price'] ?></div>
                    <strike class="preview_old-price"><?=$value['old_price'] ?></strike>
                </div>
            </a>
            <?php } ?>
    </div>
    </div>
    </div>
</div>

