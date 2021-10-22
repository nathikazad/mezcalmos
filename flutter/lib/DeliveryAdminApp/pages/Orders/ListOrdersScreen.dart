import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';

class ListOrdersScreen extends GetView {
  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();
  ListOrdersScreen() {
    currentOrders.value = controller.currentOrders;
    controller.getCurrentOrders().listen((event) {
      currentOrders.value = event;
    });
    controller.getPastOrders().listen((event) => pastOrders.value = event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Orders"),
        ),
        body: Obx(() {
          return buildOrders();
        }));
  }

  Widget buildOrders() {
    return Column(
      children:
          currentOrders.fold<List<Widget>>(<Widget>[], (children, element) {
        children.add(Row(children: [
          Text(element.orderId),
          Text(element.cost.toString()),
          TextButton(
              onPressed: () =>
                  Get.toNamed(getCurrentRestaurantOrderRoute(element.orderId)),
              child: Text("View Order"))
        ]));
        return children;
      }),
    );
  }
}
