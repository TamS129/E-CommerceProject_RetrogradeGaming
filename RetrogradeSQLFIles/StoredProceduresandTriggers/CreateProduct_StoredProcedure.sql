USE retrogradegaming;

DELIMITER //
CREATE PROCEDURE CreateProduct(IN condit VARCHAR(30), IN descrip VARCHAR(60), IN comp VARCHAR(30), IN year INT)
BEGIN
 INSERT INTO Product (Conditions, Description, Company, YearOfRelease) 
		VALUES (condit, descrip, comp, year);
END //
DELIMITER //