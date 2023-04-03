import 'package:flutter/material.dart' as mat;
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["notificationHandler"];

Notification deliveryDriverNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();

  mezDbgPrint("👋 new notification 👋\n $value");

  switch (notificationType) {
    case NotificationType.NewOrder:
      return Notification(
          id: key,
          icon:
              (value['orderType'].toString().toOrderType() == OrderType.Laundry)
                  ? mat.Icons.local_laundry_service
                  : mat.Icons.flatware,
          linkUrl: getLinkUrl(value['orderType'].toString().toOrderType(),
              value['orderId']), // needs to be changed, need to add laundry
          body: '${_i18n()['driverNotifBody']}', // needs to be changed
          imgUrl:
              'assets/images/shared/notifications/onTheWay.png', // needs to be changed
          title: '${_i18n()['driverNotifTitle']}',
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.DriverApproved:
      return Notification(
          id: key,
          icon: mat.Icons.delete_forever_rounded,
          linkUrl:
              kCurrentOrdersListRoute, // needs to be changed, need to add laundry
          body: 'You have been approved', // needs to be changed
          imgUrl:
              'assets/images/shared/notifications/delivered.png', // needs to be changed
          title: 'Congrats ',
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.DriverApproved,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      switch (value['orderType'].toString().toOrderType()) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Laundry:
          return laundryOrderStatusChangeNotificationHandler(key, value);
        default:
          throw Exception("Unexpected Order Type $value['orderType']");
      }
    default:
      throw StateError("Invalid Notification Type");
  }
}

String getLinkUrl(OrderType orderType, int orderId) {
  switch (orderType) {
    case OrderType.Laundry:
      return getDriverOrderRoute(orderId);
    case OrderType.Restaurant:
      return getDriverOrderRoute(orderId);
    default:
      return kHomeRoute;
  }
}

Notification restaurantOrderStatusChangeNotificationHandler(String key, value) {
  final RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getRestaurantOrderStatusFields(newOrdersStatus)!;

  return Notification(
      id: key,
      icon: mat.Icons.flatware_rounded,
      secondaryIcon: (value['status'].toString().toRestaurantOrderStatus() ==
                  RestaurantOrderStatus.CancelledByAdmin ||
              value['status'].toString().toRestaurantOrderStatus() ==
                  RestaurantOrderStatus.CancelledByAdmin)
          ? mat.Icons.close
          : null,
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

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.Preparing:
      return <String, dynamic>{
        "title": "${_i18n()["preparingOrderTitle"]}",
        "body": "${_i18n()["preparingOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Ready:
      return <String, dynamic>{
        "title": "${_i18n()["readyForPickupTitle"]}",
        "body": "${_i18n()["readyForPickupBody"]}",
        "imgUrl": aDeliveryIcon,
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["deliveredTitle"]}",
        "body": "${_i18n()["deliveredBody"]}",
        "imgUrl": aDeliveryIcon,
      };

    case RestaurantOrderStatus.CancelledByCustomer:
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl": aCancelledIcon,
      };
    default:
    // do nothing
  }
  return null;
}

Notification laundryOrderStatusChangeNotificationHandler(String key, value) {
  final LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;

  return Notification(
      id: key,
      icon: mat.Icons.local_laundry_service,
      secondaryIcon: (value['status'].toString().toLaundryOrderStatus() ==
                  LaundryOrderStatus.CancelledByAdmin ||
              value['status'].toString().toLaundryOrderStatus() ==
                  LaundryOrderStatus.CancelledByAdmin)
          ? mat.Icons.close
          : null,
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

Map<String, dynamic>? getLaundryOrderStatusFields(
    LaundryOrderStatus laundryOrderStatus) {
  switch (laundryOrderStatus) {
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["laundryOtwPickupTitle"]}",
        "body": "${_i18n()["laundryOtwPickupBody"]}",
        "imgUrl": aDeliveryIcon,
      };
    case LaundryOrderStatus.PickedUpFromCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["laundryPickedTitle"]}",
        "body": "${_i18n()["laundryPickedBody"]}",
        "imgUrl": aDeliveredIcon,
      };
    case LaundryOrderStatus.AtLaundry:
      return <String, dynamic>{
        "title": "${_i18n()["laundryAtLaundryTitle"]}",
        "body": "${_i18n()["laundryAtLaundryBody"]}",
        "imgUrl": aAtLaundry,
      };
    case LaundryOrderStatus.ReadyForDelivery:
      return <String, dynamic>{
        "title": "${_i18n()["laundryReadyForDeliveryTitle"]}",
        "body": "${_i18n()["laundryReadyForDeliveryBody"]}",
        "imgUrl": aReadyDeliveryLaundry,
      };
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return <String, dynamic>{
        "title": "${_i18n()["laundryOtwDeliveryTitle"]}",
        "body": "${_i18n()["laundryOtwDeliveryBody"]}",
        "imgUrl": aDeliveryIcon,
      };
    case LaundryOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["laundryDeliveredTitle"]}",
        "body": "${_i18n()["laundryDeliveredTitle"]}",
        "imgUrl": aDeliveredIcon,
      };
    case LaundryOrderStatus.CancelledByAdmin:
    case LaundryOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl": aCancelledIcon,
      };
    default:
      // do nothing
      return null;
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
                  .convertToParticipantType()),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
