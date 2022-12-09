import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class RestaurantOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();
  RxList<RestaurantOrder> inProcessOrders = <RestaurantOrder>[].obs;
  RxList<RestaurantOrder> pastOrders = <RestaurantOrder>[].obs;
  StreamSubscription<DatabaseEvent>? _currentOrdersListener;
  StreamSubscription<DatabaseEvent>? _pastOrdersListener;

  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;

  @override
  void onInit() {
    mezDbgPrint(
        "--------------------> RestaurantsOrderController Initialized !");
    listenToOrders();
    _appLifeCyclePauseCallbackId =
        _appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      mezDbgPrint("[_] _appLifeCyclePauseCallbackId ==> triggering!");
      _pastOrdersListener?.pause();
      _currentOrdersListener?.pause();
    });

    _appLifeCycleResumeCallbackId =
        _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () {
      mezDbgPrint("[_] appLifeCycleResumeCallbackId ==> triggering!");
      _pastOrdersListener?.resume();
      _currentOrdersListener?.resume();
      // listenToOrders();
    });
    super.onInit();
  }

  void listenToOrders() {
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(rootInProcessOrdersNode(orderType: OrderType.Restaurant))
        .onValue
        .listen((DatabaseEvent event) {
      final List<RestaurantOrder> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in (event.snapshot.value as dynamic).keys) {
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];
          // or make a check here in case order/orderiD already exists in orders then don't add it,
          // but that will not be supper efficient especially if there is a lot of orders.

          // or clear and re-process all orders.
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        }
      } else {}
      inProcessOrders.value = orders;
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(rootPastOrdersNode(orderType: OrderType.Restaurant))
        .orderByChild('orderTime')
        .limitToLast(5)
        .onChildAdded
        .listen((DatabaseEvent event) {
      final dynamic _data = event.snapshot.value;
      // adding this check because old data (past orders are corrupted , most of em don't have restaurant's location)
      // didn't wanna erase the data, which is too much it seems.
      if (_data?['restaurant']?['location'] != null) {
        pastOrders.add(
            RestaurantOrder.fromData(event.snapshot.key, event.snapshot.value));
      }
    });
  }

  @override
  Future<void> onClose() async {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    await _currentOrdersListener?.cancel();
    await _pastOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();

    if (_appLifeCyclePauseCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          AppLifecycleState.paused, _appLifeCyclePauseCallbackId);
    if (_appLifeCycleResumeCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          AppLifecycleState.resumed, _appLifeCycleResumeCallbackId);
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
      return null;
    });
  }

  Stream<RestaurantOrder?> _getPastOrderStream(String orderId) {
    return inProcessOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (RestaurantOrder pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  bool orderHaveNewMessageNotifications(String chatId) {
    return _fbNotificationsController
        .notifications()
        .where((MezNotification.Notification notification) =>
            notification.notificationType ==
                MezNotification.NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearNewOrderNotifications() {
    _fbNotificationsController.notifications.value
        .forEach((MezNotification.Notification element) {
      // mezDbgPrint(element.notificationType.toFirebaseFormatString());
    });
    _fbNotificationsController.notifications.value
        .where((MezNotification.Notification notification) =>
            notification.notificationType ==
            MezNotification.NotificationType.NewOrder)
        .forEach((MezNotification.Notification notification) {
      // mezDbgPrint(notification.id);
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  void clearOrderNotifications(String orderId) {
    _fbNotificationsController
        .notifications()
        .where((MezNotification.Notification notification) =>
            (notification.notificationType ==
                    MezNotification.NotificationType.OrderStatusChange ||
                notification.notificationType ==
                    MezNotification.NotificationType.NewOrder) &&
            notification.orderId! == orderId)
        .forEach((MezNotification.Notification notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  void setNotifiedAsTrue(RestaurantOrder order) {
    if (!order.notifiedAdmin) {
      _databaseHelper.firebaseDatabase
          .ref(rootNotifiedAdminRoute(
              orderType: order.orderType, orderId: order.orderId))
          .set(true);
    }
  }

  Future<ServerResponse> setEstimatedFoodReadyTime(
      int orderId, DateTime estimatedTime) async {
    mezDbgPrint("inside clod set delivery time $estimatedTime");
    return _callRestaurantCloudFunction("setEstimatedFoodReadyTime", orderId,
        optionalParams: {
          "fromRestaurantOperator": false,
          "estimatedFoodReadyTime": estimatedTime.toUtc().toString()
        });
  }

  Future<ServerResponse> cancelOrder(int orderId) async {
    return _callRestaurantCloudFunction("cancelOrderFromAdmin", orderId);
  }

  Future<ServerResponse> prepareOrder(int orderId) async {
    return _callRestaurantCloudFunction("prepareOrder", orderId);
  }

  Future<ServerResponse> readyForPickupOrder(int orderId) async {
    return _callRestaurantCloudFunction("readyForOrderPickup", orderId);
  }

  // Need to be removed
  Future<ServerResponse> deliverOrder(int orderId) async {
    return _callRestaurantCloudFunction("deliverOrder", orderId);
  }

  // Need to be removed
  Future<ServerResponse> dropOrder(int orderId) async {
    return _callRestaurantCloudFunction("dropOrder", orderId);
  }

  Future<ServerResponse> _callRestaurantCloudFunction(
      String functionName, int orderId,
      {Map<String, dynamic>? optionalParams}) async {
    final HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-$functionName');
    mezDbgPrint("Drop order");
    try {
      final HttpsCallableResult response = await dropOrderFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
