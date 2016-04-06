/*######################  DESCRPITON  ########################
 -- Author: A. Ardalan
 -- Last Modified: 	1 March 2016
 -- filename: DB_LAB8.sql
*/
/*######################### NOTES ############################
Script notes:

 Description to lines or script statements are placed BEFORE that 
 line and denoted by '##'

 Results or expected values are denoted AFTER the statement and 
 denoted by '#'
*/

##############################################################
#Question 1: Ans: Pointers
# src = http://dev.mysql.com/doc/refman/5.6/en/optimization-indexes.html

##############################################################
#Question 2: Ans: Yes
# src = http://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html

##############################################################
#Question 3: Ans: Yes
# src = http://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html

##############################################################
#Question 4: Ans: True
# src = http://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html

##############################################################
#Question 5: Ans: True
# src = http://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html

##############################################################
#Question 6:
# src = http://www.w3schools.com/sql/sql_create_index.asp
use world;

CREATE INDEX CountryCode_IDX
ON city (CountryCode);

##############################################################
#Question 7:
# src = http://www.w3schools.com/sql/sql_drop.asp
ALTER TABLE city DROP INDEX CountryCode_IDX;

##############################################################
#Question 8:
SELECT 
    country.code AS CCountryCode,
    country.name AS Country,
    COUNT(CountryCode) AS NumberOfCities
FROM
    city,
    country
WHERE
    city.CountryCode = country.code
GROUP BY CCountryCode
ORDER BY NumberOfCities DESC;


## Creating a view of the above query:
DROP VIEW NumberOfCities_V;
CREATE VIEW NumberOfCities_V AS
SELECT 
    country.code AS CCountryCode,
    country.name AS Country,
    COUNT(CountryCode) AS NumberOfCities
FROM
    city,
    country
WHERE
    city.CountryCode = country.code
GROUP BY CCountryCode
ORDER BY NumberOfCities DESC;

# Query into the view:
SELECT 
    Country,
    NumberOfCities
FROM
    NumberOfCities_V
HAVING NumberOfCities >= 100
    AND NumberOfCities <= 200;
    
##############################################################
#Quesiton 9:
## Making a table based on the query we got from Question 8:
CREATE TABLE City_Temp_T AS (SELECT Country, NumberOfCities FROM
    NumberOfCities_V
HAVING NumberOfCities >= 100
    AND NumberOfCities <= 200);
    
# Ensuring the table exists and has values:
SELECT * FROM City_temp_t;
## Yup! :)
    
##############################################################
#Question 10: Ans: DROP VIEW <view_name>;


-- eof: DB_LAB8.sql
