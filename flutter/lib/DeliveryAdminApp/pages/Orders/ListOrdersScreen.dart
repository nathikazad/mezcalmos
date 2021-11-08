import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  RxList<Order> inProcessOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();

  @override
  void initState() {
    super.initState();
    inProcessOrders.value = controller.inProcessOrders;
    mezDbgPrint("ListOrdersScreen:init value");
    mezDbgPrint(controller.inProcessOrders);
    controller.ordersStream.listen((event) {
      inProcessOrders.value = event;
      mezDbgPrint("ListOrdersScreen:listener value");
      mezDbgPrint(controller.inProcessOrders);
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
