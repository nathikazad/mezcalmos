import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';

class TaxiWrapper extends GetWidget<AuthController> {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  // pop Point!
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Inside TaxiWrapper Builder");

    return Scaffold(
      key: _sideMenuDrawerController.getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "menu", _sideMenuDrawerController.openMenu),
      body: Obx(() {
        mezDbgPrint("Inside TaxiWrapper");
        mezDbgPrint(_taxiAuthController.taxiState?.toJson());
        if (_taxiAuthController.taxiState == null) {
          mezDbgPrint("Taxi State not loaded yet >");
          return Center(
            child: Container(
              height: 200,
              width: 200,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black87),
              child: Transform.scale(scale: .8, child: MezLogoAnimation()),
            ),
          );
        } else if (!_taxiAuthController.taxiState!.isAuthorized) {
          mezDbgPrint("User not Unauthorized >");
          return UnauthorizedScreen();
        } else if (_taxiAuthController.taxiState!.currentOrder != null) {
          mezDbgPrint("InCurrentOrder >");
          Get.put(CurrentOrderController());
          return CurrentOrderScreen();
        } else {
          mezDbgPrint("Incoming orders >");
          Get.put(IncomingOrdersController());
          return IncomingOrdersScreen();
        }
      }),
    );
  }
}
