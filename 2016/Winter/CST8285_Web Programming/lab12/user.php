<?php
/**
 * Created by PhpStorm.
 * User: ARSIA
 * Date: 4/13/2016
 * Time: 10:11 PM
 */

class User{
    private $username;
    private $password;
    private $adminLevel;
    private $adminID;
    private $lastLoginDate;

    /**
     * User constructor.
     * @param $password
     * @param $username
     * @param $adminLevel
     * @param $adminID
     * @param $lastLoginDate
     * creates a new user object
     */
    public function __construct($password, $username, $adminLevel, $adminID, $lastLoginDate)
    {
        $this->password = $password;
        $this->username = $username;
        $this->adminLevel = $adminLevel;
        $this->adminID = $adminID;
        $this->lastLoginDate = $lastLoginDate;
    }

    /**
     * @return mixed
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * @param mixed $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param mixed $password
     */
    public function setPassword($password)
    {
        $this->password = $password;
    }

    /**
     * @return mixed
     */
    public function getAdminLevel()
    {
        return $this->adminLevel;
    }

    /**
     * @param mixed $adminLevel
     */
    public function setAdminLevel($adminLevel)
    {
        $this->adminLevel = $adminLevel;
    }

    /**
     * @return mixed
     */
    public function getAdminID()
    {
        return $this->adminID;
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
    public function getLastLoginDate()
    {
        return $this->lastLoginDate;
    }

    /**
     * @param mixed $lastLoginDate
     */
    public function setLastLoginDate($lastLoginDate)
    {
        $this->lastLoginDate = $lastLoginDate;
    }

    
    

}