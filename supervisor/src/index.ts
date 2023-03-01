import * as firebase from "firebase-admin";
import { Keys } from "../../functions/src/shared/models/Generic/Keys";
import { setKeys } from "../../functions/src/shared/keys";
import * as functions from "firebase-functions";
import * as fs from 'fs';
// import { startWatchingTaxiOrders } from "./taxiOrdersWatcher";
import { startWatchingMessageNotificationQueue } from "./messagesNotifier";
import { startWatchingRestaurantOrders } from "./restaurantOrdersWatcher";
import { startWatchingDeliveryOrders } from "./deliveryOrdersWatcher";
import { startWatchingLaundryOrders } from "./laundryOrdersWatcher";

enum Environment {
  Emulate = "emulate",
  Staging = "staging",
  Production = "production"
}

let keys: Record<Environment, Keys> = <Record<Environment, Keys>>functions.config()

if (Object.keys(keys).length == 0) {
  if (process.env.MEZC_API_KEYS) {
    keys = <Record<Environment, Keys>>JSON.parse(fs.readFileSync(process.env.MEZC_API_KEYS, 'utf8'));
  } else {
    console.log("No environment keys or MEZC_API_KEYS file defined")
  }
}

if (process.argv.length != 3) {
  console.log("Required environment variable")
  process.exit()
}

const env: Environment = <Environment>process.argv[2]
process.env.supervisor_environment = env;

if(env == Environment.Emulate)
  process.env.FUNCTIONS_EMULATOR = "true"

if (env != Environment.Emulate && env != Environment.Staging && env != Environment.Production) {
  console.log("Invalid environment has to be emulate, staging or production")
  process.exit()
}

if (!keys[env].databaseURL) {
  console.log("db url not defined")
  process.exit()
}

if (!keys[env].serviceAccount && (env == Environment.Staging || env == Environment.Production)) {
  console.log("Service account key not defined")
  process.exit()
}

let firebaseParams: any = { databaseURL: keys[env].databaseURL };
// console.log(keys, env, keys[env].serviceAccount)
if (keys[env].serviceAccount)
  firebaseParams.credential = firebase.credential.cert(require(keys[env].serviceAccount!))
  // console.log(firebaseParams)
firebase.initializeApp(firebaseParams)
// const hasura = new hasuraClass.Hasura(keys[env].hasura)
setKeys(keys[env]);

startWatchingMessageNotificationQueue(keys[env]);
// startWatchingTaxiOrders(constructReturnUrl);
startWatchingDeliveryOrders();
startWatchingRestaurantOrders();
startWatchingLaundryOrders();
/****************************  Some Helper Functions *************************************/
// function constructReturnUrl(orderId: string) {
//   let url;
//   let dbName;
//   if (env == "emulate") {
//     url = "http://" + getIPAddress() + ":9000"
//     dbName = "mezcalmos-31f1c-default-rtdb"
//   } else {
//     url = keys[env].databaseURL
//     dbName = keys[env].databaseURL!.split('.')[0].split('/')[2]
//   }
//   return `${url}/orders/open/taxi/${orderId}/notificationStatus/<driverId>/received.json?ns=${dbName}`
// }

// function getIPAddress() {
//   var interfaces = require('os').networkInterfaces();
//   for (var devName in interfaces) {
//     var iface = interfaces[devName];

//     for (var i = 0; i < iface.length; i++) {
//       var alias = iface[i];
//       if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal)
//         return alias.address;
//     }
//   }
//   return '0.0.0.0';
// }
