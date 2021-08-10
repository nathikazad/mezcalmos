const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");



async function main() {
  let pool = []
  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  let users = (await firebase.database().ref(`/users`).once('value')).val();
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    let total = 0;
    let customers = {}
    for(let orderId in driver.orders) {
      let order = driver.orders[orderId]

      let startTime = new Date("Mon, 2 Aug 2021 05:00:00 GMT")
      let endTime = new Date("Mon, 9 Aug 2021 05:00:00 GMT")
      let orderTime = new Date(order.acceptRideTime)
      if(orderTime > startTime && orderTime < endTime && order.status == "droppedOff"){
        if(!customers[order.customer.id]) {
          total += 1
        }
        customers[order.customer.id] = true
      }

      
        
      
      // console.log('\t '+driver.orders[orderId].acceptRideTime)
      // console.log('\t '+driver.orders[orderId].customer.name)
      // console.log('\t '+driver.orders[orderId].status)
    }
    let displayName = users[driverId].info.displayName
    if(total && displayName != "Alejandro Valle" 
    && displayName != "Prueba Valle "
    && displayName != "Nathik Azad") {
      pool.push({nombre:displayName, total: total, id:driverId})
    }
  }
  pool = pool.sort((a, b) => b.total - a.total);
  for(let i in pool) {
    console.log(`${parseInt(i)+1}. ${pool[i].nombre}   ${pool[i].total}`)//  ${pool[i].id}`)
  }
  // console.log(pool)
  process.exit()
}

main()

