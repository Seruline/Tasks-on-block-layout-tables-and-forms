<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="form.css">
    <title>Task form</title>
<?php
try {
    $db = new PDO('mysql:host=localhost;dbname=feedback', 'root', '');
    $db->exec("SET NAMES UTF8");

}catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
$query = $db->prepare("SELECT * FROM `feedback`;");
$query->execute();
$q_form = $query->fetchAll();

if (isset($_POST['submit']))  {
    $sql = ("INSERT INTO feedback (`name`, `e_mail`, `year_of_birth`, `gender`, `theme`, `message`, `confirmation`) VALUES (?,?,?,?,?,?,?)");
    $query = $db->prepare($sql);
    $query->execute([$_POST['name'], $_POST['email'],$_POST['date'],$_POST['gender'], $_POST['theme'], $_POST['info'], $_POST['approval']]);
}
?>
    <div>
        <form class="form_container" action="" method="post">
            <fieldset>
                <legend>Форма обратной связи</legend>
                <div class="lab">Имя:</div>
                <input id="name" class="input-st" type="text" name="name" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required><br>
                <div class="lab">e-mail:</div>
                <input type="email" name='email' placeholder="your_address@email.ru"class="input-st" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" />
                <div class="lab">Дата рождения:</div>
                <input class="dt" type="date" name='date' required>
                <div class="space">Пол:
                    <label for="Java"><input  name="gender" type="radio" checked>Мужской</label>
                    <label for="C"><input  name="gender"  type="radio">Женский</label>
                </div>
                <div class="space">Тема обращения:</div>
                <input class="input-st theme" name="theme" type="text" required><br>
                <div></div>
                <textarea name="info"  placeholder="Дополнительная информация" required></textarea>

                <div class="space checkbox"><label><input type="checkbox" required name="approval">С правилами ознакомился и согласен</label></div>
                <div class="space">
                    <input class="btn-add" name="submit" type = "submit" value = "Отправить">
                    <input class="btn-cl" type = "reset" value = "Очистить">
                </div>
            </fieldset>
        </form>
    </div>

    <script>
        let form = document.querySelector("form");

        let body = document.querySelector("body");
        console.log(form);

        form.addEventListener('invalid', function(evt) {
            console.log(evt.target);
            evt.target.style.color = '#f00';
            evt.classList.add("empty_field");

        }, true)
    </script>
    </head>
</html>