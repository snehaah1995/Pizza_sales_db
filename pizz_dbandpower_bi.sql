SELECT *
FROM pizza_sales

--TOTAL REVENUE

SELECT CAST(SUM(total_price)AS decimal(10,2) )AS total_pizza_revenue from pizza_sales


--AVG ORDER VALUE
SELECT CAST((SUM(total_price) / COUNT(DISTINCT order_id))AS decimal(10,2)) AS AVG_ORDER_VALUE
FROM pizza_sales

--total pizza orders

SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales

--total orders
SELECT COUNT(DISTINCT order_id)AS Total_orders from pizza_sales

--avg pizza order
SELECT CAST((SUM(quantity) / COUNT(DISTINCT order_id))AS decimal(10,2)) AS AVG_pizza_ORDER_VALUE
FROM pizza_sales


--CHART REQUIREMENT

SELECT *
FROM pizza_sales

--Daily trend for total orders
SELECT DATENAME(DW, order_date) AS Daily_order_day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Monthly trend for total orders
SELECT DATENAME(MONTH, order_date) AS Monthly_order_day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

SELECT pizza_category,CAST(( SUM(total_price) * 100 /(select SUM(total_price) FROM pizza_sales))AS decimal(10,2)) AS Total_sales
FROM pizza_sales
GROUP BY pizza_category


SELECT pizza_size,CAST(( SUM(total_price) * 100 /(select SUM(total_price) FROM pizza_sales))AS decimal(10,2)) AS Total_sales
FROM pizza_sales
WHERE DATEPART(quarter, order_date) =1
GROUP BY pizza_size
order by total_sales desc


SELECT TOP 5 pizza_name, CAST(SUM(total_price)AS decimal(10,2))AS Total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue desc


SELECT TOP 5 pizza_name, CAST(SUM(total_price)AS decimal(10,2))AS Total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC


SELECT TOP 5 pizza_name, CAST(SUM(quantity)AS decimal(10,2))AS Total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC


SELECT TOP 5 pizza_name, CAST(SUM(quantity)AS decimal(10,2))AS Total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC


SELECT TOP 5 pizza_name, COUNT( DISTINCT order_id)AS Total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESCC	

SELECT TOP 5 pizza_name, COUNT( DISTINCT order_id)AS Total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC






