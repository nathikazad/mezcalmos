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
  RxList<Order> inProcessOrders = <Order>[].obs;
  StreamSubscription? _ordersListener;
  @override
  void onInit() {
    mezDbgPrint(
        "--------------------> RestaurantsOrderController Initialized !");
    _ordersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(inProcessOrdersNode())
        .onValue
        .listen((event) {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in event.snapshot.value.keys) {
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        }
      }
      inProcessOrders.value = orders;
    });
    super.onInit();
  }

  Order? getOrder(String orderId) {
    try {
      return inProcessOrders.firstWhere((order) {
        return order.orderId == orderId;
      }) as RestaurantOrder;
    } on StateError {
      return null;
    }
  }

  Stream<Order?> getCurrentOrderStream(String orderId) {
    return inProcessOrders.stream.map<Order?>((_) {
      try {
        return inProcessOrders.firstWhere(
          (currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
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
