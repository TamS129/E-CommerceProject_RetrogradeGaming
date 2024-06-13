USE retrogradegaming;

DELIMITER //
CREATE PROCEDURE ProductDetails(IN prodID INT)
BEGIN
SELECT *
FROM Product
WHERE ProductID = prodID;
END //
DELIMITER ;