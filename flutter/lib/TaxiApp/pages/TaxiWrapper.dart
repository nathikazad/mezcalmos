import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';

class TaxiWrapper extends GetWidget<AuthController> {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();

  // pop Point!
  @override
  Widget build(BuildContext context) {
    TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
    return Scaffold(
      key: _sideMenuDrawerController.getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "menu", _sideMenuDrawerController.openMenu),
      // body: Obx(() => _taxiAuthController.dynamicScreen), // here
      body: Obx(() => _taxiAuthController.authorizedTaxi != null
          ? (_taxiAuthController.authorizedTaxi == true
              ? (_taxiAuthController.currentOrderId != null
                  ? CurrentOrderScreen()
                  : IncomingOrdersScreen())
              : UnauthorizedScreen())
          : Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            )),
      // - Incomiing order Sc
      // - Anauthorized
      // - CurrentOrder
    );
  }
}
