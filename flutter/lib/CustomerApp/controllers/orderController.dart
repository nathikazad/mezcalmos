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

  List<Order> currentOrders = [];
  List<Order> pastOrders = [];

  late Stream<List<Order>> pastOrdersStream;
  late Stream<List<Order>> currentOrdersStream;

  @override
  OrderController() {
    print("--------------------> RestaurantsOrderController Initialized !");
    pastOrdersStream = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerPastOrders(_authController.fireAuthUser!.uid))
        .onValue
        .map<List<Order>>((event) {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          if (orderData["orderType"] ==
              OrderType.Restaurant.toFirebaseFormatString()) {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          }
        });
      }
      pastOrders = orders;
      return orders;
    });

    currentOrdersStream = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerInProcessOrders(_authController.fireAuthUser!.uid))
        .onValue
        .map<List<Order>>((event) {
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
      currentOrders = orders;
      return orders;
    });
  }

  Stream<Order?> getCurrentOrderStream(String orderId) {
    return currentOrdersStream.map<Order?>((currentOrders) {
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

  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('cancelRestaurantOrderFromCustomer');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
