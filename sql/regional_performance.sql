-- =============================================
-- Project  : Sales Analysis
-- File     : regional_performance.sql
-- Author   : N Jhansi mahalakshmi
-- Date     : April 2026
-- =============================================


-- -----------------------------------------------
-- PART 3A: Top 5 States by Highest Order Count
-- -----------------------------------------------
SELECT 
    lo.State,
    COUNT(lo.OrderID) AS order_count
FROM list_of_order_1 lo
GROUP BY lo.State
ORDER BY order_count DESC
LIMIT 5;


-- -----------------------------------------------
-- PART 3B: Total Sales and Average Profit
--          for Top 5 States
-- -----------------------------------------------
SELECT 
    lo.State,
    COUNT(lo.OrderID) AS order_count,
    SUM(od.Amount) AS total_sales,
    ROUND(AVG(od.Profit), 2) AS avg_profit
FROM list_of_order_1 lo
JOIN order_details_1 od 
    ON lo.OrderID= od.OrderID
GROUP BY lo.State
ORDER BY order_count DESC
LIMIT 5;


-- -----------------------------------------------
-- PART 3C: Performance Label per State
-- -----------------------------------------------
SELECT 
    lo.State,
    COUNT(lo.OrderID) AS order_count,
    SUM(od.Amount) AS total_sales,
    ROUND(AVG(od.Profit), 2) AS avg_profit,
    CASE
        WHEN AVG(od.Profit) >= 50  THEN 'High Profit'
        WHEN AVG(od.Profit) >= 20  THEN 'Moderate Profit'
        ELSE 'Low Profit / Loss'
    END AS profit_status
FROM list_of_orders lo
JOIN order_details_1 od 
    ON lo.OrderID = od.OrderID
GROUP BY lo.State
ORDER BY order_count DESC
LIMIT 5;
