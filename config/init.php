<?php
//Autoloader
//instead of manually requiring and including nesscary files in other files and folders like this:
//require('lib/Template.php')


// Config file 
require_once 'config.php';

//use Autoloader instead
//make sure your file name matches the class name 
spl_autoload_register(function ($class_name) { 
	require_once 'lib/'.$class_name. '.php';
});
?>

