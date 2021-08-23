SELECT date("orderTime") at time zone 'pst' as date, count(*) as totalOrders, 
count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS droppedOff,
count(*) FILTER (WHERE "finalStatus" = 'expired') AS expired,
count(*) FILTER (WHERE "finalStatus" = 'cancelled') AS cancelled,
count(*) FILTER (WHERE "finalStatus" = 'droppedOff')*100/count(*) as fulfillmentRatio
FROM orders 
GROUP BY date
ORDER BY date ASC