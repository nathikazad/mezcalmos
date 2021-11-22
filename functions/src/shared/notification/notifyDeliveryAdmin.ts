import { Restaurant } from "../../restaurant/models/Restaurant";
import { NewRestaurantOrderNotification, NotificationType, OrderNotification, OrderStatusChangeNotification } from "../models/Notification";
import { OrderType } from "../models/Order";
import * as fcm from "../../utilities/senders/fcm"
import { DeliveryAdmin } from "../models/DeliveryAdmin";

import { ParticipantType } from "../models/Chat";
import { RestaurantOrderStatus } from "../../restaurant/models/RestaurantOrder";
import * as foreground from "../../utilities/senders/foreground";

export async function notifyDeliveryAdminsNewOrder(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string,
  restaurant: Restaurant) {
  let foregroundNotificaiton: NewRestaurantOrderNotification = {
    time: (new Date()).toISOString(),
    notificationType: NotificationType.NewOrder,
    orderType: OrderType.Restaurant,
    orderId: orderId,
    restaurant: {
      name: restaurant.details.name,
      image: restaurant.details.photo
    }
  }

  let fcmNotification: fcm.fcmPayload = {
    token: [],
    payload: {
      notification: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`,
        tag: NotificationType.NewOrder
      }
    },
    options: {
      priority: fcm.NotificationPriority.High
    }
  };
  notifyDeliveryAdmins(deliveryAdmins, foregroundNotificaiton, fcmNotification);
}

export async function notifyDeliveryAdminsCancelledOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {
  let foregroundNotificaiton: OrderStatusChangeNotification = {
    status: RestaurantOrderStatus.CancelledByCustomer,
    time: (new Date()).toISOString(),
    notificationType: NotificationType.OrderStatusChange,
    orderType: OrderType.Restaurant,
    orderId: orderId,
  }

  let fcmNotification: fcm.fcmPayload = {
    token: [],
    payload: {
      notification: {
        title: "Pedido Cancellado",
        body: `Hay un pedido que es cancelado`,
        tag: NotificationType.OrderStatusChange
      }
    },
    options: {
      priority: fcm.NotificationPriority.High
    }
  };
  notifyDeliveryAdmins(deliveryAdmins, foregroundNotificaiton, fcmNotification);
}

async function notifyDeliveryAdmins(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  foregroundNotificaiton: OrderNotification,
  fcmNotification: fcm.fcmPayload) {
  let notificationTokens: Array<string> = [];
  for (let adminId in deliveryAdmins) {
    let payload: foreground.fgPayload = {
      particpantType: ParticipantType.DeliveryAdmin,
      userId: adminId,
      notification: foregroundNotificaiton
    }
    foreground.push(payload)
    let admin: DeliveryAdmin = deliveryAdmins[adminId]
    if (admin.notificationInfo.deviceNotificationToken && admin.notificationInfo.deviceNotificationToken) {
      notificationTokens.push(admin.notificationInfo.deviceNotificationToken);
    }
  }
  fcmNotification.token = notificationTokens;
  fcm.push(fcmNotification);
}