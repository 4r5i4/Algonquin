/*######################  DESCRPITON  ########################
 -- Author: A. Ardalan
 -- Last Modified: 	* Feb 2016
 -- filename: DB_LAB5.sql
*/
/*######################### NOTES ############################
Script notes:

 Description to lines or script statements are placed BEFORE that 
 line and denoted by '##'

 Results or expected values are denoted AFTER the statement and 
 denoted by '#'
*/


##############################################################
#Question 1.
#show tables in world;
#same as :
USE WORLD;
SHOW tables;

#Question 2.
#@info : for me to see the fields of city table 
SHOW columns from city;

SELECT 
	Name, population, CountryCode
FROM 
	city;
##############################################################
#Question 3.
SELECT 
    country.name AS 'Country Name', 
    city.Name AS 'city Name', 
    city.population
FROM
    city
        JOIN
    country ON city.countryCode = country.Code
    order by 'Country Name';  #or order by Country.Name
##############################################################
#Question 4.
SELECT 
    country.name AS 'Country Name',
    city.Name AS 'city Name',
    city.population
FROM
    city
        JOIN
    country ON city.countryCode = country.Code
WHERE
    country.code = 'CAN'
        AND city.population BETWEEN 200000 AND 300000;
    #order by 'Country Name';  #or order by Country.Name
##############################################################
#Question 5.
#@info : for me, to see that are the fields 
show columns from country;
SELECT 
    name AS 'Country', population AS 'People living in cities'
FROM
    country
WHERE
    country.Code IN ('ECU' , 'HTI', 'FRA');
##############################################################
#Question 6.
SELECT 
    name, population
FROM
    country
WHERE
    population < (SELECT 
            AVG(population)
        FROM
            country);
           
##############################################################
#Question 7.
Use World;
SELECT 
    city.name, country.name
FROM
    city
        JOIN
    country ON city.countryCode = country.code
ORDER BY city.name ASC;
##############################################################
#Question 8.
#so we first create a view, 
# and then 'from' that view we make a query, which is down here. 
#We create and use the view so that we don't have to re-write the damn code again and again: it 
# helps with code reusability

CREATE VIEW myV As
SELECT
    city.name, country.name ctryname 	#this ctryname was added [to differentiate between the two 'name' columns] because we would have two 
										#.name (city.name and country.name) columns otherwise!
FROM
    city
        JOIN
    country ON city.countryCode = country.code
ORDER BY city.name ASC;

#... now that the view is created, we look for the city name that matches:
SELECT ctryname from myV where name="Zukovski";

##############################################################
#Question 9.
select * from city limit 0,10; #the first number is the inexing which starts from 0, and the second number is how many rows you want
select * from city limit 51;
##############################################################
#Question 10.
select * from city limit 50, 50;


##############################################################
#Question 11.
SELECT 
    name
FROM
    city
WHERE
    name LIKE '%ada%';
    #this give the nmae of cities where the string 'ada' is somewhere in the middle

##############################################################
#Question 12:
#Will show how many orders each customer has
USE production_f14;
SELECT 
    customer_t.Cust_Id,
    customer_t.Cust_Lname AS 'Last Name',
    customer_t.Cust_Fname AS 'First Name',
    count(invoice_t.Cust_Id) 'Number of Orders'
FROM
    customer_t
        LEFT JOIN
    invoice_t ON invoice_t.Cust_Id = customer_t.Cust_Id
GROUP BY customer_t.Cust_Id;

##############################################################
#Question 13:
#Will show customers who have more than 1 purchase 
USE production_f14;
SELECT 
    customer_t.Cust_Id,
    customer_t.Cust_Lname AS 'Last Name',
    customer_t.Cust_Fname AS 'First Name',
    COUNT(invoice_t.Cust_Id) 'Number of Orders'
FROM
    customer_t
        LEFT JOIN
    invoice_t ON customer_t.Cust_Id = invoice_t.Cust_Id
GROUP BY customer_t.Cust_Lname
HAVING count(invoice_t.Cust_Id) > 1;
##############################################################
#Question 14:
#This is to quert invoices made on the same product:
#... i.e. Perhaps prodcut A was ordered 3 times! 
# We also want to order them by price to see the trend 
#... and make sound managarial decisions on where we should focus
#... our production line on! :)
USE production_f14;
SELECT 
    *
FROM
    invoice_line_t;
SELECT 
    COUNT(invoice_line_t.Prod_Code) AS 'Number of Orders',
    invoice_line_t.Line_Price,
    invoice_line_t.Line_units
FROM
    invoice_line_t
GROUP BY invoice_line_t.Invoice_Number
ORDER BY COUNT(invoice_line_t.Prod_Code) DESC;
##############################################################
#Quesiton 15:
# NOTE : INCOMPLETE AND NOT FULLY IMPLEMENTED THE IDEA:
# I wanted to list the actors that played in the same movie:
# i.e. Brad Pitt and Nicolas Cage played in 3 movies together, 
# and I wanted to list those movies!
#using SAKILA
USE sakila;
#SELECT * FROM CATEGORY;
Select 
	actor.first_name 'First Name',
    actor.last_name 'Last Name',
    count(film_actor.film_id) AS 'Number of Movies Played'
    
FROM actor JOIN film_actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.actor_id > (SELECT count(category.name) from category WHERE category.name LIKE 'Action')
GROUP BY actor.actor_id;

    
		
-- eof: DB_LAB5.sql