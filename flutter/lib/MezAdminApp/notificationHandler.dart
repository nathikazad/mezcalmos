import 'package:flutter/material.dart' as mat;
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["MezAdmin"]["notificationHandler"];
//

Notification mezAdminNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();

  mezDbgPrint("👋 new notification 👋\n ${value['orderType']}");

  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.NewOrder:
      return Notification(
          id: key,
          notifWidget: (value['orderType'].toString().toOrderType() ==
                  OrderType.Restaurant)
              ? mat.CircleAvatar(
                  radius: 23,
                  backgroundColor: secondaryLightBlueColor,
                  child: mat.Icon(
                    mat.Icons.flatware,
                    color: primaryBlueColor,
                  ),
                )
              : mat.CircleAvatar(),
          linkUrl: getLinkUrl(value['orderType'].toString().toOrderType(),
              value['orderId']), // needs to be changed, need to add laundry
          body: "${_i18n()['newOrderBody']}", // needs to be changed
          imgUrl: null, // needs to be changed
          title: "${_i18n()['newOrderTitle']}",
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
        imgUrl: null, // needs to be changed
        notifWidget: _getRestaurantOrderIcon(value),
        linkUrl: getLinkUrl(
            value['orderType'].toString().toOrderType(), value['orderId']),
        notificationType: NotificationType.OrderStatusChange,
        notificationAction:
            (value["notificationAction"] as String).toNotificationAction(),
        title: 'Order status change',
      );
    default:
      return null;
  }
}

mat.Widget _getRestaurantOrderIcon(value) {
  final RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  switch (newOrdersStatus) {
    case RestaurantOrderStatus.OrderReceived:
      return mat.CircleAvatar(
        radius: 23,
        backgroundColor: secondaryLightBlueColor,
        child: mat.Icon(
          mat.Icons.flatware,
          color: primaryBlueColor,
        ),
      );
    case RestaurantOrderStatus.Ready:
      return mat.CircleAvatar(
        radius: 23,
        backgroundColor: secondaryLightBlueColor,
        child: mat.Icon(
          mat.Icons.check_box_outlined,
          color: primaryBlueColor,
        ),
      );
    case RestaurantOrderStatus.Preparing:
      return mat.CircleAvatar(
        radius: 23,
        backgroundColor: mat.Colors.orange.shade200,
        child: mat.Icon(
          mat.Icons.ramen_dining,
          color: mat.Colors.orange,
        ),
      );
    case RestaurantOrderStatus.Delivered:
      return mat.CircleAvatar(
        radius: 23,
        backgroundColor: secondaryLightBlueColor,
        child: mat.Icon(
          mat.Icons.check,
          color: primaryBlueColor,
        ),
      );
    case RestaurantOrderStatus.CancelledByAdmin:
    case RestaurantOrderStatus.CancelledByCustomer:
      return mat.CircleAvatar(
        radius: 23,
        backgroundColor: offRedColor,
        child: mat.Icon(
          mat.Icons.close,
          color: mat.Colors.red,
        ),
      );
    case RestaurantOrderStatus.OnTheWay:
      return mat.CircleAvatar(
        radius: 23,
        backgroundColor: secondaryLightBlueColor,
        child: mat.Icon(
          mat.Icons.delivery_dining,
          color: primaryBlueColor,
        ),
      );
  }
}

String getLinkUrl(OrderType orderType, int orderId) {
  switch (orderType) {
    case OrderType.Laundry:
      return DeliveryAppRoutes.getLaundryOrderRoute(orderId);
    case OrderType.Restaurant:
      return DeliveryAppRoutes.getRestaurantOrderRoute(orderId);
    default:
      return SharedRoutes.kHomeRoute;
  }
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ??
          SharedRoutes.getMessagesRoute(
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
