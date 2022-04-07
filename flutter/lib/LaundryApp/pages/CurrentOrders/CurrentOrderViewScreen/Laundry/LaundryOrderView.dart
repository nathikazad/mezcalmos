import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverBottomLaundryOrderCard.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class LaundryOrderView extends StatefulWidget {
  const LaundryOrderView({Key? key}) : super(key: key);

  @override
  _LaundryOrderViewState createState() => _LaundryOrderViewState();
}

class _LaundryOrderViewState extends State<LaundryOrderView> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  Rxn<Order> order = Rxn<Order>();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _orderListener;
  @override
  void initState() {
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);

    order.value = controller.getOrder(orderId);
    _orderListener = controller
        .getOrderStream(orderId)
        .listen((LaundryOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
      }
    });

    if (order.value == null) {
      Timer(Duration(seconds: 5), () {
        if (order.value == null) {
          // ignore: inference_failure_on_function_invocation
          Get.back();
          MezSnackbar("Error", "Order does not exist");
        }
      });
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;

    super.dispose();
  }

  AppBar getRightAppBar() {
    return mezcalmosAppBar(AppBarLeftButtonType.Menu, onClick: Get.back);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: getRightAppBar(),
          body: SingleChildScrollView(
            child: Builder(
              builder: (BuildContext context) {
                if (order.value != null) {
                  return Column(
                    children: <Widget>[
                      DriverOrderMapComponent(order: order),
                      DriverBottomLaundryOrderCard(
                          order: order.value as LaundryOrder),
                    ],
                  );
                } else {
                  return MezLogoAnimation(
                    centered: true,
                  );
                }
              },
            ),
          ),
      ),
    );
  }
}
