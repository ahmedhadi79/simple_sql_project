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
(5, 'Eve', 'Davis', 'Canada', '2023-06-10'),
(6, 'Frank', 'Miller', 'USA', '2023-02-20'),
(7, 'Grace', 'Wilson', 'Mexico', '2022-12-05'),
(8, 'Hank', 'Moore', 'Canada', '2021-09-18'),
(9, 'Ivy', 'Taylor', 'EGYPT', '2023-03-25'),
(10, 'Jack', 'Anderson', 'Mexico', '2022-07-14');



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
(105, 'Tablet', 'Electronics', 400, 80),
(106, 'Sofa', 'Furniture', 800, 10),
(107, 'Smartphone', 'Electronics', 600, 60),
(108, 'Bookshelf', 'Furniture', 150, 25),
(109, 'Monitor', 'Electronics', 300, 40),
(110, 'Dining Table', 'Furniture', 500, 15);



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
(1005, 4, 105, '2023-09-05', 1),
(1006, 5, 106, '2023-11-30', 1),
(1007, 6, 107, '2023-02-14', 2),
(1008, 7, 108, '2023-04-18', 1),
(1009, 8, 109, '2023-06-22', 1),
(1010, 9, 110, '2023-08-30', 1);

