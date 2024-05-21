SELECT * FROM pizza_sales;
USE pizzadb;

#The sum of the total price of all pizza orders.
SELECT SUM(total_price) AS Total_revenue 
FROM pizza_sales;

#The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
SELECT ROUND(SUM(total_price) / Count(DISTINCT order_id), 2) AS Average_order_value 
FROM pizza_sales;

#The sum of the quantities of all pizzas sold
SELECT SUM(quantity) AS Total_pizzas_Sold 
FROM pizza_sales;

#The total number of orders placed
SELECT COUNT(DISTINCT order_id) AS Total_Orders_Placed 
FROM pizza_sales;

#The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders
#total number of pizzas
#total number of orders
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS AVG_Pizzas_Per_Order 
FROM pizza_sales;

#Hourly Trend for Total Pizzas Sold:


SELECT HOUR(order_time) AS Hour, SUM(quantity) AS Total_pizzas_Sold 
FROM pizza_sales 
GROUP BY HOUR(order_time) 
ORDER BY HOUR(order_time);

#Weekly Trend for Total Orders:

DESCRIBE pizza_sales;
ALTER TABLE pizza_sales MODIFY COLUMN order_date DATE;
#The error message indicates that there are values in the order_date column that do not match the expected format for dates when trying to alter the column to the DATE data type. 
#The standard date format in MySQL is 'YYYY-MM-DD'.
UPDATE pizza_sales SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');
ALTER TABLE pizza_sales MODIFY COLUMN order_date DATE;

SELECT WEEK(order_date) AS WEEK,
       YEAR(order_date) AS YEAR,
       COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY WEEK(order_date), YEAR(order_date)
ORDER BY WEEK(order_date), YEAR(order_date);

#Percentage of Sales by Pizza Category:

SELECT pizza_category AS Category, SUM(total_price) AS Total_Price, 
SUM(total_price) / (SELECT SUM(total_price) 
FROM pizza_sales) * 100 AS PCT 
FROM pizza_sales 
GROUP BY Category;

#Percentage of Sales by Pizza Size:

SELECT pizza_size, 
ROUND(SUM(total_price),0) AS Total_Price, 
ROUND(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) * 100, 2) AS PCT 
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC;

#5.Total Pizzas Sold by Pizza Category:

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category;



#Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

SELECT pizza_name, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC
LIMIT 5;


#. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

SELECT pizza_name, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC
LIMIT 5;
