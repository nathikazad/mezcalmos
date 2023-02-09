// import 'dart:async';

// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
// import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

// class RestaurantOrderController extends GetxController {
//   FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
//   ForegroundNotificationsController _fbNotificationsController =
//       Get.find<ForegroundNotificationsController>();

//   // bool orderHaveNewMessageNotifications(String orderId) {
//   //   return _fbNotificationsController
//   //       .notifications()
//   //       .where((notification) =>
//   //           notification.notificationType == NotificationType.NewMessage &&
//   //           notification.orderId! == orderId)
//   //       .isNotEmpty;
//   // }

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

//   Future<ServerResponse> startRestaurantDelivery(String orderId) async {
//     return _callRestaurantCloudFunction("restaurantStartDelivery", orderId);
//   }

//   Future<ServerResponse> finishRestaurantDelivery(String orderId) async {
//     return _callRestaurantCloudFunction("restaurantFinishDelivery", orderId);
//   }

//   Future<ServerResponse> _callRestaurantCloudFunction(
//       String functionName, String orderId) async {
//     HttpsCallable dropOrderFunction =
//         FirebaseFunctions.instance.httpsCallable('delivery-$functionName');
//     mezDbgPrint("Drop order");
//     try {
//       HttpsCallableResult response =
//           await dropOrderFunction.call({"orderId": orderId});
//       return ServerResponse.fromJson(response.data);
//     } catch (e) {
//       return ServerResponse(ResponseStatus.Error,
//           errorMessage: "Server Error", errorCode: "serverError");
//     }
//   }
// }
