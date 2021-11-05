import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'dart:async';

import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  StreamSubscription? pastOrdersListener;
  StreamSubscription? currentOrdersListener;

  RxList<Order> currentOrders = <Order>[].obs;
  RxList<Order> pastOrders = <Order>[].obs;

  @override
  OrderController() {
    print("--------------------> RestaurantsOrderController Initialized !");
    pastOrdersListener?.cancel();
    pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerPastOrders(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) async {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          if (orderData["orderType"] ==
              OrderType.Restaurant.toFirebaseFormatString()) {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          }
        });
      }
      pastOrders.value = orders;
    });

    currentOrdersListener?.cancel();
    currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerInProcessOrders(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) async {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        mezDbgPrint("orderController: new incoming order data");
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          if (orderData["orderType"] ==
              OrderType.Restaurant.toFirebaseFormatString()) {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          }
        });
      }
      currentOrders.value = orders;
    });
  }

  Stream<Order> getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<Order>(
        (orders) => orders.firstWhere((order) => order.orderId == orderId));
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('cancelOrderFromCustomer');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() async {
    print("[+] RestaurantCartController::onClose ---------> Was invoked !");
    pastOrdersListener?.cancel();
    pastOrdersListener = null;
    currentOrdersListener?.cancel();
    currentOrdersListener = null;
    super.onClose();
  }
}
