import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';

import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends StatelessWidget {
  void handleStateChange(TaxiState? state) {
    if (state != null) {
      if (!state.isAuthorized) {
        mezDbgPrint("going to unauthorized");
        Get.toNamed(kAunauthorizedRoute);
      } else if (state.currentOrder != null) {
        mezDbgPrint("going to current order");
        Get.toNamed(kCurrentOrderPage);
      } else {
        mezDbgPrint("going to incoming orders");
        Get.toNamed(kOrdersListPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      handleStateChange(Get.find<TaxiAuthController>().taxiState);
      mezDbgPrint("TaxiWrapper init state change");
    });
    mezDbgPrint("Inside TaxiWrapper Builder");
    return Scaffold(
            key: Get.find<SideMenuDraweController>().getNewKey(),
            drawer: MezSideMenu(),
            backgroundColor: Colors.white,
            appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
                "menu", Get.find<SideMenuDraweController>().openMenu),
            body: MezLogoAnimation(centered: true));
  }
}
