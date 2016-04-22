/*######################  DESCRPITON  ########################
 -- Author: A. Ardalan
 -- Last Modified:  22 April 2016
 -- filename: InitializeDatabase.sql
*/

DROP database if exists wp_eatery;
CREATE DATABASE wp_eatery;
GRANT USAGE ON *.* TO wp_eatery@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wp_eatery.* TO wp_eatery@localhost;
FLUSH PRIVILEGES;

USE wp_eatery;

CREATE TABLE mailingList (
    _id INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    emailAddress VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    referrer VARCHAR(15) NOT NULL,
    PRIMARY KEY (_id)
);


select * from mailingList;

# This table was created for testing the userDAO.php
CREATE TABLE users (
    _id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(15) NOT NULL,
    PRIMARY KEY (_id)
);

INSERT INTO users (username,password)
   VALUES ('testuser','passit');
      
# Table storing the administrative usrname and password:
# Password and Username are tested against at valid session login time
CREATE TABLE adminusers (
    AdminID INT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    AdminLevel VARCHAR(50) NOT NULL,
    Lastlogin TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'time of last login for that specific admin given a session ID',
    PRIMARY KEY (AdminID)
);

use wp_eatery;
insert into adminusers values(null, 'admin', 'passme', 'Administrator', current_timestamp());

# This shows the table of admins
# PK is the AdminID, which is AUTO_INCREMENT
SELECT 
    *
FROM
    adminusers;



