-- Assuming you're using the ECommerceDB database
USE ECommerceDB;
GO

-- Create the stored procedure for order placement
CREATE PROCEDURE PlaceOrder
    @CustomerID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    -- Check if the product is in stock
    DECLARE @CurrentStock INT;
    SELECT @CurrentStock = StockQuantity FROM Inventory WHERE ProductID = @ProductID;

    IF @CurrentStock >= @Quantity
    BEGIN
        -- Update inventory
        UPDATE Inventory SET StockQuantity = @CurrentStock - @Quantity WHERE ProductID = @ProductID;

        -- Insert order header
        INSERT INTO OrderHeader (CustomerID, OrderDate) VALUES (@CustomerID, GETDATE());
        DECLARE @OrderID INT;
        SET @OrderID = SCOPE_IDENTITY();

        -- Insert order item
        INSERT INTO OrderItem (OrderID, ProductID, Quantity) VALUES (@OrderID, @ProductID, @Quantity);

        PRINT 'Order placed successfully!';
    END
    ELSE
    BEGIN
        -- Product is out of stock
        PRINT 'Insufficient stock for the selected product.';
    END
END;
GO

-- Execute the stored procedure
EXEC PlaceOrder @CustomerID = 1, @ProductID = 2, @Quantity = 3;
