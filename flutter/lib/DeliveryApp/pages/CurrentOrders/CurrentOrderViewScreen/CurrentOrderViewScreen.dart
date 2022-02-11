import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

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
    // make sure can't be poped, unless we do.
    mezDbgPrint("***************************************");

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            backgroundColor: Colors.white,
            appBar: DeliveryAppBar(AppBarLeftButtonType.Back),
            body: Obx(
              () {
                if (order != null
                    //  && this.mGoogleMapController.location.value != null
                    ) {
                  return Stack(alignment: Alignment.topCenter, children: [
                    DriverOrderMapComponent(order: order.value!),
                    (order.value!.orderType == OrderType.Restaurant)
                        ? DriverBottomRestaurantOrderCard(
                            order: order.value as RestaurantOrder)
                        : SizedBox()
                  ]);
                } else {
                  return MezLogoAnimation(
                    centered: true,
                  );
                }
                // return Stack(alignment: Alignment.topCenter, children: [
                // DriverOrderMapComponent(order: order.value!),
                // (order.value!.orderType == OrderType.Restaurant)
                //     ? DriverBottomRestaurantOrderCard(
                //         order: order.value as RestaurantOrder)
                //     : SizedBox()
                // MGoogleMap(
                //   mGoogleMapController: this.mGoogleMapController,
                //   myLocationButtonEnabled: false,
                //   debugString: "CurrentOrderScreen",
                // ),
                // CurrentPositionedBottomBar(order!),
                // CurrentPositionedFromToTopBar(order!),
              },
            ))); // no need for obx here.
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }
}
