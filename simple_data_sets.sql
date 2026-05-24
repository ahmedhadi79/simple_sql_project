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
(10, 'Jack', 'Anderson', 'Mexico', '2022-07-14')
(11, 'Ahmed', 'Hadi', 'EGYPT', '2023-01-01')
(12, 'Fatma', 'Hadi', 'EGYPT', '2023-02-02')
(13, 'Hossam', 'Hadi', 'EGYPT', '2023-03-03')
(14, 'Zienab', 'Hadi', 'USA', '2023-04-04')
(15, 'Khaled', 'Hadi', 'EGYPT', '2023-05-05')
(16, 'Sara', 'Hadi', 'EGYPT', '2023-06-06')
(17, 'Hany', 'Hadi', 'EGYPT', '2023-07-07')
(18, 'Mona', 'Hadi', 'GERMANY', '2023-08-08')
(19, 'Osama', 'Hadi', 'FRANCE', '2023-09-09')
(20, 'Hoda', 'Hadi', 'ITALY', '2023-10-10')
(21, 'Ehab', 'Hadi', 'SPAIN', '2023-11-11')
(22, 'Samia', 'Hadi', 'CHINA', '2023-12-12');



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
(110, 'Dining Table', 'Furniture', 500, 15)
(111, 'Mouse', 'Electronics', 25, 100)
(112, 'Keyboard', 'Electronics', 75, 150)
(113, 'Chair', 'Furniture', 120, 30)
(114, 'Desk', 'Furniture', 250, 20)
(115, 'Tablet', 'Electronics', 400, 80)
(116, 'Sofa', 'Furniture', 800, 10)
(117, 'Smartphone', 'Electronics', 600, 60)
(118, 'Bookshelf', 'Furniture', 150, 25)
(119, 'Monitor', 'Electronics', 300, 40)
(120, 'Dining Table', 'Furniture', 500, 15)
(121, 'Mouse', 'Electronics', 25, 100)
(122, 'Keyboard', 'Electronics', 75, 150)
(123, 'Chair', 'Furniture', 120, 30)
(124, 'Desk', 'Furniture', 250, 20)
(125, 'Tablet', 'Electronics', 400, 80)
(126, 'Sofa', 'Furniture', 800, 10)
(127, 'Smartphone', 'Electronics', 600, 60)
(128, 'Bookshelf', 'Furniture', 150, 25)
(129, 'Monitor', 'Electronics', 300, 40)
(130, 'Dining Table', 'Furniture', 500, 15);



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
(1011, 10, 111, '2023-10-05', 2),
(1012, 11, 112, '2023-12-10', 1),
(1013, 12, 113, '2024-01-15', 3),
(1014, 13, 114, '2024-02-20', 1),
(1015, 14, 115, '2024-03-25', 2),
(1016, 15, 116, '2024-04-30', 1),
(1017, 16, 117, '2024-05-05', 2),
(1018, 17, 118, '2024-06-10', 1),
(1019, 18, 119, '2024-07-15', 3),
(1020, 19, 120, '2024-08-20', 1);
(1021, 20, 121, '2024-09-25', 2),
(1022, 21, 122, '2024-10-30', 1),
(1023, 22, 123, '2024-11-05', 3),
(1024, 1, 124, '2024-12-10', 1),
(1025, 2, 125, '2025-01-15', 2),
(1026, 3, 126, '2025-02-20', 1),
(1027, 4, 127, '2025-03-25', 3),
(1028, 5, 128, '2025-04-30', 1),
(1029, 6, 129, '2025-05-05', 2),
(1030, 7, 130, '2025-06-10', 1);

