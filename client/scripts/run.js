const { execSync } = require('child_process');

var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
// console.log(argv._.length)

// export FIREBASE_DATABASE_EMULATOR_HOST="localhost:9000"
// export FIREBASE_AUTH_EMULATOR_HOST="localhost:9099"


if (argv.command == "emulate") {
  let fullCommand = "npx parallelshell \""
  let emulatorCommand = "firebase emulators:start ";
  if(argv.emulate == "all") {
    emulatorCommand += "--only functions,auth,database"
    emulatorCommand += ` --export-on-exit=test/newDummyData\" `
    emulatorCommand += "\"node test/loadData.js\" "
  } else if (argv.emulate == "onlyFunctions") {
    emulatorCommand += "--only functions\" "
  } else {
    console.log("Invalid emulate field "+argv.emulate+" can be all or onlyFunctions")
  }
  
  console.log(emulatorCommand)
  fullCommand += emulatorCommand
  let emulateModeSuffix = ""
  if (argv.emulate == "onlyFunctions") {
    emulateModeSuffix = "OnlyFunctions"
  }

  if (argv.app == "taxis" || argv.app == "all") {
    fullCommand += `\"vue-cli-service serve --mode emulate${emulateModeSuffix} --port 8081 src/taxis/main.js\" `
  }
  if (argv.app == "deliveries" || argv.app == "all") {
    fullCommand += `\"vue-cli-service serve --mode emulate${emulateModeSuffix} --port 8082 src/deliveries/main.js\" `
  }
  if (argv.app == "customers" || argv.app == "all") {
    fullCommand += `\"vue-cli-service serve --mode emulate${emulateModeSuffix} --port 8080 src/customers/main.js\" `
  }
  execSync(fullCommand, {stdio:[0, 1, 2]});
} else if (argv.command == "deploy") {
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
  if (argv.app == "deliveries" || argv.app == "all") {
    fullCommand = `vue-cli-service build ${mode} --dest ../dist/deliveries${destSuffix} src/deliveries/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "customers" || argv.app == "all") {
    fullCommand = `npx vue-cli-service build ${mode} --dest ../dist/customers${destSuffix} src/customers/main.js`
    execSync(fullCommand, {stdio:[0, 1, 2]});
  }
  if (argv.app == "all") {
    fullCommand = `firebase deploy --only hosting:taxis${destSuffix},hosting:customers${destSuffix},hosting:deliveries${destSuffix}`
  } else {
    fullCommand = `firebase deploy --only hosting:${argv.app}${destSuffix}`
  }
  execSync(fullCommand, {stdio:[0, 1, 2]});
}