/*######################  DESCRPITON  ########################
 Author: A. Ardalan
 Intro to Database Systems
 Title: CST 8282, Winter 2016, lab 10
 FileName: ParkCanada_DML_3NF.sql
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

USE ParkCanada3NF;
INSERT INTO marine_t(MarineID, MarineName)VALUES('M04', 'Rainbow Trout');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M01', 'Pike');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M02', 'Bass');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M03', 'Brook Trout');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M06', 'Stickle Back');


INSERT INTO `province_t`(`Abbreviation`,`Province`,`Capital`)VALUES('ON', 'Ontario', 'Toronto');
INSERT INTO `province_t`(`Abbreviation`,`Province`,`Capital`)VALUES('QC', 'Quebec', 'Quebec City');


INSERT INTO `park_t`(`ParkID`,`Province_T_Abbreviation`,`ParkName`)VALUES('P01', 'ON', 'Bruce Peninsula');
INSERT INTO `park_t`(`ParkID`,`Province_T_Abbreviation`,`ParkName`)VALUES('P02', 'QC', 'Forillon');
INSERT INTO `park_t`(`ParkID`,`Province_T_Abbreviation`,`ParkName`)VALUES('P04', 'QC', 'Gatineau Park');



INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M04', 'P01');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M01', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M02', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M03', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M04', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M06', 'P04');


    