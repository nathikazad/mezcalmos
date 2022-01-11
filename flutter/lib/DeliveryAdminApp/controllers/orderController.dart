import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<Order> inProcessOrders = <Order>[].obs;
  RxList<Order> pastOrders = <Order>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  @override
  void onInit() {
    mezDbgPrint(
        "--------------------> RestaurantsOrderController Initialized !");
    _currentOrdersListener = _databaseHelper.firebaseDatabase
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

    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(pastOrdersNode())
        .orderByChild('orderTime')
        .limitToLast(15)
        .onChildAdded
        .listen((event) {
      pastOrders.add(
          RestaurantOrder.fromData(event.snapshot.key, event.snapshot.value));
    });

    super.onInit();
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    _currentOrdersListener?.cancel();
    _pastOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();
    super.onClose();
  }

  Order? getOrder(String orderId) {
    try {
      return inProcessOrders.firstWhere((order) {
        return order.orderId == orderId;
      }) as RestaurantOrder;
    } on StateError {
      try {
        return pastOrders.firstWhere((order) {
          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  bool isPast(RestaurantOrder order) {
    
    return pastOrders.contains(order);
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

  bool orderHaveNewMessageNotifications(String orderId) {
    return _fbNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .isNotEmpty;
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
        .httpsCallable('restaurant-cancelOrderFromAdmin');
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
        FirebaseFunctions.instance.httpsCallable('restaurant-prepareOrder');
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
    HttpsCallable readyForPickupOrderFunction = FirebaseFunctions.instance
        .httpsCallable('restaurant-readyForOrderPickup');
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
        FirebaseFunctions.instance.httpsCallable('restaurant-deliverOrder');
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
        FirebaseFunctions.instance.httpsCallable('restaurant-dropOrder');
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
