SELECT 
  TO_CHAR(TO_DATE (extract(month from "orderTime")::text, 'MM'), 'Month') AS month,
  count(distinct "driverId") as drivers
FROM orders 
GROUP BY extract(month from "orderTime") 
ORDER BY extract(month from "orderTime") ASC