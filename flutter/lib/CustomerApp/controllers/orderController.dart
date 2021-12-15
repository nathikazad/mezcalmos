import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class OrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<Order> currentOrders = <Order>[].obs;
  RxList<Order> pastOrders = <Order>[].obs;

  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;
  Rx<FilterStatus> filterStatus = FilterStatus.All.obs;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("--------------------> OrderController Initialized !");
    if (_authController.fireAuthUser != null) {
      _pastOrdersListener?.cancel();
      _pastOrdersListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(customerPastOrders(_authController.fireAuthUser!.uid))
          .onValue
          .listen((event) async {
        mezDbgPrint("----------------- O R D E R CONTROLLER ----------------");
        mezDbgPrint("----------------- O R D E R CONTROLLER ----------------");
        mezDbgPrint("PAST ORDERS ==> ${event.snapshot.value}");
        mezDbgPrint("----------------- O R D E R CONTROLLER ----------------");
        mezDbgPrint("----------------- O R D E R CONTROLLER ----------------");

        List<Order> orders = [];
        if (event.snapshot.value != null) {
          for (var orderId in event.snapshot.value.keys) {
            dynamic orderData = event.snapshot.value[orderId];
            if (orderData["orderType"] ==
                OrderType.Restaurant.toFirebaseFormatString()) {
              orders.add(RestaurantOrder.fromData(orderId, orderData));
            }

            if (orderData["orderType"] ==
                OrderType.Taxi.toFirebaseFormatString()) {
              orders.add(TaxiOrder.fromData(orderId, orderData));
            }
          }
        }
        pastOrders.value = orders;
      });

      _currentOrdersListener?.cancel();
      _currentOrdersListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(customerInProcessOrders(_authController.fireAuthUser!.uid))
          .onValue
          .listen((event) async {
        List<Order> orders = [];
        if (event.snapshot.value != null) {
          mezDbgPrint("orderController: new incoming order data");
          for (var orderId in event.snapshot.value.keys) {
            dynamic orderData = event.snapshot.value[orderId];
            // if restaurant order
            if (orderData["orderType"] ==
                OrderType.Restaurant.toFirebaseFormatString()) {
              orders.add(RestaurantOrder.fromData(orderId, orderData));
            }
            // if Taxi order
            if (orderData["orderType"] ==
                OrderType.Taxi.toFirebaseFormatString()) {
              orders.add(TaxiOrder.fromData(orderId, orderData));
            }
          }
        }
        currentOrders.value = orders;
      });
    } else {
      throw Exception("User is not signed it to init order controller");
    }
  }

  Order? hasOrderOfType({required OrderType typeToCheck}) {
    try {
      return currentOrders().firstWhere((o) => o.orderType == typeToCheck);
    } on StateError catch (_) {
      return null;
    }
  }

  bool hasNewMessageNotification(String orderId) {
    return _fbNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .isNotEmpty;
  }

  Order? getOrder(String orderId) {
    try {
      return currentOrders.firstWhere((order) {
        return order.orderId == orderId;
      });
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

  Stream<Order?> getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<Order?>((_) {
      try {
        return currentOrders.firstWhere(
          (currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  Stream<Order?> getPastOrderStream(String orderId) {
    return pastOrders.stream.map<Order?>((_) {
      try {
        return pastOrders.firstWhere(
          (pastOrder) => pastOrder.orderId == orderId,
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

  void clearOrderNotifications(String orderId) {
    _fbNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            notification.orderId! == orderId)
        .forEach((notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  @override
  void onClose() async {
    print("[+] OrderController::onClose ---------> Was invoked !");
    _currentOrdersListener?.cancel();
    _currentOrdersListener = null;
    _pastOrdersListener?.cancel();
    _pastOrdersListener = null;
    super.onClose();
  }
}

enum FilterStatus { All, Done, Canceled }
