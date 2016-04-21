<?php
/**
 * Created by PhpStorm.
 * User: ARSIA
 * Date: 4/13/2016
 * Time: 10:10 PM
 */

require_once './abstractDAO.php';
require_once './user.php';

/**
 * Class userDAO
 * extends the abstractDAO which holds all of the database connection information, and initializes a mysqli object
 * on instantiation.
 */
class userDAO extends abstractDAO
{

    /**
     * userDAO constructor
     *
     */
    function __construct() {
        try {
            parent::__construct();
        } catch(mysqli_sql_exception $e) {
            throw $e;
        }
    }

    /**
     * @return array|bool
     * Returns an array of user objects. If there are no users in the DB, returns false
     */
    public function getUsers(){
        $result = $this->mysqli->query('SELECT * FROM adminusers');
        $users = Array();

        if($result->num_rows >=1) {
            while($row = $result->fetch_assoc()){
                $user = new User(
                    $row['password'],
                    $row['Username'],
                    $row['AdminLevel'],
                    $row['AdminID'],
                    $row['Lastlogin']);

                $users[] = $user;
            }
            $result->free();
            return $users;
        }
        $result->free();
        return false;
    }//end of getUsers function


    /**
     * @param $adminID
     * @return bool|User
     * Returns a user object. If there are no users in the DB, returns false
     */
    public function getUser($adminID){
        $query = 'SELECT * FROM adminusers WHERE adminID = ?';
        //The 'prepare' method of the mysqli object returns a mysqli_stmt object.
        //It takes a paramatarized query as a parameter:
        $stmt = $this->mysqli->prepare($query);
        $stmt->bind_param('i', $adminID);
        $stmt->execute();
        $result = $stmt->get_result();
        if($result->num_rows == 1){
            $row = $result->fetch_assoc();
            $user = new User(
                $row['password'],
                $row['Username'],
                $row['AdminLevel'],
                $row['AdminID'],
                $row['Lastlogin']);

            $result->free();
            return $user;
        }
        $result->free();
        return false;
    }//end of getUser function

    /**
     * @param $username
     * @return bool
     * Returns a user using the username. If there are no users in the DB, returns false
     */
    public function getUserByUsername($username){
        $query = 'SELECT * FROM adminusers WHERE username = ?';
        // The prepare method of the mysqli object returns a mysqli_stmt object.
        // It takes a parameterized query as a parameter.
        $stmt = $this->mysqli->prepare($query);
        // The string contains a one-letter datatype description for each parameter. 's' is used for string.
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $result = $stmt->get_result();
        if($result->num_rows == 1){
            $user = $result->fetch_assoc();
            $result->free();
            return $user;
        }
        $result->free();
        return false;
    }//end of getUserByUsername function

    /**
     * @param $password
     * @param $username
     * @param $adminLevel
     * @param $adminID
     * @param $lastLoginDate
     * @return bool
     * Returns true if five parameters where successfully added to the adminusers table. Returns false otherwise.
     */
    public function insertUser($adminID, $username, $password, $adminLevel, $lastLoginDate){
        if($this->mysqli->connect_errno){
            $query = 'INSERT INTO adminusers (adminID, username, password, adminLevel, lastLoginDate) 
                      VALUES (?, ?, ?, ?, ?)';
            $stmt = $this->mysqli->prepare($query);
            // The first parameter of bind_param takes a string describing the data.
            // In this case, we are passing five variables.
            $stmt->bind_param('sssss', $adminID, $username, $password, $adminLevel, $lastLoginDate);
            //Execute the statement
            $stmt->execute();
            //If there are errors, they will be in the error property of the mysqli_stmt object.
            if($stmt->error){
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }//end of insertUser function


    /**
     * @param $adminId
     * @return bool
     * Deletes a user from the table adminusers and returns true if there are no errors encountered in the process. Returns false if user does not exist.
     */
    public function deleteUser($adminId) {
        if(!$this->mysqli->connect_errno){
            $query = 'DELETE FROM mailinglist WHERE _id = ?';
            $stmt = $this->mysqli->prepare($query);
            $stmt->bind_param('i', $adminId);
            $stmt->execute();
            if($stmt->error){
                return false;
            } else {
                return true;
            }

        } else {
            return false;
        }
    }//end of deleteUser function


    /**
     * @param $password
     * @param $username
     * @param $adminLevel
     * @param $adminID
     * @param $lastLoginDate
     * @return bool
     * Updates a user's info and returns true if no errors were detected. Returns false otherwise.
     */
    public function updateUser($adminID, $username, $password, $adminLevel, $lastLoginDate) {
        if(!$this->mysqli->connect_errno){
            $query = 'UPDATE adminusers SET adminID = ?, username = ?, password = ?, adminLevel = ?, lastLoginDate = ?,
				referrer = ? WHERE _id = ?';
            $stmt = $this->mysqli->prepare($query);
            $stmt->bind_param('sssss', $adminID, $username, $password, $adminLevel, $lastLoginDate);
            $stmt->execute();
            if($stmt->error){
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }


}// end of userDAO class
?>

