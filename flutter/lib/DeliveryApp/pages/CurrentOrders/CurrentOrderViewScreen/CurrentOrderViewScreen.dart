import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverBottomLaundryOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverBottomRestaurantOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

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
    cancelOrderSubscription();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => canGetBack(),
        child: Obx(
          () => Scaffold(
              appBar: getRightAppBar(),
              body: SingleChildScrollView(
                child: Builder(
                  builder: (BuildContext context) {
                    if (order.value != null) {
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
              )),
        ));
  }

  AppBar getRightAppBar() {
    if (canGetBack()) {
      return deliveryAppBar(AppBarLeftButtonType.Back, function: Get.back);
    } else
      return deliveryAppBar(AppBarLeftButtonType.Back);
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

  bool canGetBack() {
    if (order.value!.orderType == OrderType.Restaurant) {
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
    } else {
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

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }
}
