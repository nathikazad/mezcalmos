import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["LaundryApp"]["notificationHandler"];

Notification restaurantNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewOrder:
      return Notification(
          id: key,
          linkUrl: getLaundryOpOrderRoute(value["orderId"]),
          body: '${_i18n()['newOrderBody']}',
          imgUrl:
              'assets/images/shared/notifications/prepareOrderNotificationIcon.png', // needs to be changed
          title: '${_i18n()['newOrderTitle']}',
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewMessage,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      return _laundryOpOrderChangesNotifier(key, value);
    default:
      throw StateError("Invalid Notification Type");
  }
}

// String getLinkUrl(OrderType orderType, String orderId) {
//   switch (orderType) {
//     case OrderType.Laundry:
//       return getLaundryOrderRoute(orderId);
//     case OrderType.Restaurant:
//       return getRestaurantOrderRoute(orderId);
//     default:
//       return kHomeRoute;
//   }
// }

Notification _laundryOpOrderChangesNotifier(String key, value) {
  final LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;

  return Notification(
      id: key,
      linkUrl: getLaundryOpOrderRoute(value["orderId"]),
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Notification laundryOrderStatusChangeNotificationHandler(String key, value) {
  final LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;

  return Notification(
      id: key,
      linkUrl: '',
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
    // case LaundryOrderStatus.OtwPickupFromCustomer:
    //   return <String, dynamic>{
    //     "title": "${_i18n()["laundryOtwPickupTitle"]}",
    //     "body": "${_i18n()["laundryOtwPickupBody"]}",
    //     "imgUrl":
    //         "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
    //   };
    // case LaundryOrderStatus.PickedUpFromCustomer:
    //   return <String, dynamic>{
    //     "title": "${_i18n()["laundryPickedTitle"]}",
    //     "body": "${_i18n()["laundryPickedBody"]}",
    //     "imgUrl":
    //         "assets/images/shared/notifications/readyOrderNotificationIcon.png",
    //   };
    // case LaundryOrderStatus.AtLaundry:
    //   return <String, dynamic>{
    //     "title": "${_i18n()["laundryAtLaundryTitle"]}",
    //     "body": "${_i18n()["laundryAtLaundryBody"]}",
    //     "imgUrl": "assets/images/shared/notifications/atLaundry.png",
    //   };
    // case LaundryOrderStatus.ReadyForDelivery:
    //   return <String, dynamic>{
    //     "title": "${_i18n()["laundryReadyForDeliveryTitle"]}",
    //     "body": "${_i18n()["laundryReadyForDeliveryBody"]}",
    //     "imgUrl":
    //         "assets/images/shared/notifications/readyOrderNotificationIcon.png",
    //   };
    // case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
    //   return <String, dynamic>{
    //     "title": "${_i18n()["laundryOtwDeliveryTitle"]}",
    //     "body": "${_i18n()["laundryOtwDeliveryBody"]}",
    //     "imgUrl":
    //         "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
    //   };
    // case LaundryOrderStatus.Delivered:
    //   return <String, dynamic>{
    //     "title": "${_i18n()["laundryDeliveredTitle"]}",
    //     "body": "${_i18n()["laundryDeliveredTitle"]}",
    //     "imgUrl":
    //         "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
    //   };
    case LaundryOrderStatus.CancelledByAdmin:
    case LaundryOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["canceledOrderTitle"]}",
        "body": "${_i18n()["canceledOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
      // do nothing
      return null;
  }
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: getMessagesRoute(
        chatId: value['chatId'],
      ),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}