import { Restaurant } from "../../restaurant/models/Restaurant";
import { NewRestaurantOrderNotification, NotificationType } from "../models/Notification";
import { OrderType } from "../models/Order";
import * as fcm from "../../utilities/senders/fcm"
import { DeliveryAdmin } from "../models/DeliveryAdmin";
import { notificationsNode } from "../databaseNodes/notifications";
import { ParticipantType } from "../models/Chat";
import { RestaurantOrderStatus } from "../../restaurant/models/RestaurantOrder";

export async function notifyDeliveryAdminsNewOrder(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string,
  restaurant: Restaurant) {
  let message: NewRestaurantOrderNotification = {
    time: (new Date()).toISOString(),
    notificationType: NotificationType.NewOrder,
    orderType: OrderType.Restaurant,
    orderId: orderId,
    restaurant: {
      name: restaurant.details.name,
      image: restaurant.details.photo
    }
  }
  let notificationTokens: Array<string> = [];
  for (let adminId in deliveryAdmins) {
    notificationsNode(ParticipantType.DeliveryAdmin, adminId).push(message)
    let admin: DeliveryAdmin = deliveryAdmins[adminId]
    if (admin.notificationInfo.deviceNotificationToken && admin.notificationInfo.deviceNotificationToken) {
      notificationTokens.push(admin.notificationInfo.deviceNotificationToken);
    }
  }
  let notification: fcm.Message = {
    token: notificationTokens,
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
  fcm.push(notification);
}

export async function notifyDeliveryAdminsCancelledOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {
  let update = {
    status: RestaurantOrderStatus.CancelledByCustomer,
    time: (new Date()).toISOString(),
    notificationType: "orderStatusChange",
    orderType: "restaurant",
    orderId: orderId,
  }
  let notificationTokens: Array<string> = [];
  for (let adminId in deliveryAdmins) {
    notificationsNode(ParticipantType.DeliveryAdmin, adminId).push(update)
    let admin: DeliveryAdmin = deliveryAdmins[adminId]
    if (admin.notificationInfo.deviceNotificationToken && admin.notificationInfo.deviceNotificationToken) {
      notificationTokens.push(admin.notificationInfo.deviceNotificationToken);
    }
  }
  let notification: fcm.Message = {
    token: notificationTokens,
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
  fcm.push(notification);
}