import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class CustomerWrapper extends GetWidget<AuthController>
    with WidgetsBindingObserver {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  OrderController _orderController = Get.find<OrderController>();
  RxInt numberOfCurrentOrders = RxInt(0);
  DateTime? appClosedTime;
  CustomerWrapper() {
    WidgetsBinding.instance!.addObserver(this);
    _orderController.getCurrentOrders().listen((currentOrders) {
      numberOfCurrentOrders.value = currentOrders.length;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (appClosedTime != null &&
          DateTime.now().difference(appClosedTime!) > Duration(seconds: 10)) {
        navigateToOrdersIfNecessary(_orderController.currentOrders);
      }
    } else if (state == AppLifecycleState.paused) {
      appClosedTime = DateTime.now();
    }
  }

  // when app resumes check if there are current orders and if yes navigate to orders page
  void navigateToOrdersIfNecessary(List<Order> currentOrders) {
    print("navigateToOrdersIfNecessary");
    if (currentOrders.length == 1) {
      if (currentOrders[0].orderType == OrderType.Restaurant)
        Get.offNamedUntil(
            getCurrentRestaurantOrderRoute(currentOrders[0].orderId),
            (Route<dynamic> route) {
          return (route.settings.name == kWrapperRoute);
        });
      else
        print("Navigate to other order type");
    } else if (currentOrders.length > 1) {
      Get.offNamedUntil(kOrdersRoute, (Route<dynamic> route) {
        return (route.settings.name == kWrapperRoute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("CustomWrapper Build callabck");
    // Navigate to current orders if any after build
    Future.microtask(() {
      _orderController.getCurrentOrders().first.then((currentOrders) {
        print("CustomWrapper Build callabck first");
        navigateToOrdersIfNecessary(currentOrders);
      });
    });
    return Scaffold(
        key: _sideMenuDrawerController.getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Mezcalmos"),
          actions: [
            TextButton(
                onPressed: () => Get.toNamed(kOrdersRoute),
                child: Obx(() =>
                    Text("Orders" + numberOfCurrentOrders.value.toString())))
          ],
        ),
        body: Column(
          children: [
            OutlinedButton(
                onPressed: () => Get.toNamed(kRestaurantsRoute),
                child: Text("Restaurants"))
          ],
        ));
  }
}
