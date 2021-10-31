import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  RxList<Order> inProcessOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();
  ListOrdersScreen() {
    inProcessOrders.value = controller.inProcessOrders;
    controller.ordersStream.listen((event) {
      inProcessOrders.value = event;
    });
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
          inProcessOrders.fold<List<Widget>>(<Widget>[], (children, element) {
        children.add(Row(children: [
          Text(element.orderId),
          Text(element.cost.toString()),
          TextButton(
              onPressed: () =>
                  Get.toNamed(getRestaurantOrderRoute(element.orderId)),
              child: Text("View Order"))
        ]));
        return children;
      }),
    );
  }
}
