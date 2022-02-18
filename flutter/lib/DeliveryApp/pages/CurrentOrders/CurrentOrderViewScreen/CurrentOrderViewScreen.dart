import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverBottomLaundryOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverBottomRestaurantOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

import '../../../../Shared/models/Orders/LaundryOrder.dart';
import '../../../../Shared/widgets/MezLogoAnimation.dart';

class CurrentOrderViewScreen extends StatefulWidget {
  @override
  _ViewCurrentOrderScreenState createState() => _ViewCurrentOrderScreenState();
}

class _ViewCurrentOrderScreenState extends State<CurrentOrderViewScreen> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  LanguageController lang = Get.find<LanguageController>();
  Rxn<Order> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _orderListener;
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
        } else {
          Get.back();
        }
      });
    }
  }

  @override
  void dispose() {
    cancelOrderSubscription();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            appBar: DeliveryAppBar(AppBarLeftButtonType.Back),
            body: SingleChildScrollView(
              child: Obx(
                () {
                  if (order != null) {
                    return Column(children: [
                      DriverOrderMapComponent(order: order.value!),
                      getOrderBottomComponent()
                    ]);
                  } else {
                    return MezLogoAnimation(
                      centered: true,
                    );
                  }
                },
              ),
            )));
  }

  Widget getOrderBottomComponent() {
    switch (order.value!.orderType) {
      case OrderType.Restaurant:
        return DriverBottomRestaurantOrderCard(
            order: order.value as RestaurantOrder);

      case OrderType.Laundry:
        return DriverBottomLaundryOrderCard(order: order.value as LaundryOrder);

      default:
        return SizedBox();
    }
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }
}
