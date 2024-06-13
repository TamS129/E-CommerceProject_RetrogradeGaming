USE retrogradegaming;
DELIMITER //

CREATE PROCEDURE ModifyInventory(IN prodID INT, IN qtyOnHand INT, IN qtyOnOrder INT)
BEGIN

    UPDATE Inventory SET QuantityOnHand = qtyOnHand, QuantityOnOrder = qtyOnOrder 
    WHERE ProductID = prodID;
    
END //
DELIMITER ;