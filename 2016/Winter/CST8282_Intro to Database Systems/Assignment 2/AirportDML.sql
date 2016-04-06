/*######################  DESCRPITON  ########################
 -- Author: A. Ardalan
 -- Last Modified: 	 3 April 2016
 -- filename: AirportDML_AmirhosseinArdalan.sql
*/
USE world;
use airport;

-- airline_t inserts
INSERT INTO airport.airline_t
(airlineID,
airlineName,
NumActivePlanes,
city_ID,
last_update)
VALUES
('USA',
'USAirways',
331,
3793,
NULL);


INSERT INTO airport.airline_t
(airlineID,
airlineName,
NumActivePlanes,
city_ID,
last_update)
VALUES
('IRA',
'Iran Air',
133,
1380,
NULL);

INSERT INTO airport.airline_t
(airlineID,
airlineName,
NumActivePlanes,
city_ID,
last_update)
VALUES
('LHA',
'Lufthansa',
331,
3068,
NULL);

INSERT INTO airport.airline_t
(airlineID,
airlineName,
NumActivePlanes,
city_ID,
last_update)
VALUES
('EK',
'Emirates',
442,
64,
NULL);

INSERT INTO airport.airline_t
(airlineID,
airlineName,
NumActivePlanes,
city_ID,
last_update)
VALUES
('TK',
'Turkish Airways',
239,
3358,
NULL);


-- airport_t inserts
INSERT INTO airport.airport_t
(airportCode,
airportName,
numOfRunways,
numOfStaff,
owner,
totalArea,
city_ID,
last_update)
VALUES
('111231',
'NewYork International',
3,
652,
'John Marston',
1233.2,
3793,
NULL);


INSERT INTO airport.airport_t
(airportCode,
airportName,
numOfRunways,
numOfStaff,
owner,
totalArea,
city_ID,
last_update)
VALUES
('231221',
'Mehrabad International',
4,
232,
'Mehdi Salimi',
2312.3,
1380,
NULL);

INSERT INTO airport.airport_t
(airportCode,
airportName,
numOfRunways,
numOfStaff,
owner,
totalArea,
city_ID,
last_update)
VALUES
('3322111',
'Frankfurt International Airport',
5,
554,
'Gerd Muller',
4321.3,
3072,
NULL);

INSERT INTO airport.airport_t
(airportCode,
airportName,
numOfRunways,
numOfStaff,
owner,
totalArea,
city_ID,
last_update)
VALUES
('9903423',
"King Salah Dubai Int'l airport",
5,
654,
'King Saleem Al-Dubaizi',
2212.3,
65,
NULL);


INSERT INTO airport.airport_t
(airportCode,
airportName,
numOfRunways,
numOfStaff,
owner,
totalArea,
city_ID,
last_update)
VALUES
('324221',
'Ataturk International airport',
4,
211,
'Salzin Malikdin',
2212.3,
3357,
NULL);



-- passenger_t inserts
INSERT INTO airport.passenger_t
(confirmationNumber,
phoneNumber,
firstName,
lastName,
classCode,
emailAddress,
cancelledTicket,
lastUpdated)
VALUES
('2441',
'6243343345',
'Reza',
'Nazdi',
'F',
'Reza@hotmailz.com',
false,
NULL);


INSERT INTO airport.passenger_t
(confirmationNumber,
phoneNumber,
firstName,
lastName,
classCode,
emailAddress,
cancelledTicket,
lastUpdated)
VALUES
('323',
'6134432232',
'John',
'Marston',
'B',
'JohnM@hotmailz.com',
false,
null);




INSERT INTO airport.passenger_t
(confirmationNumber,
phoneNumber,
firstName,
lastName,
classCode,
emailAddress,
cancelledTicket,
lastUpdated)
VALUES
('313',
'6133432992',
'Glen',
'Johnson',
'B',
'Johnson@gmail.com',
false,
null);


INSERT INTO airport.passenger_t
(confirmationNumber,
phoneNumber,
firstName,
lastName,
classCode,
emailAddress,
cancelledTicket,
lastUpdated)
VALUES
('320',
'5524435359',
'Nicki',
'Klap',
'E',
'nikiiToukki@yahoo.com',
false,
null);


INSERT INTO airport.passenger_t
(confirmationNumber,
phoneNumber,
firstName,
lastName,
classCode,
emailAddress,
cancelledTicket,
lastUpdated)
VALUES
('141',
'3217765141',
'Hasan',
'Sass',
'B',
'SassssMash@yahoo.com',
false,
null);



-- manufacturer_t inserts
INSERT INTO airport.manufacturer_t
(manufacturerID,
manufacturerName,
revenue,
city_ID,
last_update)
VALUES
('Airbus',
'Airbus',
2423,
323,
null);


INSERT INTO airport.manufacturer_t
(manufacturerID,
manufacturerName,
revenue,
city_ID,
last_update)
VALUES
('Boeing',
'Boeing',
31241,
1123,
null);

INSERT INTO airport.manufacturer_t
(manufacturerID,
manufacturerName,
revenue,
city_ID,
last_update)
VALUES
('LKHDMRTN',
'Lockheed Martin',
91231,
1263,
null);

INSERT INTO airport.manufacturer_t
(manufacturerID,
manufacturerName,
revenue,
city_ID,
last_update)
VALUES
('Bell',
'Bell',
22312,
3321,
null);

INSERT INTO airport.manufacturer_t
(manufacturerID,
manufacturerName,
revenue,
city_ID,
last_update)
VALUES
('Saab',
'Saab',
8873,
3211,
null);


-- plane_t inserts
INSERT INTO airport.plane_t
(planeSerialNumber,
weight,
capacity,
manufacturer_T_manufacturerID,
last_update)
VALUES
(123,
1231.1,
211,
'Airbus',
NULL);


INSERT INTO airport.plane_t
(planeSerialNumber,
weight,
capacity,
manufacturer_T_manufacturerID,
last_update)
VALUES
(113,
1275.1,
321,
'Airbus',
NULL);


INSERT INTO airport.plane_t
(planeSerialNumber,
weight,
capacity,
manufacturer_T_manufacturerID,
last_update)
VALUES
(6642,
1211.1,
211,
'Boeing',
NULL);


INSERT INTO airport.plane_t
(planeSerialNumber,
weight,
capacity,
manufacturer_T_manufacturerID,
last_update)
VALUES
(9921,
211.1,
99,
'Boeing',
NULL);

INSERT INTO airport.plane_t
(planeSerialNumber,
weight,
capacity,
manufacturer_T_manufacturerID,
last_update)
VALUES
(9721,
211.1,
99,
'Boeing',
NULL);

INSERT INTO airport.plane_t
(planeSerialNumber,
weight,
capacity,
manufacturer_T_manufacturerID,
last_update)
VALUES
(9121,
211.1,
99,
'Boeing',
NULL);



-- flight_t inserts
INSERT INTO airport.flight_t
(flightNumber,
flightDateTime,
airline_T_airlineID,
plane_T_planeSerialNumber,
flightUniqueIdentifier,
last_update,
airport_T_airportCode)
VALUES
('TK32',
current_timestamp(),
'TK',
'9121',
'aaabbb123',
current_timestamp(),
'111231');


INSERT INTO airport.flight_t
(flightNumber,
flightDateTime,
airline_T_airlineID,
plane_T_planeSerialNumber,
flightUniqueIdentifier,
last_update,
airport_T_airportCode)
VALUES
('TK31',
current_timestamp(),
'TK',
'9121',
'aaabbb125',
current_timestamp(),
'231221');


INSERT INTO airport.flight_t
(flightNumber,
flightDateTime,
airline_T_airlineID,
plane_T_planeSerialNumber,
flightUniqueIdentifier,
last_update,
airport_T_airportCode)
VALUES
('US31',
current_timestamp(),
'USA',
'6642',
'ccabbb125',
current_timestamp(),
'324221');

INSERT INTO airport.flight_t
(flightNumber,
flightDateTime,
airline_T_airlineID,
plane_T_planeSerialNumber,
flightUniqueIdentifier,
last_update,
airport_T_airportCode)
VALUES
('IR88',
current_timestamp(),
'IRA',
'6642',
'ccabbb325',
current_timestamp(),
'3322111');


INSERT INTO airport.flight_t
(flightNumber,
flightDateTime,
airline_T_airlineID,
plane_T_planeSerialNumber,
flightUniqueIdentifier,
last_update,
airport_T_airportCode)
VALUES
('IR08',
current_timestamp(),
'IRA',
'9121',
'00vbbb325',
current_timestamp(),
'9903423');



-- sin_t inserts
INSERT INTO airport.sin_t
(SIN,
firstName,
lastName)
VALUES
(333444982,
'Timthody',
'Browne');

INSERT INTO airport.sin_t
(SIN,
firstName,
lastName)
VALUES
(987587465,
'John',
'Browne');

INSERT INTO airport.sin_t
(SIN,
firstName,
lastName)
VALUES
(875873972,
'Nimba',
'Klayton');

INSERT INTO airport.sin_t
(SIN,
firstName,
lastName)
VALUES
(763982716,
'John',
'Marston');

INSERT INTO airport.sin_t
(SIN,
firstName,
lastName)
VALUES
(983982910,
'Nazanin',
'Bahrami');


INSERT INTO airport.sin_t
(SIN,
firstName,
lastName)
VALUES
(444343897,
'Cyprus',
'Mitchel');



-- staff_t inserts
INSERT INTO airport.staff_t
(staffID,
SIN_T_SIN,
hireDate,
salary,
phoneNumber,
emailAddress,
airport_T_airportCode,
staffJobCode,
last_update)
VALUES
(1151,
'983982910',
current_timestamp(),
552418,
6134435626,
NULL,
NULL,
'Engineer',
current_timestamp());


INSERT INTO airport.staff_t
(staffID,
SIN_T_SIN,
hireDate,
salary,
phoneNumber,
emailAddress,
airport_T_airportCode,
staffJobCode,
last_update)
VALUES
(8345,
'763982716',
current_timestamp(),
22339,
4135526526,
NULL,
'111231',
'Janitor',
current_timestamp());

INSERT INTO airport.staff_t
(staffID,
SIN_T_SIN,
hireDate,
salary,
phoneNumber,
emailAddress,
airport_T_airportCode,
staffJobCode,
last_update)
VALUES
(5564,
'444343897',
current_timestamp(),
22339,
7649739809,
NULL,
NULL,
'Janitor',
current_timestamp());


INSERT INTO airport.staff_t
(staffID,
SIN_T_SIN,
hireDate,
salary,
phoneNumber,
emailAddress,
airport_T_airportCode,
staffJobCode,
last_update)
VALUES
(8145,
'875873972',
current_timestamp(),
22339,
4135526526,
NULL,
'111231',
'Supervisor',
current_timestamp());




INSERT INTO airport.staff_t
(staffID,
SIN_T_SIN,
hireDate,
salary,
phoneNumber,
emailAddress,
airport_T_airportCode,
staffJobCode,
last_update)
VALUES
(815,
'333444982',
current_timestamp(),
33433,
6134459065,
'noreplyTechnician815@airport.com',
'111231',
'Technician',
current_timestamp());



INSERT INTO airport.staff_t
(staffID,
SIN_T_SIN,
hireDate,
salary,
phoneNumber,
emailAddress,
airport_T_airportCode,
staffJobCode,
last_update)
VALUES
(0921,
'987587465',
current_timestamp(),
89333,
5146652201,
'engineer0912@ataturkairport.com',
'324221',
'Engineer',
current_timestamp());



-- maintainance_t inserts
INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('ee32',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('ee33',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('ee34',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('ee35',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('ee36',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('ee43',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('e1b3',
curdate(),
current_timestamp());

INSERT INTO airport.maintainance_t
(maintainanceID,
dueDate,
last_update)
VALUES
('1A09',
curdate(),
current_timestamp());


-- passenger_t_has_flight_t inserts;
INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('141',
'00vbbb325');


INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('2441',
'aaabbb123');

INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('313',
'aaabbb125');


INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('320',
'aaabbb125');

INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('320',
'aaabbb123');


INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('323',
'aaabbb123');

INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('313',
'aaabbb123');


INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('313',
'ccabbb125');



INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('313',
'ccabbb325');

INSERT INTO airport.passenger_t_has_flight_t
(passenger_T_confirmationNumber,
flight_T_flightUniqueIdentifier)
VALUES
('2441',
'00vbbb325');


-- plane_t_has_maintainance_t inserts;
INSERT INTO airport.plane_t_has_maintainance_t
(maintainance_T_maintainanceID,
plane_T_planeSerialNumber,
lastMaintainance,
last_update)
VALUES
('ee32',
'113',
current_date(),
null);

INSERT INTO airport.plane_t_has_maintainance_t
(maintainance_T_maintainanceID,
plane_T_planeSerialNumber,
lastMaintainance,
last_update)
VALUES
('e1b3',
'123',
current_date(),
null);


INSERT INTO airport.plane_t_has_maintainance_t
(maintainance_T_maintainanceID,
plane_T_planeSerialNumber,
lastMaintainance,
last_update)
VALUES
('1A09',
'9921',
current_date(),
null);

INSERT INTO airport.plane_t_has_maintainance_t
(maintainance_T_maintainanceID,
plane_T_planeSerialNumber,
lastMaintainance,
last_update)
VALUES
('ee34',
'9721',
current_date(),
null);



##############################################################
/* JOIN:
 To get the list of planes that are made by 'Boeing' 
*/

USE airport;
SELECT 
    manufacturerID, 
    manufacturerName, 
    planeSerialNumber
FROM
    manufacturer_t
        JOIN
    plane_t ON manufacturerID = manufacturer_T_manufacturerID
WHERE
    manufacturerName LIKE '%bo%';

##############################################################
/* UNION:
 To get the complete list of maintainances and planes WITH 
 the lastes time stamp of those list entires
*/
USE airport;
SELECT 
    maintainanceID, last_update
FROM
    maintainance_t 
UNION SELECT 
    planeSerialNumber, last_update
FROM
    plane_t;
	
##############################################################
/* INDEX:
*/
-- Also, please refer to lines 276 and 278 of the AirportDDL_AmirhosseinArdalan.sql file
USE airport;
CREATE INDEX fk_passenger_T_has_flight_T_flight_T1_idx ON passenger_T_has_flight_T (flight_T_flightUniqueIdentifier ASC) ;
CREATE INDEX fk_passenger_T_has_flight_T_passenger_T1_idx ON passenger_T_has_flight_T (passenger_T_confirmationNumber ASC);


##############################################################
/* SUBQUERY 1:
	Returns the airports that have a matching 11 pattern in their code ID
*/
SELECT 
    flightUniqueIdentifier UID, 
    airport_T_airportCode
FROM
    flight_t
WHERE
    airport_T_airportCode IN (SELECT 
            airportCode
        FROM
            airport_t
        HAVING airportCode LIKE '%11%');



##############################################################
/* SUBQUERY 2:
	returns the list of planes that are assigned to fly AND have had at least one maintainance
*/
SELECT 
    flightNumber, 
    plane_T_planeSerialNumber
FROM
    flight_t
WHERE
    plane_T_planeSerialNumber IN (SELECT 
            plane_T_planeSerialNumber
        FROM
            plane_t_has_maintainance_t);
# The query does not have any result since those planes that are flying (in the airport DB)
# have not had at least one maintainane. You may check by uncommenting this:
-- SELECT * FROM plane_t_has_maintainance_t;


##############################################################
/* VIEW:
 To get the list of official languages of a country
*/
USE world;
DROP VIEW IF EXISTS country_official_language_vw;
CREATE VIEW country_official_language_vw AS
    SELECT 
        country.code,
        country.name,
        Region,
        countrylanguage.language language
    FROM
        country,
        countrylanguage
    WHERE
        country.code = countryLanguage.CountryCode
            AND IsOfficial = TRUE;

##############################################################
/* LEFT OUTER JOIN:
 To get the entire list of staff at the airport:
 This list shows the complete list regardless of whether or not they have enough contact information:
 If the IT need to expand the ISP , they can get a better understanding of how many nodes in their server 
 they would need to create
*/
SELECT 
    staffID,
    emailAddress email,
    phoneNumber,
    SIN_T_SIN sinNumber,
    airportCode
FROM
    staff_t
        LEFT OUTER JOIN
    airport_t ON staff_t.airport_T_airportCode = airport_t.airportCode
WHERE
    airportCode LIKE '111231'
ORDER BY staffID DESC;


##############################################################
/* RIGHT OUTER JOIN:
 To the get the list of only the planes who have had at least one maintainance!
*/
SELECT 
    maintainanceID, dueDate, plane_T_planeSerialNumber
FROM
    maintainance_t
        RIGHT OUTER JOIN
    plane_t_has_maintainance_t ON maintainance_t.maintainanceID = plane_t_has_maintainance_t.maintainance_T_maintainanceID;


##############################################################
/* META DATA:
 Metadata: data about our data
*/
use airport;
show columns from airline_t;
show columns from airport_t;
show columns from flight_t;
show columns from maintainance_t;
show columns from manufacturer_t;
show columns from passenger_t;
show columns from passenger_t_has_flight_t;
show columns from plane_t;
show columns from plane_t_has_maintainance_t;
show columns from sin_t;
show columns from staff_t;
use world;
show columns from city;
show columns from country;
show columns from countrylanguage;









