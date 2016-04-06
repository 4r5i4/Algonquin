/*######################  DESCRPITON  ########################
 -- Author: A. Ardalan
 -- Last Modified: 	1 March 2016
 -- filename: DB_LAB7.sql
*/
/*######################### NOTES ############################
Script notes:

 Description to lines or script statements are placed BEFORE that 
 line and denoted by '##'

 Results or expected values are denoted AFTER the statement and 
 denoted by '#'
*/


-- populate Customer_T
#TRUNCATE TABLE Customer_T;
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (2, 'Value Furniture', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7743');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (3, 'Home Furnishings', '1900 Allard Ave.', 'Albany', 'NY', '12209-1125');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (7, 'Period Furniture', '394 Rainbow Dr.', 'Seattle', 'WA', '97954-5589');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (8, 'California Classics', '816 Peach Rd.', 'Santa Clara', 'CA', '96915-7754');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (9, 'M and H Casual Furniture', '3709 First Street', 'Clearwater', 'FL', '34620-2314');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (10, 'Seminole Interiors', '2400 Rocky Point Dr.', 'Seminole', 'FL', '34646-4423');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (11, 'American Euro Lifestyles', '2424 Missouri Ave N.', 'Prospect Park', 'NJ', '07508-5621');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (12, 'Battle Creek Furniture', '345 Capitol Ave. SW', 'Battle Creek', 'MI', '49015-3401');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (13, 'Heritage Furnishings', '66789 College Ave.', 'Carlisle', 'PA', '17013-8834');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (14, 'Kaneohe Homes', '112 Kiowai St.', 'Kaneohe', 'HI', '96744-2537');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (15, 'Mountain Scenes', '4132 Main Street', 'Ogden', 'UT', '84403-4432');


-- Populate ProductLine_T
#TRUNCATE TABLE ProductLine_T;
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (1, 'Cherry Tree');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (2, 'Scandinavia');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (3, 'Country Look');


-- Populate Order_T
#TRUNCATE TABLE Order_T;
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1001, '2010/10/21', 1);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1002, '2010/10/21', 8);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1003, '2010/10/21', 15);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1004, '2010/10/22', 5);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1005, '2010/10/22', 3);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1006, '2010/10/23', 2);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1007, '2010/10/23', 11);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1008, '2010/10/23', 12);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1009, '2010/10/24', 4);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1010, '2010/10/24', 1);


-- populate Product_T
#TRUNCATE TABLE Product_T;
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (1, 'End Table', 'Cherry', 175, 1);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (2, 'Coffee Table', 'Natural Ash', 200, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (3, 'Computer Desk', 'Natural Ash', 375, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (4, 'Entertainment Center', 'Natural Maple', 650, 3);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (5, 'Writers Desk', 'Cherry', 325, 1);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (6, '8-Drawer Desk', 'White Ash', 750, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (7, 'Dining Table', 'Natural Ash', 800, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (8, 'Computer Desk', 'Walnut', 250, 3);


-- Populate OrderLine_T
#TRUNCATE TABLE OrderLine_T;
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1001, 1, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1001, 2, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1001, 4, 1);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1002, 3, 5);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1003, 3, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1004, 6, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1004, 8, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1005, 4, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1006, 4, 1);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1006, 5, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1006, 7, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1007, 1, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1007, 2, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1008, 3, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1008, 8, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1009, 4, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1009, 7, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1010, 8, 10);


-- Populate Employee_T
#TRUNCATE TABLE Employee_T;
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-345', 'Jim Jason', '2134 Hilltop Rd', '', 'TN', '', '22/10/10', '1962/10/10', '454-56-768');

# To be added
#1
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES 
('123-44-346', 'Ali Baba', '13 Disney blvd', '', 'FL', '31444', '22/10/10', '1961/10/11', '123-44-320');
#2
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-347', 'Blake Mortimer', '21 LeAntique Rd', '', 'QC', '', '22/10/10', '1963/1/12', '454-56-768');
#3
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-348', 'Smart Assisso', '313 Dumbshingles Rd', 'Ottawa', 'ON', '', '22/10/13', '1988/6/16', '123-44-347');
#4
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-349', 'Tom Hulk', '2134 Hilltop Rd', '', 'TN', '', '22/10/10', '1960/11/7', '123-44-347');
#5

INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES   
('123-44-315', 'Bad Luck', '666 Hell st', 'Lubbock', 'TX', '33666', '22/10/10', '1953/12/13', '454-56-768');
#6
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-316', 'Nelson Papaya', '22131 Buttfugde Rd', '', 'NY', '', '2/1/10', '1962/8/10', '454-56-768');
#7
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-317', 'Manuel R. Jackson', '2134 Hilltop Rd', '', 'TN', '', '2/11/10', '1962/5/10', '123-44-316');
#8
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES 
('123-44-318', 'Tyron Johnson', 'Tamarack Rd', 'Santa Fe', 'CA', '', '27/7/11', '1990/9/10', '123-44-316');
#9
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('123-44-319', 'Bumba Clut', '2134 Hilltop Rd', '', 'TN', '', '22/10/10', '1962/10/10', '454-56-768');
#10
INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES 
('123-44-320', 'Sneezie Cheezie', '420 Chill hwy', 'New Orleans', 'LA', '', '4/10/12', '1962/10/10', '454-56-768');

INSERT INTO Employee_T  
(EmployeeID, 
EmployeeName, 
EmployeeAddress, 
EmployeeCity, 
EmployeeState, 
EmployeeZipCode, 
EmployeeDateHired, 
EmployeeBirthDate, 
EmployeeSupervisor)
VALUES  
('454-56-768', 'Robert Lewis', '17834 Deerfield Ln', 'Nashville', 'TN', '', '1999/01/01', '1955/01/06', '');

-- Test tables
SELECT * FROM OrderLine_T;
SELECT * FROM Product_T;
SELECT * FROM ProductLine_T;
SELECT * FROM Order_T;
SELECT * FROM Customer_T;
SELECT * FROM Employee_T;


show columns from Product_T;
##############################################################
#Question 1:
#Done
##############################################################
#Question 2:
/*
Equi-join:
A join in which the joining
condition is based on equality
between values in the common
columns. Common columns appear
(redundantly) in the result table.
ref = textbook , pp.291
*/
SELECT 
    Customer_T.CustomerID,
    Order_T.CustomerID,
    CustomerName,
    OrderID
FROM
    Customer_T,
    Order_T
WHERE
    Customer_T.CustomerID = Order_T.CustomerID
ORDER BY OrderID;
# 10 rows are returned


##############################################################
#Question 3:
SELECT 
    Customer_T.CustomerID,
    Order_T.CustomerID,
    CustomerName,
    OrderID
FROM
    Customer_T
        INNER JOIN
    Order_T ON Customer_T.CustomerID = Order_T.CustomerID
ORDER BY OrderID;

#Question 4:
## the e and m are aliases that are validated in the 'FROM' clause, 
## therefore if I try to just say :
##		SELECT e.EmployeeID ... FROM Employee_T with no alias, I will get an error!
SELECT e.EmployeeID, e.EmployeeName, m.EmployeeName manager
FROM Employee_T e, employee_t m
where e.EmployeeSupervisor = m.EmployeeID
order by manager;

##############################################################
#Question 5:
## src = textbook , pp.306
SELECT 
    c.CustomerID 'customerTableCustID',
    o.customerID 'orderTableCustID',
    ol.orderedQuantity 'orderQnty',
    o.orderid as 'orderTableOrderID',
    ol.orderid as 'orderLineTableOrderID',
    
    'largest qnty' AS Quantity
FROM
    customer_t 	c,
    Order_t 	o,
    orderline_t ol
WHERE
    o.customerid = c.customerid
and
	o.orderid = ol.orderid
and 
	ol.orderedquantity = (
		select max(orderedquantity)
        from orderline_t)
UNION
SELECT 
    c.CustomerID 'customerTableCustID',
    o.customerID 'orderTableCustID',
    ol.orderedQuantity 'orderQnty',
    o.orderid as 'orderTableOrderID',
    ol.orderid as 'orderLineTableOrderID',
    
    'smallest qnty' AS Quantity
FROM
    customer_t 	c,
    Order_t 	o,
    orderline_t ol
WHERE
    o.customerid = c.customerid
and
	o.orderid = ol.orderid
and 
	ol.orderedquantity = (
		select min(orderedquantity)
        from orderline_t)
order by orderQnty;
        
##############################################################        
#Question 6:
use world;
show tables;

select c.id, c.name, c.countrycode, c.population, 'most populated city' as City
from city c
where c.population  = (
	select max(population)
    from city)
UNION
select c.id, c.name, c.countrycode, c.population, 'least populated city' as City
from city c
where c.population  = (
	select min(population)
    from city);
    
    
##############################################################    
#Quesiton 7:
use pvfc;


SELECT 
    *
FROM
    order_t;
    
show columns from order_t;


DELETE FROM `pvfc`.`order_t` 
WHERE
    OrderID = 1010;
# result:
# 	ERROR: 00:08:44	DELETE FROM `pvfc`.`order_t` WHERE OrderID = 1010	
#	Error Code: 1451. Cannot delete or update a parent row: a foreign key 
#	constraint fails (`pvfc`.`orderline_t`, CONSTRAINT `OrderLine_FK1` FOREIGN KEY (`OrderID`) REFERENCES `order_t` (`OrderID`))	0.000 sec
#		Observation:
#			OrderID is a primaryKey in order_t table, which is a parent table to the many-to-many relational table named 'orderline_t', 
#			OrderID therefore is a foreignkey to orderline_t and cannot be altered!

## Basically to delete a row from a parent table, you have to delete its respective row in its CHILD/children table and then the parent itself.
## A google lookup on this gave me the following, with a code I did not understand, and did not use:
## src = http://stackoverflow.com/questions/8251146/delete-data-with-foreign-key-in-sql-server-table
DELETE FROM orderline_t 
WHERE
    orderID = 1010;	

DELETE FROM `pvfc`.`order_t` 
WHERE
    OrderID = 1010;


SELECT 
    *
FROM
    order_t;
    # Surely, there is no OrderID 1010 :)
    
##############################################################
#Question 8:
##First a query without a subquery:
## Productivity hint: 
##	To get the fields of a table:
## 		In the 'Navigator' panel, hover over the desired table -> right click -> Copy to Clipboard -> (do what you want!)
SELECT `product_t`.`ProductID` prodID,
    `product_t`.`ProductDescription` description,
    `product_t`.`ProductStandardPrice` stndrdPrice
FROM `pvfc`.`product_t`;


## And now I can compare and check to see if the result is gonna be consistant with what I expected:
SELECT `product_t`.`ProductID` prodID,
    `product_t`.`ProductDescription` description,
    `product_t`.`ProductStandardPrice` stndrdPrice
FROM `pvfc`.`product_t`
where ProductStandardPrice > (
	select avg(ProductStandardPrice)
    from product_t)
    order by stndrdPrice DESC;


-- eof: DB_LAB7.sql