# Write your MySQL query statement below
#SELECT today.id FROM Weather today CROSS JOIN Weather yesterday

#WHERE DATEDIFF(today.recordDate, yesterday.recordDate) =1 
#AND today.temperature > yesterday.temperature;



SELECT w1.id 
FROM Weather w1 
LEFT JOIN Weather w2
ON w1.recordDate - INTERVAL 1 DAY = w2.recordDate
WHERE w1.temperature>w2.temperature;
