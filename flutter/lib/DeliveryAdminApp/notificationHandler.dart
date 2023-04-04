import 'package:flutter/material.dart' as mat;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["notificationHandler"];

Notification deliveryAdminNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewOrder:
      mezDbgPrint(value);
      return Notification(
          id: key,
          linkUrl: value["linkUrl"],
          icon: mat.Icons.watch_later,
          body: '${_i18n()['newOrderBody']}',
          imgUrl: null,
          title: '${_i18n()['newOrderTitle']}',
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      return deliveryOpOrderChangesNotifier(key, value);
    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification deliveryOpOrderChangesNotifier(String key, value) {
  DeliveryOrderStatus newOrdersStatus =
      value['status'].toString().toDeliveryOrderStatus();
  final Map<String, dynamic> dynamicFields =
      _getDeliveryOrderStatusFields(newOrdersStatus);

  return Notification(
      id: key,
      secondaryIcon: mat.Icons.close,
      linkUrl: value["linkUrl"],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic> _getDeliveryOrderStatusFields(
    DeliveryOrderStatus deliveryOrderStatus) {
  switch (deliveryOrderStatus) {
    case DeliveryOrderStatus.AtPickup:
      return <String, dynamic>{
        "title": "${_i18n()["courier"]["atPickupTitle"]}",
        "body": "${_i18n()["courier"]["atPickupBody"]}",
        "imgUrl": "assets/images/shared/notifications/packageChecked.png",
      };
    case DeliveryOrderStatus.OnTheWayToPickup:
      return <String, dynamic>{
        "title": "${_i18n()["courier"]["onTheWayPickupTitle"]}",
        "body": "${_i18n()["courier"]["onTheWayPickupBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/onTheWay.png",
      };

    case DeliveryOrderStatus.OnTheWayToDropoff:
      return <String, dynamic>{
        "title": "${_i18n()["courier"]["onTheWayDropoffTitle"]}",
        "body": "${_i18n()["courier"]["onTheWayDropoffBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/onTheWay.png",
      };
    case DeliveryOrderStatus.AtDropoff:
      return <String, dynamic>{
        "title": "${_i18n()["courier"]["atDropoffTitle"]}",
        "body": "${_i18n()["courier"]["atDropoffBody"]}",
        "imgUrl": "assets/images/shared/notifications/packageChecked.png",
      };

    case DeliveryOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["deliveredTitle"]}",
        "body": "${_i18n()["deliveredBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/delivered.png",
      };
    case DeliveryOrderStatus.CancelledByAdmin:
    case DeliveryOrderStatus.CancelledByCustomer:
    case DeliveryOrderStatus.CancelledByDeliverer:
    case DeliveryOrderStatus.CancelledByServiceProvider:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/canceled.png",
      };
    default:
      throw StateError("Unhandled Courier Order Status");
  }
}

Notification newMessageNotification(String key, value) {
  mezDbgPrint("notification Data =================================> $value");
  return Notification(
      id: key,
      linkUrl: SharedRoutes.getMessagesRoute(chatId: value['chatId']),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
