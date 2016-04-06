/*######################  DESCRPITON  ########################
 -- Author: A. Ardalan
 -- Last Modified: 	 2 April 2016
 -- filename: AirportDML_AmirhosseinArdalan.sql
*/


DROP SCHEMA IF EXISTS Airport ;
CREATE SCHEMA IF NOT EXISTS Airport DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE Airport ;



-- -----------------------------------------------------
-- Table airport_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS airport_T ;

CREATE TABLE IF NOT EXISTS airport_T (
  airportCode CHAR(10) NOT NULL  ,
  airportName VARCHAR(45) NOT NULL  ,
  numOfRunways SMALLINT UNSIGNED NOT NULL  ,
  numOfStaff VARCHAR(45) NOT NULL  ,
  owner VARCHAR(45) NOT NULL  ,
  totalArea FLOAT(6,2) UNSIGNED NOT NULL  ,
  city_ID INT(11) NOT NULL  ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  PRIMARY KEY (airportCode)   ,
  CONSTRAINT fk_airport_T_city1
    FOREIGN KEY (city_ID)
    REFERENCES world.city (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_airport_T_city1_idx ON airport_T (city_ID ASC)   ;


-- -----------------------------------------------------
-- Table SIN_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS SIN_T ;

CREATE TABLE IF NOT EXISTS SIN_T (
  SIN INT(9) NOT NULL  ,
  firstName VARCHAR(45) NOT NULL  ,
  lastName VARCHAR(45) NOT NULL  ,
  PRIMARY KEY (SIN)   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table staff_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS staff_T ;

CREATE TABLE IF NOT EXISTS staff_T (
  staffID INT(4) NOT NULL,
  SIN_T_SIN INT(9) NOT NULL,
  hireDate TIMESTAMP NOT NULL,
  salary DECIMAL(10,0) NOT NULL,
  phoneNumber CHAR(15) NOT NULL,
  emailAddress VARCHAR(45) NULL ,
  airport_T_airportCode CHAR(10) NULL ,
  staffJobCode ENUM('Engineer', 'Janitor', 'Supervisor', 'Agent', 'Security', 'Baggage', 'Designer', 'QAT', 'IT', 'HR', 'CEO', 'Technician', 'Test Pilot') NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (staffID)  ,
  CONSTRAINT fk_staff_T_airport_T1
    FOREIGN KEY (airport_T_airportCode)
    REFERENCES airport_T (airportCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_staff_T_SIN_T1
    FOREIGN KEY (SIN_T_SIN)
    REFERENCES SIN_T (SIN)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_staff_T_airport_T1_idx ON staff_T (airport_T_airportCode ASC)   ;

CREATE INDEX fk_staff_T_SIN_T1_idx ON staff_T (SIN_T_SIN ASC)   ;


-- -----------------------------------------------------
-- Table airline_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS airline_T ;

CREATE TABLE IF NOT EXISTS airline_T (
  airlineID CHAR(3) NOT NULL  ,
  airlineName VARCHAR(45) NOT NULL  ,
  NumActivePlanes INT NOT NULL  ,
  city_ID INT(11) NOT NULL  ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  PRIMARY KEY (airlineID)   ,
  CONSTRAINT fk_airline_T_city1
    FOREIGN KEY (city_ID)
    REFERENCES world.city (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_airline_T_city1_idx ON airline_T (city_ID ASC)   ;


-- -----------------------------------------------------
-- Table manufacturer_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS manufacturer_T ;

CREATE TABLE IF NOT EXISTS manufacturer_T (
  manufacturerID CHAR(10) NOT NULL  ,
  manufacturerName VARCHAR(45) NOT NULL  ,
  revenue DECIMAL(10,0) NOT NULL  ,
  city_ID INT(11) NOT NULL  ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  PRIMARY KEY (manufacturerID)   ,
  CONSTRAINT fk_manufacturer_T_city1
    FOREIGN KEY (city_ID)
    REFERENCES world.city (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_manufacturer_T_city1_idx ON manufacturer_T (city_ID ASC)   ;


-- -----------------------------------------------------
-- Table plane_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS plane_T ;

CREATE TABLE IF NOT EXISTS plane_T (
  planeSerialNumber CHAR(10) NOT NULL  ,
  weight FLOAT(5,1) NOT NULL  ,
  capacity INT NOT NULL  ,
  manufacturer_T_manufacturerID CHAR(10) NOT NULL  ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  PRIMARY KEY (planeSerialNumber)   ,
  CONSTRAINT fk_plane_T_manufacturer_T1
    FOREIGN KEY (manufacturer_T_manufacturerID)
    REFERENCES manufacturer_T (manufacturerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_plane_T_manufacturer_T1_idx ON plane_T (manufacturer_T_manufacturerID ASC)   ;


-- -----------------------------------------------------
-- Table flight_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS flight_T ;

CREATE TABLE IF NOT EXISTS flight_T (
  flightNumber CHAR(4) NOT NULL  ,
  flightDateTime DATETIME NOT NULL  ,
  airline_T_airlineID CHAR(3) NOT NULL  ,
  plane_T_planeSerialNumber CHAR(10) NOT NULL  ,
  flightUniqueIdentifier CHAR(10) NOT NULL  ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  airport_T_airportCode CHAR(10) NOT NULL  ,
  PRIMARY KEY (flightUniqueIdentifier)   ,
  CONSTRAINT fk_flight_t_airline_t1
    FOREIGN KEY (airline_T_airlineID)
    REFERENCES airline_T (airlineID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_flight_T_plane_T1
    FOREIGN KEY (plane_T_planeSerialNumber)
    REFERENCES plane_T (planeSerialNumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_flight_T_airport_T1
    FOREIGN KEY (airport_T_airportCode)
    REFERENCES airport_T (airportCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_flight_t_airline_t1_idx ON flight_T (airline_T_airlineID ASC)   ;

CREATE INDEX fk_flight_T_plane_T1_idx ON flight_T (plane_T_planeSerialNumber ASC)   ;

CREATE INDEX fk_flight_T_airport_T1_idx ON flight_T (airport_T_airportCode ASC)   ;


-- -----------------------------------------------------
-- Table passenger_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS passenger_T ;

CREATE TABLE IF NOT EXISTS passenger_T (
  confirmationNumber CHAR(5) NOT NULL  ,
  phoneNumber CHAR(15) NOT NULL  ,
  firstName VARCHAR(45) NOT NULL  ,
  lastName VARCHAR(45) NOT NULL  ,
  classCode CHAR(1) NOT NULL COMMENT 'F for firstclassClass\nB for businessClass\nE for economyClass\n\n',
  emailAddress VARCHAR(45) NULL  ,
  cancelledTicket TINYINT(1) NULL DEFAULT NULL  ,
  lastUpdated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (confirmationNumber)   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table maintainance_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS maintainance_T ;

CREATE TABLE IF NOT EXISTS maintainance_T (
  maintainanceID CHAR(4) NOT NULL  ,
  dueDate DATE NOT NULL  ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  PRIMARY KEY (maintainanceID)   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table plane_T_has_maintainance_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS plane_T_has_maintainance_T ;

CREATE TABLE IF NOT EXISTS plane_T_has_maintainance_T (
  maintainance_T_maintainanceID CHAR(4) NOT NULL  ,
  plane_T_planeSerialNumber CHAR(10) NOT NULL COMMENT 'This could also not be a PK but to be on the safe side',
  lastMaintainance DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'CURRENT_TIMESTAMP',
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  ,
  PRIMARY KEY (maintainance_T_maintainanceID, plane_T_planeSerialNumber)   ,
  CONSTRAINT fk_plane_T_has_maintainance_T_maintainance_T1
    FOREIGN KEY (maintainance_T_maintainanceID)
    REFERENCES maintainance_T (maintainanceID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_plane_T_has_maintainance_T_plane_T1
    FOREIGN KEY (plane_T_planeSerialNumber)
    REFERENCES plane_T (planeSerialNumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_plane_T_has_maintainance_T_maintainance_T1_idx ON plane_T_has_maintainance_T (maintainance_T_maintainanceID ASC)   ;

CREATE INDEX fk_plane_T_has_maintainance_T_plane_T1_idx ON plane_T_has_maintainance_T (plane_T_planeSerialNumber ASC)   ;


-- -----------------------------------------------------
-- Table passenger_T_has_flight_T
-- -----------------------------------------------------
DROP TABLE IF EXISTS passenger_T_has_flight_T ;

CREATE TABLE IF NOT EXISTS passenger_T_has_flight_T (
  passenger_T_confirmationNumber CHAR(5) NOT NULL  ,
  flight_T_flightUniqueIdentifier CHAR(10) NOT NULL  ,
  PRIMARY KEY (passenger_T_confirmationNumber, flight_T_flightUniqueIdentifier)   ,
  CONSTRAINT fk_passenger_T_has_flight_T_passenger_T1
    FOREIGN KEY (passenger_T_confirmationNumber)
    REFERENCES passenger_T (confirmationNumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_passenger_T_has_flight_T_flight_T1
    FOREIGN KEY (flight_T_flightUniqueIdentifier)
    REFERENCES flight_T (flightUniqueIdentifier)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_passenger_T_has_flight_T_flight_T1_idx ON passenger_T_has_flight_T (flight_T_flightUniqueIdentifier ASC)   ;

CREATE INDEX fk_passenger_T_has_flight_T_passenger_T1_idx ON passenger_T_has_flight_T (passenger_T_confirmationNumber ASC)   ;
