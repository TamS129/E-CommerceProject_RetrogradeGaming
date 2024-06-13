USE retrogradegaming;

DELIMITER //

CREATE TRIGGER AfterOrderItemInsert
AFTER INSERT ON OrderItem
FOR EACH ROW
BEGIN
    UPDATE Inventory 
    SET QuantityOnHand = QuantityOnHand - NEW.Quantity 
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;