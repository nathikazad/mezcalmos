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
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

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
    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
      }
    });

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      }
    });
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
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
