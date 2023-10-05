-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE DATABASE ecommerce;
USE ecommerce;

-- -----------------------------------------------------
-- Table --
-- -----------------------------------------------------
CREATE TABLE Users (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Username VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  ShippingAddress TEXT,
  PaymentInformation TEXT
);

CREATE TABLE Categories (
  CategoryID INT AUTO_INCREMENT PRIMARY KEY,
  CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Products (
  ProductID INT AUTO_INCREMENT PRIMARY KEY,
  ProductName VARCHAR(255) NOT NULL,
  Description TEXT,
  Price DECIMAL(10, 2) NOT NULL,
  StockQuantity INT NOT NULL,
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
  OrderID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT,
  OrderDate DATETIME NOT NULL,
  TotalPrice DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE OrderItems (
  OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT NOT NULL,
  Subtotal DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Reviews (
  ReviewID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT,
  ProductID INT,
  Rating INT NOT NULL,
  ReviewText TEXT,
  ReviewDate DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Cart (
  CartID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE CartItems (
  CartItemID INT AUTO_INCREMENT PRIMARY KEY,
  CartID INT,
  ProductID INT,
  Quantity INT NOT NULL,
  FOREIGN KEY (CartID) REFERENCES Cart(CartID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------

-- Insert sample data into Users Table
INSERT INTO Users (UserID, Username, Email, Password, ShippingAddress, PaymentInformation)
VALUES
    (1, 'user123', 'user123@email.com', 'password123', '123 Main St, Dearborn, 48120', 'Credit Card: ************9012'),
    (2, 'johndoe', 'johndoe@email.com', 'secretpass', '456 Elm St, Chicago, 60603', 'PayPal: johndoe@paypal.com'),
    (3, 'alice123', 'alice123@email.com', 'mypass123', '789 Oak St, Roselle, 60196', 'Credit Card: ************1098');

-- Insert sample data into Products Table
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity, CategoryID)
VALUES
    (1, 'Laptop', 'High-performance laptop with SSD storage', 799.99, 50, 1),
    (2, 'Smartphone', 'Latest smartphone with HD camera', 499.99, 100, 2),
    (3, 'Headphones', 'Noise-canceling headphones with Bluetooth', 149.99, 75, 3),
    (4, 'Sneakers', 'Running sneakers with breathable material', 79.99, 200, 4);

-- Insert sample data into Categories Table
INSERT INTO Categories (CategoryID, CategoryName)
VALUES
    (1, 'Electronics'),
    (2, 'Mobile Phones'),
    (3, 'Audio'),
    (4, 'Footwear');

-- Insert sample data into Orders Table
INSERT INTO Orders (OrderID, UserID, OrderDate, TotalPrice)
VALUES
    (1, 1, '2023-09-30 10:15:00', 799.99),
    (2, 2, '2023-09-30 11:30:00', 649.98),
    (3, 3, '2023-09-30 14:45:00', 229.98);

-- Insert sample data into OrderItems Table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Subtotal)
VALUES
    (1, 1, 1, 1, 799.99),
    (2, 2, 2, 2, 999.98),
    (3, 3, 3, 1, 149.99),
    (4, 3, 4, 2, 159.98);

-- Insert sample data into Reviews Table
INSERT INTO Reviews (ReviewID, UserID, ProductID, Rating, ReviewText, ReviewDate)
VALUES
    (1, 1, 1, 5, 'Great laptop, fast performance!', '2023-09-30 10:30:00'),
    (2, 2, 2, 4, 'Good smartphone, camera is decent.', '2023-09-30 11:45:00'),
    (3, 3, 3, 5, 'Fantastic headphones, love the sound quality.', '2023-09-30 15:00:00');

-- Insert sample data into Cart Table
INSERT INTO Cart (CartID, UserID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Insert sample data into CartItems Table
INSERT INTO CartItems (CartItemID, CartID, ProductID, Quantity)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 1),
    (4, 3, 4, 2);

