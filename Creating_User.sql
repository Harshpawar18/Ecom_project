USE master;
GO

-- Creating a login (replace 'NewUser' and 'Password123' with your desired username and password)
CREATE LOGIN NewUser WITH PASSWORD = 'Password123';
GO

-- Switch to the ECommerceDB database
USE ECommerceDB;
GO

-- Creating a user in the database and map it to the login
CREATE USER NewUser FOR LOGIN NewUser;
GO

-- Grant SELECT permissions on the Product and Category tables
GRANT SELECT ON OBJECT::Product TO NewUser;
GRANT SELECT ON OBJECT::Category TO NewUser;
GO
