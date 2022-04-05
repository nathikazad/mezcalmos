import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<LaundryOrder> currentOrders = <LaundryOrder>[].obs;
  RxList<LaundryOrder> pastOrders = <LaundryOrder>[].obs;
  StreamSubscription<Event>? _currentOrdersListener;
  StreamSubscription<Event>? _pastOrdersListener;

  Future<void> init(String laundryId) async {
    mezDbgPrint(
        "--------------------> Start listening on past orders  ${serviceProviderPastOrders(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _pastOrdersListener?.cancel();
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderPastOrders(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        .listen((event) {
      List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.keys.forEach((String orderId) {
          mezDbgPrint("Hndling Order : $orderId");
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(LaundryOrder.fromData(orderId, orderData));
        });
      }
      pastOrders.value = orders;
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${serviceProviderInProcessOrders(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInProcessOrders(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        .listen((event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

      List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        event.snapshot.value.keys?.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(LaundryOrder.fromData(orderId, orderData));
        });
      }
      currentOrders.value = orders;
    });
  }

  DeliverableOrder? getOrder(String orderId) {
    try {
      return currentOrders.firstWhere((DeliverableOrder order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((DeliverableOrder order) {
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

  bool hasNewMessageNotification(String orderId) {
    return _foregroundNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _foregroundNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            notification.orderId! == orderId)
        .forEach((notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> setAsReadyForDelivery(String orderId) async {
    return _callLaundryCloudFunction("readyForDeliveryOrder", orderId,
        optionalParams: <String, dynamic>{});
  }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-$functionName');
    try {
      HttpsCallableResult response = await cloudFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "CURRENT ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! ${this.hashCode}");
    mezDbgPrint(
        "--------------------> CurrentOrderController::onClose called  !");
    print("[+] Orderontroller::onClose ---------> Was invoked !");
    _currentOrdersListener?.cancel();
    _currentOrdersListener = null;
    _pastOrdersListener?.cancel();
    _pastOrdersListener = null;
    super.onClose();
  }
}
