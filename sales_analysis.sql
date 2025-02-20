CREATE DATABASE IF NOT EXISTS Sales;

USE Sales;

DROP TABLE IF EXISTS sale;

CREATE TABLE sale (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255),
    cost_price FLOAT,
    list_price FLOAT,
    quantity INT,
    total_profit FLOAT
);
-- top 3 categories sold
select * from sale;
SELECT 
    category, 
    SUM(quantity) AS total_quantity
FROM 
    sale
GROUP BY 
    Category
ORDER BY 
    total_quantity DESC;
-- state with the most profit
SELECT 
    State, 
    SUM(CAST(Profit AS DECIMAL)) AS Profit
FROM 
    sale
GROUP BY 
    State
ORDER BY 
    Profit DESC
LIMIT 3;
-- lowest profit of sub category
SELECT Sub_Category, SUM(Profit) AS Profit
FROM sale
GROUP BY Sub_Category
ORDER BY Profit ASC
LIMIT 3;

SELECT Sub_Category, SUM(Profit) AS Profit
FROM sale
Where Profit < 0
GROUP BY Sub_Category
LIMIT 10;

-- # Find the top 3 products with the highest total profit. 
select Ship_mode, Sum(Profit) as Profit
from sale
Group by Ship_mode
order by Profit DESC
limit 3;

-- # Find the total quantity sold and total profit for each category.
select * from sale;

select Sub_Category, Sum(Quantity) as Quantity, sum(Profit) as Profit
from sale
Group by Sub_Category
Order by Quantity desc;

-- List the regions in descending order of total profit.
Select Region, Sum(Profit) as Profit
from sale
Group by Region
Order by Profit desc;

-- # Find the state that has the highest average quantity per order.
Select State, AVG(Quantity) as Avg_Quantity, COUNT(Order_ID) AS total_orders
from sale
Group by State
Order by Avg_Quantity DESC, total_orders
limit 5;

-- Find the ship mode with the highest number of orders.
SELECT Ship_Mode, COUNT(Order_ID) AS total_orders
FROM sale
GROUP BY Ship_Mode
ORDER BY total_orders DESC
LIMIT 5;

-- # Calculate the overall profit margin for each category.
select Category, sum(Profit) as total_profit
from sale
group by category
order by total_profit desc;
