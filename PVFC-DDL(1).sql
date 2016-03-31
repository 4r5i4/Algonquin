-- Pine Valley Furniture Company. 
-- CST 8282, Introduction to Database Systems
-- Filename: F14-PVFC-DDL.sql
-- Last Review: 22 Feb 2015

DROP SCHEMA IF EXISTS PVFC;
CREATE SCHEMA PVFC;

USE PVFC;

DROP TABLE IF EXISTS Customer_T;
DROP TABLE IF EXISTS ProductLine_T;
DROP TABLE IF EXISTS Order_T;
DROP TABLE IF EXISTS Product_t;
DROP TABLE IF EXISTS OrderLine_T;


CREATE TABLE IF NOT EXISTS Customer_T (
    CustomerID INT(11) NOT NULL,
    CustomerName VARCHAR(25) NOT NULL,
    CustomerAddress VARCHAR(30),
    CustomerCity VARCHAR(20),
    CustomerState VARCHAR(2),
    CustomerPostalCode VARCHAR(10),
    CONSTRAINT Customer_PK PRIMARY KEY (CustomerID)
);


CREATE TABLE IF NOT EXISTS Order_T (
    OrderID INT(11) NOT NULL,
    CustomerID INT(11),
    OrderDate DATE,
    CONSTRAINT Order_PK PRIMARY KEY (OrderID),
    CONSTRAINT Order_FK1 FOREIGN KEY (CustomerID)
        REFERENCES Customer_T (CustomerID)
);


CREATE TABLE IF NOT EXISTS ProductLine_T (
    ProductLineID INT(11) NOT NULL,
    ProductLineName VARCHAR(50),
    CONSTRAINT ProductLine_PK PRIMARY KEY (ProductLineID)
);


CREATE TABLE IF NOT EXISTS Product_T (
    ProductID INT(11) NOT NULL,
    ProductLineID INT(11),
    ProductDescription VARCHAR(50),
    ProductFinish VARCHAR(20),
    ProductStandardPrice DECIMAL(6 , 2 ),
    CONSTRAINT Product_PK PRIMARY KEY (ProductID),
    CONSTRAINT Product_FK1 FOREIGN KEY (ProductLineID)
        REFERENCES ProductLine_T (ProductLineID)
);


CREATE TABLE IF NOT EXISTS OrderLine_T (
    OrderID INT(11) NOT NULL,
    ProductID INT(11) NOT NULL,
    OrderedQuantity INT(11),
    CONSTRAINT OrderLine_PK PRIMARY KEY (OrderID , ProductID),
    CONSTRAINT OrderLine_FK1 FOREIGN KEY (OrderID)
        REFERENCES Order_T (OrderID),
    CONSTRAINT OrderLine_FK2 FOREIGN KEY (ProductID)
        REFERENCES Product_T (ProductID)
);

CREATE TABLE Employee_T (
    EmployeeID VARCHAR(10) NOT NULL,
    EmployeeName VARCHAR(25),
    EmployeeAddress VARCHAR(30),
    EmployeeBirthDate DATE,
    EmployeeCity VARCHAR(20),
    EmployeeState CHAR(2),
    EmployeeZipCode VARCHAR(10),
    EmployeeDateHired DATE,
    EmployeeSupervisor VARCHAR(10),
    CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID)
);

# eof: F14-PVFC-DDL.sql