<?php include_once 'config/init.php';?>
<?php
$product = new Product();
$template = new Template('templates/frontpage.php');

$template->title ='Photo Wahba';

echo $template;
?>