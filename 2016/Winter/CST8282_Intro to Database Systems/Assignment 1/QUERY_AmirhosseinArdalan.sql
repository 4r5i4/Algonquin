# CST 8282, Winter 2016, Assignment 1
# FileName: Quesry_AmirhosseinArdalan.sql
# Author: Amirhossein Ardalan
# Date: Feb 27, 2016

#######################################
#UNION
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

#######################################
# ERROR: 
#		22:35:58	delete from park_t where Abbreviation='QC'	
#		Error Code: 1451. Cannot delete or update a parent row: 
# 		a foreign key constraint fails (`parkcanada`.`parkvegetation_t`, 
# 		CONSTRAINT `ParkID_FK` FOREIGN KEY (`ParkID`) REFERENCES `park_t` (`ParkID`))	0.015 sec
# Explanation: The error occurs since Abbreviation is a foreign key in park_t and a primary
# ... key in the parent, Province_t.
DELETE FROM park_t 
WHERE
    Abbreviation = 'QC';


#######################################
# ERROR:
#		22:40:34	delete from province_t where Abbreviation='ON'	
#		Error Code: 1451. Cannot delete or update a parent row: 
#		a foreign key constraint fails (`parkcanada`.`park_t`, 
#		CONSTRAINT `Abbrev_FK` FOREIGN KEY (`Abbreviation`) REFERENCES `province_t` (`Abbreviation`))	0.016 sec
# Explanation: Deleting the Abbreviation which is the primary key in the parent Province_t will alter 
# ... foreign keys of its children, in this case Park_t

DELETE FROM province_t 
WHERE
    Abbreviation = 'ON';

#######################################
# Please see B-tree_AmirhosseinArdalan.pdf
SHOW INDEX FROM park_t;


#######################################
# Subquery 1:
# Documentation: This query returns the parkID of parks that also have a 
# wildlife in them
SELECT 
    parkvegetation_t.VegID AS 'Vegetation ID',
    parkvegetation_t.ParkID AS 'Park ID',
    park_t.ParkName
FROM
    parkvegetation_t
        JOIN
    park_t ON park_t.ParkID = parkvegetation_t.ParkID
WHERE
    parkvegetation_t.ParkID IN (SELECT 
            parkwildlife_t.Park_ID
        FROM
            parkwildlife_t);
   
   
#######################################
# Subquery 2:
# Documentation: This query returns a table with parkName 
# and parkID of parks that have more than two entries (wildlife species)
SELECT 
    park_t.ParkName AS 'Park Name', park_t.ParkID AS 'Park ID'
FROM
    park_t
WHERE
    park_t.ParkID IN (SELECT 
            parkwildlife_t.Park_ID
        FROM
            parkwildlife_t
        group by parkwildlife_t.Park_ID
            HAVING COUNT(Park_ID) > 2);
          
          
#######################################
# Left Join:
# Documentation: This quesry return the Park name ad Park ID that belong to 
# a specific Province. Park Names are unique, and a province can 
# have many parks.
SELECT 
    province_t.Province,
    province_t.Abbreviation,
    park_t.ParkID,
    park_t.ParkName
FROM
    province_t
        LEFT JOIN
    park_t ON park_t.Abbreviation = province_t.Abbreviation;
    

#######################################
# Right Join:
# Documentation: This quesry returns only the parks that do have some 
# form of wildlife.
SELECT 
    park_t.ParkName, park_t.ParkID, parkwildlife_t.Wild_ID
FROM
    park_t
        RIGHT JOIN
    parkwildlife_t ON park_t.ParkID = parkwildlife_t.Park_ID;