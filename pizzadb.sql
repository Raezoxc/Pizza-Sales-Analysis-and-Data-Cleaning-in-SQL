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
#Create a stacked bar chart that displays the hourly trend of total orders over a specific time period.
#This chart will help us identify any patterns or fluctuations in order volumes on a hourly basis.

SELECT HOUR(order_time) AS Hour, SUM(quantity) AS Total_pizzas_Sold 
FROM pizza_sales 
GROUP BY HOUR(order_time) 
ORDER BY HOUR(order_time);

#Weekly Trend for Total Orders:
#Create a line chart that illustrates the weekly trend of total orders throughout the year. 
#This chart will allow us to identify peak weeks or periods of high order activity.

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
#Create a pie chart that shows the distribution of sales across different pizza categories. 
#This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.

SELECT pizza_category AS Category, SUM(total_price) AS Total_Price, 
SUM(total_price) / (SELECT SUM(total_price) 
FROM pizza_sales) * 100 AS PCT 
FROM pizza_sales 
GROUP BY Category;

#Percentage of Sales by Pizza Size:
#Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. 
#This chart will help us understand customer preferences for pizza sizes and their impact on sales.

SELECT pizza_size, 
ROUND(SUM(total_price),0) AS Total_Price, 
ROUND(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) * 100, 2) AS PCT 
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC;

#5.Total Pizzas Sold by Pizza Category:
#Create a funnel chart that presents the total number of pizzas sold for each pizza category. 
#This chart will allow us to compare the sales performance of different pizza categories.
SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category;



#Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
#Create a bar chart highlighting the top 5 best-selling pizzas based on the Revenue, Total Quantity, Total Orders. 
#This chart will help us identify the most popular pizza options.


SELECT pizza_name, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC
LIMIT 5;


#. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
#Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the Revenue, Total Quantity, Total Orders. 
#This chart will enable us to identify underperforming or less popular pizza options.


SELECT pizza_name, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC
LIMIT 5;