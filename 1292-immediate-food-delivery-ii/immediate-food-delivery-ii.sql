# Write your MySQL query statement below
#Beginner

SELECT ROUND(AVG(IF(d.order_date = d.customer_pref_delivery_date,1,0))*100,2 ) AS immediate_percentage
FROM Delivery d
LEFT JOIN
(SELECT customer_id, MIN(order_date) AS first_order_date
FROM Delivery 
GROUP BY customer_id) v
ON d.customer_id = v.customer_id
WHERE d.order_date = v.first_order_date;