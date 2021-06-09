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
    for(let orderId in driver.orders) {
      let order = driver.orders[orderId]
      // let rideStartTime = 
      if (order.status == "droppedOff") {
        total += 1
      }
      
      // console.log('\t '+driver.orders[orderId].acceptRideTime)
      // console.log('\t '+driver.orders[orderId].customer.name)
      // console.log('\t '+driver.orders[orderId].status)
    }
    let displayName = users[driverId].info.displayName
    if(total && displayName != "Alejandro Valle" 
    && displayName != "Prueba Valle "
    && displayName != "Nathik Azad"
    && displayName != "Magalí Ramirez") {
      pool.push({nombre:displayName, total: total, id:driverId})
    }
  }
  pool = pool.sort((a, b) => b.total - a.total);
  for(let i in pool) {
    console.log(`${parseInt(i)+1}. ${pool[i].nombre}   ${pool[i].total}  ${pool[i].id}`)
  }
  // console.log(pool)
  process.exit()
}

main()

