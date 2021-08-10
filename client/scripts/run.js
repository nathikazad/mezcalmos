const { execSync } = require('child_process');

var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
if (argv.command == "deploy") {
  let fullCommand;
  let mode = ""

  if (argv.mode == "test") {
    mode = "--mode staging"
  }
  if (argv.app == "taxis" || argv.app == "all") {
    fullCommand = `vue-cli-service build ${mode} --dest ../dist/taxis src/taxis/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "admin" || argv.app == "all") {
    fullCommand = `vue-cli-service build ${mode} --dest ../dist/admin src/admin/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "customers" || argv.app == "all") {
    fullCommand = `npx vue-cli-service build ${mode} --dest ../dist/customers src/customers/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }

  if (argv.mode == "test") {
    fullCommand = "firebase use mezcalmos-staging"
  } else {
    fullCommand = "firebase use mezcalmos-31f1c"
  }
  execSync(fullCommand, { stdio: [0, 1, 2] });

  if (argv.app == "all") {
    fullCommand = `firebase deploy --only hosting:taxis,hosting:customers,hosting:admin`
  } else {
    fullCommand = `firebase deploy --only hosting:${argv.app}`
  }
  execSync(fullCommand, {stdio:[0, 1, 2]});
}