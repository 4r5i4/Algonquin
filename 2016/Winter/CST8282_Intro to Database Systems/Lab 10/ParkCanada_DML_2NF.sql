/*######################  DESCRPITON  ########################
 Author: A. Ardalan
 Intro to Database Systems
 Title: CST 8282, Winter 2016, lab 10
 FileName: ParkCanada_DML_2NF.sql
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


USE ParkCanada2NF;
INSERT INTO marine_t(MarineID, MarineName)VALUES('M04', 'Rainbow Trout');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M01', 'Pike');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M02', 'Bass');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M03', 'Brook Trout');
INSERT INTO marine_t(MarineID, MarineName)VALUES('M06', 'Stickle Back');

INSERT INTO `park_t`(`ParkID`,`Abbreviation`,`Province`,`Capital`,`ParkName`)VALUES('P01', 'ON', 'Ontario', 'Toronto', 'Bruce Peninsula');
INSERT INTO `park_t`(`ParkID`,`Abbreviation`,`Province`,`Capital`,`ParkName`)VALUES('P02', 'QC', 'Quebec', 'Quebec City', 'Forillon');
INSERT INTO `park_t`(`ParkID`,`Abbreviation`,`Province`,`Capital`,`ParkName`)VALUES('P04', 'QC', 'Quebec', 'Quebec City', 'Gatineau Park');

INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M04', 'P01');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M01', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M02', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M03', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M04', 'P02');
INSERT INTO park_has_marine_t(Marine_T_MarineID, Park_T_ParkID)VALUES('M06', 'P04');


    