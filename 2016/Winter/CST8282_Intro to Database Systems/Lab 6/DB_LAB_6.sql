/*######################  DESCRPITON  ########################
 Author: A. Ardalan
 Intro to Database Systems
 title: DB_LAB6.sql
*/
/*######################### NOTES ############################
Script notes:

 Description to lines or script statements are placed BEFORE that 
 line and denoted by '##'

 Results or expected values are denoted AFTER the statement and 
 denoted by '#'
*/

##############################################################
#Quesiton 1:
show databases like '%';
# % is a wildcard and a substitute for zero or more characters.
# it shows all the databases available


##############################################################
#Quesiton 2:
use sakila;
# nothing's displayed
# but it does eliminate the need to specify the root DB:
#	e.g. I would otherwise have to say:
#		select sakila.rental.cutomer_id
#	but instead, I can just say:
#		select rental.customer_id


SELECT 
    *
FROM
    world.city;
#shows the city table from world database


##############################################################
#Quesiton 3:


##show me the columns so I can decide what to JOIN on :
show columns from rental;
show columns from customer;


## I later made this into a view but I also want to see the result of my query
SELECT 
    customer.customer_id AS 'customer_id',
    rental.customer_id AS 'cust_id from sakila.rental',
    customer.first_name AS 'firstName',
    customer.last_name AS 'lastName',
    
    #this was only for debugging and to see how the query bahaves
    #rental.rental_id AS 'rental_id',
    
    COUNT(rental.rental_id) AS 'TotalRented',
    COUNT(DISTINCT rental.rental_id) AS 'No. of distinct titles rented'
FROM
    customer
        JOIN
    rental ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY TotalRented DESC
##this LIMIT keyword, goes from row indexed 0 all the way UP TO and NOT INCLUDING row indexed 2
LIMIT 0,2;



##dropping the view: why? some later changes to the view would not take effect, that's why
#	we have have to drop the view and re-create it
drop view mostDevotedMovieGeek;
create view mostDevotedMovieGeek AS
SELECT 
    customer.customer_id AS 'customer_id',
    rental.customer_id AS 'cust_id from sakila.rental',
    customer.first_name AS 'firstName',
    customer.last_name AS 'lastName',
    
    #this was only for debugging and to see how the query bahaves
    #rental.rental_id AS 'rental_id',
    
    COUNT(rental.rental_id) AS 'TotalRented',
    COUNT(DISTINCT rental.rental_id) AS 'distinctTotalRented'
FROM
    customer
        JOIN
    rental ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id
# ORDER BY comes before 'WHERE' but after 'GROUP BY'
ORDER BY TotalRented DESC;

    
##... now that the view is created, we look for whatever we want:
##	Making sure that the column names match the Aliases that we give to the fields in the view:
##	e.g. the is no customer.first_name in this view, we set is as firstName

#this is just to get the customer that rented the most
SELECT 
    max(TotalRented),
    firstName,
    lastName
FROM
    mostDevotedMovieGeek;


## But if I want the second highest number of rented titles then I use
## two subqueries:
##	first find the highest (which in essence is the second highest, becuase ->
##	then we say this ^^^^ highest value has to be less than whatever is the highest value
##	in the mostDevotedMovieGeek... second subquery returns BEFORE the first subquery does
## NOTE that this is not really needed for this lab, but what if you don't want to display
##		the remining names and really REALLY want only two names to pop out!?
SELECT 
    firstName, lastName, TotalRented
FROM
    mostDevotedMovieGeek
WHERE
    TotalRented = (SELECT 
            MAX(TotalRented)
        FROM
            mostDevotedMovieGeek
        WHERE
            TotalRented < (SELECT 
                    MAX(TotalRented)
                FROM
                    mostDevotedMovieGeek));
##############################################################
#Quesiton 4:
SELECT 
    firstName, lastName, TotalRented
FROM
	mostDevotedMovieGeek
HAVING TotalRented >= 40;
# Note that I tried count(TotalRented) when TotalRented is already an aggregate COUNT() function

##############################################################
#Quesiton 5:
SELECT 
    firstName, lastName, TotalRented as 'c'
FROM
	mostDevotedMovieGeek
HAVING c > 30 AND c < 40;

##############################################################
#Quesiton 6:
SHOW COLUMNS FROM inventory;
SHOW COLUMNS FROM customer;
SHOW COLUMNS FROM film;
SHOW COLUMNS FROM rental;
select * from customer;

## This is a inventory join on film view
## Basically checking to see the complete iist of movies and their respective 
## IDs in both inventory and film tables
DROP VIEW INV_JOIN_FILM_vw;
CREATE VIEW INV_JOIN_FILM_vw AS 
SELECT 
    inventory.inventory_id AS 'invID',
    ## I want to compare and make sure film_ids match!
    inventory.film_id AS 'invFilmID',
    film.film_id AS 'filmFilmID',
    film.title AS 'title'
FROM
    film
        JOIN
    inventory ON inventory.film_id = film.film_id;
# The query on its own results in many rows with unique inventory id as PK
# but duplicates in title, because many copies of a movie are rented at different locations

## Query to output the the view result and eliminate 'title' duplicates
SELECT 
    invID, filmFilmID, title
FROM
    INV_JOIN_FILM_vw
GROUP BY title;

## Doing a three join:
## first JOIN:
##		first, I need to know which film_id belongs to what title:
##		This has already been accomplished by creating INV_JOIN_FILM_vw view
##		then second join:
##			Now I need to know which idiot rented FROST HEAD:
##			So we join in with the customer table on their id to get thier dumb names
SELECT 
    invID,
    filmFilmID,
    title,
    rental_id,
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    rental.return_date 'return'
FROM
    INV_JOIN_FILM_vw
        JOIN
    RENTAL ON rental.inventory_id = invID
        JOIN
    customer ON customer.customer_id = rental.customer_id
WHERE
    title LIKE 'FROST HEAD';
   
##############################################################
#Quesiton 7:
## We could have avoided making a view all together, but it might have some use later on, I don't want to rewrite 
## a piece of code a zillion times. 
DROP VIEW WHICH_CUTS_HAS_WHAT_MOVIE_vw;
CREATE VIEW WHICH_CUTS_HAS_WHAT_MOVIE_vw AS 
SELECT 
    invID,
    filmFilmID,
    title 					'title',
    rental_id,
    # You don't need to add the 'AS' keyword to signify alliases... just write in from of the fields
    customer.customer_id	'cust_id',
    customer.first_name 	'fname',
    customer.last_name  	'lname',
    rental.return_date  	'returnDate'    
FROM
    INV_JOIN_FILM_vw
        JOIN
    RENTAL ON rental.inventory_id = invID
        JOIN
    customer ON customer.customer_id = rental.customer_id;


## I use the newly created WHICH_CUTS_HAS_WHAT_MOVIE_vw to query which return
## dates are null. 

SELECT 
    cust_id, fname, lname, title, returnDate
FROM
    WHICH_CUTS_HAS_WHAT_MOVIE_vw
WHERE
    returnDate IS NULL;

##############################################################
#Quesiton 8:
SHOW COLUMNS FROM sakila.staff;
# the picture attribute is of type:
/*
To store binary data of any kind, such as ASCII text, an executable (.exe) file, 
or a stream of bytes, and with indeterminate length, use the Blob data type. 
Blob data types are particularly useful for storing Image data from SQL Server.
src = https://msdn.microsoft.com/en-CA/library/0t1k839z(v=vs.80).aspx
*/

##############################################################
#Quesiton 9:
select * from staff;
SELECT password FROM staff;
# The password fields are :
#	identical in length
#	identical in content/char


##############################################################
#Quesiton 10:
SHOW columns FROM inventory;
SHOW columns FROM FILM;
select * from film;
select * from inventory;


SELECT 
    inventory.inventory_id AS 'invID',
    count(film.title),
    film.language_id 'languageID'
FROM
    film
        JOIN
    inventory ON inventory.film_id = film.film_id
    group by invID;
#The reuslt is very biased! only one language is offered.
# Also, only two stores carry all the inventory.


##############################################################
#Quesiton 11:
select * from customer;

SELECT 
	customer.customer_id,
    customer.first_name,
	customer.last_name lastName,
	customer.active activeOrNot
FROM
	customer
HAVING activeOrNot = 0;

	

    
## This will not work:
##		insert into language(language_id, name, last_update) 
##		values(7, Persian, time); 
## Because id is automatically increamented, and timestamp is also automatically updated. so:
## We have to give NULL values as INPUT so that sql takes care of it on itself! 
## src = http://www.cubrid.org/wiki_tutorials/entry/how-to-insert-data-into-tables-with-auto_increment-columns

##############################################################
#Quesiton 12:
select * from language;
INSERT INTO sakila.language(language_id, name, last_update) values(NULL, 'Persian', NULL);
INSERT INTO sakila.language(language_id, name, last_update) values(NULL, 'Turkish', NULL);
select * from language;
## just in case:
##		delete from language where language_id = 11;
##		I deleted Turkish, which was added three times, and the deleted all of them
## QUESTION FOR MS.GURUSAMY: Then I added it again just to see that id = 11.. how can I reset the id to the last valid value? i.e. Turkish should have id 8




##############################################################
#Quesiton 13:
select * from film;
show columns from film;


INSERT INTO `sakila`.`film`
(`film_id`,
`title`,
`description`,
`release_year`,
`language_id`,
`original_language_id`,
`rental_duration`,
`rental_rate`,
`length`,
`replacement_cost`,
`rating`,
`special_features`,
`last_update`)
VALUES
(1001,
'A Separation',
'When Nader (Payman Maadi), a bank employee, refuses to leave Tehran, his wife, Simin (Leila Hatami) sues for divorce in the hope that she can make a better life for their young daughter abroad',
2011,
7,
NULL,
3,
5.99,
123,
30,
'PG-13',
NULL,
NULL);


INSERT INTO `sakila`.`film`
(`film_id`,
`title`,
`description`,
`release_year`,
`language_id`,
`original_language_id`,
`rental_duration`,
`rental_rate`,
`length`,
`replacement_cost`,
`rating`,
`special_features`,
`last_update`)
VALUES
(1002,
'About Elly',
'A young teacher disappears before being introduced to a potential suitor in northern Iran.',
2009,
7,
NULL,
3,
5.99,
123,
30,
'PG-13',
NULL,
NULL);


INSERT INTO `sakila`.`film`
(`film_id`,
`title`,
`description`,
`release_year`,
`language_id`,
`original_language_id`,
`rental_duration`,
`rental_rate`,
`length`,
`replacement_cost`,
`rating`,
`special_features`,
`last_update`)
VALUES
(1003,
'The Bandit',
'The Bandit is a 1996 Turkish film written and directed by Yavuz Turgul and starring Şener Şen and Uğur Yüce',
1996,
8,
NULL,
3,
2.99,
128,
20,
'PG-13',
NULL,
NULL);


INSERT INTO `sakila`.`film`
(`film_id`,
`title`,
`description`,
`release_year`,
`language_id`,
`original_language_id`,
`rental_duration`,
`rental_rate`,
`length`,
`replacement_cost`,
`rating`,
`special_features`,
`last_update`)
VALUES
(1004,
'Distant',
'After losing his factory job, Yusuf (Mehmet Emin Toprak) leaves his Turkish village and travels to Istanbul in search of work. There, he lives with his cousin Mahmut (Muzaffer Özdemir), a well-to-do photographer',
2002,
8,
NULL,
2,
6.99,
110,
35,
'G',
NULL,
NULL);


INSERT INTO `sakila`.`film`
(`film_id`,
`title`,
`description`,
`release_year`,
`language_id`,
`original_language_id`,
`rental_duration`,
`rental_rate`,
`length`,
`replacement_cost`,
`rating`,
`special_features`,
`last_update`)
VALUES
(1005,
'Winter Sleep',
'Aydin, his wife and his recently divorced sister spend the winter in their hotel',
2014,
8,
NULL,
4,
5.99,
196,
55,
'PG',
NULL,
NULL);


select * from film;










