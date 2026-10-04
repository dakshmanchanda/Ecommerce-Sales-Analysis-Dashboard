CREATE DATABASE IF NOT EXISTS ecommerce_capstone;
USE ecommerce_capstone;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Signup_Date DATE,
    Email VARCHAR(120)
);

CREATE TABLE categories (
    Category_ID VARCHAR(10) PRIMARY KEY,
    Category_Name VARCHAR(100),
    Department VARCHAR(100)
);

CREATE TABLE products (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(150),
    Category_ID VARCHAR(10),
    Brand VARCHAR(100),
    Price DECIMAL(12,2),
    FOREIGN KEY (Category_ID) REFERENCES categories(Category_ID)
);

CREATE TABLE orders (
    Order_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Order_Date DATETIME,
    Order_Status VARCHAR(30),
    Platform VARCHAR(30),
    Payment_ID VARCHAR(15),
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID)
);

CREATE TABLE order_details (
    Order_Detail_ID VARCHAR(12) PRIMARY KEY,
    Order_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Discount_Percent DECIMAL(5,2),
    FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);

CREATE TABLE payments (
    Payment_ID VARCHAR(15) PRIMARY KEY,
    Order_ID VARCHAR(10),
    Payment_Method VARCHAR(30),
    Amount DECIMAL(12,2),
    Payment_Status VARCHAR(30),
    FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID)
);