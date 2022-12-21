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
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class LaundryOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();
  RxList<LaundryOrder> inProcessOrders = <LaundryOrder>[].obs;
  RxList<LaundryOrder> pastOrders = <LaundryOrder>[].obs;

  StreamSubscription<dynamic>? _inProcessOrdersListener;
  StreamSubscription<dynamic>? _pastOrdersListener;

  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;

  @override
  void onInit() {
    mezDbgPrint("--------------------> LaundrysOrderController Initialized !");
    listenToOrders();
    _appLifeCyclePauseCallbackId =
        _appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      _pastOrdersListener?.pause();
      _inProcessOrdersListener?.pause();
    });

    _appLifeCycleResumeCallbackId =
        _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () {
      _pastOrdersListener?.resume();
      _inProcessOrdersListener?.resume();

      // listenToOrders();
    });
    super.onInit();
  }

  void listenToOrders() {
    _inProcessOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(rootInProcessOrdersNode(orderType: OrderType.Laundry))
        .onValue
        .listen((dynamic event) {
      final List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in event.snapshot.value.keys) {
          final dynamic orderData = event.snapshot.value[orderId];
          orders.add(LaundryOrder.fromData(orderId, orderData));
        }
      }
      inProcessOrders.value = orders;
    });

    _databaseHelper.firebaseDatabase
        .ref()
        .child(rootPastOrdersNode(orderType: OrderType.Laundry))
        .orderByChild('orderTime')
        .limitToLast(5)
        .onChildAddedWitchCatch()
        .then((Stream stream) {
      _pastOrdersListener = stream.listen((dynamic event) {
        pastOrders.add(
            LaundryOrder.fromData(event.snapshot.key, event.snapshot.value));
      });
    });
  }

  @override
  void onClose() {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    _inProcessOrdersListener?.cancel();
    _pastOrdersListener?.cancel();
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

  LaundryOrder? getOrder(String orderId) {
    try {
      return inProcessOrders.firstWhere((LaundryOrder order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((LaundryOrder order) {
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

  Future<ServerResponse> setOrderWeight(
      int orderId, LaundryOrderCosts laundryOrderCosts) async {
    return _callLaundryCloudFunction("setWeight", orderId, optionalParams: {
      "fromLaundryOperator": false,
      "costsByType": laundryOrderCosts.toFirebasFormat()
    });
  }

  Future<ServerResponse> setEstimatedLaundryReadyTime(
      int orderId, DateTime estimatedTime) async {
    mezDbgPrint("inside clod set delivery time $estimatedTime");
    return _callLaundryCloudFunction("setEstimatedLaundryReadyTime", orderId,
        optionalParams: {
          "fromLaundryOperator": false,
          "estimatedLaundryReadyTime": estimatedTime.toUtc().toString()
        });
  }

  bool isPast(LaundryOrder order) {
    return pastOrders.contains(order);
  }

  Stream<LaundryOrder?> _getCurrentOrderStream(String orderId) {
    return inProcessOrders.stream.map<LaundryOrder?>((_) {
      try {
        return inProcessOrders.firstWhere(
          (LaundryOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  Stream<LaundryOrder?> getPastOrderStream(String orderId) {
    return pastOrders.stream.map<LaundryOrder?>((_) {
      try {
        return pastOrders.firstWhere(
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
    return inProcessOrders.stream.map<LaundryOrder?>((_) {
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

  bool orderHaveNewMessageNotifications(int chatId) {
    return _fbNotificationsController
        .notifications()
        .where((MezNotification.Notification notification) =>
            notification.notificationType ==
                MezNotification.NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearNewOrderNotifications() {
    _fbNotificationsController.notifications
        .where((MezNotification.Notification notification) =>
            notification.notificationType ==
            MezNotification.NotificationType.NewOrder)
        .forEach((MezNotification.Notification notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  void setNotifiedAsTrue(LaundryOrder order) {
    if (!order.notifiedAdmin) {
      _databaseHelper.firebaseDatabase
          .ref(rootNotifiedAdminRoute(
              orderType: order.orderType, orderId: order.orderId))
          .set(true);
    }
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

  Future<ServerResponse> cancelOrder(int orderId) async {
    mezDbgPrint('CAnceling oooooooooooooooooooooooorrrrderrrr');
    return _callLaundryCloudFunction("cancelFromAdmin", orderId);
  }

  Future<ServerResponse> readyForDeliveryOrder(int orderId) async {
    return _callLaundryCloudFunction("readyForDeliveryOrder", orderId);
  }

  // Future<ServerResponse> assignLaundry(String orderId, String laundryId) async {
  //   return _callLaundryCloudFunction("assignLaundry", orderId,
  //       optionalParams: <String, dynamic>{"laundryId": laundryId});
  // }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, int orderId,
      {Map<String, dynamic>? optionalParams}) async {
    final HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-$functionName');
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
