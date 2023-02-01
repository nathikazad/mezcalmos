import 'package:flutter/material.dart' as mat;
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

Notification mezAdminNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();

  mezDbgPrint("👋 new notification 👋\n $value");

  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.NewOrder:
      return Notification(
          id: key,
          icon:
              (value['orderType'].toString().toOrderType() == OrderType.Laundry)
                  ? mat.Icons.local_laundry_service
                  : mat.Icons.flatware,
          linkUrl: getLinkUrl(value['orderType'].toString().toOrderType(),
              value['orderId']), // needs to be changed, need to add laundry
          body: 'You got new order', // needs to be changed
          imgUrl:
              'assets/images/shared/notifications/onTheWay.png', // needs to be changed
          title: 'New order',
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.OrderStatusChange:
      return _orderStatusChangesHandler(key, value)!;

    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification? _orderStatusChangesHandler(key, value) {
  switch (value['orderType'].toString().toOrderType()) {
    case OrderType.Restaurant:
      return Notification(
        id: key,
        timestamp: DateTime.parse(value['time']),
        icon: (value['orderType'].toString().toOrderType() == OrderType.Laundry)
            ? mat.Icons.local_laundry_service
            : mat.Icons.flatware,
        body: 'New status', // needs to be changed
        imgUrl:
            'assets/images/shared/notifications/onTheWay.png', // needs to be changed

        linkUrl: getLinkUrl(
            value['orderType'].toString().toOrderType(), value['orderId']),
        notificationType: NotificationType.OrderStatusChange,
        notificationAction:
            (value["notificationAction"] as String).toNotificationAction(),
        title: 'Order status change',
      );
    case OrderType.Laundry:
      return Notification(
        id: key,
        timestamp: DateTime.parse(value['time']),
        icon: (value['orderType'].toString().toOrderType() == OrderType.Laundry)
            ? mat.Icons.local_laundry_service
            : mat.Icons.flatware,
        body: 'New status', // needs to be changed
        imgUrl:
            'assets/images/shared/notifications/onTheWay.png', // needs to be changed

        linkUrl: getLinkUrl(
            value['orderType'].toString().toOrderType(), value['orderId']),
        notificationType: NotificationType.OrderStatusChange,
        notificationAction:
            (value["notificationAction"] as String).toNotificationAction(),
        title: 'Order status change',
      );
  }
  return null;
}

String getLinkUrl(OrderType orderType, int orderId) {
  switch (orderType) {
    case OrderType.Laundry:
      return getLaundryOrderRoute(orderId);
    case OrderType.Restaurant:
      return getRestaurantOrderRoute(orderId);
    default:
      return kHomeRoute;
  }
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ??
          getMessagesRoute(
              chatId: value["chatId"],
              orderId: value["orderId"],
              recipientType: value["sender"]["particpantType"]
                  .toString()
                  .toParticipantType()),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
