WITH firstMonthOfUsers AS (
  SELECT 
    min(extract(month FROM "orderTime")) as firstMonth, 
    "customerId"
  FROM orders 
  GROUP BY "customerId"),

newUsersPerMonth AS (SELECT 
  firstMonth as month,
  count(*) as total
FROM firstMonthOfUsers
GROUP BY firstMonth),

totalUsersPerMonth AS (SELECT 
  extract(month FROM "orderTime") as month,
  count(DISTINCT "customerId") as total
FROM orders o
GROUP BY month)


SELECT 
  TO_CHAR(TO_DATE(t.month::text, 'MM'), 'Month') as month,
  t.total as total,
  n.total as newUsers
FROM totalUsersPerMonth t
JOIN newUsersPerMonth n
  ON t.month = n.month
