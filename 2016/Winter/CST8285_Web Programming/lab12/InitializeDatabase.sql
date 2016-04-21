DROP database if exists wp_eatery;
CREATE DATABASE wp_eatery;
GRANT USAGE ON *.* TO wp_eatery@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wp_eatery.* TO wp_eatery@localhost;
FLUSH PRIVILEGES;

USE wp_eatery;

CREATE TABLE mailingList(
	_id int not null AUTO_INCREMENT,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
	phoneNumber VARCHAR(15) NOT NULL,
	emailAddress VARCHAR(100) NOT NULL,
	username VARCHAR(50) NOT NULL,
	referrer VARCHAR(15) NOT NULL,
	PRIMARY KEY (_id)
	);


select * from mailingList;


CREATE TABLE users(
	_id int not null AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(15) NOT NULL,
	PRIMARY KEY (_id)
	);

INSERT INTO users (username,password)
   VALUES ('testuser','passit');
   
   
   

CREATE TABLE adminusers (
    AdminID INT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    AdminLevel VARCHAR(50) NOT NULL,
    Lastlogin DATE NOT NULL,
    PRIMARY KEY (AdminID)
);

use wp_eatery;

/*
Username = admin
Password = passme
AdminLevel = Administrator
*/
-- insert into adminusers values(12, 'garcia', 'tt', 'master', CURRENT_DATE())

insert into adminusers values(null, 'admin', 'passme', 'Administrator', current_date());
-- insert into adminusers values(null, 'admin', 'passme', 'Administrator', current_date());

select * from adminusers;



