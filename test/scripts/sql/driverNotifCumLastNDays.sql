WITH  lastNdays AS (
SELECT * FROM generate_series(

CURRENT_DATE - interval '15 Day',

CURRENT_DATE,

'1 day') AS day),


allNotifs AS (SELECT
"sentTime",
"readTime"
FROM notifications
WHERE ("driverId" = 'yKo3XqL3dEd78BVgzjNOvAxru723'
        AND "sentTime" > CURRENT_DATE - INTERVAL '15 day')
ORDER BY 1)
,

cumNotifsByDay AS (SELECT
 CAST( "sentTime" AT TIME ZONE 'CDT' AS date) as day,
 count(*) FILTER (WHERE "sentTime" IS NOT NULL) AS totalSent,
 count(*) FILTER (WHERE "readTime" IS NOT NULL) AS totalRead
 FROM allNotifs
 GROUP BY 1
)
 

SELECT 
  15 - EXTRACT(day from CURRENT_DATE - lastNdays.day) as day,
  SUBSTRING(CAST(lastNdays.day AS text) FROM 1 FOR 10),
  coalesce(totalSent, 0) as totalSent,
  coalesce(totalRead, 0) as totalRead
FROM cumNotifsByDay 
RIGHT JOIN lastNdays ON cumNotifsByDay.day = lastNdays.day