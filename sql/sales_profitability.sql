-- =============================================
-- Project  : Sales Analysis
-- File     : sales_profitability.sql
-- Author   : N Jhansi mahalakshmi
-- Date     : April 2026
-- =============================================

-- -----------------------------------------------
-- PART 1A: Total Sales by Category
-- -----------------------------------------------
SELECT 
    od.Category,
    SUM(od.Amount) AS total_sales
FROM list_of_orders_1 lo
JOIN order_details_1 od ON lo.OrderID = od.OrderID
GROUP BY od.Category
ORDER BY total_sales DESC;


-- -----------------------------------------------
-- PART 1B: Average Profit and Profit Margin
-- -----------------------------------------------
SELECT 
    od.Category,
    AVG(od.Profit) AS avg_profit_per_order,
    ROUND(SUM(od.Profit) / SUM(od.Amount) * 100, 2) AS profit_margin_pct
FROM list_of_orders_1 lo
JOIN order_details_1 od ON lo.OrderID = od.OrderID
GROUP BY od.Category
ORDER BY profit_margin_pct DESC;


-- -----------------------------------------------
-- PART 1C: Top and Underperforming Categories
-- -----------------------------------------------
SELECT 
    od.Category,
    SUM(od.Amount) AS total_sales,
    AVG(od.Profit) AS avg_profit,
    ROUND(SUM(od.Profit) / SUM(od.Amount) * 100, 2) AS profit_margin_pct,
    CASE 
        WHEN SUM(od.Profit) / SUM(od.Amount) * 100 >= 15 THEN 'Top Performer'
        WHEN SUM(od.Profit) / SUM(od.Amount) * 100 BETWEEN 5 AND 14 THEN 'Average'
        ELSE 'Underperforming'
    END AS performance_status
FROM list_of_order_1 lo
JOIN order_details_1 od ON lo.OrderID = od.OrderID
GROUP BY od.Category
ORDER BY profit_margin_pct DESC;
