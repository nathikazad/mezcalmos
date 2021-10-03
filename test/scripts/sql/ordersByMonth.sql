SELECT TO_CHAR(TO_DATE (extract(month from "orderTime")::text, 'MM'), 'Month') AS month, 
count(*) AS totalOrders, 
count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS droppedOff,
count(*) FILTER (WHERE "finalStatus" = 'expired') AS expired,
count(*) FILTER (WHERE "finalStatus" = 'cancelled') AS cancelled,
count(*) FILTER (WHERE "finalStatus" = 'droppedOff')*100/count(*) as fulfillmentRatio
FROM orders 
GROUP BY extract(month from "orderTime") 
ORDER BY extract(month from "orderTime") ASC