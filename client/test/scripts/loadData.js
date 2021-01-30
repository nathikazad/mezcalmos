var http = require('http');
const {loadData} = require("../functions/loadData")
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
//console.log("Load Data: Starting Up")
//add the export commands and see if it affects only functions mode
