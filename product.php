<?php include_once 'config/init.php';?>
<?php
//product object
$product = new Product();
$template = new Template('templates/products.php');

$template->title ='Products';
$template->products =$product->getAllProducts();  //get all products from the database
// $template->products =$product->getAllProducts();



echo $template;
?>