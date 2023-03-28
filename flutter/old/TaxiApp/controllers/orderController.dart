import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<TaxiOrder> currentOrders = <TaxiOrder>[].obs;
  RxList<TaxiOrder> pastOrders = <TaxiOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  @override
  void onInit() {
    print("--------------------> RestaurantsOrderController Initialized !");
    _pastOrdersListener?.cancel();
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(taxiPastOrdersNode(_authController.fireAuthUser!.uid))
        .orderByChild('orderTime')
        .limitToLast(5)
        .onChildAdded
        .listen((DatabaseEvent event) {
      pastOrders
          .add(TaxiOrder.fromData(event.snapshot.key, event.snapshot.value));
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${taxiInProcessOrderNode(_authController.fireAuthUser!.uid)}");
    _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(taxiInProcessOrderNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((DatabaseEvent event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

      final List<TaxiOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        (event.snapshot.value as dynamic)?.keys.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];
          // mezDbgPrint("Order Data => $orderData");
          orders.add(TaxiOrder.fromData(orderId, orderData));
          // try {
          // } catch (e) {
          //   mezDbgPrint(e);
          // }
        });
      }
      currentOrders.value = orders;
    });
    super.onInit();
  }

  TaxiOrder? getOrder(String orderId) {
    try {
      return currentOrders.firstWhere((TaxiOrder order) {
        // mezDbgPrint(
        //     "Checking CurrentOrders::${order.orderId} ==> Driver Loc : ${order.driver?.location?.toJson()}");
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((TaxiOrder order) {
          mezDbgPrint(
              "Checking PastOrders::${order.orderId} ==> ${order.toString()}");

          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  Stream<TaxiOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<TaxiOrder?>>[
      _getInProcessOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<TaxiOrder?> _getInProcessOrderStream(String orderId) {
    return currentOrders.stream.map<TaxiOrder?>((_) {
      try {
        return currentOrders.firstWhere(
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<TaxiOrder?> _getPastOrderStream(String orderId) {
    return pastOrders.stream.map<TaxiOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (TaxiOrder pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  bool hasNewMessageNotification() {
    return _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId ==
                Get.find<TaxiAuthController>().taxiState?.currentOrder)
        .toList()
        .isNotEmpty;
  }

  void clearOrderNotifications() {
    _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            notification.orderId! ==
                Get.find<TaxiAuthController>().taxiState!.currentOrder!)
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> cancelTaxi(String? reason) async {
    final HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-cancelFromDriver');
    mezDbgPrint("Cancel Taxi Called");
    try {
      final HttpsCallableResult response =
          await cancelTaxiFunction.call(<String, dynamic>{'reason': reason});
      final ServerResponse res = ServerResponse.fromJson(response.data);
      mezDbgPrint(res.data);
      mezDbgPrint(res.errorMessage);
      mezDbgPrint(res.errorCode);
      return res;
    } catch (e) {
      mezDbgPrint("Exception happend in cancelTaxi : $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> startScheduledRide() async {
    mezDbgPrint("Start Taxi Called");
    final HttpsCallable startScheduledRideFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-startScheduledRide');
    try {
      final HttpsCallableResult response =
          await startScheduledRideFunction.call({});
      final ServerResponse res = ServerResponse.fromJson(response.data);
      mezDbgPrint(res.data);
      mezDbgPrint(res.errorMessage);
      mezDbgPrint(res.errorCode);
      return res;
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> startRide() async {
    mezDbgPrint("Start Taxi Called");
    final HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-startRide');
    try {
      final HttpsCallableResult response = await startRideFunction.call({});
      final ServerResponse res = ServerResponse.fromJson(response.data);
      mezDbgPrint(res.data);
      mezDbgPrint(res.errorMessage);
      mezDbgPrint(res.errorCode);
      return res;
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> finishRide() async {
    mezDbgPrint("Finish Taxi Called");
    final HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-finishRide');
    try {
      final HttpsCallableResult response = await finishRideFunction.call();
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
