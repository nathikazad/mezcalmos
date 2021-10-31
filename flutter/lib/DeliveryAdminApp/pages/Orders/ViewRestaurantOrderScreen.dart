import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreen createState() => _ViewRestaurantOrderScreen();
}

class _ViewRestaurantOrderScreen extends State<ViewRestaurantOrderScreen> {
  Rxn<RestaurantOrder> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  late String orderId;
  _ViewRestaurantOrderScreen() {
    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    try {
      order.value = controller.inProcessOrders
          .firstWhere((order) => order.orderId == orderId) as RestaurantOrder;
      mezDbgPrint("order");
      mezDbgPrint(order.value);
    } on StateError catch (_) {
      mezDbgPrint("error");
      // do nothing
    }
    controller.getCurrentOrder(orderId).listen((newOrder) {
      mezDbgPrint("event");
      order.value = newOrder as RestaurantOrder;
      mezDbgPrint(order.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("ViewOrderScreen build");
    return Scaffold(
        appBar: AppBar(
          title: Text("View Order"),
        ),
        body: Obx(() {
          if (order.value == null) {
            return Text("Order loadings");
          } else {
            List<Widget> children = <Widget>[
              Text(order.value!.orderId),
              Text(order.value!.orderTime.toString()),
            ];
            if (changeStatusButton() != null)
              children.add(changeStatusButton()!);
            return Column(children: children);
          }
        }));
  }

  Widget? changeStatusButton() {
    switch (order.value!.restaurantOrderStatus) {
      case RestaurantOrderStatus.OrderReceieved:
        return OutlinedButton(
            onPressed: () {
              controller.prepareOrder(orderId);
            },
            child: Text("Prepare"));
      case RestaurantOrderStatus.PreparingOrder:
        return OutlinedButton(
            onPressed: () {
              mezDbgPrint("Clicked ready");
              controller.readyForPickupOrder(orderId);
            },
            child: Text("Ready"));
      case RestaurantOrderStatus.ReadyForPickup:
        return OutlinedButton(
            onPressed: () {
              controller.deliverOrder(orderId);
            },
            child: Text("Start Delivery"));
      case RestaurantOrderStatus.OnTheWay:
        return OutlinedButton(
            onPressed: () {
              controller.dropOrder(orderId);
            },
            child: Text("Dropped"));
      default:
        return null;
    }
  }
}
