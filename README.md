# Pizza Sales Analysis and Data Cleaning

This project focuses on analyzing and cleaning pizza sales data to gain insights into revenue, order patterns, and customer preferences. Below is a structured approach, combining all the queries and their explanations:

## Data Selection and Database Usage

**Retrieve All Data**: Selecting all records from the `pizza_sales` table provides an initial overview of the dataset.

**Database Selection**: Using the `pizzadb` database ensures all queries are executed within the correct context.

## Revenue Analysis

**Total Revenue**: Calculating the total revenue from all pizza orders gives a comprehensive view of the overall sales performance.

**Average Order Value**: Determining the average amount spent per order by dividing the total revenue by the number of distinct orders helps understand customer spending behavior.

## Sales Volume Analysis

**Total Pizzas Sold**: Summing the quantities of all pizzas sold provides insight into the sales volume.

**Total Orders Placed**: Counting the distinct orders helps gauge the level of customer engagement.

**Average Pizzas per Order**: Calculating the average number of pizzas sold per order reveals purchasing patterns.

## Trend Analysis

**Hourly Sales Trend**: Grouping the total pizzas sold by the hour identifies peak sales times and operational patterns.

**Weekly Sales Trend**: Ensuring the `order_date` column is correctly formatted as a date, then grouping and counting orders by week and year, helps observe fluctuations in order volumes and identify peak periods.

## Sales Distribution Analysis

**Percentage of Sales by Category**: Calculating the percentage of total sales contributed by each pizza category provides insights into the popularity of various categories.

**Percentage of Sales by Size**: Computing the percentage of sales attributed to different pizza sizes helps understand customer preferences.

## Category Performance Analysis

**Total Pizzas Sold by Category**: Summing the total number of pizzas sold for each category allows comparison of performance across different categories.

## Best and Worst Sellers Analysis

**Top 5 Best Sellers by Revenue**: Identifying the top five pizzas based on revenue helps highlight the most popular options.

**Bottom 5 Worst Sellers by Revenue**: Identifying the bottom five pizzas based on revenue reveals the least popular options, informing potential adjustments.

## Data Cleaning and Formatting

**Order Date Formatting**: Converting the `order_date` to the correct date format ensures consistency and accuracy in date-related analyses. This involves updating the format and altering the table structure accordingly.
