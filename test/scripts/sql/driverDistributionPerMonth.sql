WITH firstMonthDrivers AS (SELECT
  min(extract(month from "orderTime")) AS firstMonth,
  "driverId" 
  FROM orders
  GROUP BY "driverId"
),

newDriversPerMOnth AS (SELECT 
firstMonth AS month,
count (*) AS totalNewDrivers
FROM firstMonthDrivers
GROUP BY month
),

allDriversPerMonth AS (SELECT
extract(month FROM "orderTime") AS month,
count(DISTINCT "driverId") AS totalDrivers
FROM orders
GROUP BY month
)

SELECT TO_CHAR(TO_DATE(t.month::text, 'MM'), 'Month') AS month,
t.totalDrivers AS totalDrivers,
n.totalNewDrivers AS newDrivers
FROM  allDriversPerMonth t
JOIN newDriversPerMOnth n ON t.month = n.month        

