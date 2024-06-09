CREATE DATABASE retrogradeGaming;

USE retrogradeGaming;

CREATE TABLE User (
    UserID          INT             NOT NULL AUTO_INCREMENT,
    FullName        VARCHAR(70)     NOT NULL,
    Birthday        DATE            NOT NULL,
    Email           VARCHAR(60)     NOT NULL,
    Password        VARCHAR(30)     NOT NULL,
    PhoneNumber     BIGINT,
    
    CONSTRAINT user PRIMARY KEY(UserID),
    
    CONSTRAINT validBirthDate CHECK (Birthday >= '1900-01-01')
);

CREATE TABLE Product (
    ProductID       INT             NOT NULL AUTO_INCREMENT,
    Conditions      VARCHAR(30)     DEFAULT 'No Information',
    Description     VARCHAR(60),
    Company         VARCHAR(30)     NOT NULL,
    YearOfRelease   YEAR            NOT NULL,
    
    CONSTRAINT productInfo PRIMARY KEY(ProductID)
);

CREATE TABLE Review (
    ReviewID          INT             NOT NULL AUTO_INCREMENT,
    UserID            INT             NOT NULL,
    ProductID         INT             NOT NULL,
    Rating            INT             NOT NULL,
    ReviewDescription VARCHAR(100),
    DatePosted        DATE            NOT NULL,
    
    CONSTRAINT reviewInfo PRIMARY KEY(ReviewID),
    
    CONSTRAINT reviewUserFK FOREIGN KEY(UserID)    
               REFERENCES User(UserID),
               
    CONSTRAINT reviewProductFK FOREIGN KEY(ProductID)
			   REFERENCES Product(ProductID),
               
    CONSTRAINT RatingValues CHECK
               (Rating > 0 AND Rating <= 5)
);

CREATE TABLE Inventory (
    InventoryID     INT             NOT NULL AUTO_INCREMENT,
    StoreAvailable  VARCHAR(30)     DEFAULT 'Not Available',
    QuantityOnHand  INT             NOT NULL,
    QuantityOnOrder INT             NOT NULL,
    
    CONSTRAINT invenKey PRIMARY KEY(InventoryID)
);

CREATE TABLE Orders (
    PurchaseID      INT             NOT NULL AUTO_INCREMENT,
    UserID          INT             NOT NULL,
    ProductID       INT             NOT NULL,
    Price           NUMERIC(8,2)    NOT NULL,
    DateOfPurchase  DATE            NOT NULL,
    
    CONSTRAINT purchases PRIMARY KEY(PurchaseID),
    
    CONSTRAINT ordersUserFK FOREIGN KEY(UserID)
			   REFERENCES User(UserID),
        
    CONSTRAINT ordersProductFK FOREIGN KEY(ProductID)
			   REFERENCES Product(ProductID)
);

CREATE TABLE OrderItem(
OrderedItemID	INT	 NOT NULL AUTO_INCREMENT,
PurchaseID		INT  NOT NULL,
ProductID		INT	  NOT NULL,
Quantity	    INT   NOT NULL,
Price			Numeric(8,2) NOT NULL,

CONSTRAINT	orderIID	PRIMARY KEY(OrderedItemID),

CONSTRAINT 	orderFK		FOREIGN KEY(PurchaseID)
			REFERENCES	Orders(PurchaseID)
            ON UPDATE	NO ACTION
            ON DELETE	CASCADE,
            
CONSTRAINT	productFK	FOREIGN KEY (ProductID)
			REFERENCES	Product(ProductID)
            ON UPDATE	NO ACTION
            ON DELETE	CASCADE
            


);

CREATE TABLE Game (
    ProductID       INT             NOT NULL,
    Title           VARCHAR(30)     NOT NULL,
    Genre           VARCHAR(50),
    Platform        VARCHAR(50),
    Conditions      VARCHAR(30)     DEFAULT 'No Information',
    Description     VARCHAR(60),
    Company         VARCHAR(30)     NOT NULL,
    YearOfRelease   YEAR            NOT NULL,
    PlayableConsole VARCHAR(40)     NOT NULL,
    
    CONSTRAINT gamePK PRIMARY KEY(ProductID),
    
    CONSTRAINT gameProductFK FOREIGN KEY(ProductID)
               REFERENCES Product(ProductID)
               ON UPDATE NO ACTION
               ON DELETE CASCADE
);

CREATE TABLE Console (
    ProductID       INT             NOT NULL,
    ConsoleName     VARCHAR(20)     NOT NULL,
    Conditions      VARCHAR(30)     DEFAULT 'No Information',
    Company         VARCHAR(30)     NOT NULL,
    YearOfRelease   YEAR            NOT NULL,
    
    CONSTRAINT consolePK 		PRIMARY KEY(ProductID),
    
    CONSTRAINT consoleProductFK FOREIGN KEY(ProductID)
			   REFERENCES Product(ProductID)
               ON UPDATE NO ACTION
               ON DELETE CASCADE,
               
    CONSTRAINT CompanyValues CHECK 
               (Company IN ('Nintendo', 'Microsoft', 'Sony', 'Atari', 'Bandai', 'Sega', 'Mattel', 'Panasonic', 'PC'))
);

CREATE TABLE Store (
    StoreID         INT             NOT NULL AUTO_INCREMENT,
    InventoryID     INT             NOT NULL,
    Address         VARCHAR(60)     NOT NULL,
    PhoneNumber     BIGINT          NOT NULL,
    
    CONSTRAINT storeInfo PRIMARY KEY(StoreID),
    
    CONSTRAINT storeInventoryFK FOREIGN KEY(InventoryID)
               REFERENCES Inventory(InventoryID)
);

CREATE TABLE ConsoleRepair (
    RepairID        INT             NOT NULL AUTO_INCREMENT,
    ProductID       INT             NOT NULL,
    UserID          INT             NOT NULL,
    ConsoleID       INT             NOT NULL,
    Status          VARCHAR(30)     NOT NULL,
    Issue           VARCHAR(60)     DEFAULT 'No information',
    PriceOfRepair   NUMERIC(8,2)    NOT NULL,
    DateReceived    DATE            NOT NULL,
    DateCompleted   DATE            DEFAULT NULL,
    
    CONSTRAINT repairInfo PRIMARY KEY(RepairID),
    
    CONSTRAINT repairUserFK FOREIGN KEY(UserID)
               REFERENCES User(UserID),
               
    CONSTRAINT repairProductFK FOREIGN KEY(ProductID)
               REFERENCES Product(ProductID),
               
    CONSTRAINT repairConsoleFK FOREIGN KEY(ConsoleID) 
               REFERENCES Console(ProductID)  
);