USE retrogradeGaming;


INSERT INTO User (FullName, Birthday, Email, Password, PhoneNumber) VALUES
('John Doe', '1990-05-15', 'john.doe@gmail.com', 'password123', 1234567890),
('Jane Smith', '1985-08-25', 'jane.smith@msn.com', '222333444', 2345678901),
('Light Kira', '1999-06-10', 'IamKira@yahoo.com', 'iHavetheDeathNote', 2067890099),
('Terra Armstead', '1993-07-17', 'darknessinmysoul@yahoo.com', '1234destruction', 6066390000),
('Stark Grier', '1990-10-13', 'bestgoodboi@gmail.com', 'dontStEaLmYPasS', 6064337000),
('Dexter Pauper', '1988-12-03', 'ghoulsforlife@live.com', '123girrrll4356', 7889005464);


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
(6, 2, 4, 'Great console, but has some wear and tear.', '2024-02-01');


INSERT INTO Inventory (ProductID, StoreAvailable, QuantityOnHand, QuantityOnOrder) VALUES
(1, 'Available', 10, 5),
(5, 'Not Available', 0, 2),
(6, 'Available', 3, 5),
(2, 'Not Available', 0, 8);


INSERT INTO Orders (UserID, ProductID, Price, DateOfPurchase) VALUES
(1, 1, 59.99, '2023-01-10'),
(2, 2, 129.99, '2023-02-15'),
(3, 1, 60.99, '2024-03-18'),
(2, 2, 101.99, '2023-02-15');


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
(2, '456 Vintage Ave, Gamecity', 4567890123);


INSERT INTO ConsoleRepair (ProductID, UserID, ConsoleID, Status, Issue, PriceOfRepair, DateReceived, DateCompleted) VALUES
(6, 1, 6, 'In Progress', 'Disk drive not working', 50.00, '2023-03-01', NULL);