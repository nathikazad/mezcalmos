import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

dynamic _i18n = Get.find<LanguageController>().strings['CustomerApp']
    ['notificationHandler'];
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
      linkText: _i18n['viewOrder'],
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
      linkText: _i18n['viewOrder'],
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
        "title": "${_i18n["restaurant"]["preparingOrder"]["title"]}",
        "body": "${_i18n["restaurant"]["preparingOrder"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title": "${_i18n["restaurant"]["readyForPickup"]["title"]}",
        "body": "${_i18n["restaurant"]["readyForPickup"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title": "${_i18n["restaurant"]["onTheWay"]["title"]}",
        "body": "${_i18n["restaurant"]["onTheWay"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n["restaurant"]["delivered"]["title"]}",
        "body": "${_i18n["restaurant"]["delivered"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title": "${_i18n["restaurant"]["cancelled"]["title"]}",
        "body": "${_i18n["restaurant"]["cancelled"]["body"]}",
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
        "title": "${_i18n["taxi"]["onTheWay"]["title"]}",
        "body": "${_i18n["taxi"]["onTheWay"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.InTransit:
      return <String, dynamic>{
        "title": "${_i18n["taxi"]["inTransit"]["title"]}",
        "body": "${_i18n["taxi"]["inTransit"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.DroppedOff:
      return <String, dynamic>{
        "title": "${_i18n["taxi"]["droppedOff"]["title"]}",
        "body": "${_i18n["taxi"]["droppedOff"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.CancelledByTaxi:
      return <String, dynamic>{
        "title": "${_i18n["taxi"]["cancelled"]["title"]}",
        "body": "${_i18n["taxi"]["cancelled"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.Expired:
      return <String, dynamic>{
        "title": "${_i18n["taxi"]["expired"]["title"]}",
        "body": "${_i18n["taxi"]["expired"]["body"]}",
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
