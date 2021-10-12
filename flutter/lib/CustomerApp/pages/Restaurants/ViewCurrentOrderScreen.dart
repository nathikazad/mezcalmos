import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';

class ViewCurrentRestaurantOrderScreen extends GetView<OrderController> {
  Rxn<RestaurantOrder> order = Rxn();

  ViewCurrentRestaurantOrderScreen() {
    String orderId = Get.parameters['orderId']!;
    controller.getCurrentOrder(orderId).listen((event) {
      order.value = event as RestaurantOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order"),
        ),
        body: Column(
          children: [],
        ));
  }
}
