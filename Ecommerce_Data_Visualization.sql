USE ecommerce_capstone;

SHOW TABLES;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_details;
SELECT COUNT(*) FROM payments;

SELECT 
    o.Order_ID,
    c.Customer_Name,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Unit_Price,
    od.Discount_Percent
FROM orders o
JOIN customers c 
    ON o.Customer_ID = c.Customer_ID
JOIN order_details od 
    ON o.Order_ID = od.Order_ID
JOIN products p 
    ON od.Product_ID = p.Product_ID
LIMIT 10;



# 1. BASIC DATA EXPLORATION

SELECT COUNT(*) AS Total_Customers
FROM customers;

SELECT COUNT(*) AS Total_Orders
FROM orders;

SELECT COUNT(*) AS Total_Products
FROM products;

SELECT COUNT(*) AS Total_Categories
FROM categories;

SELECT COUNT(*) AS Total_Payments
FROM payments;