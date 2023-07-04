
// import { startWatchingTaxiOrders } from "./taxiOrdersWatcher";
import { startWatchingMessageNotificationQueue } from "./messagesNotifier";
import { startWatchingRestaurantOrders } from "./restaurantOrdersWatcher";
import { startWatchingDeliveryOrders } from "./deliveryOrdersWatcher";
import { startWatchingLaundryOrders } from "./laundryOrdersWatcher";
import { initEnv} from "./init"


initEnv();
startWatchingMessageNotificationQueue();
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
