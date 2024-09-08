--World Database: 
SELECT name FROM country WHERE continent = 'South America'; --1
SELECT population FROM country WHERE name = "Germany"; --2
SELECT name FROM city WHERE CountryCode='JPN'; --3
SELECT Name,Population FROM country WHERE Continent='Africa' order by Population DESC LIMIT 3; --4
SELECT Name,LifeExpectancy FROM country WHERE Population BETWEEN 1000000 and 5000000; --5
SELECT CountryCode FROM countrylanguage WHERE Language='French'; --6

--Chinook Database:
SELECT Title FROM Album WHERE ArtistID = 1; --7
SELECT FirstName,LastName,Email FROM Customer WHERE Country= "Brazil"; --8
SELECT Name FROM Playlist; --9
SELECT count(*) FROM Track WHERE GenreId="1"; --10
SELECT FirstName,LastName FROM Employee WHERE ReportsTo="2"; --11
SELECT CustomerId, SUM(Total) AS TotalSales FROM Invoice GROUP BY CustomerId; --12

--Part 2:
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    RewardsMember BOOLEAN DEFAULT FALSE,
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Flavor VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (FirstName, LastName, PhoneNumber, RewardsMember)
VALUES 
('James', 'Williamson', '1234567890', True),
('Bob', 'TheBuilder', '8772419092', False),
('Steve', 'Jobs', '9023920292', True),
('Malala', 'Yousafzai', '9876543210', True),
('Michelle', 'Obama', '7777777777', False);

INSERT INTO Products (ProductName, Flavor, Price)
VALUES 
('Vanilla Cone','Vanilla', 2.50),
('Mystery Sundae','Cotton Candy', 3.75),
('Strawberry Milkshake','Strawberry', 4.00),
('Halloween Special','Dark Raspberry Truffle', 3.50),
('Banana Split','Chocolate', 5.00);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate, TotalAmount)
VALUES 
(1, 1, 2, '2024-08-29', 7.50),
(2, 3, 2,'2024-09-01', 8.75),
(3, 4, 3, '2024-09-06', 9.00),
(4, 1, 1,'2024-09-08', 5.50),
(5, 2, 1,'2024-09-09', 7.00);

--Queries:
SELECT OrderID, TotalAmount FROM Orders WHERE TotalAmount > 7.00;
SELECT FirstName, LastName, PhoneNumber FROM Customers WHERE RewardsMember = TRUE;
SELECT ProductName, Price FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);
