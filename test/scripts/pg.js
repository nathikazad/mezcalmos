const { Client } = require('pg')

const client = new Client({
  user: 'xqzmxaqcsacvjl',
  host: 'ec2-35-173-94-156.compute-1.amazonaws.com',
  database: 'd3r4algidqrk00',
  password: 'b4501d713f0caa3bd0efa49721d000dc739260dc314a7c9db176f89439c4e59a',
  port: 5432,
  ssl: {
    rejectUnauthorized: false
  }
})
client.connect()


// client.query(`SELECT date("orderTime"), count(*) as totalOrders, 
// count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS droppedOff,
// count(*) FILTER (WHERE "finalStatus" = 'expired') AS expired,
// count(*) FILTER (WHERE "finalStatus" = 'cancelled') AS cancelled,
// count(*) FILTER (WHERE "finalStatus" = 'droppedOff')*100/count(*) as fulfillmentRatio
// FROM orders 
// GROUP BY date("orderTime") 
// ORDER BY date("orderTime") ASC`, (err, res) => {
//   if (err)
//     console.log(err)
//   else
//     console.log(res.rows)
//   client.end()
// })


// client.query(`SELECT extract(month from "orderTime") as month, 
// count(*) as totalOrders, 
// count(*) FILTER (WHERE "finalStatus" = 'droppedOff') AS droppedOff,
// count(*) FILTER (WHERE "finalStatus" = 'expired') AS expired,
// count(*) FILTER (WHERE "finalStatus" = 'cancelled') AS cancelled,
// count(*) FILTER (WHERE "finalStatus" = 'droppedOff')*100/count(*) as fulfillmentRatio
// FROM orders 
// GROUP BY month 
// ORDER BY month ASC`, (err, res) => {
//   if (err)
//     console.log(err)
//   else
//     console.log(res.rows)
//   client.end()
// })

client.query(`SELECT extract(month from "orderTime") as month, 
count(distinct "driverId") as drivers
FROM orders 
GROUP BY month 
ORDER BY month ASC`, (err, res) => {
  if (err)
    console.log(err)
  else
    console.log(res.rows)
  client.end()
})

// WHERE ("orders"."updated_at" ) BETWEEN '2012-10-17 00:00:00.000000' AND '2012-11-07     12:25:04.082224'
