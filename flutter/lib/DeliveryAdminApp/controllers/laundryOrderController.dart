import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class LaundryOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<LaundryOrder> inProcessOrders = <LaundryOrder>[].obs;
  RxList<LaundryOrder> pastOrders = <LaundryOrder>[].obs;

  StreamSubscription<dynamic>? _inProcessOrdersListener;
  StreamSubscription<dynamic>? _pastOrdersListener;

  @override
  void onInit() {
    mezDbgPrint("--------------------> LaundrysOrderController Initialized !");
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
        .then(
          (value) => value.listen((dynamic event) {
            pastOrders.add(LaundryOrder.fromData(
                event.snapshot.key, event.snapshot.value));
          }),
        );

    super.onInit();
  }

  @override
  void onClose() {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    _inProcessOrdersListener?.cancel();
    _pastOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();
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
      String orderId, LaundryOrderCosts laundryOrderCosts) async {
    return _callLaundryCloudFunction("setWeight", orderId, optionalParams: {
      "fromLaundryOperator": false,
      "costsByType": laundryOrderCosts.toFirebasFormat()
    });
  }

  Future<ServerResponse> setEstimatedLaundryReadyTime(
      String orderId, DateTime estimatedTime) async {
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

  bool orderHaveNewMessageNotifications(String chatId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearNewOrderNotifications() {
    _fbNotificationsController.notifications
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewOrder)
        .forEach((Notification notification) {
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
    mezDbgPrint('CAnceling oooooooooooooooooooooooorrrrderrrr');
    return _callLaundryCloudFunction("cancelFromAdmin", orderId);
  }

  Future<ServerResponse> readyForDeliveryOrder(String orderId) async {
    return _callLaundryCloudFunction("readyForDeliveryOrder", orderId);
  }

  // Future<ServerResponse> assignLaundry(String orderId, String laundryId) async {
  //   return _callLaundryCloudFunction("assignLaundry", orderId,
  //       optionalParams: <String, dynamic>{"laundryId": laundryId});
  // }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, String orderId,
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
