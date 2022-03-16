import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverBottomLaundryOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class LaundryOrderView extends StatefulWidget {
  LaundryOrderView({Key? key}) : super(key: key);

  @override
  _LaundryOrderViewState createState() => _LaundryOrderViewState();
}

class _LaundryOrderViewState extends State<LaundryOrderView> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  Rxn<Order> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _orderListener;
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    super.initState();

    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
        } else {}
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
    if (canGetBack()) {
      return deliveryAppBar(AppBarLeftButtonType.Back, function: Get.back);
    } else
      return deliveryAppBar(AppBarLeftButtonType.Back);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canGetBack(),
      child: Scaffold(
          appBar: getRightAppBar(),
          body: SingleChildScrollView(
            child: Obx(
              () {
                if (order.value != null) {
                  return Column(children: [
                    DriverOrderMapComponent(order: order.value!),
                    DriverBottomLaundryOrderCard(
                        order: order.value as LaundryOrder),
                  ]);
                } else {
                  return MezLogoAnimation(
                    centered: true,
                  );
                }
              },
            ),
          )),
    );
  }

  bool canGetBack() {
    switch ((order.value! as LaundryOrder).status) {
      case LaundryOrderStatus.CancelledByAdmin:
      case LaundryOrderStatus.CancelledByCustomer:
      case LaundryOrderStatus.Delivered:
      case LaundryOrderStatus.AtLaundry:
        return true;

      default:
        return false;
    }
  }
}
