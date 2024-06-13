DELIMITER //
CREATE PROCEDURE CreateGame(IN prodID INT, IN title VARCHAR(30), IN genr VARCHAR(50), IN plat VARCHAR(50), IN condit VARCHAR(30), IN descrip VARCHAR(60), IN comp VARCHAR(30), IN year INT)
BEGIN
 INSERT INTO Game (ProductID, Title, Genre, Platform, Conditions, Description, Company, YearOfRelease) 
		VALUES (prodID, title, genr, plat, condit, descrip, comp, year);
END //
DELIMITER //