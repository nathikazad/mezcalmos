import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["notificationHandler"];

Notification deliveryAdminNotificationHandler(String key, value) {
  mezDbgPrint("FRONT VALUE =====>>>>$value");
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  // mezDbgPrint(notificationType.toFirebaseFormatString());
  switch (notificationType) {
    case NotificationType.NewMessage:
      // mezDbgPrint("the key is $key and its value ${value.toString()}");
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      return orderStatusChangeNotification(key, value);
    case NotificationType.NewOrder:
      return newOrderNotification(key, value);
    case NotificationType.AssignDriver:
      return assignDriverNotification(key, value);
    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification orderStatusChangeNotification(String key, value) {
  final RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  final OrderType orderType = value['orderType'].toString().toOrderType();
  switch (orderType) {
    case OrderType.Restaurant:
      return Notification(
          id: key,
          linkUrl: getRestaurantOrderRoute(value["orderId"]),
          body: 'Order is now ${newOrdersStatus.toFirebaseFormatString()}',
          imgUrl: "assets/images/shared/notifications/cancel.png",
          title: newOrdersStatus.toFirebaseFormatString(),
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.OrderStatusChange,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());
    case OrderType.Laundry:
      return Notification(
          id: key,
          linkUrl: getLaundryOrderRoute(value["orderId"]),
          body: 'Order is now ${newOrdersStatus.toFirebaseFormatString()}',
          imgUrl: "assets/images/shared/notifications/cancel.png",
          title: newOrdersStatus.toFirebaseFormatString(),
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.OrderStatusChange,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());
    case OrderType.Taxi:
      return Notification(
          id: key,
          linkUrl: getTaxiOrderRoute(value["orderId"]),
          body: 'Order is now ${newOrdersStatus.toFirebaseFormatString()}',
          imgUrl: "assets/images/shared/notifications/cancel.png",
          title: newOrdersStatus.toFirebaseFormatString(),
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.OrderStatusChange,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());
    default:
      throw Exception("Invalid order type");
  }
}

Notification newOrderNotification(String key, value) {
  final OrderType orderType = value['orderType'].toString().toOrderType();
  switch (orderType) {
    case OrderType.Restaurant:
      return Notification(
          id: key,
          linkUrl: getRestaurantOrderRoute(value['orderId']),
          body: 'New order from restaurant ${value['restaurant']['name']}',
          imgUrl: value['restaurant']['image'],
          title: _i18n()["restaurantTitle"],
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());
    case OrderType.Laundry:
      return Notification(
          id: key,
          linkUrl: getLaundryOrderRoute(value['orderId']),
          body: _i18n()["laundryBody"],
          imgUrl: 'assets/images/customer/laundry/laundryMachine.png',
          title: _i18n()["laundryTitle"],
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());
    case OrderType.Taxi:
      return Notification(
          id: key,
          linkUrl: getTaxiOrderRoute(value['orderId']),
          body: _i18n()['taxiBody'],
          imgUrl: 'assets/images/customer/taxi/taxiDriverImg.png',
          title: _i18n()['taxiTitle'],
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());
    default:
      throw Exception("Invalid order type");
  }
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ?? getMessagesRoute(chatId: value['chatId']),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      variableParams: value,
      notificationAction:
          value["notificationAction"]?.toString().toNotificationAction() ??
              NotificationAction.ShowSnackbarOnlyIfNotOnPage);
}

Notification assignDriverNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ?? getRestaurantOrderRoute(value["orderId"]),
      body: "Please Assign a driver",
      imgUrl: "assets/images/shared/notifications/onTheWay.png",
      title: "Assign driver",
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.AssignDriver,
      variableParams: value,
      notificationAction:
          value["notificationAction"]?.toString().toNotificationAction() ??
              NotificationAction.ShowSnackbarOnlyIfNotOnPage);
}
