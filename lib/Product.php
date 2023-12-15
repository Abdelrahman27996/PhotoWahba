<?php
class Product{
    // Make sure these properties matches your database columns
    private $db;
    public $id;
    public $name;
    public $image;
    public $Price;
    public $Product_Type;

    public function __construct() {
        $this->db = new Database;
    }

    // Get all products
    public function getAllProducts(){
        $this->db->query('SELECT id, name,image, Price, Product_Type FROM product');
        $results = $this->db->resultSet();
        return $results;
    }
    
    //Get all categories
//     public function getCategories(){
//         $this->db->query("SELECT DISTINCT `Product_Type` FROM `product` ORDER BY `Product_Type`
//         ASC");
//         $results=$this->db->resultSet();
//         return $results;
//         }
// }
}
?>