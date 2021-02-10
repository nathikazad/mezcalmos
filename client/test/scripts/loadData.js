var http = require('http');
const fs = require('fs');
const axios = require('axios');
const admin = require("firebase-admin");
const puppeteer = require('puppeteer');
const CustomerApp = require("../classes/customerApp")

function checkIfWebsiteIsUp(){
  http.get('http://localhost:4000/', function (res) {
    http.get('http://localhost:8080/', function (res) {
      console.log("Load Data: Emulator and  Customer Website are up, starting to write data")
      
      if(process.argv.length == 3) {
        dataFolderName = `../data/${process.argv[2]}`
        loadData(dataFolderName)
      } else {
        loadData()
      }
      
    }).on('error', function(e) {
      console.log("Load Data: Customer Website @ 8080 is not up yet")
      setTimeout( checkIfWebsiteIsUp, 10000)
    });;
  }).on('error', function (e) {
    //console.log("Load Data: Emulator is not up yet")
    setTimeout(checkIfWebsiteIsUp, 10000)
  });
}

checkIfWebsiteIsUp()
console.log("Load Data: Starting Up")

async function loadData(dataFolderName = "dummyData"){
  //clear DB
  await axios.put("http://localhost:9000/.json?ns=mezcalmos-31f1c-default-rtdb", {})
  //clear Auth
  let app = admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
  let userList = await admin.auth().listUsers(100)
  userList.users.forEach((userRecord) => {
    admin.auth().deleteUser(userRecord.uid)
  });
  // Get test data
  let rawData = fs.readFileSync(`test/data/${dataFolderName}/database_export/mezcalmos-31f1c-default-rtdb.json`, "utf8")
  let data = JSON.parse(rawData)
  // Create Users
  let oldUsers = {}
  const browser = await puppeteer.launch();
  for (let key in data.users) {
    await createUser(data.users[key].info)
    oldUsers[data.users[key].info.email] = key
  }
  await browser.close();
  // Get new users
  userList = await admin.auth().listUsers(100)
  let newUsers = {}
  userList.users.forEach((userRecord) => {
    newUsers[userRecord.email] = userRecord.uid
  });
  // Add new users to data
  for(let email in oldUsers){
    rawData = rawData.replace(new RegExp(oldUsers[email],"g"), newUsers[email])
  }
  data = JSON.parse(rawData)
  
  // Write data
  axios.put("http://localhost:9000/.json?ns=mezcalmos-31f1c-default-rtdb", data)
  // app.delete();
  console.log("\nLoad Data: Finished")
}

async function createUser(browser, user) {
  // while(true) {
  //   try{
  
  // const browser = await puppeteer.launch({headless:false});
  let customerApp = new CustomerApp(browser)
  await customerApp.open()
  await customerApp.createUser(user)
  // await browser.waitForTarget(() => false)
      // break;
  //   } catch(e) {
  //     console.log("Create user error, trying again")
  //   }
  // }
}
