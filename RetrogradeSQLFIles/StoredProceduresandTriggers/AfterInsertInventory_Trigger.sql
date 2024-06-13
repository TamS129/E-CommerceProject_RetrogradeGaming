Use retrogradegaming;

DELIMITER //
CREATE TRIGGER AfterProductInsert
AFTER INSERT ON Product
FOR EACH ROW
BEGIN
    INSERT INTO Inventory (ProductID, StoreAvailable, QuantityOnHand, QuantityOnOrder)
    VALUES (NEW.ProductID, 'Available', 1, 0);
END;
//
DELIMITER ;