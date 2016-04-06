# CST 8282, Winter 2016, Assignment 1
# FileName: ParkDML.sql 
# Author: Amirhossein Ardalan
# Date: Feb 27, 2016


# Complete data in this TABLE
# all 8 provinces and 3 territories. 
# Provinces and territories are entered in the same field, i.e. Province
# Source https://en.wikipedia.org/wiki/Provinces_and_territories_of_Canada
# Populating: Provinces
INSERT INTO Province_T VALUES( 'ON', 'Ontario', "Toronto" );
INSERT INTO Province_T VALUES( 'QC', 'Quebec', "Quebec City" );
INSERT INTO Province_T VALUES( 'NS', 'Nova Scotia', "Halifax" );
INSERT INTO Province_T VALUES( 'NB', 'New Brunswick', "Fredericton" );
INSERT INTO Province_T VALUES( 'MB', 'Winnipeg', "Winnipeg" );
INSERT INTO Province_T VALUES( 'BC', 'Victoria', "Vancouver" );
INSERT INTO Province_T VALUES( 'PE', 'Prince Edward Island', "Charlottetown" );
INSERT INTO Province_T VALUES( 'SK', 'Saskatchewan', "Regina" );
INSERT INTO Province_T VALUES( 'AB', 'Alberta', "Edmonton" );
INSERT INTO Province_T VALUES( 'NL', 'Newfoundland & Labrador', "St John's" );
# Populating: Territories
INSERT INTO Province_T VALUES( 'YT', 'Yukon', "Whitehorse" );
INSERT INTO Province_T VALUES( 'NU', 'Nunavut', "Iqaluit" );
INSERT INTO Province_T VALUES( 'NT', 'Northwest Territories', "Yellowknife" );



# Three entries in Parks T are created. Insert at least 15 other entries from 5 different provinces or
# ... territories in the Park T table. Maintain Referential Integrity Constraint.
# You may use http://www.pc.gc.ca/eng/index.aspx as reference.
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P01', 'QC', 'Forillon' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P02', 'ON', 'Pukaskwa' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P03', 'ON', 'Bruce Peninsula' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P04', 'QC', 'La Mauricie' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P05', 'AB', 'Banff' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P06', 'AB', 'Waterton Lakes' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P07', 'BC', 'Yoho' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P08', 'NT', 'Nahanni' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P09', 'NT', 'Wood Buffalo' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P10', 'NS', 'Kejimkujik' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P11', 'NS', 'Cape Breton Highlands' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P12', 'NB', 'Fundy' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P13', 'MB', 'Riding Mountain' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P14', 'MB', 'Wapusk' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P15', 'YT', 'Vuntut' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P16', 'YT', 'Kluane' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P17', 'SK', 'Grassland' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P18', 'SK', 'Prince Albert' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P19', 'NL', 'Gros Morne' );
INSERT INTO Park_T( ParkID, Abbreviation, ParkName ) VALUES( 'P20', 'NL', 'Terra Nova' );


#############################################################################
# Populating table Vegetation_T
################################vvvvvvvvv####################################
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V01', 'White Spruce' ); 
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V02', 'Balsam Fir' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V03', 'Black Spruce' ); 
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V04', 'White Pine' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V05', 'Red Pine' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V06', 'Sugar Maple' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V07', 'Black Ash' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V08', 'Easter White Cedar' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V09', 'American Beech' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V10', 'Basswood' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V11', 'Black Walnut' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V12', 'White Oak' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V13', 'Jack Pine' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V14', 'White Birch' ); 
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V15', 'Alpine Fir' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V16', 'Engleman Spruce' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V17', 'Red Spruce' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V18', 'Tamarack' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V19', 'Yellow Birch' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V20', 'White Spruce' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V21', 'Stika Spruce' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V22', 'Speargrass' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V23', 'Wheatgrass' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V24', 'Blue grama' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V25', 'Rough Fescue' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V26', 'Red Fescue' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V27', 'Bluebunch Fescue' );

#############################################################################
# Populating table WildLife_T
################################vvvvvvvvv####################################
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W01', 'Black Bear');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W02', 'Red Fox');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W03', 'Lynx');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W04', 'Moose');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W05', 'Snowshoe Hare');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W06', 'Trout');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W07', 'White Tailed Deer');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W08', 'Racoon');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W09', 'Bobcat');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W10', 'Cayote');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W11', 'Mink');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W12', 'Otter');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W13', 'Beaver');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W14', 'Muskrat');
INSERT INTO WildLife_T( WildID, WildName ) VALUES ( 'W15', 'Wolf');



#############################################################################
# it is necesary for a park to have a vegitation
# A park can have may vegitations

# it is not necessary for a vegitation to have a park
# A vegitation can be in many parks


#
#  _________________                   _________________
#  | vegitation    |\                 /| Park          |
#  |               |--|-------------o--|               |
#  |_______________|/                 \|_______________|
#


# associative entity
# Poulating ParkVegetation_T
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P01' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P01' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V03', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V04', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V05', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V06', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V07', 'P02' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V08', 'P02' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V09', 'P03' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V10', 'P03' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V11', 'P03' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V12', 'P03' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P04' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P04' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V03', 'P04' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V13', 'P04' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V14', 'P04' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V15', 'P05' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V16', 'P05' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V15', 'P06' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V16', 'P06' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V15', 'P07' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V16', 'P07' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P08' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V03', 'P08' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V18', 'P09' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P10' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P10' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V03', 'P10' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V17', 'P10' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V06', 'P11' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V14', 'P11' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V17', 'P11' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V19', 'P11' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V20', 'P11' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V06', 'P12' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V14', 'P12' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V17', 'P12' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V19', 'P12' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V20', 'P12' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P13' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P13' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V14', 'P13' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P14' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P14' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P15' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V03', 'P15' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V21', 'P16' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V22', 'P17' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V23', 'P17' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V24', 'P17' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V25', 'P17' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V26', 'P17' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V27', 'P17' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V01', 'P18' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P18' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V14', 'P18' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V09', 'P19' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V10', 'P19' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V11', 'P19' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V12', 'P19' );

INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V02', 'P20' );
INSERT INTO ParkVegetation_T ( VegID, ParkID ) VALUES ( 'V03', 'P20' );




#############################################################################
# it is NOT necesary for a park to have a wildlife (there could only be trees!)
# A park can have may animals

# it is not necessary for an animal to be in a park, i.e. they could be in 
# ... another park!
# A certain species of animal can be found in many parks


#
#  _________________                   _________________
#  | WildLife      |\                 /| Park          |
#  |               |--o-------------o--|               |
#  |_______________|/                 \|_______________|
#

# associative entity
# Populating ParkWildlife_T
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P01', 'W01');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P01', 'W02');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P01', 'W03');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P01', 'W05');


INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P05', 'W04');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P05', 'W06');

INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P07', 'W04');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P07', 'W06');

INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P08', 'W03');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P08', 'W15');

INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W01');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W04');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W07');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W08');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W09');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W10');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W11');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W12');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W13');
INSERT INTO ParkWildlife_T( Park_ID, Wild_ID ) VALUES ( 'P12', 'W14');



# CST 8282, Winter 2016, Assignment 1
# FileName: Quesry_AmirhosseinArdalan.sql
# Author: Amirhossein Ardalan
# Date: Feb 27, 2016


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





#eof: ParkDML.sql
