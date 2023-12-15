<?php
class Database{
	private $host = DB_HOST;
	private $user = DB_USER;
	private $pass = DB_PASS;
	private $dbname = DB_NAME;
	public $conn;

    private $dbh; //database handler
    private $error;
    private $stmt; //statement

	function __construct() {
        //set DSN data source name
        //PDO => php data objects 
        $dsn = 'mysql:host='. $this->host. ';dbname='. $this->dbname;


        //set options
        $options= array(
            PDO::ATTR_PERSISTENT => true,   //persistent connection
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION  //turn on errors throw as exception
        );

        //PDO Instance
        try{
            $this->dbh = new PDO($dsn, $this->user, $this->pass, $options);//connect to mysql
        }catch (PDOException $e){
            $this->error=$e->getMessage();
        }
    }
        
        
    public function query($query) {
        $this->stmt = $this->dbh->prepare($query);

    }

    public function bind($param ,$value, $type = null){
        if(is_null($type)){
            switch(true){
                case is_int($value) :
                    $type = PDO::PARAM_INT;
                    break;
                case is_bool ($value) :
                    $type = PDO::PARAM_BOOL;
                    break;
                case is_null($value):
                    $type = PDO::PARAM_NULL;
                    break;
                default:
                    $type = PDO::PARAM_STR;
                }
        }
        $this->stmt->bindValue($param, $value, $type);
    }

    public function execute(){
        //if the statement fails then it will return false and set an error message
        //else it returns true
        //and also executes the SQL command in the database
        $executed = $this->stmt->execute();
        if(!$executed){
            $this->error = $this->stmt->errorInfo()[2];
        }
        return $executed;
    }

    public function resultSet(){
        //fetches all of the rows from a prepared statement
        //as an associative array
        $this->execute();
        return $this->stmt->fetchAll(PDO::FETCH_OBJ);
    }

    public function single(){
        //fetches a single row from a prepared statement as an associative array
        $this->execute();
        return $this->stmt->fetch(PDO::FETCH_OBJ);

    }

    
}


?>