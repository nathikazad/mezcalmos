import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
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
        .listen((Event event) {
      mezDbgPrint(
          "PAST ORDERS ======> the event value ------------> ${event.snapshot.value}");

      final List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        mezDbgPrint("the event value ------------> ${event.snapshot.value}");
        event.snapshot.value.keys.forEach((orderId) {
          mezDbgPrint("-------------------->>>>>>>>>>Hndling Order : $orderId");
          final dynamic orderData = event.snapshot.value[orderId];
          mezDbgPrint("Order Data ======================> $orderData");
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
        .listen((Event event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");
      mezDbgPrint(
          "CURRENT ORDERS ======> the event value ------------> ${event.snapshot.value}");

      final List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        event.snapshot.value.keys?.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          final dynamic orderData = event.snapshot.value[orderId];
          orders.add(LaundryOrder.fromData(orderId, orderData));
        });
      }
      currentOrders.value = orders;
    });
  }

  LaundryOrder? getOrder(String orderId) {
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

  Stream<LaundryOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<LaundryOrder?>>[
      _getCurrentOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<LaundryOrder?> _getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<LaundryOrder?>((_) {
      try {
        return currentOrders.firstWhere(
          (LaundryOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<LaundryOrder?> _getPastOrderStream(String orderId) {
    return pastOrders.stream.map<LaundryOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (LaundryOrder pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  bool hasNewMessageNotification(String orderId) {
    return _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            notification.orderId! == orderId)
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> setAsReadyForDelivery(String orderId) async {
    return _callLaundryCloudFunction("readyForDeliveryOrderTwo", orderId,
        optionalParams: <String, dynamic>{"fromLaundryOperator": true});
  }

  Future<ServerResponse> setOrderWeight(
      String orderId, LaundryOrderCosts laundryOrderCosts) async {
    return _callLaundryCloudFunction("setWeight", orderId, optionalParams: {
      "fromLaundryOperator": true,
      "costsByType": laundryOrderCosts.toFirebasFormat()
    });
  }

  Future<ServerResponse> setEstimatedDeliveryTime(
      String orderId, DateTime estimatedTime) async {
    return _callLaundryCloudFunction("setEstimatedDeliveryTime", orderId,
        optionalParams: {
          "fromLaundryOperator": true,
          "estimatedDeliveryTime": estimatedTime.toUtc().toString()
        });
  }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-$functionName');
    try {
      final HttpsCallableResult response = await cloudFunction
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
        "CURRENT ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! $hashCode");
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
