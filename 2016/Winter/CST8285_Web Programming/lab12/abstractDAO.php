<?php

//Used to throw mysqli_sql_exceptions for database errors instead or printing them to the screen.
mysqli_report(MYSQLI_REPORT_STRICT);
/**
 * Abstract data access class. Holds all of the database connection information, and initializes a mysqli object
 * on instantiation.
 * 
 * @author Matt
 */
class AbstractDAO {
    private $adminID;
    private $adminLevel;
    private $username;
    private $password;
    protected $mysqli;
    private $dbError;
    private $authenticated = false;


    protected static $DB_HOST = "127.0.0.1"; // Host address for the database 
    protected static $DB_USERNAME = "wp_eatery"; // Database username
    protected static $DB_PASSWORD = "password"; // Database password
    protected static $DB_DATABASE = "wp_eatery"; // Name of database

    /**
     * AbstractDAO constructor.
     * Constructor. Instantiates a new MySQLi object.
     * Throws an exception if there is an issue connecting
     * to the database.
     */
    function __construct() {
        $this->mysqli = new mysqli(self::$DB_HOST, self::$DB_USERNAME,
            self::$DB_PASSWORD, self::$DB_DATABASE);
        if($this->mysqli->errno){
            $this->dbError = true;
        }else{
            $this->dbError = false;
        }
    }


    /**
     * @return mysqli
     */
    public function getMysqli(){
        return $this->mysqli;
    }


    /**
     * @param $username
     * @param $password
     */
    public function authenticate($username, $password){
        $loginQuery = "SELECT * FROM adminusers WHERE username = ? AND password = ?";
        $stmt = $this->mysqli->prepare($loginQuery);
        $stmt->bind_param('ss', $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();
        if($result->num_rows == 1){
            $this->username = $username;
            $this->password = $password;
            $this->authenticated = true;
        }
        $stmt->free_result();
    }

    /**
     * @return mixed
     */
    public function isAuthenticated(){
        return $this->authenticated;
    }

    /**
     * @return bool
     */
    public function hasDbError(){
        return $this->dbError;
    }

    /**
     * @return mixed
     */
    public function getUsername(){
        return $this->username;
    }

    /**
     * @param mixed $adminLevel
     */
    public function setAdminLevel($adminLevel)
    {
        $this->adminLevel = $adminLevel;
    }

    /**
     * @param mixed $adminID
     */
    public function setAdminID($adminID)
    {
        $this->adminID = $adminID;
    }

    /**
     * @return mixed
     */
    public function getAdminID()
    {
        return $this->adminID;
    }

    /**
     * @return mixed
     */
    public function getAdminLevel()
    {
        return $this->adminLevel;
    }
    

}

?>
