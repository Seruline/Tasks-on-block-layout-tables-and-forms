<title>Products</title>

<?php
include 'sql-query.php';

$c = getCatalog($db);?>
<h2 class="main_page-title">Главная</h2>
<div class="main_page-list">
    <?php foreach ($c as $value) { ?>
    <div class="main_page-catalogs">
        <a class="main_page-link" href="catalog.php?cat_id=<?=$value['id_catalog']?>"><?= $value['catalog_name']?></a>
        <div class="link-count"><?= $value['count_product_in_catalog']?></div>
    </div>
<?php } ?>
</div>
