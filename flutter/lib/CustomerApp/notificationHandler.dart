import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['notificationHandler'];

Notification customerNotificationHandler(
  String key,
  value,
) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);

    case NotificationType.OrderStatusChange:
      final OrderType orderType = value['orderType'].toString().toOrderType();
      switch (orderType) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);

        case OrderType.Laundry:
          return laundryOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Courier:
          return _courierOrderStatusChangeNotificationHandler(key, value);
        default:
          throw StateError("Invalid Notification Type");
      }
    case NotificationType.Call:
      throw StateError("Callllll forgrouned notif!!");
    case NotificationType.PriceChange:
    //@saad needs to be implemented
    // return Notification(
    //     id: id,
    //     timestamp: timestamp,
    //     title: headline6,
    //     body: body,
    //     imgUrl: imgUrl,
    //     linkUrl: linkUrl,
    //     notificationType: notificationType,
    //     notificationAction: notificationAction);

    case NotificationType.PriceChange:
      return Notification(
          id: key,
          timestamp: DateTime.parse(value['time']),
          title: '${_i18n()['priceChange']}',
          body: '${_i18n()['driverSentYouMessage']}',
          imgUrl: null,
          icon: Material.Icons.price_change,
          linkUrl: value['linkUrl'],
          notificationType: notificationType,
          variableParams: value,
          notificationAction:
              value["notificationAction"].toString().toNotificationAction());

    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification laundryOrderStatusChangeNotificationHandler(String key, value) {
  final LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;
  return Notification(
    id: key,
    icon: Material.Icons.local_laundry_service,
    linkUrl: value["linkUrl"],
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

Notification _courierOrderStatusChangeNotificationHandler(String key, value) {
  final DeliveryOrderStatus newOrdersStatus =
      value['status'].toString().toDeliveryOrderStatus();
  final Map<String, dynamic> dynamicFields =
      _getCourierOrderStatusFields(newOrdersStatus);
  return Notification(
    id: key,
    icon: Material.Icons.shopping_bag_rounded,
    linkUrl: value["linkUrl"],
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
  return Notification(
    id: key,
    icon: Material.Icons.flatware,
    linkUrl: value["linkUrl"],
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
  }
  return null;
}

Map<String, dynamic> _getCourierOrderStatusFields(DeliveryOrderStatus status) {
  switch (status) {
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
        "title": "${_i18n()["laundryDeliveredTitle"]}",
        "body": "${_i18n()["laundryDeliveredTitle"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/delivered.png",
      };
    case DeliveryOrderStatus.CancelledByAdmin:
    case DeliveryOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["LaundryCancelledTitle"]}",
        "body": "${_i18n()["LaundryCancelledBody"]}",
        "imgUrl": "assets/images/shared/notifications/laundry/canceled.png",
      };
    default:
      throw StateError("Unhandled Courier Order Status");
  }
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
  }
  return null;
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ??
          SharedRoutes.getMessagesRoute(chatId: int.parse(value["chatId"])),
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
