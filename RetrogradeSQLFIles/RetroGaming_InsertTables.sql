USE retrogradeGaming;

INSERT INTO User (FullName, Birthday, Email, Password, PhoneNumber) VALUES
('John Doe', '1990-05-15', 'john.doe@gmail.com', 'password123', 1234567890),
('Jane Smith', '1985-08-25', 'jane.smith@msn.com', '222333444', 2345678901),
('Light Kira', '1999-06-10', 'IamKira@yahoo.com', 'iHavetheDeathNote', 2067890099),
('Terra Armstead', '1993-07-17', 'darknessinmysoul@yahoo.com', '1234destruction', 6066390000),
('Stark Grier', '1990-10-13', 'bestgoodboi@gmail.com', 'dontStEaLmYPasS', 6064337000),
('Dexter Pauper', '1988-12-03', 'ghoulsforlife@live.com', '123girrrll4356', 7889005464),
('Diego Ortiz', '1995-10-11', 'anime4life@yahoo.com', '149494950201282839404', 6067770099),
('Audrey Kingsley', '1996-12-03', 'loveyouall@gmail.com', 'badabingbadaboom', 6068886600),
('Denji Chain', '2002-09-12', 'chainsawMan@live.com', 'makima', 9999015464);


INSERT INTO Product (Conditions, Description, Company, YearOfRelease) VALUES
('New', 'NES Game', 'Nintendo', 1985),
('Used', 'PS1 Game', 'Square Enix', 1997),
('Used', 'DreamCast Game', 'Sega', 2001),
('New', 'Xbox Game', 'Microsoft', 2001),

('New', 'NES Console', 'Nintendo', 1985),
('Used', 'PS1 Console', 'Sony', 1995),
('Used', 'DreamCast Console', 'Sega', 1999),
('New', 'Xbox Console', 'Microsoft', 2001);


INSERT INTO Review (UserID, ProductID, Rating, ReviewDescription, DatePosted) VALUES
(1, 1, 5, 'Amazing game, brings back memories!', '2023-01-01'),
(6, 2, 4, 'Great console, but has some wear and tear.', '2024-02-01'),
(7, 3, 5, 'Loved this game, brought back childhood memories!', '2024-02-01'), 
(8, 5, 4, 'Great console, works perfectly!', '2024-02-05'), 
(9, 7, 3, 'The console works but has some issues.', '2024-02-10'); 


INSERT INTO Inventory (ProductID, StoreAvailable, QuantityOnHand, QuantityOnOrder) VALUES
(1, 'Available', 10, 5),
(5, 'Not Available', 0, 2),
(6, 'Available', 3, 5),
(2, 'Not Available', 0, 8),
(3, 'Available', 15, 5), 
(4, 'Available', 10, 2), 
(5, 'Available', 8, 1), 
(6, 'Available', 5, 3), 
(7, 'Available', 7, 0); 

-- Insert data into the Orders table
INSERT INTO Orders (UserID, ProductID, Price, DateOfPurchase) VALUES
(1, 1, 59.99, '2023-01-10'),
(2, 2, 129.99, '2023-02-15'),
(3, 1, 60.99, '2024-03-18'),
(2, 2, 101.99, '2023-02-15'),
(7, 3, 44.99, '2024-01-10'), 
(7, 4, 44.99, '2024-01-10'), 
(8, 5, 79.99, '2024-01-15'), 
(8, 6, 79.99, '2024-01-15'), 
(9, 7, 69.99, '2024-01-20'); 


INSERT INTO OrderItem (PurchaseID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 59.99),
(2, 2, 1, 129.99),
(3, 1, 1, 60.99),
(4, 2, 1, 101.99),
(5, 3, 1, 44.99), 
(5, 4, 1, 44.99), 
(6, 5, 1, 79.99), 
(6, 6, 1, 79.99), 
(7, 7, 1, 69.99); 


INSERT INTO Game (ProductID, Title, Genre, Platform, Conditions, Description, Company, YearOfRelease, PlayableConsole) VALUES
(1, 'Super Mario Bros.', 'Platformer', 'NES', 'New', 'A classic retro game', 'Nintendo', 1985, 'NES'),
(2, 'Final Fantasy 7', 'JRPG', 'PS1', 'Used', 'A classic retro game', 'Square Enix', 1997, 'PS1, PC'),
(3, 'Sonic Adventure 2', 'Platform, Adventure Game', 'DreamCast', 'Used', 'A classic retro game', 'Sega', 2001, 'DreamCast, Gamecube, PC'),
(4, 'Halo', 'First Person Shooter', 'Xbox', 'New', 'A classic retro game', 'Microsoft', 2001, 'Xbox, PC');


INSERT INTO Console (ProductID, ConsoleName, Conditions, Company, YearOfRelease) VALUES
(5, 'NES', 'New', 'Nintendo', 1985),
(6, 'PlayStation', 'Used', 'Sony', 1995),
(7, 'DreamCast', 'Used', 'Sega', 1999),
(8, 'Xbox', 'New', 'Microsoft', 2001);


INSERT INTO Store (InventoryID, Address, PhoneNumber) VALUES
(1, '123 Retro St, Gametown', 3456789012),
(2, '456 Vintage Ave, Gamecity', 4567890123),
(3, '555 Greenwood Ave NE, AnotherCastle', 2067889194),
(4, '1000 North City Street, BeachCity', 2063771898),
(5, '9234 Retro SW, Seattle', 4457008912),
(6, '678 Retro Way, Gameville', 9876543210), 
(7, '789 Classic Dr, Oldtown', 8765432109), 
(8, '890 Vintage Blvd, Retropolis', 7654321098); 


INSERT INTO ConsoleRepair (ProductID, UserID, ConsoleID, Status, Issue, PriceOfRepair, DateReceived, DateCompleted) VALUES
(6, 1, 6, 'In Progress', 'Disk drive not working', 50.00, '2023-03-01', NULL);