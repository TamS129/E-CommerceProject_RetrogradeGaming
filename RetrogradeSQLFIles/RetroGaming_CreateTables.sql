CREATE DATABASE retrogradeGaming;
CREATE TABLE USER (
	UserID 		INT 			NOT NULL AUTO_INCREMENT,
    FullName  	VARCHAR(70)		NOT NULL,
    Birthday	DATE    		NOT NULL,
    Email		VARCHAR(60) 	NOT NULL,
    Password	VARCHAR(30) 	NOT NULL,
    PhoneNumber	BIGINT(10),
    CONSTRAINT user PRIMARY KEY(UserID)
    CONSTRAINT validBirthDate CHECK (Birthday >= 1900)

);

CREATE TABLE Product (
	ProductID	INT 	NOT NULL AUTO_INCREMENT,
    Conditions	VARCHAR(30)	NULL DEFAULT 'No Information',
    Description VARCHAR(60),
    Company		VARCHAR(30) NOT NULL, 
    YearOfRelease	YEAR	NOT NULL,
    PRIMARY KEY(ProductID)
);

CREATE TABLE Game (
GameID		INT auto_increment,
ProductID	INT	NOT NULL,
Title		VARCHAR(30) NOT NULL,
Conditions	VARCHAR(30) NULL DEFAULT 'No Information',
Description	VARCHAR(60),
Company		VARCHAR(30)	NOT NULL,
YearOfRelease	YEAR	NOT NULL,
PlayableConsole	VARCHAR(40) NOT NULL
);

CREATE TABLE Console (
ConsoleID INT AUTO_INCREMENT,
ProductID	INT NOT NULL,
ConsoleName	VARCHAR(20) NOT NULL,
Conditions	VARCHAR(30) NULL DEFAULT 'No Information',
Company		VARCHAR(30) NOT NULL,
YearOfRelease YEAR	NOT NULL,

);

CREATE TABLE ConsoleRepair(
RepairID	INT 	NOT NULL AUTO_INCREMENT,
UserID		INT 	NOT NULL,
ConsoleID	INT		NOT NULL,
Status		VARCHAR(30)	NOT NULL,
Issue VARCHAR(60) NULL DEFAULT 'No information',
PriceOfRepair	NUMERIC(8,2) NOT NULL,
DateRecieved	DATE	NOT NULL,
DateCompleted	DATE    Null default 'Not repaired',

);

CREATE TABLE REVIEW (
UserID	INT NOT NULL,
ProductID	INT NOT NULL,
Rating	INT	NOT NULL,
ReviewDescription	VARCHAR(100),
DatePosted	DATE	NOT NULL,


);

CREATE TABLE INVENTORY (
InventoryID INT NOT NULL AUTO_INCREMENT,
ProductID	INT	NOT NULL,
GameID		INT NOT NULL,
ConsoleID	INT NOT NULL,
StoreAvailable	INT NULL DEFAULT 'Not Available',
QuantityOnHand	INT	NOT NULL,
QuantityOnOrder	INT NOT NULL,

CONSTRAINT invenKey PRIMARY KEY(InventoryID, ProductID),
Constrain

);

CREATE TABLE STORE (
StoreID		INT NOT NULL AUTO_INCREMENT,

Address		VARCHAR(60)	NOT NULL,
PhoneNumber	BIGINT(10) NOT NULL,



);


CREATE TABLE ORDERS (

PurchaseID	INT		NOT NULL AUTO_INCREMENT,
UserID		INT		NOT NULL,
ProductID	INT		NOT NULL,
Price		NUMERIC(8,2) NOT NULL,
DateOfPurchase	DATE 	NOT NULL,
PRIMARY KEY(PurchaseID)





);