import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

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
        .reference()
        .child(taxiPastOrdersNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) {
      mezDbgPrint("[][][][][ got new past Order ]]");
      List<TaxiOrder> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.keys.forEach((orderId) {
          // for (var orderId in event.snapshot.value.keys) {
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(TaxiOrder.fromData(orderId, orderData));
        });
      }
      pastOrders.value = orders;
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${taxiInProcessOrderNode(_authController.fireAuthUser!.uid)}");
    _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiInProcessOrderNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

      List<TaxiOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        event.snapshot.value.keys?.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          dynamic orderData = event.snapshot.value[orderId];
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
      return currentOrders.firstWhere((order) {
        // mezDbgPrint(
        //     "Checking CurrentOrders::${order.orderId} ==> Driver Loc : ${order.driver?.location?.toJson()}");
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((order) {
          mezDbgPrint(
              "Checking PastOrders::${order.orderId} ==> ${order.toString()}");

          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  Stream<TaxiOrder?> getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<TaxiOrder?>((_) {
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

  Stream<TaxiOrder?> getPastOrderStream(String orderId) {
    return pastOrders.stream.map<TaxiOrder?>((_) {
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

  bool hasNewMessageNotification() {
    return _foregroundNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! ==
                Get.find<TaxiAuthController>().taxiState!.currentOrder)
        .isNotEmpty;
  }

  void clearOrderNotifications() {
    _foregroundNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            notification.orderId! ==
                Get.find<TaxiAuthController>().taxiState!.currentOrder!)
        .forEach((notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-cancelFromDriver');
    mezDbgPrint("Cancel Taxi Called");
    try {
      HttpsCallableResult response =
          await cancelTaxiFunction.call(<String, dynamic>{'reason': reason});
      var res = ServerResponse.fromJson(response.data);
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

  Future<ServerResponse> startRide() async {
    mezDbgPrint("Start Taxi Called");
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-startRide');
    try {
      HttpsCallableResult response = await startRideFunction.call({});
      var res = ServerResponse.fromJson(response.data);
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
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-finishRide');
    try {
      HttpsCallableResult response = await finishRideFunction.call();
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
