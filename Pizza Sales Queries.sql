-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_value
FROM pizza_sales

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales

-- Average Pizzas Per Order
SELECT (SUM(quantity) / COUNT(DISTINCT order_id)) AS Avg_pizzas_per_order
FROM pizza_sales

-- Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS Day_Name , COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_orders DESC

-- Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name , COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

-- Percentage of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_of_sales  
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_of_sales DESC

-- Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10, 2)) AS Percentage_of_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_of_sales DESC

-- Best 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC

-- Worst 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC

-- Best 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC

-- Worst 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC

-- Best 5 Pizzas by total orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC

-- Worst 5 Pizzas by total orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
