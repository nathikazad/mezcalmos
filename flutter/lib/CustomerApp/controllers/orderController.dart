import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

class OrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  late Stream<List<Order>> ordersStream;
  List<Order> allOrders = [];
  List<Order> currentOrders = [];
  List<Order> pastOrders = [];
  @override
  void onInit() {
    print("--------------------> RestaurantsOrderController Initialized !");
    ordersStream = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerOrders(_authController.fireAuthUser!.uid))
        .onValue
        .map<List<Order>>((event) {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          if (orderData["orderType"] ==
              convertOrderTypeEnumToString(OrderType.Restaurant)) {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          }
        });
      }
      allOrders = orders;
      return orders;
    });
  }

  Stream<List<Order>> getCurrentOrders() {
    return ordersStream.map<List<Order>>((orders) {
      currentOrders = orders.where((Order order) => order.inProcess()).toList();
      return orders.where((Order order) => order.inProcess()).toList();
    });
  }

  Stream<List<Order>> getPastOrders() {
    return ordersStream.map<List<Order>>((orders) {
      pastOrders = orders.where((Order order) => !order.inProcess()).toList();
      return orders.where((Order order) => !order.inProcess()).toList();
    });
  }

  Stream<Order> getCurrentOrder(String orderId) {
    return getCurrentOrders().map<Order>((currentOrders) {
      return currentOrders
          .firstWhere((currentOrder) => currentOrder.orderId == orderId);
    });
  }

  Future<void> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('cancelOrder');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      print(response.data);
      // handle restaurantClosed error
    } catch (e) {}
  }
}
