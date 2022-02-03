import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class OrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<Order> currentOrders = <Order>[].obs;
  RxList<Order> pastOrders = <Order>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  @override
  void onInit() {
    print("--------------------> RestaurantsOrderController Initialized !");
    _pastOrdersListener?.cancel();
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(deliveryDriversPastOrdersNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) {
      mezDbgPrint("[][][][][ got new past Order ]]");
      List<Order> orders = [];
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
        .child(deliveryDriversInProcessOrdersNode(
            _authController.fireAuthUser!.uid))
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

  Order? getOrder(String orderId) {
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

  Stream<Order?> getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<Order?>((_) {
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

  Stream<Order?> getPastOrderStream(String orderId) {
    return pastOrders.stream.map<Order?>((_) {
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

  bool hasNewMessageNotification(String orderId) {
    return _foregroundNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _foregroundNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            notification.orderId! == orderId)
        .forEach((notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> cancelOrder(String? reason) async {
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
      MezSnackbar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      mezDbgPrint("Exception happend in cancelTaxi : $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> onTheWayPickup() async {
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

  Future<ServerResponse> pickedUp() async {
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
