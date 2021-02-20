const { execSync } = require('child_process');

var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
if (argv.command == "deploy") {
  let fullCommand;
  let mode = ""
  let destSuffix = ""
  if (argv.mode == "test"){
    mode = "--mode test"
    destSuffix = "Test"
  }
  if (argv.app == "taxis" || argv.app == "all") {
    fullCommand = `vue-cli-service build ${mode} --dest ../dist/taxis${destSuffix} src/taxis/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "admin" || argv.app == "all") {
    fullCommand = `vue-cli-service build ${mode} --dest ../dist/admin${destSuffix} src/admin/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "customers" || argv.app == "all") {
    fullCommand = `npx vue-cli-service build ${mode} --dest ../dist/customers${destSuffix} src/customers/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "all") {
    fullCommand = `firebase deploy --only hosting:taxis${destSuffix},hosting:customers${destSuffix},hosting:admin${destSuffix}`
  } else {
    fullCommand = `firebase deploy --only hosting:${argv.app}${destSuffix}`
  }
  execSync(fullCommand, {stdio:[0, 1, 2]});
}