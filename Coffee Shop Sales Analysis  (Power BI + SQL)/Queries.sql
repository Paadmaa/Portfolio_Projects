CREATE TABLE coffee_shop_sales (
    transaction_id SERIAL PRIMARY KEY,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(100),
    product_id INT,
    unit_price NUMERIC(10, 2),
    product_category VARCHAR(50),
    product_type VARCHAR(50),
    product_detail VARCHAR(100)
);

SELECT * FROM coffee_shop_sales;

-- Convert transaction_date to DATE type

ALTER TABLE coffee_shop_sales
ALTER COLUMN transaction_date TYPE DATE USING transaction_date::DATE;

-- Convert transaction_time to TIME type

ALTER TABLE coffee_shop_sales 
ALTER COLUMN transaction_time TYPE TIME USING transaction_time::TIME;

-- Get table structure (PostgreSQL equivalent of DESCRIBE)
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'coffee_shop_sales';

-- Total Sales (for the month of May)
SELECT ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) = 5;

-- TOTAL SALES KPI - MOM DIFFERENCE AND MOM GROWTH

WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('month', transaction_date) AS month,
        SUM(unit_price * transaction_qty) AS total_sales
    FROM 
        coffee_shop_sales
    WHERE 
        transaction_date < '2025-02-04'  -- Exclude current date
    GROUP BY 
        month
)

SELECT 
    month,
    total_sales AS current_month_sales,
    LAG(total_sales) OVER (ORDER BY month) AS previous_month_sales,
    (total_sales - LAG(total_sales) OVER (ORDER BY month)) AS sales_difference,
    ROUND((100.0 * (total_sales - LAG(total_sales) OVER (ORDER BY month)) / NULLIF(LAG(total_sales) OVER (ORDER BY month), 0)), 2) AS growth_percentage
FROM 
    monthly_sales
ORDER BY 
    month DESC;

-- TOTAL ORDERS

SELECT COUNT(transaction_id) AS Total_Orders
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) = 5;

-- TOTAL ORDERS KPI - MOM DIFFERENCE AND MOM GROWTH

WITH monthly_orders AS (
    SELECT 
        DATE_TRUNC('month', transaction_date) AS month,
        COUNT(transaction_id) AS total_orders
    FROM 
        coffee_shop_sales
    WHERE 
        EXTRACT(MONTH FROM transaction_date) IN (4, 5) -- for April and May
    GROUP BY 
        month
)

SELECT 
    month,
    total_orders,
    (total_orders - LAG(total_orders) OVER (ORDER BY month)) AS orders_difference,
    ROUND(
        (100.0 * (total_orders - LAG(total_orders) OVER (ORDER BY month)) / NULLIF(LAG(total_orders) OVER (ORDER BY month), 0)), 2
    ) AS mom_increase_percentage
FROM 
    monthly_orders
ORDER BY 
    month;

-- Total Quantity Sold
SELECT SUM(transaction_qty) AS Total_Quantity_Sold
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) = 5; -- for the month of May


--  TOTAL QUANTITY SOLD KPI - MOM DIFFERENCE AND MOM GROWTH

WITH monthly_quantity AS (
    SELECT 
        DATE_TRUNC('month', transaction_date) AS month,
        SUM(transaction_qty) AS total_quantity_sold
    FROM 
        coffee_shop_sales
    WHERE 
        EXTRACT(MONTH FROM transaction_date) IN (4, 5) -- for April and May
    GROUP BY 
        month
)

SELECT 
    month,
    total_quantity_sold,
    (total_quantity_sold - LAG(total_quantity_sold) OVER (ORDER BY month)) AS quantity_difference,
    ROUND(
        (100.0 * (total_quantity_sold - LAG(total_quantity_sold) OVER (ORDER BY month)) / NULLIF(LAG(total_quantity_sold) OVER (ORDER BY month), 0)), 2
    ) AS mom_increase_percentage
FROM 
    monthly_quantity
ORDER BY 
    month;

-- CALENDAR TABLE – DAILY SALES, QUANTITY and TOTAL ORDERS
SELECT
    SUM(unit_price * transaction_qty) AS total_sales,
    SUM(transaction_qty) AS total_quantity_sold,
    COUNT(transaction_id) AS total_orders
FROM 
    coffee_shop_sales
WHERE 
    transaction_date = '2023-05-18'; -- For 18 May 2023

-- If you want to get exact Rounded off values then use below query to get the result:

SELECT 
    ROUND(SUM(unit_price * transaction_qty) / 1000, 1)::TEXT || 'K' AS total_sales,
    ROUND(COUNT(transaction_id) / 1000, 1)::TEXT || 'K' AS total_orders,
    ROUND(SUM(transaction_qty) / 1000, 1)::TEXT || 'K' AS total_quantity_sold
FROM 
    coffee_shop_sales
WHERE 
    transaction_date = '2023-05-18'; -- For 18 May 2023


-- SALES TREND OVER PERIOD

SELECT AVG(total_sales) AS average_sales
FROM (
    SELECT 
        SUM(unit_price * transaction_qty) AS total_sales
    FROM 
        coffee_shop_sales
    WHERE 
        EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
    GROUP BY 
        transaction_date
) AS internal_query;


-- DAILY SALES FOR MONTH SELECTED
SELECT 
    EXTRACT(DAY FROM transaction_date) AS day_of_month,
    ROUND(SUM(unit_price * transaction_qty), 1) AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
GROUP BY 
    EXTRACT(DAY FROM transaction_date)
ORDER BY 
    EXTRACT(DAY FROM transaction_date);

-- COMPARING DAILY SALES WITH AVERAGE SALES – IF GREATER THAN “ABOVE AVERAGE” and LESSER THAN “BELOW AVERAGE”

SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        EXTRACT(DAY FROM transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
    GROUP BY 
        EXTRACT(DAY FROM transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;

-- SALES BY WEEKDAY / WEEKEND:

SELECT 
    CASE 
        WHEN EXTRACT(DOW FROM transaction_date) IN (0, 6) THEN 'Weekends'  -- 0 = Sunday, 6 = Saturday
        ELSE 'Weekdays'
    END AS day_type,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
GROUP BY 
    CASE 
        WHEN EXTRACT(DOW FROM transaction_date) IN (0, 6) THEN 'Weekends'
        ELSE 'Weekdays'
    END;

-- SALES BY STORE LOCATION

SELECT 
    store_location,
    SUM(unit_price * transaction_qty) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
GROUP BY 
    store_location
ORDER BY 
    Total_Sales DESC;  -- Order by total sales in descending order

-- SALES BY PRODUCT CATEGORY

SELECT 
    product_category,
    ROUND(SUM(unit_price * transaction_qty), 1) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
GROUP BY 
    product_category
ORDER BY 
    Total_Sales DESC;  -- Order by total sales in descending order

-- SALES BY PRODUCTS (TOP 10)
SELECT 
    product_type,
    ROUND(SUM(unit_price * transaction_qty), 1) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5  -- Filter for May
GROUP BY 
    product_type
ORDER BY 
    Total_Sales DESC  -- Order by total sales in descending order
LIMIT 10;  -- Limit to top 10 results

-- SALES BY DAY | HOUR

SELECT 
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,
    SUM(transaction_qty) AS Total_Quantity,
    COUNT(*) AS Total_Orders
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(DOW FROM transaction_date) = 2  -- Filter for Tuesday (0 is Sunday, 1 is Monday, ..., 6 is Saturday)
    AND EXTRACT(HOUR FROM transaction_time) = 8  -- Filter for hour number 8
    AND EXTRACT(MONTH FROM transaction_date) = 5; -- Filter for May (month number 5)

-- TO GET SALES FROM MONDAY TO SUNDAY FOR MONTH OF MAY
SELECT 
    CASE 
        WHEN EXTRACT(DOW FROM transaction_date) = 0 THEN 'Sunday'
        WHEN EXTRACT(DOW FROM transaction_date) = 1 THEN 'Monday'
        WHEN EXTRACT(DOW FROM transaction_date) = 2 THEN 'Tuesday'
        WHEN EXTRACT(DOW FROM transaction_date) = 3 THEN 'Wednesday'
        WHEN EXTRACT(DOW FROM transaction_date) = 4 THEN 'Thursday'
        WHEN EXTRACT(DOW FROM transaction_date) = 5 THEN 'Friday'
        WHEN EXTRACT(DOW FROM transaction_date) = 6 THEN 'Saturday'
    END AS Day_of_Week,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5 -- Filter for May
GROUP BY 
    EXTRACT(DOW FROM transaction_date)
ORDER BY 
    EXTRACT(DOW FROM transaction_date);  -- Optional: Order by day of the week

-- TO GET SALES FOR ALL HOURS FOR MONTH OF MAY
SELECT 
    EXTRACT(HOUR FROM transaction_time) AS Hour_of_Day,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5 -- Filter for May
GROUP BY 
    EXTRACT(HOUR FROM transaction_time)
ORDER BY 
    Hour_of_Day;  -- Order by hour of the day


