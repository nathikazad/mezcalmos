WITH driverTotals AS (SELECT 
  count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS totalorders, 
  "driverId" AS driverId
FROM orders
WHERE "orderTime" at time zone 'pst' > (current_date - extract(dow from current_date)::integer + 1 - 7) 
  AND "orderTime" at time zone 'pst' < (current_date + 8 - extract(dow from current_date)::integer - 7)
GROUP BY driverid
ORDER BY totalorders DESC)


SELECT
  dt.totalorders,
  "displayName"
FROM driverTotals dt
LEFT JOIN users u
  ON dt.driverId = u.uid
WHERE totalorders > 0
ORDER BY dt.totalOrders DESC


