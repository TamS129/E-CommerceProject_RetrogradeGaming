USE retrogradegaming;

DELIMITER //
CREATE PROCEDURE CreateConsole(IN prodID INT, IN consoleNam VARCHAR(20), IN condit VARCHAR(30), IN comp VARCHAR(30), IN year INT)
BEGIN
 INSERT INTO Console (ProductID, ConsoleName, Conditions, Company, YearOfRelease) 
		VALUES (prodID, consoleNam, condit, comp, year);
END //
DELIMITER //