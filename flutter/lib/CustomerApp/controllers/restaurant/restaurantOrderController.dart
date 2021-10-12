import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';

import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

class RestaurantOrderController extends GetxController {
  dynamic currentOrderData = "intitialized";
  @override
  void onInit() {
    print("--------------------> RestaurantsOrderController Initialized !");
  }

  Stream<List<Order>> getCurrentOrders() {
    return Get.find<CustomerAuthController>()
        .customerStream
        .stream
        .where((customer) {
      if (customer?.data["state"]?["currentOrders"] == null) {
        if (currentOrderData != null) {
          print("No current orders but there was before");
          currentOrderData = null;
          return true;
        } else {
          print("No current orders now or before");
          currentOrderData = null;
          return false;
        }
      } else if (currentOrderData == null) {
        print("Previous current order was null");
        currentOrderData = customer?.data["state"]?["currentOrders"];
        return true;
      } else if (currentOrderData.toString() !=
          customer?.data["state"]?["currentOrders"].toString()) {
        print("Previous current order was different");
        currentOrderData = customer?.data["state"]?["currentOrders"];
        return true;
      } else {
        print("Previous current order was same");
        return false;
      }
    }).map<List<Order>>((customer) => customer?.currentOrders ?? []);
  }

  Stream<Order?> getCurrentOrder(String orderId) {
    return getCurrentOrders().map<Order?>((currentOrders) {
      try {
        return currentOrders
            .firstWhere((currentOrder) => currentOrder.orderId == orderId);
      } on StateError {
        return null;
      }
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
