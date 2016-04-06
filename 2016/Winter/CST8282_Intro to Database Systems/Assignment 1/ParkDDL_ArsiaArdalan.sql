# CST 8282, Winter 2016, Assignment 1
# FileName: ParkDDL.sql
# Author: Amirhossein Ardalan
# Date: Feb 27, 2016
# Last modified: April 06, 2016
DROP DATABASE IF EXISTS ParkCanada;
CREATE DATABASE ParkCanada;
USE ParkCanada;

# Lookup Table
# DROP TABLE IF EXISTS Province_T;
CREATE TABLE Province_T( 
	Abbreviation 	CHAR( 2 ) NOT NULL,
	Province 		CHAR( 35 ),
    Capital			CHAR( 30 ),
	CONSTRAINT Abbrev_PK PRIMARY KEY( Abbreviation ) 
);


# Park Table
# DROP TABLE IF EXISTS Park_T;
CREATE TABLE Park_T(
	ParkID 			CHAR( 4 ) NOT NULL, 
	Abbreviation 	CHAR( 2 ) NOT NULL,
	ParkName 		VARCHAR( 45 ),
	CONSTRAINT Park_PK PRIMARY KEY( ParkID ),
    CONSTRAINT Abbrev_FK FOREIGN KEY( Abbreviation ) REFERENCES Province_T( Abbreviation )
);

# Vegetation Table
# DROP TABLE IF EXISTS Vegetation_T;
CREATE TABLE Vegetation_T(
	VegID 			CHAR( 4 ) NOT NULL,
	VegName 		VARCHAR( 45 ),
	CONSTRAINT Vegetation_PK PRIMARY KEY( VegID )
);

# Wildlife Table
# DROP TABLE IF EXISTS WildLife_T;
CREATE TABLE WildLife_T(
    WildID          CHAR( 4 ) NOT NULL,
    WildName        VARCHAR( 45 ),
    CONSTRAINT Wild_PK PRIMARY KEY ( WildID )
);


#######################################
# Park Vegitation Table
# DROP TABLE IF EXISTS ParkVegetation_T;
CREATE TABLE ParkVegetation_T(
	VegID			CHAR( 4 ) NOT NULL,
	ParkID			CHAR( 4 ) NOT NULL,
	CONSTRAINT VegID_FK  FOREIGN KEY( VegID ) REFERENCES Vegetation_T( VegID ),
	CONSTRAINT ParkID_FK  FOREIGN KEY( ParkID ) REFERENCES Park_T( ParkID )
);

# Park Wildlife Table
# DROP TABLE IF EXISTS ParkWildlife_T;
CREATE TABLE ParkWildlife_T(
    Park_ID         CHAR ( 4 ) NOT NULL,
    Wild_ID          CHAR( 4 ) NOT NULL,
    CONSTRAINT Park_ID_FK FOREIGN KEY ( Park_ID ) REFERENCES Park_T( ParkID ),
    CONSTRAINT WildID_FK FOREIGN KEY ( Wild_ID ) REFERENCES WildLife_T( WildID )
);

#######################################
#JOIN
SELECT 
    park_t.parkID AS 'Park Code',
    park_t.ParkName AS 'Park Name',
    parkwildlife_t.Wild_ID AS ' Animal Code ',
    wildlife_t.WildName AS 'Animal name'
FROM
    park_t
        JOIN
    parkwildlife_t ON park_t.ParkID = parkwildlife_t.Park_ID
        JOIN
    wildlife_t ON wildlife_t.WildID = parkwildlife_t.Wild_ID
ORDER BY park_t.parkID;


#select parkwildlife_t.Wild_ID, parkwildlife_t.Park_ID FROM parkwildlife_t where ParkID == 'P01' UNION 

#######################################    
#View 1
DROP view IF EXISTS findSpruce;
CREATE VIEW findSpruce AS
    SELECT 
        vegetation_t.VegID AS 'Vegetation Code',
        vegetation_t.VegName AS 'Vegetation Name'
    FROM
        vegetation_t
    WHERE
        VegName LIKE '%Spruce%';
#######################################
#View 2
DROP view IF EXISTS listProvince;
CREATE VIEW listProvince AS
    SELECT 
        province_t.Abbreviation AS 'Province', province_t.Capital
    FROM
        province_t;
#######################################
#Indecies
#DROP index ParkID_IDX;
CREATE index ParkID_IDX on park_t( ParkID );
CREATE index VegetationID_IDX on vegetation_t( VegID );
CREATE index WildLifeID_IDX on wildlife_t( WildID);
CREATE index ParkWildLifeID_IDX on parkwildlife_t( Park_ID );

# eof: ParkDDL.sql
