CREATE OR REPLACE MODEL `feisty-delight-451900-r1.superstore_dataset.sales_forecast_model`
OPTIONS(MODEL_TYPE='ARIMA_PLUS', TIME_SERIES_TIMESTAMP_COL='Order_Date', TIME_SERIES_DATA_COL='Sales', TIME_SERIES_ID_COL='Region') AS
SELECT 
    Order_Date, 
    Region, 
    Round(SUM(Sales),2) AS Sales
FROM `feisty-delight-451900-r1.superstore_dataset.superstore_orders`
WHERE Order_Date BETWEEN '2020-01-01' AND '2023-12-31'
GROUP BY Order_Date, Region;

SELECT
  FORMAT_TIMESTAMP('%Y-%m-%d', forecast_timestamp) AS predicted_date,
  Region,
  Round(forecast_value,2) AS predicted_sales
FROM
  ML.FORECAST(MODEL `feisty-delight-451900-r1.superstore_dataset.sales_forecast_model`, STRUCT(365 AS horizon, 0.95 AS confidence_level))
WHERE EXTRACT(YEAR FROM forecast_timestamp) = 2024
ORDER BY
  predicted_date;