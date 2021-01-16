const puppeteer = require('puppeteer');
const fs = require('fs');
const axios = require('axios');

async function createUser(user) {
  while(true) {
    try{
      const browser = await puppeteer.launch();
      // const browser = await puppeteer.launch({headless:false});
      const page = await browser.newPage();
      await page.goto('http://localhost:8080/');
      page.evaluate(_ => {
        document.getElementsByTagName('a')[0].__vue__.$store._actions["login"][0]()
      });

      const newPagePromise = new Promise(x => browser.once('targetcreated', target => x(target.page()))); 
      const popup = await newPagePromise;
      await popup.waitForSelector('#add-account-button button')
      await popup.waitForTimeout(2000)
      await popup.click('#add-account-button button')
      await popup.waitForTimeout(2000)
      await popup.waitForSelector('#autogen-button')
      await popup.click('#autogen-button')
  
      // await popup.waitForTimeout(500)
      await popup.evaluate((user) => {
        console.log(user)
        if(user.displayName) {
          document.getElementById("display-name-input").value = user.displayName
          document.getElementById("screen-name-input").value = user.displayName
        }
        if(user.email) {
          document.getElementById("email-input").value = user.email
        }
        let photo = "http://www.gravatar.com/avatar/?d=robohash"
        if(user.photo){
          photo = user.photo
        }
        document.getElementById("profile-photo-input").value = photo
      }, user)
      await popup.click('#sign-in')
      await popup.waitForTimeout(2000)
      // await browser.waitForTarget(() => false)
      await browser.close();
      break;
    } catch(e) {
      console.log("Create user error, trying again")
    }
  }
}

async function loadData(){
  let rawData = fs.readFileSync('test/dummyData/database_export/mezcalmos-31f1c-default-rtdb.json', "utf8")
  let data = JSON.parse(rawData)
  let oldUsers = {}
  for (let key in data.users) {
    await createUser(data.users[key].info)
    oldUsers[data.users[key].info.email] = key
  }
  const admin = require("firebase-admin");
  let app = admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
  let userList = await admin.auth().listUsers(100)
  let newUsers = {}
  userList.users.forEach((userRecord) => {
    newUsers[userRecord.email] = userRecord.uid
  });
  for(let email in oldUsers){
    rawData = rawData.replace(new RegExp(oldUsers[email],"g"), newUsers[email])
  }
  data = JSON.parse(rawData)
  
  
  axios.put("http://localhost:9000/.json?ns=mezcalmos-31f1c-default-rtdb", data)
  // app.delete();
  console.log("\nLoad Data: Finished")
}

function checkIfWebsiteIsUp(){
  var http = require('http');
  http.get('http://localhost:4000/', function (res) {
    http.get('http://localhost:8080/', function (res) {
      console.log("Load Data: Emulator and  Customer Website are up, starting to write data")
      loadData()
    }).on('error', function(e) {
      console.log("Load Data: Customer Website @ 8080 is not up yet")
      setTimeout( checkIfWebsiteIsUp, 10000)
    });;
  }).on('error', function(e) {
    console.log("Load Data: Emulator is not up yet")
    setTimeout( checkIfWebsiteIsUp, 10000)
  });
}

checkIfWebsiteIsUp()
console.log("Load Data: Starting Up")
//add the export commands and see if it affects only functions mode