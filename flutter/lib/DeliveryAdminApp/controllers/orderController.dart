import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'dart:async';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  FBNotificationsController _fbNotificationsController =
      Get.find<FBNotificationsController>();
  late Stream<List<Order>> ordersStream;
  List<Order> inProcessOrders = [];
  @override
  void onInit() {
    mezDbgPrint(
        "--------------------> RestaurantsOrderController Initialized !");
    ordersStream = _databaseHelper.firebaseDatabase
        .reference()
        .child(inProcessOrdersNode())
        .onValue
        .map<List<Order>>((event) {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        });
      }
      inProcessOrders = orders;
      return orders;
    });
    super.onInit();
  }

  Stream<Order?> getCurrentOrder(String orderId) {
    return ordersStream.map<Order?>((orders) {
      try {
        return orders
            .firstWhere((currentOrder) => currentOrder.orderId == orderId);
      } on StateError {
        return null;
      }
      // catch (e) {
      //   mezDbgPrint("Some error");
      // }
    });
  }

  void clearNewOrderNotifications() {
    _fbNotificationsController.notifications.value.forEach((element) {
      mezDbgPrint(element.notificationType.toFirebaseFormatString());
    });
    _fbNotificationsController.notifications.value
        .where((notification) =>
            notification.notificationType == NotificationType.NewOrder)
        .forEach((notification) {
      mezDbgPrint(notification.id);
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  void clearOrderNotifications(String orderId) {
    _fbNotificationsController
        .notifications()
        .where((notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType == NotificationType.NewOrder) &&
            notification.orderId! == orderId)
        .forEach((notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('cancelRestaurantOrderFromAdmin');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> prepareOrder(String orderId) async {
    mezDbgPrint("prepare order");
    HttpsCallable prepareOrderFunction =
        FirebaseFunctions.instance.httpsCallable('prepareOrder');
    try {
      HttpsCallableResult response =
          await prepareOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> readyForPickupOrder(String orderId) async {
    HttpsCallable readyForPickupOrderFunction =
        FirebaseFunctions.instance.httpsCallable('readyForPickupOrder');
    try {
      HttpsCallableResult response =
          await readyForPickupOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> deliverOrder(String orderId) async {
    HttpsCallable deliverOrderFunction =
        FirebaseFunctions.instance.httpsCallable('deliverOrder');
    try {
      HttpsCallableResult response =
          await deliverOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> dropOrder(String orderId) async {
    HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('dropOrder');
    mezDbgPrint("Drop order");
    try {
      HttpsCallableResult response =
          await dropOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
