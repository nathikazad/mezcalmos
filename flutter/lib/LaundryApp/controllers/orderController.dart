import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<LaundryOrder> currentOrders = <LaundryOrder>[].obs;
  RxList<LaundryOrder> pastOrders = <LaundryOrder>[].obs;
  StreamSubscription<dynamic>? _currentOrdersListener;
  StreamSubscription<dynamic>? _pastOrdersListener;

  Future<void> init(String laundryId) async {
    mezDbgPrint(
        "--------------------> Start listening on past orders  ${serviceProviderPastOrders(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _pastOrdersListener?.cancel();
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderPastOrders(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        // ignore: avoid_annotating_with_dynamic
        .listen((dynamic event) {
      final List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.keys.forEach((orderId) {
          final dynamic orderData = event.snapshot.value[orderId];

          orders.add(LaundryOrder.fromData(orderId, orderData));
        });
      }
      pastOrders.value = orders;
      pastOrders.sort((DeliverableOrder a, DeliverableOrder b) =>
          a.orderTime.toLocal().compareTo(b.orderTime.toLocal()));
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${serviceProviderInProcessOrders(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInProcessOrders(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        // ignore: avoid_annotating_with_dynamic
        .listen((dynamic event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

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

  bool hasNewMessageNotification(String chatId) {
    return _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType == NotificationType.NewMessage) &&
            notification.orderId == orderId)
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> setAsReadyForDelivery(String orderId) async {
    mezDbgPrint("Seeting order ready for delivery");
    return _callLaundryCloudFunction("readyForDeliveryOrder", orderId,
        optionalParams: <String, dynamic>{"fromLaundryOperator": true});
  }

  Future<ServerResponse> setOrderWeight(
      String orderId, LaundryOrderCosts laundryOrderCosts) async {
    return _callLaundryCloudFunction("setWeight", orderId, optionalParams: {
      "fromLaundryOperator": true,
      "costsByType": laundryOrderCosts.toFirebasFormat()
    });
  }

  Future<ServerResponse> setEstimatedLaundryReadyTime(
      String orderId, DateTime estimatedTime) async {
    mezDbgPrint("inside clod set delivery time $estimatedTime");
    return _callLaundryCloudFunction("setEstimatedLaundryReadyTime", orderId,
        optionalParams: {
          "fromLaundryOperator": true,
          "estimatedLaundryReadyTime": estimatedTime.toUtc().toString()
        });
  }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    mezDbgPrint("calling cloud func");
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-$functionName');
    try {
      final HttpsCallableResult response = await cloudFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      mezDbgPrint("Response : ${response.data}");
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
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
