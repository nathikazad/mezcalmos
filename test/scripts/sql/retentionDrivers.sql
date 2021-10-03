WITH visit_log AS(
SELECT 
	"driverId" as userid,
	(DATE_PART('month', "orderTime"::date)-DATE_PART('month', '2021-01-01'::date)+(DATE_PART('year', "orderTime"::date) - 2021)*12) AS visit_month 
FROM
	orders
WHERE 
  "orderTime" > '2021-06-01'
GROUP BY 1,2
ORDER BY 1,2),


visit_tracker AS(
SELECT 
	"driverId" as userid,
	(DATE_PART('month', "orderTime"::date)-DATE_PART('month', '2021-01-01'::date)+(DATE_PART('year', "orderTime"::date) - 2021)*12) AS visit_month 
FROM
	orders
WHERE 
  "orderTime" > '2021-06-01'
GROUP BY 1,2
ORDER BY 1,2),


first_visit AS
    (SELECT userid,
           min(visit_month) AS first_month
    FROM visit_log
    GROUP BY 1),

New_users AS
    (SELECT first_month,
           count(DISTINCT userid) AS new_users
    FROM first_visit
    GROUP BY 1),

Ret_users AS 
	(SELECT 
			visit_log.userid,
			(visit_tracker.visit_month - visit_log.visit_month) AS retention_month
		FROM visit_log
              LEFT JOIN visit_log visit_tracker
                 ON visit_log.userid = visit_tracker.userid
                     AND visit_log.visit_month < visit_tracker.visit_month
		GROUP BY 1,2),

Cohort_Table AS
 (SELECT New_users.first_month,
		new_users,
		retention_month,
		Count(DISTINCT Ret_users.userid) AS retained,
		Count(DISTINCT Ret_users.userid)*100/new_users AS retention_percent
FROM first_visit
		LEFT JOIN Ret_users ON
			first_visit.userid = Ret_users.userid
		LEFT JOIN New_users
                 ON New_users.first_month = first_visit.first_month
GROUP BY 1,2,3
ORDER BY 1,3),

t as (SELECT 
	TO_CHAR(TO_DATE ((1+MOD(first_month::int,12))::text, 'MM'), 'Month') AS "month",
  2021+first_month::int/12  AS "year", 
  TO_CHAR(TO_DATE ((1+MOD(first_month::int+retention_month::int,12))::text, 'MM'), 'Month') AS "retention_month",
  new_users,
  retained,
  retention_percent
FROM Cohort_Table 
WHERE retention_percent < 100
ORDER BY 2,to_date(TO_CHAR(TO_DATE ((1+MOD(first_month::int,12))::text, 'MM'), 'Month'),'Month'))

select * from t;