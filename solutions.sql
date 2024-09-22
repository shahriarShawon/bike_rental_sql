-- Task 1

SELECT 
    category, COUNT(1) AS number_of_bikes
FROM
    bike
GROUP BY 1
HAVING COUNT(1) > 2;

-- Task 2

SELECT 
    c.name, COUNT(m.id) AS membership_count
FROM
    membership AS m
        RIGHT JOIN
    customer AS c ON c.id = m.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- Task 3
SELECT 
    id,
    category,
    price_per_hour AS old_price_per_hour,
    CASE
        WHEN
            category = 'electric'
        THEN
            ROUND(price_per_hour - (price_per_hour * 0.1),
                    2)
        WHEN
            category = 'mountain'
        THEN
            ROUND(price_per_hour - (price_per_hour * 0.2),
                    2)
        ELSE ROUND(price_per_hour - (price_per_hour * 0.5),
                2)
    END AS new_price_per_hour,
    price_per_day AS old_price_per_day,
    CASE
        WHEN category = 'electric' THEN ROUND(price_per_day - (price_per_day * 0.2), 2)
        WHEN category = 'mountain' THEN ROUND(price_per_day - (price_per_day * 0.5), 2)
        ELSE ROUND(price_per_day - (price_per_day * 0.5), 2)
    END AS New_price_per_day
FROM
    bike;
        
-- Task 4

SELECT COALESCE(category, 'Total') AS category,
       COUNT(CASE WHEN status = 'available' THEN 1 END) AS available_bikes_count,
       COUNT(CASE WHEN status = 'rented' THEN 1 END) AS rented_bikes_count
FROM bike
GROUP BY category WITH ROLLUP;

-- Task 5
SELECT 
    EXTRACT(YEAR FROM start_timestamp) AS year,
    EXTRACT(MONTH FROM start_timestamp) AS month,
    SUM(total_paid) AS revenue
FROM
    rental
GROUP BY EXTRACT(YEAR FROM start_timestamp) , EXTRACT(MONTH FROM start_timestamp) WITH ROLLUP
ORDER BY year , month;

-- Task 6
SELECT 
    EXTRACT(YEAR FROM start_date) AS year,
    EXTRACT(MONTH FROM start_date) AS month,
    mt.name AS membership_type_name,
    SUM(total_paid) AS total_revenue
FROM
    membership AS m
        JOIN
    membership_type AS mt ON m.membership_type_id = mt.id
GROUP BY year , month , mt.name
ORDER BY year , month , mt.name;

-- Task 7
SELECT 
    COALESCE(mt.name, 'Grand Total') AS membership_type_name,
    EXTRACT(MONTH FROM m.start_date) AS month,
    SUM(m.total_paid) AS total_revenue
FROM 
    membership m
JOIN 
    membership_type mt ON m.membership_type_id = mt.id
WHERE 
    EXTRACT(YEAR FROM m.start_date) = 2023
GROUP BY 
    mt.name, 
    EXTRACT(MONTH FROM m.start_date) WITH ROLLUP
ORDER BY 
    mt.name, 
    month;

-- Task 8
WITH cte AS (
	SELECT 
    customer_id,
    COUNT(1),
    CASE
        WHEN COUNT(1) > 10 THEN 'more than 10'
        WHEN COUNT(1) BETWEEN 5 AND 10 THEN 'between 5 and 10'
        ELSE 'fewer than 5'
    END AS category
FROM
    rental
GROUP BY customer_id
)

SELECT 
    category AS rental_count_category,
    COUNT(*) AS customer_count
FROM
    cte
GROUP BY category
ORDER BY customer_count desc;


    



    
