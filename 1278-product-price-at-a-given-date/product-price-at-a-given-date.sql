# Write your MySQL query statement below

WITH data AS
(SELECT *, DATEDIFF('2019-08-16', change_date) AS diff
FROM Products)


SELECT T.product_id, IFNULL(SUM(T.price),10) AS price 
FROM (SELECT data.*, d2.min_diff, CASE WHEN data.diff = d2.min_diff
THEN new_price 
WHEN data.diff <> d2.min_diff 
THEN 0
ELSE NULL
END
AS PRICE
FROM data 
LEFT JOIN
(SELECT product_id, MIN(diff) AS min_diff
FROM data
WHERE diff>=0
GROUP BY product_id) d2
ON data.product_id = d2.product_id) T
GROUP BY T.product_id;