import { deliveryNewOrderMessage } from "../delivery/bgNotificationMessages";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getDeliveryDrivers } from "./graphql/delivery/driver/getDeliveryDriver";
import { getDeliveryOperators } from "./graphql/delivery/operator/getDeliveryOperator";
import { getMezAdmin } from "./graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "./models/Generic/Chat";
import { DeliveryOrder, DeliveryOperator, DeliveryDriver } from "./models/Generic/Delivery";
import { AuthorizationStatus } from "./models/Generic/Generic";
import { OrderType } from "./models/Generic/Order";
import { OrderNotification, NotificationType, NotificationAction, Notification } from "./models/Notification";

export async function isMezAdmin(userId: number): Promise<boolean> {
    try {
        await getMezAdmin(userId);
        return true;
    } catch(error) {
        return false;
    }
}

export async function notifyDeliveryPartner(deliveryOrder: DeliveryOrder, deliveryPartnerId: number, orderType: OrderType) {
    let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(deliveryPartnerId);
    let deliveryDrivers: DeliveryDriver[] = await getDeliveryDrivers(deliveryPartnerId);
  
    let notification: Notification = {
      foreground: <OrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: deliveryOrder.deliveryId
      },
      background: deliveryNewOrderMessage,
      linkUrl: '/'
    }
  
    deliveryOperators.forEach((d) => {
      pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.DeliveryOperator);
    });
    
    deliveryDrivers.filter((d) => (d.status == AuthorizationStatus.Authorized && d.online));
  
    if(deliveryDrivers.length > 10) {
      for(let i=0; i<10; i++) {
        for(let j=10; j<deliveryDrivers.length; j++) {
          if(!(deliveryDrivers[i].currentLocation)) {
            deliveryDrivers[i] = deliveryDrivers[j];
            continue;
          }
          if(!(deliveryDrivers[j].currentLocation))
            continue;
          
          let dist1 = distance(
            deliveryOrder.pickupLocation.lat, 
            deliveryOrder.pickupLocation.lng,
            deliveryDrivers[i].currentLocation!.lat,
            deliveryDrivers[i].currentLocation!.lng
          )
          let dist2 = distance(
            deliveryOrder.pickupLocation.lat, 
            deliveryOrder.pickupLocation.lng,
            deliveryDrivers[j].currentLocation!.lat,
            deliveryDrivers[j].currentLocation!.lng
          )
          if(dist1 > dist2) {
            let temp = deliveryDrivers[i];
            deliveryDrivers[i] = deliveryDrivers[j];
            deliveryDrivers[j] = temp;
          }
        }
      }
    }
    deliveryDrivers = deliveryDrivers.slice(0, 10);
    deliveryDrivers.forEach((d) => {
      pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.DeliveryDriver);
    });
  }
  
  function distance(lat1: number, lon1: number, lat2: number, lon2: number) {
      if ((lat1 == lat2) && (lon1 == lon2)) {
          return 0;
      }
      else {
          var radlat1 = Math.PI * lat1/180;
          var radlat2 = Math.PI * lat2/180;
          var theta = lon1-lon2;
          var radtheta = Math.PI * theta/180;
          var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
          if (dist > 1) {
              dist = 1;
          }
          dist = Math.acos(dist);
          dist = dist * 180/Math.PI;
          dist = dist * 60 * 1.1515;
          //unit is miles
          return dist;
      }
  }