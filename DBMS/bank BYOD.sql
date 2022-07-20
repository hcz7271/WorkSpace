-- INFO90002 Database Systems and Information Management
-- Lectures 4,5  
--    bank Schema Script 
--    NAME
--     bank.sql - Create data objects for  used in the lectures 9,10 and 11 
--     INFO90002 Database Systems and Information Modelling
--     Copyright The University of Melbourne (C) 2020 
--
--    DESCRIPTION
--      This creates a all tables and views 
--     
--
--    NOTES
--
--    CREATED by David Eccles
--
--    MODIFIED   (MM/DD/YY)
--    deccles     06/08/20 - bank.sql created

-- Lecture 8

DROP SCHEMA IF EXISTS Bank;
CREATE SCHEMA Bank;
USE Bank;

-- DDL to create the tables 

CREATE TABLE BankHQ (
     BankHQID		INT		AUTO_INCREMENT, 
     HQAddress		VARCHAR(120)	NOT NULL,
     OtherHQDetails	VARCHAR(100), 
PRIMARY KEY(BankHQID)
);

CREATE TABLE Customer (
     CustomerID		INT			AUTO_INCREMENT, 
     CustFirstName		VARCHAR(12),	
     CustMiddleName		VARCHAR(14),
     CustLastName		VARCHAR(20) 		NOT NULL,
     BusinessName		VARCHAR(100),
     CustType		 ENUM('Personal','Company') 	NOT NULL,
PRIMARY KEY(CustomerID)
);

CREATE TABLE Account (
     AccountID		INT			AUTO_INCREMENT, 
     AccountName		VARCHAR(25),	
     OutstandingBalance	DECIMAL(10,2)		NOT NULL,
     CustomerID		INT 		NOT NULL,
PRIMARY KEY(AccountID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

-- DML to populate the tables 
INSERT INTO BankHQ VALUES
(1, '23 Charles St Peterson North 2022', 'Main Branch');
INSERT INTO BankHQ VALUES 
(2, '213 Jones Rd Parkville North 2122', 'Sub Branch');

-- Lecture 10 Different types of inserts 
-- Only some columns
INSERT INTO  Customer (CustomerID, CustFirstName, CustLastName, CustType)
	VALUES (1, 'Peter', 'Smith', 'Personal');
-- All columns 
INSERT INTO  Customer
          VALUES (2, 'James', NULL, 'Jones', 'JJ Enterprises', 'Company');
INSERT INTO  Customer 	
          VALUES (DEFAULT, 'Akin', NULL, 'Smythe', 'Bay Wart', 'Company');
          
INSERT INTO Account values (1, 'Peter Smith', 245.25, 1);
INSERT INTO Account values (5, 'JJ Ent.', 552.39, 2);
INSERT INTO Account values (6, 'JJ Ent. Mgr', 10.25,2);

-- INSERT remaining customer accounts 

INSERT INTO Customer VALUES 
(DEFAULT, 'Julie', 'Anne', 'Smythe', 'Konks', 'Company'), (DEFAULT, 'Jen',NULL, 'Smart', 'BRU','Company'), 
(DEFAULT, 'Lim', NULL, 'Lam', NULL, 'Personal'), (DEFAULT, 'Kim',NULL, 'Unila', 'Saps','Company'), 
(DEFAULT, 'James', 'Jay', 'Jones', "JJ's", 'Company'), (DEFAULT, 'Keith', NULL, 'Samson', NULL, 'Personal'); 


-- LECTURE 11 UNION
-- DDL
CREATE TABLE employee 
(id  int, 
 name varchar(12) NOT NULL, 
 title varchar(15),
 deptid tinyint,
 datehired date, 
 PRIMARY KEY (id));
 
 CREATE TABLE salaried 
 (id int, 
  employeetype char(1), 
  AnnualSalary decimal(9,2),
  PRIMARY KEY (id, employeetype),
  FOREIGN KEY (id) REFERENCES employee(id));
  
CREATE TABLE hourly 
 (id int, 
  employeetype char(1), 
  HourlyRate decimal(5,2), 
  PRIMARY KEY (id, employeetype),
  FOREIGN KEY (id) REFERENCES employee(id));
 
  CREATE TABLE consultant 
 (id int, 
  employeetype char(1), 
  BillingRate decimal(7,2), 
  PRIMARY KEY (id, employeetype),
  FOREIGN KEY (id) REFERENCES employee(id));
  
  -- DML
  INSERT INTO employee values 
  (101, 'Alice', 'Assistant', 30, '2010-03-23'), (102, 'Bob', 'Clerk', 20, '2013-05-09'), (103, 'Carol', 'Manager', 10, '2012-08-30'), (104, 'David', 'Manager', 20, '2007-11-09'), 
  (105, 'Enid', 'Paid Volunteer', 30, '2015-06-06'), (106, 'Frank', 'Senior Manager', 10, '2003-03-01'), (107, 'Grace', 'Research', 20, '2011-09-04'), 
  (108, 'Henry','Clerk', 30,'2008-02-23'), (109, 'Ingrid', 'Clerk', 10, '2005-09-09'), (110, 'James', 'Assistant', 20, '2015-10-03'), 
  (111, 'Kylie', 'H.R Manager', 30, '2017-04-01'), (112, 'Lionel', 'Clerk', 10, '2014-12-03'), (113, 'Mary', 'HR Consultant',20, '2018-03-02'), (114, 'Nigel', 'Auditor',10, '2019-01-26');
 
 INSERT INTO salaried VALUES
  (103, 'S', 80000), (104, 'S',96000), (106, 'S', 160000), (107, 'S', 96000), (108, 'S', 54000), (111,'S', 48000); 
 
 INSERT INTO hourly VALUES 
  (101, 'H', 54), (102, 'H', 48), (105, 'H', 36), (109, 'H', 48), (110, 'H', 54), (112, 'H', 54); 
  
 INSERT INTO consultant VALUES 
  (113, 'C','1300'), (114,'C',2250); 


-- Lecture 9 UNION statement 
SELECT employee.name, employeetype
FROM employee INNER JOIN salaried 
ON employee.id = salaried.id
UNION 
SELECT employee.name, employeetype
FROM employee INNER JOIN hourly 
ON employee.id = hourly.id;

CREATE TABLE artefact 
(id smallint, 
 name varchar(25) NOT NULL, 
 description varchar(80), 
 PRIMARY KEY (id)); 
 
 CREATE TABLE seller 
 (SellerID tinyint, 
  Name varchar(25) NOT NULL, 
  Phone char(13) NOT NULL, 
  PRIMARY KEY (SellerID)); 
  
CREATE TABLE buyer 
 (BuyerID tinyint, 
  Name varchar(25) NOT NULL, 
  Phone char(13) NOT NULL, 
  PRIMARY KEY (BuyerID)); 
  
  CREATE TABLE offer 
  (SellerID tinyint, 
   ArtefactID smallint, 
   BuyerID tinyint, 
   Date date, 
   amount DECIMAL(9,2), 
   ACCEPTANCE char(1), 
   PRIMARY KEY (SellerID, ArtefactID, BuyerID), 
   FOREIGN KEY (SellerID) REFERENCES seller(SellerID)
   ON UPDATE CASCADE ON DELETE RESTRICT, 
   FOREIGN KEY (artefactID) REFERENCES artefact(id) 
   ON UPDATE CASCADE ON DELETE RESTRICT, 
   FOREIGN KEY (BuyerID) REFERENCES buyer(buyerid));

-- INSERT some rows 
INSERT into seller values (1, 'Ann', '0509 123 321'), (2, 'Bill', '0518 234 432'), (3, 'Carol', '02 8344 4777'); 
INSERT into artefact values (1, 'Vase', 'Ming Vase H50cm W30cm'), (2, 'Sketch', 'Early Modern Dutch School'), (3, 'Pot', 'Copper' 'US 18th Century'); 
INSERT into buyer values (1, 'Maggie', '0539 335 577'), (2, 'Nigel', '0519 434 389'), (3, 'Olga', '13 24 35');
INSERT into offer values (1,1,1,'2012-06-20', 81223.23,'N'), (1,1,2, '2012-06-20', 82223.23, 'N'), 
(2,2,1, '2012-06-20', 1995.50, 'N'), (2,2,2, '2012-06-20', 2300.15, 'N');
   
--

CREATE VIEW EmpPay AS 
SELECT Employee.ID, Employee.Name, DateHired, EmployeeType, HourlyRate AS pay
FROM Employee INNER JOIN Hourly 
ON Employee.ID = Hourly.ID
UNION
SELECT Employee.ID, Employee.Name, DateHired, EmployeeType, AnnualSalary AS pay
FROM Employee INNER JOIN Salaried 
ON Employee.ID = Salaried.ID
UNION 
SELECT Employee.ID, Employee.Name, DateHired, EmployeeType, BillingRate AS pay
FROM Employee INNER JOIN Consultant 
ON Employee.ID = Consultant.ID;

-- Using a view 
SELECT * 
FROM EmpPay;


SELECT Name, pay, employeetype
FROM emppay
WHERE employeetype in ('H', 'C');

COMMIT;