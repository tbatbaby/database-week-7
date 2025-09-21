-- Database Week 7 Normalization Assignment Solutions

--@block
-- Question 1: Achieving 1NF
-- Splitting products into separate rows

-- Step 1: Create a new table for 1NF data
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Step 2: Insert data for OrderID 101 (John Doe)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse');

-- Step 3: Insert data for OrderID 102 (Jane Smith)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse');

-- Step 4: Insert data for OrderID 103 (Emily Clark)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(103, 'Emily Clark', 'Phone');


--@block

-- Question 2: Achieving 2NF
-- Removing partial dependencies

-- Step 1: Create Orders table (stores order information)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Step 2: Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 3: Create OrderItems table (stores product details for each order)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)  -- Composite primary key
);

-- Step 4: Insert data into OrderItems table
-- Order 101 products
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1);

-- Order 102 products
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2);

-- Order 103 products
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
(103, 'Phone', 1);
