-- Retrieve products in a category
SELECT ProductName, Price FROM Product WHERE CategoryID = 1;

-- Update product price
UPDATE Product SET Price = 1099.99 WHERE ProductID = 1;

--Retrieve order details with customer information:

SELECT
  OrderHeader.OrderID,
  Customer.FirstName,
  Customer.LastName,
  OrderHeader.OrderDate
FROM OrderHeader
JOIN Customer ON OrderHeader.CustomerID = Customer.CustomerID;

--Calculate the total sales for each product
SELECT
  Product.ProductID,
  Product.ProductName,
  SUM(OrderItem.Quantity * Product.Price) AS TotalSales
FROM OrderItem
JOIN Product ON OrderItem.ProductID = Product.ProductID
GROUP BY Product.ProductID, Product.ProductName;

--Calculate the total quantity of each product sold:
SELECT
  Product.ProductID,
  Product.ProductName,
  SUM(OrderItem.Quantity) AS TotalQuantitySold
FROM OrderItem
JOIN Product ON OrderItem.ProductID = Product.ProductID
GROUP BY Product.ProductID, Product.ProductName;
