USE zepto_sql_project;

ALTER TABLE zepto_v2
ADD sku_id INT IDENTITY(1,1);

--set the sku_id as primary key
ALTER TABLE zepto_v2
ADD CONSTRAINT PK_zeptov2 PRIMARY KEY (sku_id);

--DATA EXPLORATION 
-- count of rows
SELECT COUNT(*) as 'count_rows'
FROM zepto_v2;

--sample data 
SELECT TOP 10 *
FROM zepto_v2;

--null values
SELECT *
FROM zepto_v2
WHERE name IS NULL
	OR category IS NULL
	OR mrp IS NULL
	OR discountPercent IS NULL
	OR availableQuantity IS NULL
	OR discountedSellingPrice IS NULL
	OR quantity IS NULL;

--product categories
SELECT DISTINCT category
FROM zepto_v2
ORDER BY category ASC;

--products in stock vs out of stock
SELECT 
	outOfStock, 
	COUNT(sku_id) AS 'count'
FROM zepto_v2
GROUP BY outOfStock;

--product names present multiple times
SELECT 
	name, 
	COUNT(sku_id) AS "Number of SKU's"
FROM zepto_v2
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

--DATA CLEANING
-- products with price = 0
SELECT *
FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

--standardize prices-convert paise to rupees
SELECT 
	mrp,
	mrp = mrp/100.0 ,
	discountedSellingPrice,
	discountedSellingPrice = discountedSellingPrice/100.0 
FROM zepto_v2;

UPDATE zepto_v2
SET mrp = mrp/100.0,
	discountedSellingPrice = discountedSellingPrice/100.0;

SELECT *
FROM zepto_v2;

--Q1. Find the top 10 best-value products based on the discount percentage
SELECT DISTINCT TOP 10 
	name,
	mrp,
	discountPercent 
FROM zepto_v2
ORDER BY discountPercent DESC;

--Q2. What are the products with high MRP but out of stock?
SELECT 
	category,
	name,
	mrp,
	outOfStock
FROM zepto_v2
WHERE outofStock = 'TRUE' AND mrp > 300
ORDER BY mrp DESC;

--Q3. Calculate Estimated Revenue for each category
SELECT
	category,
	SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue DESC;

--Q4. Find all products where MRP is greater than Rs 500 and discount is less than 10%
SELECT DISTINCT
	name,
	mrp,
	discountPercent 
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage
SELECT TOP 5
	category,
	ROUND(AVG(discountPercent), 2) AS AvgDiscount
FROM zepto_v2
GROUP BY category
ORDER BY AvgDiscount DESC;

--Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT 
	name,
	discountedSellingPrice,
	weightinGms,
	ROUND(discountedSellingPrice/weightinGms, 2) AS pricePerGm
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY pricePerGm DESC;

--Q7. Group the product into categories like low, medium, bulk
SELECT DISTINCT 
	name,
	weightInGms,
	CASE 
		WHEN weightInGms > 1000 THEN 'Low'
		WHEN weightInGms > 5000 THEN 'Medium'
		ELSE 'Bulk'
	END AS weight_category
FROM zepto_v2;

--Q8. What is the total inventory weight per category?
SELECT
	category,
	SUM(availableQuantity * weightInGms) AS total_inventory_wt
FROM zepto_v2
GROUP BY category
ORDER BY total_inventory_wt DESC;




