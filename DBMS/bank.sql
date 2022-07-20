CREATE TABLE BankHQ (
	BankHQID INT AUTO_INCREMENT,
    HQAddress VARCHAR(120) NOT NULL,
    OtherHQDetails VARCHAR(120),
PRIMARY KEY(BankHQID)
);

INSERT INTO BankHQ VALUES
(1, '23 Charles St Peterson North 2022', 'Main Branch');

INSERT INTO BankHQ Values
(2, "213 Jones Rd Parkville North 2122", "Sub Branch");

SELECT *
FROM BankHQ;

CREATE TABLE Customer (
	CustomerID INT AUTO_INCREMENT,
    CustFirstName VARCHAR(12),
    CustMiddleName VARCHAR(14),
    CustLastName VARCHAR(20) NOT NULL,
    BusinessName VARCHAR(100),
    CustType ENUM("Personal","Company") NOT NULL,
PRIMARY KEY(CustomerID)
);

-- specify columns
INSERT INTO Customer (CustomerID, CustFirstName, CustLastName, CustType)
	VALUES (DEFAULT, "Peter", "Smith", "Personal");

-- All columns
INSERT INTO Customer
	VALUES (DEFAULT, "James", NULL, "Jones", "JJ Enterprises", "Company");
    
INSERT INTO Customer
	VALUES (DEFAULT, "Akin", NULL, "Smythe", "", "Company");

SELECT *
FROM Customer;

CREATE TABLE Account (
	AccountID INT AUTO_INCREMENT,
    AccountName VARCHAR(12),
    OutstandingBalance DECIMAL(10,2) NOT NULL,
    CustomerID INT NOT NULL,
PRIMARY KEY(AccountID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
	ON DELETE RESTRICT
    ON UPDATE CASCADE
);

INSERT INTO Account values (1, 'Peter Smith',245.25,1);
INSERT INTO Account values (2, 'JJ Ent.', 552.38, 2);
INSERT INTO Account values (3, 'JJ Ent. Mgr', 10.25, 2);

INSERT INTO Customer VALUES
(DEFAULT, 'Julie', 'Anne', 'Smythe', ' Konks', 'Company'), (DEFAULT, 'Jen', NULL, 'Smart', 'BRU', 'Company'),
(DEFAULT, 'Lim', NULL, 'Lam', NULL, 'Personal'), (DEFAULT, 'Kim', NULL, 'Unila', 'Saps', 'Company'),
(DEFAULT, 'James', 'Jay', 'Jones', "JJ's", 'Company'), (DEFAULT, 'Keith', NULL, 'Samson', NULL, 'Personal');

SELECT *
FROM Account;