import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverBottomLaundryOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

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
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      Get.back<void>();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((Order? newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
        } else {
          controller.getPastOrderStream(orderId).listen((Order? pastOrder) {
            if (pastOrder != null) {
              order.value = pastOrder;
            } else {
              Get.back<void>();
            }
          });
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
      mezDbgPrint("CCCCANNNNNNN GO BACK");
      return deliveryAppBar(AppBarLeftButtonType.Back, function: Get.back);
    } else
      return deliveryAppBar(AppBarLeftButtonType.Back);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => canGetBack(),
        child: Scaffold(
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
      ),
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
