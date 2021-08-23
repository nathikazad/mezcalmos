const { Client } = require('pg')
const fs = require('fs');

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
if (process.argv.length != 3) {
  console.log("Required sql file name");
  process.exit()
}
let query = fs.readFileSync(`sql/${process.argv[2]}.sql`, 'utf8');
client.query(query, (err, res) => {
  if (err)
    console.log(err)
  else
    console.log(res.rows)
  client.end()
})

// WHERE ("orders"."updated_at" ) BETWEEN '2012-10-17 00:00:00.000000' AND '2012-11-07     12:25:04.082224'
