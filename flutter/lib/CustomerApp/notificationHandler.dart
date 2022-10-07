import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['notificationHandler'];
bool showReviews = false;
Notification customerNotificationHandler(
  String key,
  value,
) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.NewCounterOffer:
      return newCounterOfferNotification(key, value);
    case NotificationType.OrderStatusChange:
      final OrderType orderType = value['orderType'].toString().toOrderType();
      mezDbgPrint(value['orderType']);
      switch (orderType) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Taxi:
          return taxiOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Laundry:
          return laundryOrderStatusChangeNotificationHandler(key, value);
        default:
          throw StateError("Invalid Notification Type");
      }
    case NotificationType.Call:
      //@saad needs to be implemented
      throw StateError("Callllll forgrouned notif!!");

    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification laundryOrderStatusChangeNotificationHandler(String key, value) {
  final LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  mezDbgPrint(newOrdersStatus);
  final Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  return Notification(
    id: key,
    icon: Material.Icons.local_laundry_service,
    linkUrl: getLaundryOrderRoute(value['orderId']),
    linkText: _i18n()['viewOrder'],
    body: dynamicFields["body"],
    imgUrl: dynamicFields["imgUrl"],
    title: dynamicFields["title"],
    timestamp: DateTime.parse(value['time']),
    notificationType: NotificationType.OrderStatusChange,
    notificationAction:
        value["notificationAction"].toString().toNotificationAction(),
    variableParams: value,
  );
}

Notification taxiOrderStatusChangeNotificationHandler(String key, value) {
  final TaxiOrdersStatus newOrdersStatus =
      value['status'].toString().toTaxiOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getTaxiOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  value['icon'] = dynamicFields['icon'];
  return Notification(
    id: key,
    icon: dynamicFields['icon'],
    linkUrl: getTaxiOrderRoute(value['orderId']),
    linkText: _i18n()['viewOrder'],
    body: dynamicFields["body"],
    imgUrl: dynamicFields["imgUrl"],
    title: dynamicFields["title"],
    timestamp: DateTime.parse(value['time']),
    notificationType: NotificationType.OrderStatusChange,
    notificationAction:
        value["notificationAction"].toString().toNotificationAction(),
    variableParams: value,
  );
}

Notification restaurantOrderStatusChangeNotificationHandler(String key, value) {
  final RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getRestaurantOrderStatusFields(newOrdersStatus)!;
  _handleReview(newOrdersStatus, value);
  return Notification(
    id: key,
    icon: Material.Icons.flatware,
    linkUrl: getRestaurantOrderRoute(value['orderId']),
    linkText: _i18n()['viewOrder'],
    body: dynamicFields["body"],
    imgUrl: dynamicFields["imgUrl"],
    title: dynamicFields["title"],
    timestamp: DateTime.parse(value['time']),
    notificationType: NotificationType.OrderStatusChange,
    notificationAction:
        value["notificationAction"].toString().toNotificationAction(),
    variableParams: value,
  );
}

void _handleReview(RestaurantOrderStatus newOrdersStatus, value) {
  if (newOrdersStatus == RestaurantOrderStatus.OnTheWay) {
    showReviews = true;
  }

  if (newOrdersStatus == RestaurantOrderStatus.Delivered && showReviews) {
    showReviews = false;
    mezDbgPrint("SHOW REVIEWS 🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟");
    showReviewDialog(Get.context!,
            orderId: value["orderId"],
            orderType: value["orderType"].toString().toOrderType())
        .whenComplete(() {
      Get.find<OrderController>().clearOrderNotifications(value["orderId"]);
      mezDbgPrint("ClOSE REVIEWS 🌟🌟");

      showReviews = true;
    });
  }
}

// TODO: needs to be formatted for laundry
Map<String, dynamic>? getLaundryOrderStatusFields(
    LaundryOrderStatus laundryOrderStatus) {
  switch (laundryOrderStatus) {
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["laundryOtwPickupTitle"]}",
        "body": "${_i18n()["laundryOtwPickupBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/onTheWay.png",
      };
    case LaundryOrderStatus.PickedUpFromCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["laundryPickedTitle"]}",
        "body": "${_i18n()["laundryPickedBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/delivered.png",
      };
    case LaundryOrderStatus.AtLaundry:
      return <String, dynamic>{
        "title": "${_i18n()["laundryAtLaundryTitle"]}",
        "body": "${_i18n()["laundryAtLaundryBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/atLaundry.png",
      };
    case LaundryOrderStatus.ReadyForDelivery:
      return <String, dynamic>{
        "title": "${_i18n()["laundryReadyForDeliveryTitle"]}",
        "body": "${_i18n()["laundryReadyForDeliveryBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/laundry/readyForDelivery.png",
      };
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return <String, dynamic>{
        "title": "${_i18n()["laundryOtwDeliveryTitle"]}",
        "body": "${_i18n()["laundryOtwDeliveryBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/onTheWay.png",
      };
    case LaundryOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["laundryDeliveredTitle"]}",
        "body": "${_i18n()["laundryDeliveredTitle"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/delivered.png",
      };
    case LaundryOrderStatus.CancelledByAdmin:
    case LaundryOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["LaundryCancelledTitle"]}",
        "body": "${_i18n()["LaundryCancelledBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/canceled.png",
      };
    default:
    // do nothing
  }
  return null;
}

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title": "${_i18n()["preparingOrderTitle"]}",
        "body": "${_i18n()["preparingOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title": "${_i18n()["readyForPickUpTitle"]}",
        "body": "${_i18n()["readyForPickUpBody"]}",
        "imgUrl": "assets/images/shared/notifications/onTheWay.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title": "${_i18n()["onTheWayRestaurantTitle"]}",
        "body": "${_i18n()["onTheWayRestaurantBody"]}",
        "imgUrl": "assets/images/shared/notifications/onTheWay.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["deliveredTitle"]}",
        "body": "${_i18n()["deliveredBody"]}",
        "imgUrl": "assets/images/shared/notifications/delivered.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Map<String, dynamic>? getTaxiOrderStatusFields(
    TaxiOrdersStatus taxiOrdersStatus) {
  switch (taxiOrdersStatus) {
    case TaxiOrdersStatus.OnTheWay:
      return <String, dynamic>{
        "title": "${_i18n()["taxiOnTheWayTitle"]}",
        "body": "${_i18n()["taxiOnTheWayBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.InTransit:
      return <String, dynamic>{
        "title": "${_i18n()["taxiInTransitTitle"]}",
        "body": "${_i18n()["taxiInTransitBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.DroppedOff:
      return <String, dynamic>{
        "title": "${_i18n()["taxiDroppedOffTitle"]}",
        "body": "${_i18n()["taxiDroppedOffBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.CancelledByTaxi:
      return <String, dynamic>{
        "title": "${_i18n()["taxiCancelledTitle"]}",
        "body": "${_i18n()["taxiCancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
        "icon": Material.Icons.close_rounded,
      };
    case TaxiOrdersStatus.Expired:
      return <String, dynamic>{
        "title": "${_i18n()["taxiExpiredTitle"]}",
        "body": "${_i18n()["taxiExpiredBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
        "icon": Material.Icons.restore,
      };

    case TaxiOrdersStatus.ForwardingToLocalCompany:
      return <String, dynamic>{
        "title": "${_i18n()["taxiFwdToCompanyTitle"]}",
        "body": "${_i18n()["taxiFwdToCompanyBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingUnsuccessful:
      return <String, dynamic>{
        "title": "${_i18n()["taxiFwdCancelTitle"]}",
        "body": "${_i18n()["taxiFwdCancelBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingSuccessful:
      return <String, dynamic>{
        "title": "${_i18n()["taxiFwdSuccessTitle"]}",
        "body": "${_i18n()["taxiFwdSuccessBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Notification newMessageNotification(String key, value) {
  mezDbgPrint("New message notif ==========>>>>>>>>$value");
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ??
          getMessagesRoute(
              chatId: value["chatId"],
              orderId: value["orderId"],
              recipientType: value["sender"]["particpantType"]
                  .toString()
                  .toParticipantType()),
      // just for backwards compatibility, future make it just value['orderId']
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

Notification newCounterOfferNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: getTaxiOrderRoute(value['orderId']),
      body: "${_i18n()["counterOfferBody"]}${value['driver']['name']}",
      imgUrl: value['driver']['image'],
      title: "${_i18n()["counterOfferTitle"]}",
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewCounterOffer,
      notificationAction:
          value["notificationAction"]?.toString().toNotificationAction() ??
              NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      variableParams: value);
}
