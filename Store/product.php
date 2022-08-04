<title>Product</title>

<?php
include 'sql-query.php';

$id = intval($_GET['id']);

$product_info = getInfoProduct($db, $id); // информация о продукте и его каталоги , гл. картинка

if (!$product_info){
    header('Location: error/404.php');
}

$m_cat = getMainCatalog($db, $id);  // гл. категория товара
$im = getImage($db, $id); // Картинки товара
?>
<h2 class="title-page">Товар <?= $product_info[0][0]?></h2>
<?php
$previous = "javascript:history.go(-1)";
if(isset($_SERVER['HTTP_REFERER'])) { ?>
    <a class="back" href="<?= $previous?>">&#8592; Назад</a>
<?php } else{ ?>
    <a class="back" href="catalog.php?cat_id=<?= $m_cat[0][1]?>" class="main_page-title">&#8592; Назад</a>
<?php }?>

<div class="container">
    <div class="product">
        <!--    Gallary    -->
        <div class="product_gallery">
            <?php foreach ($im as $value) { ?>
            <img class="product_gallery-obj image1" src="<?= $value['url_img']?>" alt="<?= $value['alt']?>">
            <?php } ?>
        </div>
        <div class="product_showing">
            <img class="product_main image0" src="<?= $product_info[0][7]?>">
        </div>
        <!--    Description    -->
        <div class="product_description">
            <h2 class="product_title"><?= $product_info[0][0]?></h2>
            <div class="product_categories">
                <?php foreach ($product_info as $value) { ?>
                <a href="catalog.php?cat_id=<?= $value['id_catalog']?>"><?= $value['catalog_name']?></a>
                <?php } ?>
            </div>
            <div class="product_price">
                <div class="product_old-price"><?= $product_info[0][3]?></div>
                <div class="product_current-price currency"><?= $product_info[0][2]?></div>
                <div class="product_promo-price currency"><?= $product_info[0][4]?></div>
                <div class="product_text-price">- с промокодом</div>
            </div>
            <div class="product_info">
                <div class="product_info-advantage">
                    <img class="icon_mini" src="./img/icon/checkmark.svg">
                    <div class="product_info-point"> В наличии в магазине <a href="https://www.lamoda.ru/p/me024ewghl35/clothes-medicine-rubashka/" target="_blank">Lamoda</a></div>
                </div>
                <div class="product_info-advantage">
                    <img class="icon_mini" src="./img/icon/business.svg">
                    <div class="product_info-point">Бесплатаня доставка</div>
                </div>
            </div>
            <div class="product_btn">
                <button class="btn btn--blue">В магазин</button>
                <button class="btn">В избранное</button>
            </div>
            <div class="product_text">
                <p><?= $product_info[0][5]?></p>
            </div>
            <div class="product_forwarding">
                <div class="product_forwarding-title">Поделиться:</div>
                <div class="product_forwarding-list">
                    <a class="ico" href="#" target="_blank"><img class="icon" src="./img/icon/vk_icon.svg" alt="vk"></a>
                    <a class="ico" href="#" target="_blank"><img class="icon" src="./img/icon/facebook_icon.svg" alt="facebook"></a>
                    <a href="#" target="_blank"><img class="icon" src="./img/icon/google_icon.svg" alt="google"></a>
                </div>
            </div>
        </div>
    </div>
</div>
