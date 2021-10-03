WITH  lastNdays AS (
SELECT * FROM generate_series(

CURRENT_DATE - interval '15 Day',

CURRENT_DATE,

'1 day') AS day),


allOrders AS (SELECT
"orderTime",
"orderId" AS orderId,
"finalStatus" 
FROM orders
WHERE ("driverId" = 'QHcus8twu5eU7E2lJp4IeuHduB43'
        AND "orderTime" > CURRENT_DATE - INTERVAL '15 day')
),


cumOrdersByDay AS (SELECT
 CAST( "orderTime" AT TIME ZONE 'CDT' AS date) AS day, 
 count(*) AS totalOrders,
 count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS droppedOff
 FROM allOrders
 GROUP BY 1
) 

SELECT 
  15 - EXTRACT(day from CURRENT_DATE - lastNdays.day) as day,
  SUBSTRING(CAST(lastNdays.day AS text) FROM 1 FOR 10),
  coalesce(totalOrders, 0) as totalOrders,
  coalesce(droppedOff, 0) as droppedOff
FROM cumOrdersByDay 
RIGHT JOIN lastNdays ON cumOrdersByDay.day = lastNdays.day