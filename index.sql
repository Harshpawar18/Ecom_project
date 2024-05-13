USE ECommerceDB;

-- Create an index on the Email column in the Customer table
CREATE INDEX idx_Customer_Email ON Customer (Email);
-- Create an index on the ProductName column in the Product table
CREATE INDEX idx_Product_ProductName ON Product (ProductName);
-- Create an index on the OrderDate column in the OrderHeader table
CREATE INDEX idx_OrderHeader_OrderDate ON OrderHeader (OrderDate);
