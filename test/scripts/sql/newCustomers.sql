WITH monthDays AS (
SELECT * FROM generate_series(

'2021-09-01'::date AT TIME ZONE 'CDT',

'2021-09-01'::date AT TIME ZONE 'CDT' + interval '1 month',

'1 day') AS day),

firstDayForCustomers AS(SELECT 
min("orderTime" AT TIME ZONE 'CDT') AS firstDay,
"customerId" AS customer
FROM orders
GROUP BY customer
),
newCustomersForOneMonth AS(SELECT
 firstDay as day,
 customer
 FROM firstDayForCustomers WHERE(firstDay > '2021-09-01'::date AND firstDay < '2021-09-01'::date + interval '1 month')
 GROUP BY customer, firstDay
),


newCustomersByDay AS (
SELECT 
CAST(day AS date) as day,
CAST(count(*) AS INTEGER) AS numOfNewCustomers
FROM newCustomersForOneMonth
GROUP BY 1)

SELECT 
  CAST(EXTRACT(day FROM monthDays.day) AS INTEGER) AS day,
  coalesce(numOfNewCustomers, 0) as totalRead
FROM newCustomersByDay
RIGHT JOIN monthDays ON CAST(newCustomersByDay.day AS date) = CAST(monthDays.day AS date)
ORDER BY 1