-- SQLite
CREATE TABLE Customers(
 Customer_ID VARCHAR(6) PRIMARY KEY,
 Name VARCHAR(100),
 Phone_no VARCHAR(11),
 E_mail VARCHAR(50),
 Address VARCHAR(100)
);

CREATE TABLE Products(
 ProductID VARCHAR(6) PRIMARY KEY,
 Product_Name VARCHAR(100),
 Price DECIMAL(10, 2),
 Stock INT
);

CREATE TABLE Regions(
 Region_ID VARCHAR(6) PRIMARY KEY,
 Country VARCHAR(50),
 State VARCHAR(50)
 );

 CREATE TABLE Sales(
 SaleID INT PRIMARY KEY,
 Customer_ID VARCHAR(6),
 ProductID VARCHAR(6),
 Quantity INT,
 Date DATETIME,
 Region_ID VARCHAR(6)
);
