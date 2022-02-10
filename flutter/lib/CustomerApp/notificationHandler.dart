import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

LanguageController i18n = Get.find<LanguageController>();
Notification customerNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      OrderType orderType = value['orderType'].toString().toOrderType();
      mezDbgPrint(value['orderType']);
      switch (orderType) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Taxi:
          return taxiOrderStatusChangeNotificationHandler(key, value);
        default:
          throw StateError("Invalid Notification Type");
      }
    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification taxiOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  TaxiOrdersStatus newOrdersStatus =
      value['status'].toString().toTaxiOrderStatus();
  mezDbgPrint(newOrdersStatus);
  Map<String, dynamic> dynamicFields =
      getTaxiOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  return Notification(
      id: key,
      linkUrl: getTaxiOrderRoute(value['orderId']),
      linkText: i18n.strings['customerApp']['notificationHandler']
          ['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Notification restaurantOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  Map<String, dynamic> dynamicFields =
      getRestaurantOrderStatusFields(newOrdersStatus)!;
  return Notification(
      id: key,
      linkUrl: getRestaurantOrderRoute(value['orderId']),
      linkText: i18n.strings['customerApp']['notificationHandler']
          ['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["preparingOrder"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["preparingOrder"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["readyForPickup"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["readyForPickup"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["onTheWay"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["onTheWay"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["delivered"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["delivered"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["cancelled"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["restaurant"]["cancelled"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
}

Map<String, dynamic>? getTaxiOrderStatusFields(
    TaxiOrdersStatus taxiOrdersStatus) {
  switch (taxiOrdersStatus) {
    case TaxiOrdersStatus.OnTheWay:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["onTheWay"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["onTheWay"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.InTransit:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["inTransit"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["inTransit"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.DroppedOff:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["droppedOff"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["droppedOff"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.CancelledByTaxi:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["cancelled"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["cancelled"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.Expired:
      return <String, dynamic>{
        "title":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["expired"]["title"]}",
        "body":
            "${i18n.strings['customerApp']['notificationHandler']["taxi"]["expired"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
}

Notification newMessageNotification(String key, dynamic value) {
  return Notification(
      id: key,
      linkUrl: getMessageUrl(
          value['orderId'])!, // in future make dependent on order type
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          value["notificationAction"]?.toString().toNotificationAction() ??
              NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      variableParams: value);
}

String? getMessageUrl(String orderId) {
  switch (Get.find<OrderController>().getOrder(orderId)!.orderType) {
    case OrderType.Restaurant:
      return getRestaurantMessagesRoute(orderId);
    case OrderType.Taxi:
      return getTaxiMessagesRoute(orderId);
    default:
  }
}
