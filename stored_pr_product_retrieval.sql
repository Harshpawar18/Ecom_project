-- Assuming you're using the ECommerceDB database
USE ECommerceDB;
GO

-- Create the stored procedure
CREATE PROCEDURE GetProductsByCategory
    @CategoryID INT
AS
BEGIN
    -- Query to retrieve products based on category
    SELECT
        ProductID,
        ProductName,
        Price
    FROM
        Product
    WHERE
        CategoryID = @CategoryID;
END;
GO


--EXECUTION
EXEC GetProductsByCategory @CategoryID = 4;
