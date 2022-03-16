import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/Components/DriverBottomRestaurantOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class RestaurantOrderView extends StatefulWidget {
  RestaurantOrderView({Key? key}) : super(key: key);

  @override
  _RestaurantOrderViewState createState() => _RestaurantOrderViewState();
}

class _RestaurantOrderViewState extends State<RestaurantOrderView> {
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
      mezDbgPrint("ORDER NULL");
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
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
                    DriverBottomRestaurantOrderCard(
                        order: order.value as RestaurantOrder),
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
    switch ((order.value! as RestaurantOrder).status) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
      case RestaurantOrderStatus.Delivered:
      case RestaurantOrderStatus.OrderReceieved:
      case RestaurantOrderStatus.PreparingOrder:
        return true;

      default:
        return false;
    }
  }
}
