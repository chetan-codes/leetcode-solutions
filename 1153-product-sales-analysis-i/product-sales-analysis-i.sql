# Write your MySQL query statement below

SELECT P.product_name, S.year, S.price
FROM SALES S LEFT JOIN PRODUCT AS P
ON S.product_id=P.product_id;
