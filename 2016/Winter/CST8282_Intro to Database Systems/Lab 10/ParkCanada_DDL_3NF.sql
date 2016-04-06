/*######################  DESCRPITON  ########################
 Author: A. Ardalan
 Intro to Database Systems
 Title: CST 8282, Winter 2016, lab 10
 FileName: ParkCanada_DDL_3NF.sql
 Date: April 06, 2016
 Last modified: April 06, 2016
*/

/*######################### NOTES ############################
Script notes:

 Description to lines or script statements are placed BEFORE that 
 line and denoted by '##'

 Results or expected values are denoted AFTER the statement and 
 denoted by '#'
*/


drop database if exists ParkCanada3NF;
create database ParkCanada3NF;


use ParkCanada3NF;


create table Province_t
	(
    Abbreviation	char(4) not null comment 'primary key',
	Province 		CHAR( 35 ),
    Capital			CHAR( 30 ),
	CONSTRAINT Abbrev_PK PRIMARY KEY( Abbreviation )
    );
    
    
create table Park_t
	(
	ParkID 					char(4) not null comment 'primary key',
    Province_T_Abbreviation char(4) not null comment 'foreign key',
    ParkName				varchar(45),
    constraint parkID_PK primary key (ParkID),
    constraint Province_T_Abbreviation_FK foreign key (Province_T_Abbreviation) references Province_t(Abbreviation)
	);


create table Marine_t
	(
	MarineID		char(4) not null comment 'primary key',
    MarineName		varchar(45),
    constraint marineID_PK primary key (MarineID)
	);
    
    
create table Park_has_Marine_t
	(
    Marine_T_MarineID	char(4) not null comment 'one of the composite keys',
    Park_T_ParkID		char(4) not null comment 'one of the compostie keys',
    constraint Marine_T_MarineID_FK foreign key (Marine_T_MarineID) references Marine_t(MarineID),
    constraint Park_T_ParkID_FK foreign key (Park_T_ParkID) references Park_t(ParkID)
    );
    
    
    