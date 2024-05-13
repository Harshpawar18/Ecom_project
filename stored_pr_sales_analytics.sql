-- Assuming you're using the ECommerceDB database
USE ECommerceDB;
GO

-- Create the stored procedure for sales analytics
CREATE PROCEDURE GetProductSalesAnalytics
AS
BEGIN
    -- Query to retrieve total sales for each product
    SELECT
        P.ProductID,
        P.ProductName,
        P.Price,
        SUM(OI.Quantity) AS TotalSold,
        SUM(OI.Quantity * P.Price) AS TotalRevenue
    FROM
        Product P
    JOIN
        OrderItem OI ON P.ProductID = OI.ProductID
    GROUP BY
        P.ProductID, P.ProductName, P.Price
    ORDER BY
        TotalRevenue DESC;
END;
GO

-- Execute the stored procedure
EXEC GetProductSalesAnalytics;
