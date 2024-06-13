USE retrogradeGaming;

INSERT INTO User (FullName, Birthday, Email, Password, PhoneNumber) VALUES
('John Doe', '1990-05-15', 'john.doe@gmail.com', 'password123', 1234567890),
('Jane Smith', '1985-08-25', 'jane.smith@msn.com', '222333444', 2345678901),
('Light Kira', '1999-06-10', 'IamKira@yahoo.com', 'iHavetheDeathNote', 2067890099),
('Terra Armstead', '1993-07-17', 'darknessinmysoul@yahoo.com', '1234destruction', 6066390000),
('Stark Grier', '1990-10-13', 'bestgoodboi@gmail.com', 'dontStEaLmYPasS', 6064337000),
('Dexter Pauper', '1988-12-03', 'ghoulsforlife@live.com', '123girrrll4356', 7889005464),
('Diego Ortiz', '1995-10-11', 'anime4life@yahoo.com', '149494950201282839404', 6067770099),
('Audrey Kingsley', '1996-06-23', 'loveyouall@gmail.com', 'badabingbadaboom', 6068886600),
('Denji Chain', '2002-09-12', 'chainsawMan@live.com', 'makima', 9999015464),
('Alice Johnson', '1992-06-20', 'alice.johnson@example.com', 'password123', 1234567890),
('Bob Smith', '1988-11-10', 'bob.smith@example.com', 'securepassword', 2345678901),
('Charlie Brown', '1995-09-05', 'charlie.brown@example.com', 'password1234', 3456789012),
('David Lee', '1983-06-15', 'david.lee@example.com', 'letmein', 4567890123);


INSERT INTO Product (Conditions, Description, Company, YearOfRelease) VALUES
('New', 'NES Game', 'Nintendo', 1985),
('Used', 'PS1 Game', 'Square Enix', 1997),
('Used', 'DreamCast Game', 'Sega', 2001),
('New', 'Xbox Game', 'Microsoft', 2001),

('New', 'NES Console', 'Nintendo', 1985),
('Used', 'PS1 Console', 'Sony', 1995),
('Used', 'DreamCast Console', 'Sega', 1999),
('New', 'Xbox Console', 'Microsoft', 2001),
('Used', 'GameCube Game', 'Nintendo', 2001),
('New', 'PS2 Game', 'Sony', 2000),
('Used', 'GameBoy Game', 'Nintendo', 1989),
('New', 'Sega Genesis Game', 'Sega', 1988),
('New', 'PS3 Game', 'Sony', 2006);


INSERT INTO Review (UserID, ProductID, Rating, ReviewDescription, DatePosted) VALUES
(1, 1, 5, 'Amazing game, brings back memories!', '2023-01-01'),
(6, 2, 4, 'Great console, but has some wear and tear.', '2024-02-01'),
(7, 3, 5, 'Loved this game, brought back childhood memories!', '2024-02-01'), 
(8, 5, 4, 'Great console, works perfectly!', '2024-02-05'), 
(9, 7, 3, 'The console works but has some issues.', '2024-02-10'),
(10, 9, 4, 'Great game, hours of fun!', '2024-04-10'),
(11, 10, 5, 'Excellent console, works like a charm.', '2024-05-05'),
(12, 11, 3, 'Decent game, but not my favorite.', '2024-06-01');


INSERT INTO Inventory (ProductID, StoreAvailable, QuantityOnHand, QuantityOnOrder) VALUES
(1, 'Available', 10, 5),
(5, 'Not Available', 0, 2),
(6, 'Available', 3, 5),
(2, 'Not Available', 0, 8),
(3, 'Available', 15, 5), 
(4, 'Available', 10, 2), 
(5, 'Available', 8, 1), 
(6, 'Available', 5, 3), 
(7, 'Available', 7, 0),
(9, 'Available', 5, 2),
(10, 'Not Available', 0, 5),
(11, 'Available', 10, 3),
(12, 'Available', 3, 8),
(13, 'Available', 15, 5);


INSERT INTO Orders (UserID, ProductID, Price, DateOfPurchase) VALUES
(1, 1, 59.99, '2023-01-10'),
(2, 2, 129.99, '2023-02-15'),
(3, 1, 60.99, '2024-03-18'),
(2, 2, 101.99, '2023-02-15'),
(7, 3, 44.99, '2024-01-10'), 
(7, 4, 44.99, '2024-01-10'), 
(8, 5, 79.99, '2024-01-15'), 
(8, 6, 79.99, '2024-01-15'), 
(9, 7, 69.99, '2024-01-20'),
(10, 9, 39.99, '2024-04-15'),
(11, 10, 99.99, '2024-05-20'),
(12, 11, 29.99, '2024-06-05');


INSERT INTO OrderItem (PurchaseID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 59.99),
(2, 2, 1, 129.99),
(3, 1, 1, 60.99),
(4, 2, 1, 101.99),
(5, 3, 1, 44.99), 
(5, 4, 1, 44.99), 
(6, 5, 1, 79.99), 
(6, 6, 1, 79.99), 
(7, 7, 1, 69.99),
(8, 9, 1, 39.99),
(9, 10, 1, 99.99),
(10, 11, 1, 29.99);



INSERT INTO Game (ProductID, Title, Genre, Platform, Conditions, Description, Company, YearOfRelease) VALUES
(1, 'Super Mario Bros.', 'Platformer', 'NES', 'New', 'A classic retro game', 'Nintendo', 1985),
(2, 'Final Fantasy 7', 'JRPG', 'PS1', 'Used', 'A classic retro game', 'Square Enix', 1997),
(3, 'Sonic Adventure 2', 'Platform, Adventure Game', 'DreamCast', 'Used', 'A classic retro game', 'Sega', 2001),
(4, 'Halo', 'First Person Shooter', 'Xbox', 'New', 'A classic retro game', 'Microsoft', 2001),
(5, 'The Legend of Zelda', 'Action-Adventure', 'NES', 'New', 'A classic retro game', 'Nintendo', 1986),
(6, 'Metal Gear Solid 2', 'Stealth', 'PS2', 'New', 'A classic retro game', 'Konami', 2001),
(7, 'Pokemon Red', 'Role-Playing', 'GameBoy', 'Used', 'A classic retro game', 'Nintendo', 1996),
(8, 'Sonic the Hedgehog', 'Platformer', 'Sega Genesis', 'New', 'A classic retro game', 'Sega', 1991),
(9, 'Uncharted 2: Among Thieves', 'Action-Adventure', 'PS3', 'New', 'A classic retro game', 'Naughty Dog', 2009);



INSERT INTO Console (ProductID, ConsoleName, Conditions, Company, YearOfRelease) VALUES
(5, 'NES', 'New', 'Nintendo', 1985),
(6, 'PlayStation', 'Used', 'Sony', 1995),
(7, 'DreamCast', 'Used', 'Sega', 1999),
(8, 'Xbox', 'New', 'Microsoft', 2001),
(9, 'GameCube', 'Used', 'Nintendo', 2001),
(10, 'PlayStation 2', 'New', 'Sony', 2000),
(11, 'GameBoy Color', 'Used', 'Nintendo', 1998),
(12, 'Sega Saturn', 'Used', 'Sega', 1994),
(13, 'PlayStation 3', 'New', 'Sony', 2006);


INSERT INTO Store (InventoryID, Address, PhoneNumber) VALUES
(1, '123 Retro St, Gametown', 3456789012),
(2, '456 Vintage Ave, Gamecity', 4567890123),
(3, '555 Greenwood Ave NE, AnotherCastle', 2067889194),
(4, '1000 North City Street, BeachCity', 2063771898),
(5, '9234 Retro SW, Seattle', 4457008912),
(6, '678 Retro Way, Gameville', 9876543210), 
(7, '789 Classic Dr, Oldtown', 8765432109), 
(8, '890 Vintage Blvd, Retropolis', 7654321098),
(9, '111 Retro Rd, Arcade City', 5678901234),
(10, '222 Vintage Blvd, Retroville', 6789012345),
(11, '333 Old Town Ave, Nostalgia City', 7890123456),
(12, '444 Classic St, Gameburg', 8901234567),
(13, '555 Memory Lane, Console Town', 9012345678);



INSERT INTO ConsoleRepair (ProductID, UserID, ConsoleID, Status, Issue, PriceOfRepair, DateReceived, DateCompleted) VALUES
(6, 1, 6, 'In Progress', 'Disk drive not working', 50.00, '2023-03-01', NULL),
(10, 2, 10, 'Completed', 'Overheating', 75.00, '2024-05-25', '2024-05-27'),
(11, 3, 11, 'In Progress', 'Screen not working', 50.00, '2024-06-08', NULL);