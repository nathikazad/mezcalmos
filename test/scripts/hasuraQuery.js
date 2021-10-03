const { gql, GraphQLClient } = require('graphql-request')
const fs = require('fs');

hasura = {
  "url": "https://testing-mezc.hasura.app/v1/graphql",
  "key": "rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN"
}
client = new GraphQLClient(
  hasura.url,
  {
    headers: {
      'x-hasura-admin-secret': hasura.key
    }
  }
);

if (process.argv.length != 4 && process.argv.length != 5) {
  console.log("Required gql file name and database and params");
  process.exit()
}

if (process.argv[2] != "prod" && process.argv[2] != "test") {
  console.log("db can be only prod or test");
  process.exit()
}


let query = fs.readFileSync(`gql/${process.argv[3]}.gql`, 'utf8');
let params = {}
if (process.argv.length == 5)
  params = JSON.parse(fs.readFileSync(`gql/${process.argv[4]}.json`, 'utf8'));
const gqlQuery = gql`${query}`

//   try {
async function main() {
  const result = await this.client.request(gqlQuery, params)
  console.log(result)
}
main()
