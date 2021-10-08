import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantOrderController.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class CustomerWrapper extends GetWidget<AuthController>
    with WidgetsBindingObserver {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  RestaurantOrderController _restaurantOrderController =
      Get.put(RestaurantOrderController());
  CustomerAuthController _customerAuthController =
      Get.find<CustomerAuthController>();
  CustomerWrapper() {
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // when app resumes check if there are current orders and if yes navigate to orders page
    if (state == AppLifecycleState.resumed) {
      navigateToOrdersIfNecessary(_customerAuthController.currentOrders);
    }
  }

  void navigateToOrdersIfNecessary(List<Order> currentOrders) {
    print("navigateToOrdersIfNecessary");
    if (currentOrders.length == 1) {
      // navigate to orders list
    } else if (currentOrders.length > 1) {
      // navigate to orders view
    }
  }

  @override
  Widget build(BuildContext context) {
    // after widget builds check if there are orders and if yes navigate to orders page
    Future.microtask(() {
      print("CustomWrapper Build callabck");
      _restaurantOrderController.getCurrentOrders().first.then((currentOrders) {
        navigateToOrdersIfNecessary(currentOrders);
      });
    });
    return Scaffold(
        key: _sideMenuDrawerController.getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "menu", _sideMenuDrawerController.openMenu),
        body: Column(
          children: [
            OutlinedButton(
                onPressed: () => Get.to(ListRestaurantsScreen()),
                child: Text("Restaurants"))
          ],
        ));
  }
}
