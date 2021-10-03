const { Client } = require('pg')
const fs = require('fs');

const prodClient = new Client({
  user: 'gswxnnbineecam',
  host: 'ec2-3-217-219-146.compute-1.amazonaws.com',
  database: 'd3nurnhq69kcf6',
  password: '19d49c2e7ef98a532b2760ccf419007e499a84410f38fa2f57e8498a0adae853',
  port: 5432,
  ssl: {
    rejectUnauthorized: false
  }
})

const testClient = new Client({
  user: 'eaifyzkxpnbafv',
  host: 'ec2-44-196-170-156.compute-1.amazonaws.com',
  database: 'd6i9ej0gihqpgl',
  password: 'f4a44cbadd71d2d34c50939036d60534481eaa8c36201fa32c4f33d6ac0b3d08',
  port: 5432,
  ssl: {
    rejectUnauthorized: false
  }
})


if (process.argv.length != 4) {
  console.log("Required sql file name and database");
  process.exit()
}

if (process.argv[2] != "prod" && process.argv[2] != "test") {
  console.log("db can be only prod or test");
  process.exit()
}

let client;
if (process.argv[2] == "prod") {
  client = prodClient
}

if (process.argv[2] == "test") {
  client = testClient
}

client.connect()

let query = fs.readFileSync(`sql/${process.argv[3]}.sql`, 'utf8');
client.query(query, (err, res) => {
  if (err)
    console.log(err)
  else
    console.log(res.rows)
  client.end()
})

// WHERE ("orders"."updated_at" ) BETWEEN '2012-10-17 00:00:00.000000' AND '2012-11-07     12:25:04.082224'
