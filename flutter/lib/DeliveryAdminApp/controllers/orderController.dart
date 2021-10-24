import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class OrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  late Stream<List<Order>> ordersStream;
  List<Order> inProcessOrders = [];
  @override
  void onInit() {
    print("--------------------> RestaurantsOrderController Initialized !");
    ordersStream = _databaseHelper.firebaseDatabase
        .reference()
        .child(inProcessOrdersNode())
        .onValue
        .map<List<Order>>((event) {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        });
      }
      inProcessOrders = orders;
      return orders;
    });
  }

  Stream<Order> getCurrentOrder(String orderId) {
    return ordersStream.map<Order>((orders) {
      return orders
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
    } catch (e) {}
  }

  Future<void> prepareOrder(String orderId) async {
    HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('cancelOrder');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      print(response.data);
    } catch (e) {}
  }

  Future<void> deliverOrder(String orderId) async {
    HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('cancelOrder');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      print(response.data);
    } catch (e) {}
  }


  Future<void> dropOrder(String orderId) async {
    HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('cancelOrder');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      print(response.data);
    } catch (e) {}
  }
}
