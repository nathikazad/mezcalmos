import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<DeliverableOrder> currentOrders = <DeliverableOrder>[].obs;
  RxList<DeliverableOrder> pastOrders = <DeliverableOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  @override
  void onInit() {
    mezDbgPrint(
        "--------------------> Start listening on past orders  ${deliveryDriversPastOrdersNode(_authController.fireAuthUser!.uid)}");

    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(deliveryDriversPastOrdersNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((DatabaseEvent event) {
      final List<DeliverableOrder> orders = [];
      if (event.snapshot.value != null) {
        (event.snapshot.value as dynamic).keys.forEach((orderId) {
          try {
            final dynamic orderData =
                (event.snapshot.value as dynamic)[orderId];
            if (orderData["orderType"] ==
                OrderType.Restaurant.toFirebaseFormatString()) {
              orders.add(RestaurantOrder.fromData(orderId, orderData));
            } else if (orderData["orderType"] ==
                OrderType.Laundry.toFirebaseFormatString())
              orders.add(LaundryOrder.fromData(orderId, orderData));
          } catch (e, stk) {
            mezDbgPrint(stk);
            // TODO
          }
        });
      }
      pastOrders.value = orders;
      pastOrders.sort((DeliverableOrder a, DeliverableOrder b) =>
          b.orderTime.toLocal().compareTo(a.orderTime.toLocal()));
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${deliveryDriversInProcessOrdersNode(_authController.fireAuthUser!.uid)}");
    _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(deliveryDriversInProcessOrdersNode(
            _authController.fireAuthUser!.uid))
        .onValue
        .listen((DatabaseEvent event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

      final List<DeliverableOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        (event.snapshot.value as dynamic).keys?.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];
          if (orderData["orderType"] ==
              OrderType.Restaurant.toFirebaseFormatString()) {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          } else if (orderData["orderType"] ==
              OrderType.Laundry.toFirebaseFormatString()) {
            orders.add(LaundryOrder.fromData(orderId, orderData));
          }
        });
      }
      currentOrders.value = orders;
      currentOrders.sort((DeliverableOrder a, DeliverableOrder b) =>
          b.orderTime.toLocal().compareTo(a.orderTime.toLocal()));
    });
    super.onInit();
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

  Stream<DeliverableOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<DeliverableOrder?>>[
      _getInProcessOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<DeliverableOrder?> _getInProcessOrderStream(String orderId) {
    return currentOrders.stream.map<DeliverableOrder?>((_) {
      try {
        return currentOrders.firstWhere(
          (DeliverableOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  Stream<DeliverableOrder?> _getPastOrderStream(String orderId) {
    return pastOrders.stream.map<DeliverableOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (DeliverableOrder pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
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
                notification.notificationType == NotificationType.NewOrder) &&
            notification.orderId! == orderId)
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  void clearNewOrderNotificationsOfPastOrders() {
    final List<String> currentOrderIds = <String>[];
    currentOrders.forEach((Order order) => currentOrderIds.add(order.orderId));
    _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewOrder &&
            !currentOrderIds.contains(notification.orderId!))
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> setEstimatedTime(
      String orderId,
      DateTime estimatedTime,
      DeliveryDriverType deliveryDriverType,
      DeliveryAction deliveryAction,
      OrderType orderType) async {
    final HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('delivery-setEstimatedTime');
    try {
      final Map<String, dynamic> _map = {
        "orderId": orderId,
        "estimatedTime": estimatedTime.toUtc().toString(),
        "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
        "orderType": orderType.toFirebaseFormatString(),
        "deliveryAction": deliveryAction.toFirebaseFormatString()
      };
      mezDbgPrint("Map ===> $_map");

      final HttpsCallableResult response = await dropOrderFunction.call(_map);
      return ServerResponse.fromJson(response.data);
    } catch (e, s) {
      mezDbgPrint("Error ===> $e | $s");
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
