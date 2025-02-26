SELECT 
    Region, 
    Round(SUM(Sales),2) AS total_sales, 
    Round(SUM(Profit),2) AS total_profit, 
    COUNT(DISTINCT Order_ID) AS total_orders
FROM `feisty-delight-451900-r1.superstore_dataset.superstore_orders`
GROUP BY Region
ORDER BY total_sales DESC;