const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");


let currentDate = null
async function main() {
  let pool = []
  let orders = (await firebase.database().ref(`/orders`).once('value')).val();

  for(let orderId in orders.taxi){
    let order = orders.taxi[orderId]
    if(order.status == "droppedOff") {
      var datetime = new Date(order.orderTime);
      let date = datetime.toLocaleString().split(", ")[0]
      let time = datetime.toLocaleString().split(", ")[1]
      if(date != currentDate){
        console.log(date)
        currentDate = date
      }
      console.log(`  ${time} ${order.driver.name} ${order.customer.name}`)// ${order.customer.id}`)
    }
  } 
  process.exit()   
}

main()