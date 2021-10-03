WITH driverTotals AS (SELECT 
  count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS totalorders, 
  "driverId" AS driverId
FROM orders
GROUP BY driverid
ORDER BY totalorders DESC)


SELECT
  dt.totalorders,
  "displayName"
FROM driverTotals dt
JOIN users u
  ON dt.driverId = u.uid
ORDER BY dt.totalOrders DESC