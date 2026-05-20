drop database if exists training_database;

create database training_databas;

use training_databas;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    RegistrationDate DATE
);

INSERT INTO Customers VALUES
(1, 'Alice', 'Johnson', 'USA', '2022-05-01'),
(2, 'Bob', 'Smith', 'Canada', '2023-01-15'),
(3, 'Charlie', 'Brown', 'USA', '2021-08-22'),
(4, 'Diana', 'Garcia', 'Mexico', '2022-11-30'),
(5, 'Eve', 'Davis', 'Canada', '2023-06-10');



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price INT, -- No decimals
    Stock INT
);

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 1000, 50),
(102, 'Headphones', 'Electronics', 50, 200),
(103, 'Chair', 'Furniture', 120, 30),
(104, 'Desk', 'Furniture', 250, 20),
(105, 'Tablet', 'Electronics', 400, 80);



CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders VALUES
(1001, 1, 101, '2023-03-10', 1),
(1002, 2, 103, '2023-05-15', 2),
(1003, 3, 102, '2023-01-20', 3),
(1004, 1, 104, '2023-07-25', 1),
(1005, 4, 105, '2023-09-05', 1);

