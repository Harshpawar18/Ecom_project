 
  --+-------------+       +-------------+       +--------------+
  --|  Customer   |       |   Category  |       |   Product    |
  --+-------------+       +-------------+       +--------------+
  --| CustomerID  |1----1>| CategoryID  |1----* | ProductID    |
  --| FirstName   |       | CategoryName|       | ProductName  |
  --| LastName    |       +-------------+       | Price        |
  --| Email       |                           +--------------+
  --+-------------+

  --+-------------+       +--------------+       +--------------+
  --| OrderHeader |       | OrderItem    |       |  Inventory   |
  --+-------------+       +--------------+       +--------------+
  --| OrderID     |1----* | OrderItemID  |       | ProductID    |
  --| CustomerID  |1----1>| OrderID      |       | StockQuantity|
  --| OrderDate   |       | ProductID    |       +--------------+
  --+-------------+
