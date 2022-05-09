import 'dart:async';
import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class RestaurantOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<RestaurantOrder> inProcessOrders = <RestaurantOrder>[].obs;
  RxList<RestaurantOrder> pastOrders = <RestaurantOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  @override
  void onInit() {
    mezDbgPrint(
        "--------------------> RestaurantsOrderController Initialized !");
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(rootInProcessOrdersNode(orderType: OrderType.Restaurant))
        .onValue
        .listen((Event event) {
      final List<RestaurantOrder> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in event.snapshot.value.keys) {
          final dynamic orderData = event.snapshot.value[orderId];
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        }
      } else {}
      inProcessOrders.value = orders;
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(rootPastOrdersNode(orderType: OrderType.Restaurant))
        .orderByChild('orderTime')
        .limitToLast(5)
        .onChildAdded
        .listen((Event event) {
      final dynamic _data = event.snapshot.value;
      // adding this check because old data (past orders are corrupted , most of em don't have restaurant's location)
      // didn't wanna erase the data, which is too much it seems.
      if (_data?['restaurant']?['location'] != null) {
        pastOrders.add(
            RestaurantOrder.fromData(event.snapshot.key, event.snapshot.value));
      }
    });

    super.onInit();
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    await _currentOrdersListener?.cancel();
    await _pastOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();
    super.onClose();
  }

  RestaurantOrder? getOrder(String orderId) {
    try {
      return inProcessOrders.firstWhere((RestaurantOrder order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((RestaurantOrder order) {
          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  Stream<RestaurantOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<RestaurantOrder?>>[
      _getCurrentOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  bool isPast(RestaurantOrder order) {
    return pastOrders.contains(order);
  }

  Stream<RestaurantOrder?> _getCurrentOrderStream(String orderId) {
    return inProcessOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return inProcessOrders.firstWhere(
          (RestaurantOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
    });
  }

  Stream<RestaurantOrder?> _getPastOrderStream(String orderId) {
    return inProcessOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
    });
  }

  bool orderHaveNewMessageNotifications(String chatId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearNewOrderNotifications() {
    _fbNotificationsController.notifications.value
        .forEach((Notification element) {
      // mezDbgPrint(element.notificationType.toFirebaseFormatString());
    });
    _fbNotificationsController.notifications.value
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewOrder)
        .forEach((Notification notification) {
      // mezDbgPrint(notification.id);
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  void clearOrderNotifications(String orderId) {
    _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType == NotificationType.NewOrder) &&
            notification.orderId! == orderId)
        .forEach((Notification notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    return _callRestaurantCloudFunction("cancelOrderFromAdmin", orderId);
  }

  Future<ServerResponse> prepareOrder(String orderId) async {
    return _callRestaurantCloudFunction("prepareOrder", orderId);
  }

  Future<ServerResponse> readyForPickupOrder(String orderId) async {
    return _callRestaurantCloudFunction("readyForOrderPickup", orderId);
  }

  // Need to be removed
  Future<ServerResponse> deliverOrder(String orderId) async {
    return _callRestaurantCloudFunction("deliverOrder", orderId);
  }

  // Need to be removed
  Future<ServerResponse> dropOrder(String orderId) async {
    return _callRestaurantCloudFunction("dropOrder", orderId);
  }

  Future<ServerResponse> _callRestaurantCloudFunction(
      String functionName, String orderId) async {
    final HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-$functionName');
    mezDbgPrint("Drop order");
    try {
      final HttpsCallableResult response =
          await dropOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
