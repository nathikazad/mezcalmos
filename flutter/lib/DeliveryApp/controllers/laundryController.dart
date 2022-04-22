import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class LaundryOrderController extends GetxController {
  // bool orderHaveNewMessageNotifications(String orderId) {
  //   return _fbNotificationsController
  //       .notifications()
  //       .where((notification) =>
  //           notification.notificationType == NotificationType.NewMessage &&
  //           notification.orderId! == orderId)
  //       .isNotEmpty;
  // }

  // void clearNewOrderNotifications() {
  //   _fbNotificationsController.notifications.value.forEach((element) {
  //     // mezDbgPrint(element.notificationType.toFirebaseFormatString());
  //   });
  //   _fbNotificationsController.notifications.value
  //       .where((notification) =>
  //           notification.notificationType == NotificationType.NewOrder)
  //       .forEach((notification) {
  //     // mezDbgPrint(notification.id);
  //     _fbNotificationsController.removeNotification(notification.id);
  //   });
  // }

  // void clearOrderNotifications(String orderId) {
  //   _fbNotificationsController
  //       .notifications()
  //       .where((notification) =>
  //           (notification.notificationType ==
  //                   NotificationType.OrderStatusChange ||
  //               notification.notificationType == NotificationType.NewOrder) &&
  //           notification.orderId! == orderId)
  //       .forEach((notification) {
  //     _fbNotificationsController.removeNotification(notification.id);
  //   });
  // }

  Future<ServerResponse> otwPickupOrder(String orderId) async {
    return _callLaundryCloudFunction("laundryStartPickup", orderId);
  }

  Future<ServerResponse> pickedUpOrder(String orderId) async {
    return _callLaundryCloudFunction("laundryFinishPickup", orderId);
  }

  Future<ServerResponse> atLaundryOrder(String orderId, num weight) async {
    return _callLaundryCloudFunction("laundryAtFacilityTwo", orderId,
        optionalParams: <String, dynamic>{});
  }

  Future<ServerResponse> otwDeliveryOrder(String orderId) async {
    return _callLaundryCloudFunction("laundryStartDropoff", orderId);
  }

  Future<ServerResponse> deliveredOrder(String orderId) async {
    return _callLaundryCloudFunction("laundryFinishDropoff", orderId);
  }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('delivery-$functionName');
    mezDbgPrint("Drop order");
    try {
      HttpsCallableResult response = await dropOrderFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
