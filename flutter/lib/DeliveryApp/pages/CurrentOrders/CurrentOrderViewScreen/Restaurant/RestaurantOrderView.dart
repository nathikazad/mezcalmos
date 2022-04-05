import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  const RestaurantOrderView({Key? key}) : super(key: key);

  @override
  _RestaurantOrderViewState createState() => _RestaurantOrderViewState();
}

class _RestaurantOrderViewState extends State<RestaurantOrderView> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  Rxn<Order> order = Rxn<Order>();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription<Order?>? _orderListener;
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      mezDbgPrint("ORDER NULL");
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((Order? newOrder) {
        final DeliverableOrder? _order = controller.getOrder(orderId);
        if (_order == null) {
          Get.back<void>();
        } else {
          order.value = _order;
          order.refresh();
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
    mezDbgPrint("CCCCANNNNNNN GO BACK");
    return mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: getRightAppBar(),
          body: SingleChildScrollView(
            child: Builder(
              builder: (BuildContext context) {
                if (order.value != null) {
                  return Column(children: <Widget>[
                    DriverOrderMapComponent(order: order),
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
          ),
        ),
      ),
    );
  }
}
