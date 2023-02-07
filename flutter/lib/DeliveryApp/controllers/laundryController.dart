// import 'dart:async';

// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

// class LaundryOrderController extends GetxController {
//   // void clearNewOrderNotifications() {
//   //   _fbNotificationsController.notifications.value.forEach((element) {
//   //     // mezDbgPrint(element.notificationType.toFirebaseFormatString());
//   //   });
//   //   _fbNotificationsController.notifications.value
//   //       .where((notification) =>
//   //           notification.notificationType == NotificationType.NewOrder)
//   //       .forEach((notification) {
//   //     // mezDbgPrint(notification.id);
//   //     _fbNotificationsController.removeNotification(notification.id);
//   //   });
//   // }

//   // void clearOrderNotifications(String orderId) {
//   //   _fbNotificationsController
//   //       .notifications()
//   //       .where((notification) =>
//   //           (notification.notificationType ==
//   //                   NotificationType.OrderStatusChange ||
//   //               notification.notificationType == NotificationType.NewOrder) &&
//   //           notification.orderId! == orderId)
//   //       .forEach((notification) {
//   //     _fbNotificationsController.removeNotification(notification.id);
//   //   });
//   // }

//   Future<ServerResponse> otwPickupFromCustomer(int orderId) async {
//     return _callLaundryCloudFunction(
//         "laundryStartPickupFromCustomer", orderId.toString());
//   }

//   Future<ServerResponse> pickedUpFromCustomer(int orderId) async {
//     return _callLaundryCloudFunction(
//         "laundryPickedUpFromCustomer", orderId.toString());
//   }

//   Future<ServerResponse> atLaundryOrder(int orderId) async {
//     return _callLaundryCloudFunction("laundryAtFacility", orderId.toString(),
//         optionalParams: <String, dynamic>{});
//   }

//   Future<ServerResponse> otwPickupFromLaundry(int orderId) async {
//     return _callLaundryCloudFunction(
//         "laundryStartPickupFromLaundry", orderId.toString());
//   }

//   Future<ServerResponse> pickedUpFromLaundry(int orderId) async {
//     return _callLaundryCloudFunction(
//         "laundryPickedUpFromLaundry", orderId.toString());
//   }

//   Future<ServerResponse> deliveredOrder(int orderId) async {
//     return _callLaundryCloudFunction(
//         "laundryFinishDropoff", orderId.toString());
//   }

//   Future<ServerResponse> _callLaundryCloudFunction(
//       String functionName, String orderId,
//       {Map<String, dynamic>? optionalParams}) async {
//     mezDbgPrint("func name -------------------> $functionName");
//     final HttpsCallable dropOrderFunction =
//         FirebaseFunctions.instance.httpsCallable('delivery-$functionName');
//     mezDbgPrint("Drop order");
//     try {
//       final HttpsCallableResult response = await dropOrderFunction
//           .call({"orderId": orderId, ...optionalParams ?? {}});
//       return ServerResponse.fromJson(response.data);
//     } catch (e) {
//       return ServerResponse(ResponseStatus.Error,
//           errorMessage: "Server Error", errorCode: "serverError");
//     }
//   }
// }
