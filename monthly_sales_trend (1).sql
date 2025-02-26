SELECT 
    Region, 
    EXTRACT(YEAR FROM Order_Date) AS year,
    EXTRACT(MONTH FROM Order_Date) AS month,
    Round(SUM(Sales),2) AS monthly_sales
FROM `feisty-delight-451900-r1.superstore_dataset.superstore_orders`
GROUP BY Region, year, month
ORDER BY Region, year, month;