WITH monthDays AS (
SELECT * FROM generate_series(

'2021-09-01'::date AT TIME ZONE 'CDT',

'2021-09-01'::date AT TIME ZONE 'CDT' + interval '1 month',

'1 day') AS day),

driversSentByDay AS(SELECT
    distinct on ("driverId", EXTRACT(day FROM "sentTime" AT TIME ZONE 'CDT'))
    EXTRACT(day FROM "sentTime" AT TIME ZONE 'CDT') as day,
    "driverId"
    FROM notifications
    WHERE ("sentTime" > '2021-09-01'::date AT TIME ZONE 'CDT' AND "sentTime" < '2021-09-01'::date AT TIME ZONE 'CDT'+ interval '1 month')
    GROUP BY 1,2),


driversReceivedByDay AS(SELECT distinct on ("driverId", EXTRACT(day FROM "receivedTime" AT TIME ZONE 'CDT'))
    EXTRACT(day FROM "receivedTime" AT TIME ZONE 'CDT') as day,
    "driverId"
    FROM notifications
    WHERE ("receivedTime" > '2021-09-01'::date AT TIME ZONE 'CDT' AND "receivedTime" < '2021-09-01'::date AT TIME ZONE 'CDT' + interval '1 month')
    GROUP BY 1,2),

driversReadByDay AS(SELECT distinct on ("driverId", EXTRACT(day FROM "readTime" AT TIME ZONE 'CDT'))
    EXTRACT(day FROM "readTime" AT TIME ZONE 'CDT') as day,
    "driverId"
    FROM notifications
    WHERE ("readTime" > '2021-09-01'::date AND "readTime" AT TIME ZONE 'CDT' < '2021-09-01'::date AT TIME ZONE 'CDT' + interval '1 month')
    GROUP BY 1,2),


driverStatusByDay AS (SELECT 
  s.day,
  s."driverId",
  CASE WHEN r.day IS NOT NULL THEN true
       ELSE false END AS "received",
  CASE WHEN o.day IS NOT NULL THEN true
      ELSE false END AS "read"
  
FROM driversSentByDay s
LEFT JOIN driversReceivedByDay r 
ON s.day = r.day AND s."driverId" = r."driverId"
LEFT JOIN driversReadByDay o
ON s.day = o.day AND s."driverId" = o."driverId"),

uniqueNotifications AS (SELECT 
    day,
    count(*) as uniqueSent,
    count(*) filter (where "received" = true) as uniqueReceived,
    count(*) filter (where "read" = true) as uniqueRead,
    CAST( (count(*) filter (where received = true) * 100 / count(*)) AS INTEGER ) AS uniqueReceivedPercentage,
    CAST( (count(*) filter (where read = true) * 100 / count(*)) AS INTEGER ) AS uniqueReadPercentage
FROM driverStatusByDay
GROUP BY 1),

totalNotifications AS(SELECT 
    EXTRACT(day FROM "sentTime") as day,
    count("sentTime") AS "sent",
    count("receivedTime") AS received,
    count("readTime") AS "read",
    count("receivedTime")*100/count("sentTime") AS receivedPercentage,
    count("readTime")*100/count("sentTime") AS readPercentage
FROM notifications
WHERE ("sentTime" > '2021-09-01'::date AND "sentTime" < '2021-09-01'::date + interval '1 month')
GROUP BY day)

SELECT
    EXTRACT(day FROM m.day) as day,
    coalesce(u.uniqueSent, 0) as uniqueSent,
    coalesce(u.uniqueReceived, 0) as uniqueReceived,
    coalesce(u.uniqueRead, 0) as uniqueRead,
    coalesce(t.sent, 0) as sent,
    coalesce(t.received, 0) as received,
    coalesce(t.read, 0) as read,
    coalesce(t.receivedPercentage, 0) as receivedPercentage,
    coalesce(t.readPercentage, 0) as readPercentage,
    coalesce(u.uniqueReceivedPercentage, 0) as uniqueReceivedPercentage,
    coalesce(u.uniqueReadPercentage, 0) as uniqueReadPercentage
FROM uniqueNotifications u
JOIN totalNotifications t
ON u.day = t.day
RIGHT JOIN monthDays m
ON t.day = EXTRACT(day FROM m.day)
ORDER BY 1



