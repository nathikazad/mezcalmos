import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

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
      fetchCustomerOrders();
    } else {
      mezDbgPrint("User is not signed it to init order controller");
    }
  }

  Future<void> fetchCustomerOrders() async {
    final List<RestaurantOrder> _orders = await get_customer_orders(
            customer_id: _authController.user!.hasuraId) ??
        [];
    currentOrders.value = _orders
        .where((RestaurantOrder element) => element.inProcess())
        .toList();
    pastOrders.value = _orders
        .where((RestaurantOrder element) => !element.inProcess())
        .toList();
    // get_customer_orders(customer_id: _authController.user!.hasuraId)
    //     .then((List<RestaurantOrder> value) {
    //   final List<Order> _currentOrders = <Order>[];
    //   final List<Order> _pastOrders = <Order>[];

    //   if (value.isNotEmpty) {
    //     value.forEach((RestaurantOrder order) {
    //       if (order.inProcess()) {
    //         _currentOrders.add(order);
    //       } else {
    //         _pastOrders.add(order);
    //       }
    //     });
    //   }
    //   currentOrders.value = _currentOrders;
    //   pastOrders.value = _pastOrders;
    // });
  }

  Order? hasOrderOfType({required OrderType typeToCheck}) {
    try {
      return currentOrders()
          .firstWhere((Order o) => o.orderType == typeToCheck);
    } on StateError catch (_) {
      return null;
    }
  }

  int? getServiceProviderId({required int orderId, required bool isPast}) {
    if (isPast) {
      return pastOrders
          .firstWhere((Order element) => element.orderId == orderId)
          .serviceProviderId;
    } else
      return currentOrders
          .firstWhere((Order element) => element.orderId == orderId)
          .serviceProviderId;
  }

  bool hasNewMessageNotification(int chatId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  bool hasNewAdminMessageNotification(int orderId) {
    return _fbNotificationsController
        .notifications()
        .where(
          (Notification notification) =>
              notification.notificationType == NotificationType.NewAdminMessage,
        )
        .isNotEmpty;
  }

  Order? getOrder(int orderId) {
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

  Stream<Order?> getOrderStream(int orderId) {
    return StreamGroup.merge(<Stream<Order?>>[
      _getInProcessOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<Order?> _getInProcessOrderStream(int orderId) {
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

  Stream<Order?> _getPastOrderStream(int orderId) {
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

  Future<ServerResponse> addReview({
    required int orderId,
    required int serviceId,
    required String comment,
    required OrderType orderType,
    required num rate,
  }) async {
    final HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{
        "orderId": orderId,
        "serviceProviderId": serviceId,
        "rating": rate,
        "comment": comment,
        "orderType": orderType.toFirebaseFormatString(),
      });
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  bool orderHaveNewMessageNotifications(int chatId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearOrderNotifications(int? orderId) {
    // mezDbgPrint("oooo id ==> $orderId");
    // _fbNotificationsController
    //     .notifications()
    //     .where((Notification notification) {
    //   mezDbgPrint("oooo2 id ==> ${notification.orderId}");

    //   return (notification.notificationType ==
    //               NotificationType.OrderStatusChange ||
    //           notification.notificationType ==
    //               NotificationType.NewCounterOffer) &&
    //       notification.orderId == orderId;
    // }).forEach((Notification notification) {
    //   _fbNotificationsController.removeNotification(notification.id);
    // });
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
