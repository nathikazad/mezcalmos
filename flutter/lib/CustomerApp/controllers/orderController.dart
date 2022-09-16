import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<Order> currentOrders = <Order>[].obs;
  RxList<Order> pastOrders = <Order>[].obs;
  RxNum shippingCost = RxNum(50);

  StreamSubscription<dynamic>? _currentOrdersListener;
  StreamSubscription<dynamic>? _pastOrdersListener;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> OrderController Initialized ! and the user uid is ${_authController.fireAuthUser?.uid} ");
    if (_authController.fireAuthUser?.uid != null) {
      getShippingPrice().then((num value) => shippingCost.value = value);
      _pastOrdersListener?.cancel();
      _pastOrdersListener = _databaseHelper.firebaseDatabase
          .ref()
          .child(customerPastOrders(_authController.fireAuthUser!.uid))
          .onValue
          .listen(
        // ignore: avoid_annotating_with_dynamic
        (dynamic event) async {
          final List<Order> orders = <Order>[];
          if (event.snapshot.value != null) {
            for (String orderId in event.snapshot.value.keys) {
              final dynamic orderData = event.snapshot.value[orderId];
              try {
                if (orderData["orderType"] ==
                    OrderType.Restaurant.toFirebaseFormatString()) {
                  orders.add(RestaurantOrder.fromData(
                    orderId,
                    orderData,
                  ));
                }

                if (orderData["orderType"] ==
                    OrderType.Taxi.toFirebaseFormatString()) {
                  orders.add(TaxiOrder.fromData(orderId, orderData));
                }
                if (orderData["orderType"] ==
                    OrderType.Laundry.toFirebaseFormatString()) {
                  orders.add(LaundryOrder.fromData(
                    orderId,
                    orderData,
                  ));
                }
              } catch (e) {
                mezDbgPrint(
                    "past order error $orderId ==============" + e.toString());
              }
            }
          }
          pastOrders.value = orders;
        },
      );

      _currentOrdersListener?.cancel();

      _currentOrdersListener = _databaseHelper.firebaseDatabase
          .ref()
          .child(customerInProcessOrders(_authController.fireAuthUser!.uid))
          .onValue
          // ignore: avoid_annotating_with_dynamic
          .listen((dynamic event) async {
        final List<Order> orders = <Order>[];

        if (event.snapshot.value != null) {
          // mezDbgPrint("my data : ${event.snapshot.value.toString()}");
          for (String orderId in event.snapshot.value.keys) {
            final dynamic orderData = event.snapshot.value[orderId];
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
            if (orderData["orderType"] ==
                OrderType.Laundry.toFirebaseFormatString()) {
              orders.add(LaundryOrder.fromData(
                orderId,
                orderData,
              ));
            }
          }
        }
        currentOrders.value = orders;
      });
    } else {
      mezDbgPrint("User is not signed it to init order controller");
    }
  }

  Order? hasOrderOfType({required OrderType typeToCheck}) {
    try {
      return currentOrders()
          .firstWhere((Order o) => o.orderType == typeToCheck);
    } on StateError catch (_) {
      return null;
    }
  }

  bool hasNewMessageNotification(String chatId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  bool hasNewAdminMessageNotification(String orderId) {
    return _fbNotificationsController
        .notifications()
        .where(
          (Notification notification) =>
              notification.notificationType == NotificationType.NewAdminMessage,
        )
        .isNotEmpty;
  }

  Order? getOrder(String orderId) {
    try {
      return currentOrders.firstWhere((Order order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((Order order) {
          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  Stream<Order?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<Order?>>[
      _getInProcessOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<Order?> _getInProcessOrderStream(String orderId) {
    return currentOrders.stream.map<Order?>((_) {
      try {
        return currentOrders.firstWhere(
          (Order currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<Order?> _getPastOrderStream(String orderId) {
    return pastOrders.stream.map<Order?>((_) {
      try {
        return pastOrders.firstWhere(
          (Order pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Future<num> getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(baseShippingPriceNode())
            .once())
        .snapshot;
    return snapshot.value as num;
  }

  bool orderHaveNewMessageNotifications(String chatId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType ==
                    NotificationType.NewCounterOffer) &&
            notification.orderId == orderId)
        .forEach((Notification notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  @override
  Future<void> onClose() async {
    print("[+] OrderController::onClose ---------> Was invoked !");
    await _currentOrdersListener?.cancel();
    _currentOrdersListener = null;
    await _pastOrdersListener?.cancel();
    _pastOrdersListener = null;
    super.onClose();
  }
}
