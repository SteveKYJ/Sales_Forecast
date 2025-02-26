SELECT 
    Category, 
    Region, 
    ROUND(SUM(Sales), 2) AS total_sales, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM `feisty-delight-451900-r1.superstore_dataset.superstore_orders`
GROUP BY Category, Region
ORDER BY total_sales;